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

import numpy as np
import sys, os; sys.path.append(os.path.split(__file__)[0])
from online_agipd_calib import AGIPD_Calibrator

state = {}
state['Facility'] = 'EuXFELtrains'
state['EuXFEL/DataSource'] = 'tcp://10.253.0.51:45000' # Raw
#state['EuXFEL/DataSource'] = 'tcp://10.253.0.51:45011' # Calibrated
state['EuXFEL/DataFormat'] = 'Raw'
state['EuXFEL/MaxTrainAge'] = 4
state['EuXFEL/MaxPulses'] = 115
#state['EuXFEL/MaxPulses'] = 176

# Use SelModule = None or remove key to indicate a full detector
# [For simulator, comment if running with full detector, otherwise uncomment]
state['EuXFEL/SelModule'] = 4

# AGIPD calibrator
path_to_calib = "/gpfs/exfel/exp/SPB/201802/p002145/usr/Shared/calib/latest/"
calibrator = AGIPD_Calibrator([path_to_calib + "Cheetah-AGIPD04-calib.h5"], max_pulses=state['EuXFEL/MaxPulses'])

# Parameters and buffers
running_background = None

# Switches
alignment  = True
hitfinding = True
background = False
statistics = True
manual_mask = False

# Hitfinding parameters
adu_threshold  = 25
hit_threshold  = 650
dark_threshold = 80


# Display parameters
show_max_hits = 2


# Build up the mask
mask = np.ones((128,512)).astype(np.bool)
if manual_mask:
    #mask[:,-64:] = False
    mask[:,(256+128):] = False
mask = mask[:,:,np.newaxis]

read_mask = False
if read_mask:
    import h5py
    badpixel_file = "/gpfs/exfel/exp/SPB/201802/p002145/usr/Shared/calib/online_mask04.h5"
    with h5py.File(badpixel_file, "r") as file_handle:
        manual_mask = file_handle["mask"][...]
    mask *= ~np.bool8(manual_mask[:, :, np.newaxis])

# Last part of the mask is the badpixelMask that is added for each event

