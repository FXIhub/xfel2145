#!/usr/bin/env python

'''
Create calibrated shots and powder sums from AGIPD VDS files
Author: Jonas Sellberg, Kartik Ayyer
'''

import sys
import h5py
import numpy as np
import glob
import multiprocessing as mp
import ctypes
import geom
import argparse

class AGIPD_VDS_Calibrator():
    '''
    Interface to get frames interactively
    Initially specify path to folder with raw/proc data
    Then use get_frame(num) to get specific frame
    '''
    def __init__(self, fname, raw=True, calib_run=None, good_cells=range(176), chunk_size=None, verbose=0,
            geom_fname='/gpfs/exfel/exp/SPB/201802/p002145/scratch/geom/b1.geom'):
        self.num_h5cells = 176
        self.chunk_size = chunk_size
        self.verbose = verbose
        self.good_cells = np.array(good_cells)
        self.geom_fname = geom_fname
        self.is_raw_data = raw
        if self.geom_fname is not None:
            self.x, self.y = geom.pixel_maps_from_geometry_file(geom_fname)
        calib_glob = None
        if self.is_raw_data and calib_run is None:
            calib_glob='/gpfs/exfel/exp/SPB/201802/p002145/usr/Shared/calib/latest/Cheetah*.h5'
        elif self.is_raw_data:
            calib_glob='/gpfs/exfel/exp/SPB/201802/p002145/scratch/calib/r%.4d/Cheetah*.h5'%calib_run
        self.dset_name = '/INSTRUMENT/SPB_DET_AGIPD1M-1/DET/image/data'
        self.train_name = '/INSTRUMENT/SPB_DET_AGIPD1M-1/DET/image/trainId'
        self.pulse_name = '/INSTRUMENT/SPB_DET_AGIPD1M-1/DET/image/pulseId'
        self.cell_name = '/INSTRUMENT/SPB_DET_AGIPD1M-1/DET/image/cellId'
        self._load_vds(fname, calib_glob)
        self.frame = np.empty((16,512,128))
        self.powder = None
        self.train_ids = None
        
    def __enter__(self):
        return self
    
    def _load_vds(self, fname, calib_glob):
        try:
            self.vds = h5py.File(fname, 'r')
        except IOError:
            print('ERROR: file does not exist: %s' % fname)
            sys.exit(-1)
        self.nframes = self.vds[self.dset_name].shape[1]
        if self.verbose > 0:
            print('VDS file contains %d shots' % self.nframes)
        
        if calib_glob is not None:
            self.calib = [h5py.File(f, 'r') for f in sorted(glob.glob(calib_glob))]
        if self.verbose > 0:
            print('%d calibration files found'%len(self.calib))
    
    def __exit__(self, exc_type, exc_value, traceback):
        self._close_vds()
    
    def _close_vds(self):
        try:
            self.vds.close()
        except ValueError:
            print('WARNING: VDS file has already been closed')

    def _calibrate_powder(self, data_sum, module, cell, gain_mode=0, nframes=1):
        offset = self.calib[module]['AnalogOffset'][gain_mode,cell]
        badpix = self.calib[module]['Badpixel'][gain_mode,cell]
        gain = self.calib[module]['RelativeGain'][gain_mode,cell]
        data = (np.float32(data_sum) - nframes*offset)*gain
        data[badpix != 0] = 0
        return data
    
    def _calibrate_module(self, data, gain, module, cell, cmode=True, photonThresh=0.5):
        gain_mode = self._threshold(gain, module, cell)
        offset = np.empty(gain_mode.shape)
        gain = np.empty(gain_mode.shape)
        badpix = np.empty(gain_mode.shape)
        for i in range(3):
            offset[gain_mode==i] = self.calib[module]['AnalogOffset'][i,cell][gain_mode==i]
            gain[gain_mode==i] = self.calib[module]['RelativeGain'][i,cell][gain_mode==i]
            badpix[gain_mode==i] = self.calib[module]['Badpixel'][i,cell][gain_mode==i]
        data = (np.float32(data) - offset)*gain
        data[badpix != 0] = 0
        if self.verbose:
            print('Found %d bad pixels for module %d' % ((badpix != 0).sum(), module))
        if cmode:
            # Median subtraction by 64x64 asics
            data = data.reshape(8,64,2,64).transpose(1,3,0,2).reshape(64,64,16)
            if self.verbose:
                print('Common-mode correction for module %d: %.1f ADU' % (module, np.sum(np.median(data, axis=(0,1)))))
            data -= np.median(data, axis=(0,1))
            data = data.reshape(64,64,8,2).transpose(2,0,3,1).reshape(512,128)
        # Threshold below 0.5-0.7 photon (1 photon = 45 ADU)
        if self.verbose:
            print('Setting %d pixels below photon threshold to zero for module %d' % (((data < photonThresh*45*gain) & (data > 0)).sum(), module))
        data[data < photonThresh*45*gain] = 0
        #data[data > 10000] = 10000

        return data

    def _threshold(self, gain, module, cell):        
        threshold = self.calib[module]['DigitalGainLevel'][:,cell]
        high_gain = gain < threshold[1]
        low_gain = gain > threshold[2]
        medium_gain = (~high_gain) * (~low_gain)
        return low_gain*2 + medium_gain

    def _get_frame(self, num, type='frame', calibrate=False, threshold=False, assemble=True):
        if num > self.nframes or num < 0:
            print('Out of range: %d' % num)
            return
        
        #cell_ind = num % len(self.good_cells)
        #train_ind = num // len(self.good_cells)
        #ind = self.good_cells[cell_ind] + train_ind * self.num_h5cells
        cellId = self.vds[self.cell_name][num]
        pulseId = self.vds[self.pulse_name][num]
        trainId = self.vds[self.train_name][num]
        #print('cellId:')
        #print(cellId)
        #print('cell_ind:')
        #print(cell_ind)
        if self.verbose:
            print('Getting frame with cellId=%d, pulseId=%d and trainId=%d' % (cellId, pulseId, trainId))
        if type == 'frame':
            type_ind = 0
            threshold = False
        elif type == 'gain':
            type_ind = 1
            calibrate = False
        else:
            print('Unknown type string: %s' % type)
            return
        data = self.vds[self.dset_name][:,num]
        if calibrate:
            print('Calibrating frame')
            for i in range(16):
                self.frame[i] = self._calibrate_module(data[i,0,:,:], data[i,1,:,:], i, cellId)
        else:
            if self.is_raw_data:
                self.frame = data[:,0,:,:]
            else:
                self.frame = data[:]
        if not assemble or self.geom_fname is None:
            return np.copy(self.frame)
        else:
            if self.verbose:
                print('Assembling frame')
            return geom.apply_geom_ij_yx((self.y, self.x), self.frame)
    
    def get_frame(self, num, calibrate=False, assemble=True):
        return self._get_frame(num, type='frame', calibrate=calibrate, assemble=assemble)

    def get_gain(self, num, threshold=False, assemble=True):
        return self._get_frame(num, type='gain', calibrate=False, threshold=threshold, assemble=assemble)

    def get_powder(self):
        if self.powder is not None:
            print('Powder sum already calculated')
            return self.powder
        
        powder_shape = (len(self.good_cells),) + self.frame.shape
        powder = mp.Array(ctypes.c_double, len(self.good_cells)*self.frame.size)
        jobs = []
        for i in range(16):
            p = mp.Process(target=self._powder_worker, args=(i, powder, powder_shape))
            jobs.append(p)
            p.start()
        for j in jobs:
            j.join()
        sys.stderr.write('\n')
        self.powder = np.frombuffer(powder.get_obj()).reshape(powder_shape)
        self.npowder = np.zeros_like(self.good_cells)
        # calibrate powder
        for k,cell in enumerate(self.good_cells):
            ind = np.zeros((self.nframes,), dtype=np.bool)
            ind[cell::self.num_h5cells] = True
            self.npowder[k] = ind.sum()
            if self.is_raw_data:
                for i in range(16):
                    self.powder[k,i,:,:] = self._calibrate_powder(self.powder[k,i,:,:], i, cell, nframes=self.npowder[k])
        return (self.powder, self.npowder)
    
    def _powder_worker(self, i, powder, shape):
        np_powder = np.frombuffer(powder.get_obj()).reshape(shape)
        
        # For each cell
        for k,cell in enumerate(self.good_cells):
            if self.is_raw_data:
                np_powder[k,i] += self.vds[self.dset_name][i][cell::self.num_h5cells,0,:,:].sum(0)
                #np_powder[k,i] += self._calibrate_powder(self.vds[self.dset_name][i][cell::self.num_h5cells,0,:,:].sum(0), i, cell, nframes=self.npowder[k])
                #np_powder[k,i] += self.vds[self.dset_name][i][cell::self.num_h5cells,0,:,:].sum(0)
            else:
                np_powder[k,i] += self.vds[self.dset_name][i][cell::self.num_h5cells,:,:].sum(0)
        
