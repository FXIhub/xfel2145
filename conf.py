"""
For testing the EuXFEL backend, start the karabo server:

./karabo-bridge-server-sim 1234
    OR
./karabo-bridge-server-sim -d AGIPDModule -r 1234

from the karabo-bridge (https://github.com/European-XFEL/karabo-bridge-py).
and then start the Hummingbird backend:

./hummingbird.py -b examples/euxfel/mock/conf.py
"""
import plotting.image
import plotting.line
import analysis.agipd
import analysis.event
import analysis.hitfinding
import ipc.mpi
from backend import add_record

state = {}
state['Facility'] = 'EuXFELtrains'
state['EuXFEL/DataSource'] = 'tcp://10.253.0.51:45000' # Raw
#state['EuXFEL/DataSource'] = 'tcp://10.253.0.51:45011' # Calibrated
state['EuXFEL/DataFormat'] = 'Raw'
state['EuXFEL/MaxTrainAge'] = 4
state['EuXFEL/MaxPulses'] = 120

# Use SelModule = None or remove key to indicate a full detector
# [For simulator, comment if running with full detector, otherwise uncomment]
state['EuXFEL/SelModule'] = 4

# Parameters and buffers
running_background = None

# Switches
alignment  = True
hitfinding = True
background = False
statistics = True
masking = True

# Hitfinding parameters
adu_threshold  = 60
hit_threshold  = 10
dark_threshold = 200

# Display parameters
show_max_hits = 2

import h5py
import numpy as np
class AGIPD_Calibrator:
    def __init__(self, filenames):
        self._nCells = 174
        self._badpixData       = []
        self._darkOffsetData   = []
        self._relativeGainData = []
        self._gainLevelData    = []
        for filename in sorted(filenames):
            self._read_and_append_calibration_data(filename=filename)
        self._badpixData       = np.asarray(self._badpixData)
        self._darkOffsetData   = np.asarray(self._darkOffsetData)
        self._relativeGainData = np.asarray(self._relativeGainData)
        self._gainLevelData    = np.asarray(self._gainLevelData)

    def _read_and_append_calibration_data(self, filename):
        # Meaning of indices: (gainID, cellID, pixcol, pixrow)
        # Anton's AGIPD calibration format
        #> h5ls calib/agipd/Cheetah-AGIPD00-calib.h5
        #AnalogOffset             Dataset {3, 64, 512, 128} H5T_STD_I16LE
        #Badpixel                 Dataset {3, 64, 512, 128} H5T_STD_U8LE
        #DigitalGainLevel         Dataset {3, 64, 512, 128} H5T_STD_U16LE
        #RelativeGain             Dataset {3, 64, 512, 128} H5T_IEEE_F32LE
        with h5py.File(filename) as f:
            self._badpixData.append(np.asarray(f["Badpixel"]))
            self._darkOffsetData.append(np.asarray(f["AnalogOffset"]))
            self._relativeGainData.append(np.asarray(f["RelativeGain"]))
            self._gainLevelData.append(np.asarray(f["DigitalGainLevel"]))
            self._badpixData = np.transpose(np.array(self._badpixData), axes=(0, 1, 4, 3, 2))
            self._darkOffsetData = np.transpose(np.array(self._darkOffsetData), axes=(0, 1, 4, 3, 2))
            self._relativeGainData = np.transpose(np.array(self._relativeGainData), axes=(0, 1, 4, 3, 2))
            self._gainLevelData = np.transpose(np.array(self._gainLevelData), axes=(0, 1, 4, 3, 2))
            assert self._nCells < f["/Badpixel"].shape[1]
            assert self._nCells < f["/AnalogOffset"].shape[1]
            assert self._nCells < f["/RelativeGain"].shape[1]
            assert self._nCells < f["/DigitalGainLevel"].shape[1]

    #def calibrate_train(self, evt, aduData, apply_gain_switch=True):
    def calibrate_train(self, evt, aduData, gainData, apply_gain_switch=False):
        npulses = aduData.data.shape[-1]
        outData = aduData.data.copy()
        darkoffset = self._darkOffsetData[..., :npulses]
        relativegain = self._relativeGainData[...,:npulses]
        badpixdata = self._badpixData[...,:npulses]
        gainleveldata = self._gainLevelData[...,:npulses]

        if apply_gain_switch:
            outData -= self._darkOffsetData[-1][0][:len(outData)]
        else:
            pixGainLevel0 = gainData < gainleveldata[0,1]
            pixGainLevel1 = pixGainLevel0 == False
            pixGainLevel2 = np.zeros(shape=gainData.shape, dtype='bool')
            pixGainLevels = [pixGainLevel0, pixGainLevel1, pixGainLevel2]

            for g, pixGain in enumerate(pixGainLevels):
                if not pixGain.any():
                    continue
                outData[pixGain] = (outData[pixGain] - darkoffset[0,g,pixGain]) * relativegain[0,g,pixGain]
                outData[pixGain] *= (badpixdata[0,g,pixGain] == 0)
                badpixMask = (badpixdata[0,g,pixGain] == 0)
        return add_record(evt['analysis'], 'analysis', 'AGIPD/Calib', outData)