def onEvent(evt):
    global running_background

    # Timestamp of a full train
    T = evt["eventID"]["Timestamp"]
    goodcells = T.cellId
    badcells = T.badCells
    
    # Calculate number of pulses in each train
    npulses = len(T.timestamp)
    analysis.event.printProcessingRate(pulses_per_event=npulses)

    # Print statistics
    if statistics and ipc.mpi.is_main_worker():
        print("Nr. of pulses per train: {:d}".format(npulses))
        # print("Bad cells (filtered out): ", badcells)

    # Shape of data: (module, ss, fs, cell)
    agipd_data = evt['photonPixelDetectors']['AGIPD'].data[0,:,:,:]
    agipd_gain = evt['photonPixelDetectors']['AGIPD'].data[1,:,:,:]
    agipd_module = add_record(evt['analysis'], 'analysis', 'AGIPD', agipd_data)

    # Dark calibration
    calibrated, badmask = calibrator.calibrate_train(evt, agipd_module, agipd_gain, apply_gain_switch=True)
    agipd_module = add_record(evt['analysis'], 'analysis', 'AGIPD/Calib', calibrated)
    #badmask = mask.copy()

    # Median correction
    agipd_module = add_record(evt['analysis'], 'analysis', 'AGIPD/Calib', agipd_module.data - np.median(agipd_module.data,axis=(0,1)))

    # Flip the X-axis
    agipd_module = add_record(evt['analysis'], 'analysis', 'AGIPD/Calib', agipd_module.data[:,::-1])
    badmask = badmask[:, ::-1]
    badmask *= mask

    # # Save image and mask
    # import h5py
    # with h5py.File("image_and_mask.h5", "w") as file_handle:
    #     file_handle.create_dataset("image_train", data=np.float64(agipd_module.data))
    #     file_handle.create_dataset("mask_train", data=np.int64(badmask))

    # For alignment purposes, calculate the average signal per train
    if alignment:
        # Mean image in a train
        meanimg = add_record(evt['analysis'], 'analysis', 'meanimg', agipd_module.data.mean(axis=-1))
        plotting.image.plotImage(meanimg, group='Alignment', mask=badmask.min(axis=2))

        # Single pulse image
        random_index = np.random.choice(npulses, 1)[0]
        singleimg = add_record(evt['analysis'], 'analysis', 'singleimg', agipd_module.data[:,:,random_index])
        plotting.image.plotImage(singleimg, group='Alignment', mask=badmask[:,:,random_index])

        # Mean data intensity over all pixels in all cells of detector 
        mean = add_record(evt['analysis'], 'analysis', 'mean', agipd_module.data.mean())
        plotting.line.plotHistory(mean, group='Alignment')

    # Do hit-finding on full trains
    if hitfinding:

        # Subtract the running Background
        if background:
            if running_background is None:
                running_background = np.zeros(agipd_module.data.shape[:-1])
            agipd_module.data[:] -= running_background[:, :, np.newaxis]

        # Count lit pixel in each train
        analysis.hitfinding.countLitPixels(evt, agipd_module, aduThreshold=adu_threshold, hitscoreThreshold=hit_threshold, 
                                           hitscoreDark=dark_threshold,
                                           mask=mask, stack=True)
        hitscore  = evt['analysis']['litpixel: hitscore'].data
        hittrain  = evt['analysis']['litpixel: isHit'].data
        misstrain = evt['analysis']['litpixel: isMiss'].data

        # Calculate hitsore left-right ratio
        left_score = ((agipd_module.data*badmask)[:, :256, :] > adu_threshold).sum(axis=(0, 1))
        right_score = ((agipd_module.data*badmask)[:, 256:, :] > adu_threshold).sum(axis=(0, 1))
        score_ratio = add_record(evt['analysis'], 'analysis', 'score_ratio', (left_score+1) / (right_score+1))
        
        # Plot the hitscore for each pulse
        for i in range(npulses):
            # Update event ID for each pulse
            evt.event_id = lambda: T.timestamp[i]
            hitscore_pulse = add_record(evt['analysis'], 'analysis', 'hitscore', hitscore[i])
            plotting.line.plotHistory(hitscore_pulse, group='Hitfinding', hline=hit_threshold, history=10000)
            
        # Plot the hitscore against the cellID
        cellid_record = add_record(evt['analysis'], 'analysis', 'cellid', T.cellId)
        plotting.line.plotTrace(evt['analysis']['litpixel: hitscore'], paramX=cellid_record, history=10000, group='Hitfinding')

        # Update the hitrate 
        analysis.hitfinding.hitrate(evt, hittrain)
        if ipc.mpi.is_main_worker():
            plotting.line.plotHistory(evt['analysis']['hitrate'], history=100000, group='Hitfinding')

        # Update the running background
        if background and misstrain.sum():
            background_history_ratio = 0.9
            running_background[:] = (background_history_ratio*running_background +
                                     (1-background_history_ratio)*agipd_module.data[:, :, misstrain].mean(axis=2))
    
        # If there is a hit
        Nhits = hittrain.sum()
        Nmiss = misstrain.sum()
        if Nhits:
        # Select pulses from the AGIPD train that are hits
            agipd_hits = agipd_module.data[:,:,hittrain]

            # Plot some pretty pictures (but not more than show_max_hits)
            pick_indices = np.random.choice(Nhits, min(show_max_hits, Nhits), replace=False)
            for i in pick_indices:
                agipd_pulse = add_record(evt['analysis'], 'analysis', 'AGIPD - hits', agipd_hits[:,:,i])
                plotting.image.plotImage(agipd_pulse, group='Hitfinding')

                #Plot left-right hitscore ratio
                hitscore_ratio_record = add_record(evt['analysis'], 'analysis', 'score_ratio_single', score_ratio.data[hittrain][i])
                plotting.line.plotHistory(hitscore_ratio_record, group='Hitfinding', history=10000)

        #Plot one of the misses
        if Nmiss:
            agipd_misses = agipd_module.data[:,:,misstrain]
            pick_misses = np.random.choice(Nmiss, min(show_max_hits, Nmiss), replace=False)
            for i in pick_misses:
                agipd_pulse_miss = add_record(evt['analysis'], 'analysis', 'AGIPD - miss', agipd_misses[:,:,i])
                plotting.image.plotImage(agipd_pulse_miss, group='Hitfinding')

                #Plot left-right hitscore ratio
                hitscore_ratio_record = add_record(evt['analysis'], 'analysis', 'score_ratio_single - misses', score_ratio.data[1-hittrain][i])
                plotting.line.plotHistory(hitscore_ratio_record, group='Hitfinding', history=10000)