if __name__ == '__main__':

    parser = argparse.ArgumentParser(description='Create calibrated AGIPD VDS files')
    parser.add_argument('run', help='Run number', type=int)
    parser.add_argument('-c', '--chunk', help='Chunk size (default=2000)', type=int, default=2000)
    parser.add_argument('-f', '--frame', help='Get frame (default=None)', type=int, default=None)
    parser.add_argument('-p', '--proc', help='If proc data (default=False)', action='store_true', default=False)
    parser.add_argument('-o', '--out_folder', help='Path of output folder (default=.)', default='.')
    parser.add_argument('-v', '--verbose', help='Output additional information (default=False)', default=False, action='store_true')
    args = parser.parse_args()
    
    npulses = 176
    good_cells = list(range(npulses))
    # get rid of every 32nd memory cells, starting at 19th cell
    for r in good_cells[::-1]:
        if ((r-18) % 32 == 0):
            good_cells.pop(r)
    good_cells.pop(0) # get rid of first memory cell
    if args.proc:
        fname = '/gpfs/exfel/exp/SPB/201802/p002145/scratch/vds/r%04d_vds_proc.h5' % args.run
    else:
        fname = '/gpfs/exfel/exp/SPB/201802/p002145/scratch/vds/r%04d_vds_raw.h5' % args.run
    
    print('Calibrating virtual data set for run %d' % args.run)
    with AGIPD_VDS_Calibrator(fname, good_cells=good_cells, chunk_size=args.chunk, verbose=int(args.verbose)) as c:
        if args.frame is None:
            print('Calculating powder sum for run %d' % args.run)
            c.get_powder()
        else:
            print('Calibrating frame %d from run %d' % (args.frame, args.run))
            frame = c.get_frame(args.frame, calibrate=True)
        import os
        if args.frame is None:
            if args.proc:
                fname = 'data/r%04d_powder_proc.h5' % args.run
            else:
                fname = 'data/r%04d_powder_raw.h5' % args.run
        else:
            if args.proc:
                fname = 'data/r%04d_frame%d_proc.h5' % (args.run, args.frame)
            else:
                fname = 'data/r%04d_frame%d_raw.h5' % (args.run, args.frame)
        if not os.path.isdir('data'):
            os.mkdir('data')
        if os.path.exists(fname):
            print('WARNING: overwriting file: %s' % fname)
        f = h5py.File(fname, 'w')
        if args.frame is None:
            f['sum'] = c.powder
            f['nframes'] = c.npowder
            print('Saved powder pattern from run %d to: %s' % (args.run, fname))
        else:
            g = f.create_group("data")
            g['raw'] = c.frame
            g['assembled'] = frame
            print('Saved frame %d from run %d to: %s' % (args.frame, args.run, fname))
        f.close()
        
