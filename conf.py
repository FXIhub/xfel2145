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
state['EuXFEL/MaxPulses'] = 110
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
calibrate  = True
commonmode = True
usemask = True

# Hitfinding parameters
adu_threshold  = 25
hit_threshold  = 520
maskhit_threshold = 140
ratio_threshold = 2
sumhit_threshold = 2400
dark_threshold = 50

# Display parameters
show_max_hits = 2

# Build a mask for hitfinding
# NOTE: This is still in non-flipped geometry
hitmask = np.zeros((128,512)).astype(np.bool)
hitmask[:64,:64] = True
hitmask = hitmask[:,:,np.newaxis]

# Sperical mask for hitsum finding (searching)
hitsum_radius = 30
cx,cy = 15, -20
xx,yy = np.meshgrid(np.arange(128)-cx, np.arange(512)-cy, indexing='ij')
hitsummask = (xx**2 + yy**2) > (hitsum_radius**2)
hitsummask = hitsummask[:,:,np.newaxis]

# Dirty edge mask
edgemask = np.ones((128,512,1)).astype(np.bool)
edgemask[0::64, :, :]  = False
edgemask[63::64, :, :] = False
edgemask[:,0::64, :] = False
edgemask[:,63::64, :] = False

read_mask = True
manual_mask = np.ones((128,512,1)).astype(np.bool)
if read_mask:
    import h5py
    badpixel_file = "/gpfs/exfel/exp/SPB/201802/p002145/usr/Shared/calib/online_mask04.h5"
    with h5py.File(badpixel_file, "r") as file_handle:
        manual_mask = file_handle["mask"][...]
    manual_mask = ~np.bool8(manual_mask[:, :, np.newaxis])

# Building the initial mask
# Last part of the mask is the badpixelMask that is added for each event
initmask = np.ones((128,512,1)).astype(np.bool)
if usemask:
    #initmask &= hitmask
    initmask &= manual_mask
    #initmask &= edgemask

