#!/bin/env python
import os

from mpi4py import MPI
comm = MPI.COMM_WORLD
size = comm.Get_size()
rank = comm.Get_rank()

runs = range(565, 594+1)
for run in runs[rank::size]:
    print("Cropping for run %d [%d]" %(run, rank))
    os.system("python crop_sparse.py %d" %run)