calibrator = AGIPD_Calibrator(["/gpfs/exfel/exp/SPB/201802/p002145/usr/Shared/calib/latest/Cheetah-AGIPD04-calib.h5"])


# Hacking a mask
mask = np.ones((128,512)).astype(np.bool)
if masking:
    #mask[:,-64:] = False
    mask[:,:256] = False
mask = mask[:,:,np.newaxis]

def onEvent(evt):
    global running_background

    # Timestamp of a full train
    T = evt["eventID"]["Timestamp"]
    cells = T.cellId

    # Calculate number of pulses in each train
    npulses = len(T.timestamp)
    analysis.event.printProcessingRate(pulses_per_event=npulses)

    # Print statistics
    if statistics and ipc.mpi.is_main_worker():
        print("Nr. of pulses per train: {:d}".format(npulses))

    # Shape of data: (module, ss, fs, cell)
    agipd_data = evt['photonPixelDetectors']['AGIPD'].data[0,:,:,:]
    agipd_gain = evt['photonPixelDetectors']['AGIPD'].data[1,:,:,:]
    agipd_module = add_record(evt['analysis'], 'analysis', 'AGIPD', agipd_data)

    # Dark subtraction
    agipd_module = calibrator.calibrate_train(evt, agipd_module, agipd_gain)

    # Running background subtraction
    if background:
        if running_background is None:
            running_background = numpy.zeros(agipd_module.data.shape[0])

        # Background calibration
        # TODO

    # For alignment purposes, calculate the average signal per train
    if alignment:
        meanimg = add_record(evt['analysis'], 'analysis', 'meanimg', agipd_module.data.mean(axis=-1))
        plotting.image.plotImage(meanimg, group='Alignment', mask=mask[:,:,0])
        #plotting.line.plotHistogram(meanimg, group='Alignment')
        mean = add_record(evt['analysis'], 'analysis', 'mean', agipd_module.data.mean())
        plotting.line.plotHistory(mean, group='Alignment')

    # Do hit-finding on full trains
    if hitfinding:

        # Count lit pixel in each train
        analysis.hitfinding.countLitPixels(evt, agipd_module, aduThreshold=adu_threshold, hitscoreThreshold=hit_threshold, 
                                           hitscoreDark=dark_threshold,
                                           mask=mask, stack=True)
        hitscore  = evt['analysis']['litpixel: hitscore'].data
        hittrain  = evt['analysis']['litpixel: isHit'].data
        misstrain = evt['analysis']['litpixel: isMiss'].data

        # Plot the hitscore for each pulse
        for i in range(npulses):
            # Update event ID for each pulse
            evt.event_id = lambda: T.timestamp[i]
            hitscore_pulse = add_record(evt['analysis'], 'analysis', 'hitscore', hitscore[i])
            plotting.line.plotHistory(hitscore_pulse, group='Hitfinding', hline=hit_threshold)

        # Plot the hitscore against the cellID
        plotting.line.plotTrace(evt['analysis']['litpixel: hitscore'], group='Hitfinding')

        # Update the hitrate 
        analysis.hitfinding.hitrate(evt, hittrain)
        if ipc.mpi.is_main_worker():
            plotting.line.plotHistory(evt['analysis']['hitrate'], group='Hitfinding')
    
        # If there is a hit
        if hittrain.sum():
        # Select pulses from the AGIPD train that are hits
            agipd_hits = agipd_module.data[:,:,hittrain]

            # Running background subtraction
            if background:
                # Calculate average background based on the misses
                running_background = agipd_data[:,:,misstrain].mean(axis=0)

            # Plot some pretty pictures
                agipd_pulse = add_record(evt['analysis'], 'analysis', 'AGIPD - hits', agipd_hits[:,:,i])
                plotting.image.plotImage(agipd_pulse, group='Hitfinding')
            # Avoid showing the first pulses (probably corrupted)
            for i in range(len(agipd_hits[1:show_max_hits])):
                agipd_pulse = add_record(evt['analysis'], 'analysis', 'AGIPD - hits', agipd_hits[:,:,i] > adu_threshold)
                plotting.image.plotImage(agipd_pulse, group='Hitfinding')

        elif misstrain.sum():
            #cellids = T.cellId[:120][misstrain.astype(np.bool)]
            #print(T.cellId, misstrain.shape)
            #print(cellids)
            agipd_misses = agipd_module.data[:,:,misstrain]            
            agipd_pulse_miss = add_record(evt['analysis'], 'analysis', 'AGIPD - miss', agipd_misses[:,:,21])
            plotting.image.plotImage(agipd_pulse_miss, group='Hitfinding')