def common_mode_correction(inarray, mask, d=64):
    """
    a: input array of shape (Y,X, cells)
    mask: a boolean mask
    d: size of sqaure asic
    
    returns per-asic common-mode corrected version of a
    """
    a = inarray.copy()
    nmask = ~mask
    a[nmask] = np.nan
    m, n, l = a.shape
    b = a.transpose(2, 0, 1).reshape(l, m, n//d, d).transpose(0, 3, 2, 1).reshape(l, d, n // d, m // d, d).transpose(0, 2, 3, 1, 4)
    b -= np.nanmedian(b, axis=(3, 4))[:, :, :, np.newaxis, np.newaxis]
    a[nmask] = inarray[nmask]
    return a

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

    # HACK
    #agipd_module.data[np.isnan(agipd_module.data)] = -1000

    # Dark calibration
    if calibrate:
        calibrated, badpixmask = calibrator.calibrate_train_fast(evt, agipd_module, agipd_gain, apply_gain_switch=False)
        badpixmask = np.bool8(badpixmask)
        agipd_module = add_record(evt['analysis'], 'analysis', 'AGIPD/Calib', calibrated)
    else:
        badpixmask = np.ones((128,512,npulses)).astype(np.bool)
    mask = (badpixmask & initmask)

    # Common-mode  correction
    if commonmode:
        agipd_module = add_record(evt['analysis'], 'analysis', 'AGIPD/Calib', common_mode_correction(agipd_module.data, mask))
        
    # Flip the X-axis
    agipd_module = add_record(evt['analysis'], 'analysis', 'AGIPD/Calib', agipd_module.data[:,::-1])
    mask = mask[:, ::-1]
    #agipd_module.data[-10:,-10:] = 100

    # Update masks
    maskhit = (mask & hitmask)
    masksum = (mask & hitsummask & hitmask)

    # Save image and mask
    #import h5py
    #with h5py.File("image_and_mask_%d.h5" %(T.trainId[0]), "w") as file_handle:
    #     file_handle.create_dataset("image_train", data=np.float64(agipd_module.data))
    #     file_handle.create_dataset("mask_train", data=np.int64(mask))

    # For alignment purposes, calculate the average signal per train
    if alignment:
        # Mean image in a train
        meanimg = add_record(evt['analysis'], 'analysis', 'meanimg', agipd_module.data.mean(axis=-1))
        plotting.image.plotImage(meanimg, group='Alignment', vmin=-10, vmax=50, mask=masksum.min(axis=2))

        # Single pulse image
        random_index = np.random.choice(npulses, 1)[0]
        singleimg = add_record(evt['analysis'], 'analysis', 'singleimg', agipd_module.data[:,:,random_index])
        plotting.image.plotImage(singleimg, group='Alignment', mask=mask[:,:,random_index])

        # Mean data intensity over all pixels in all cells of detector 
        
        mean = add_record(evt['analysis'], 'analysis', 'mean', agipd_module.data[:,:].mean())
        plotting.line.plotHistory(mean, group='Alignment')

    # Do hit-finding on full trains
    if hitfinding:

        # Subtract the running Background
        if background:
            if running_background is None:
                running_background = np.zeros(agipd_module.data.shape[:-1])
            agipd_module.data[:] -= running_background[:, :, np.newaxis]

        # Count lit pixel in each train using only badpixel mask
        analysis.hitfinding.countLitPixels(evt, agipd_module, aduThreshold=adu_threshold, hitscoreThreshold=hit_threshold, 
                                           hitscoreDark=dark_threshold,
                                           mask=mask, stack=True)
        hitscore  = evt['analysis']['litpixel: hitscore'].data
        hittrain  = np.bool8(evt['analysis']['litpixel: isHit'].data)
        misstrain = np.bool8(evt['analysis']['litpixel: isMiss'].data)

        # Calculate hitsore left-right ratio
        left_score = ((agipd_module.data*mask)[:, :256, :] > adu_threshold).sum(axis=(0, 1))
        right_score = ((agipd_module.data*mask)[:, 256:, :] > adu_threshold).sum(axis=(0, 1))
        litpixel_ratio = add_record(evt['analysis'], 'analysis', 'litpixel: ratio', (left_score+1) / (right_score+1))
        hittrain_ratio = (litpixel_ratio.data > ratio_threshold).astype(np.bool)
        misstrain_ratio = ~hittrain_ratio
        
        # Count lit pixel in each train using a special hit-finding mask
        analysis.hitfinding.countLitPixels(evt, agipd_module, aduThreshold=adu_threshold, hitscoreThreshold=maskhit_threshold, 
                                           hitscoreDark=dark_threshold, outkey="litpixel - masked: ", 
                                           mask=maskhit, stack=True)
        hitscore_masked  = evt['analysis']['litpixel - masked: hitscore'].data
        hittrain_masked  = np.bool8(evt['analysis']['litpixel - masked: isHit'].data)
        misstrain_masked = np.bool8(evt['analysis']['litpixel - masked: isMiss'].data)

        # Hitfinding based on integrated signal
        sum_litpixel = (agipd_module.data * masksum) > adu_threshold
        sum_hitscore = (agipd_module.data * sum_litpixel).sum(axis=(0,1))
        hittrain_sum = sum_hitscore > sumhit_threshold
        misstrain_sum = ~hittrain_sum

        # Plot the hitscores for each pulse
        for i in range(npulses):
            # Update event ID for each pulse
            evt.event_id = lambda: T.timestamp[i]
            hitscore_pulse = add_record(evt['analysis'], 'analysis', 'hitscore', hitscore[i])
            plotting.line.plotHistory(hitscore_pulse, group='Hitfinding', hline=hit_threshold, history=10000)
            ratio_pulse = add_record(evt['analysis'], 'analysis', 'litpixel ratio', litpixel_ratio.data[i])
            plotting.line.plotHistory(ratio_pulse, group='Hitfinding', hline=ratio_threshold, history=10000)
            hitscore_masked_pulse = add_record(evt['analysis'], 'analysis', 'hitscore - masked', hitscore_masked[i])
            plotting.line.plotHistory(hitscore_masked_pulse, group='Hitfinding', hline=maskhit_threshold, history=10000)
            hitscore_sum_pulse = add_record(evt['analysis'], 'analysis', 'hitscore - integrated', sum_hitscore[i])
            plotting.line.plotHistory(hitscore_sum_pulse, group='Hitfinding', hline=sumhit_threshold, history=10000)

        # Plot the hitscore against the cellID
        cellid_record = add_record(evt['analysis'], 'analysis', 'cellid', T.cellId)
        plotting.line.plotTrace(evt['analysis']['litpixel: hitscore'], paramX=cellid_record, history=10000, group='Hitfinding')

        # Plot the hitscore against the cellID
        hitsum_record = add_record(evt['analysis'], 'analysis', 'litpixel: sum', sum_hitscore)
        plotting.line.plotTrace(evt['analysis']['litpixel: sum'], paramX=cellid_record, history=10000, group='Hitfinding')

        # Decide which scores to use for defining hits
        #hittrain *= hittrain_ratio
        #hittrain = hittrain_ratio
        #hittrain = hittrain_masked
        hittrain |= hittrain_masked
        hittrain |= hittrain_sum

        # Update the hitrate 
        analysis.hitfinding.hitrate(evt, hittrain)
        if ipc.mpi.is_main_worker():
            plotting.line.plotHistory(evt['analysis']['hitrate'], history=10000, group='Hitfinding')

        # Update the running background
        if background and misstrain.sum():
            background_history_ratio = 0.5
            running_background[:] = (background_history_ratio*running_background +
                                     (1-background_history_ratio)*(agipd_module.data[:, :, misstrain].mean(axis=2)+running_background))
    
        # These are the hits
        Nhits = hittrain.sum()
        if Nhits:
        # Select pulses from the AGIPD train that are hits
            agipd_hits = agipd_module.data[:,:,hittrain]

            # Plot some pretty pictures (but not more than show_max_hits)
            pick_indices = np.random.choice(Nhits, min(show_max_hits, Nhits), replace=False)
            for i in pick_indices:
                agipd_pulse = add_record(evt['analysis'], 'analysis', 'AGIPD - hits', agipd_hits[:,:,i])
                plotting.image.plotImage(agipd_pulse, group='Hitfinding')

                # Binned hit image
                binned_pulse = agipd_pulse.data[:,:128].reshape((64,2,64,2)).sum(axis=(1,3))
                #print(binned_pulse.shape)
                agipd_pulse_binned = add_record(evt['analysis'], 'analysis', 'AGIPD - binned hits', binned_pulse)               
                plotting.image.plotImage(agipd_pulse_binned, group='Hitfinding')
                
        # Theser are the misses
        Nmiss = misstrain.sum()
        if Nmiss:
            agipd_misses = agipd_module.data[:,:,misstrain]
            pick_misses = np.random.choice(Nmiss, min(show_max_hits, Nmiss), replace=False)
            for i in pick_misses:
                agipd_pulse_miss = add_record(evt['analysis'], 'analysis', 'AGIPD - miss', agipd_misses[:,:,i])
                plotting.image.plotImage(agipd_pulse_miss, group='Hitfinding')
