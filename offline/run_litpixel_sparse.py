#!/bin/env python
import os

runs = range(565, 592)

for run in runs:
    os.system("python litpixel_sparse.py %d -m ../analysis/goodpixels.h5 -p ../data/" %run)
