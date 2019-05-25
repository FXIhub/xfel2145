#!/usr/bin/env python

'''Creates VDS file with synchronized AGIPD data

There is one giant VDS data set with the dimensions:
    (module, pulse_number, <A/D>, fs, ss)
where <A/D> is an extra dimension in the raw data for the analog and digital data.
Additionally it has the corresponding train, pulse and cell IDs for all the frames.
The fill value for the detector data is NaN 
(i.e. if one or more modules does not have that train)
The fill value for the cell and pulse IDs is 65536

Run `./vds.py -h` for command line options.
'''

import sys
import os.path as op
import glob
import argparse
import numpy as np
import h5py

MAX_TRAINS_IN_FILE = 260

def main():
    parser = argparse.ArgumentParser(description='Create synchronized AGIPD VDS files')
    parser.add_argument('run', help='Run number', type=int)
    parser.add_argument('-p', '--proc', help='If proc data (default=False)', action='store_true', default=False)
    parser.add_argument('-o', '--out_folder', help='Path of output folder (default=.)', default='.')
    args = parser.parse_args()

    npulses = 176
    if not args.proc:
        folder = '/gpfs/exfel/exp/SPB/201802/p002145/raw/r%.4d/'%args.run
    else:
        folder = '/gpfs/exfel/exp/SPB/201802/p002145/proc/r%.4d/'%args.run

    ntrains = -1
    ftrain = sys.maxsize
    for m in range(16):
        tmin = sys.maxsize
        tmax = 0
        flist = glob.glob(folder+'/*AGIPD%.2d*.h5'%m)
        for fname in flist:
            with h5py.File(fname, 'r') as f:
                tid = f['INDEX/trainId'][:]
                if tid.max() - tid.min() > MAX_TRAINS_IN_FILE:
                    print('WARNING: Too large trainId range in %s (%d)' % (op.basename(fname), tid.max()-tid.min()))
                    continue
                tmin = min(tmin, tid.min())
                tmax = max(tmax, tid.max())
                ftrain = min(ftrain, tmin)
        ntrains = max(ntrains, tmax-tmin)
    ntrains = int(ntrains) + 4
    ltrain = ftrain + ntrains
    print(ntrains, 'trains in run starting from', ftrain)
    all_trains = np.repeat(np.arange(ftrain, ftrain+ntrains, dtype='u8'), npulses)

    with h5py.File(flist[0], 'r') as f:
        det_name = list(f['INSTRUMENT'])[0]
        dshape = f['INSTRUMENT/'+det_name +'/DET/15CH0:xtdf/image/data'].shape
    print('Shape of data in', det_name, 'is', dshape[1:])

    if not args.proc:
        out_fname = op.join(args.out_folder, 'r%.4d_vds_raw.h5'%args.run)
    else:
        out_fname = op.join(args.out_folder, 'r%.4d_vds_proc.h5'%args.run)
    outf = h5py.File(out_fname, 'w', libver='latest')
    outf['INSTRUMENT/'+det_name+'/DET/image/trainId'] = all_trains

    layout_data = h5py.VirtualLayout(shape=(16, ntrains*npulses) + dshape[1:])
    outdset_cid = outf.create_dataset('INSTRUMENT/'+det_name+'/DET/image/cellId',
                                      shape=(ntrains*npulses,), dtype='u2',
                                      data=65535*np.ones(ntrains*npulses, dtype='u2'))
    outdset_pid = outf.create_dataset('INSTRUMENT/'+det_name+'/DET/image/pulseId',
                                      shape=(ntrains*npulses,), dtype='u8',
                                      data=65535*np.ones(ntrains*npulses, dtype='u8'))
    for m in range(16):
        flist = sorted(glob.glob(folder+'/*AGIPD%.2d*.h5'%m))
        for fname in flist:
            dset_prefix = 'INSTRUMENT/'+det_name+'/DET/%dCH0:xtdf/image/'%m
            with h5py.File(fname, 'r') as f:
                # Annoyingly, raw data has an extra dimension for the IDs
                #   (which is why we need the ravel)
                tid = f[dset_prefix+'trainId'][:].ravel()
                sel = (tid>0) & (tid<ltrain)
                tid = tid[sel]
                cid = f[dset_prefix+'cellId'][:].ravel()[sel]
                pid = f[dset_prefix+'pulseId'][:].ravel()[sel]
                indices = np.where(np.in1d(all_trains, tid))[0]

                dset = f[dset_prefix+'data']
                vsource_data = h5py.VirtualSource(dset)
                badfr = np.where(~sel)[0]
                # The following trick only works if the empty trains are
                #  at the beginning or end of file (which is usually the case).
                #  Otherwise, one would have to play with FancySelection()
                if badfr.size == 0:
                    pass
                elif badfr[0] == 0:
                    vsource_data.sel = h5py._hl.selections.SimpleSelection(dset.shape)[badfr[-1]:]
                elif badfr[-1] == sel.shape[0] - 1:
                    vsource_data.sel = h5py._hl.selections.SimpleSelection(dset.shape)[:badfr[0]]
                layout_data[m, indices] = vsource_data
                sel_indices = np.zeros(len(all_trains), dtype=np.bool)
                sel_indices[indices] = True
                outdset_cid[sel_indices] = cid
                outdset_pid[sel_indices] = pid
                print(fname, vsource_data.shape)

    outf.create_virtual_dataset('INSTRUMENT/'+det_name+'/DET/image/data', layout_data, fillvalue=np.nan)
    outf.close()

if __name__ == '__main__':
    main()
