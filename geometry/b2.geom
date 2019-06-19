; BD: Manually updated to match det_2160_lowq7.h5
; KA: Manually optimized with hdfsee to match run 48 AgBe rings
; KA: Manually optimized with hdfsee to match AgBe rings (24.05.2019)
; Manually optimized with hdfsee
; Manually optimized with hdfsee
; Optimized panel offsets can be found at the end of the file
; OY: I think this is a very well optimized geometry!
; Optimized panel offsets can be found at the end of the file
; Optimized panel offsets can be found at the end of the file
; Optimized panel offsets can be found at the end of the file
; Optimized panel offsets can be found at the end of the file
; Optimized panel offsets can be found at the end of the file
; Optimized panel offsets can be found at the end of the file
; Optimized panel offsets can be found at the end of the file
; Optimized panel offsets can be found at the end of the file
; Optimized panel offsets can be found at the end of the file
; Optimized panel offsets can be found at the end of the file
; Manually optimized with hdfsee
; Optimized panel offsets can be found at the end of the file
; Optimized panel offsets can be found at the end of the file
; Optimized panel offsets can be found at the end of the file
; Optimized panel offsets can be found at the end of the file
; Optimized panel offsets can be found at the end of the file
; Optimized panel offsets can be found at the end of the file
; Optimized panel offsets can be found at the end of the file
; Optimized panel offsets can be found at the end of the file
; Optimized panel offsets can be found at the end of the file
; Optimized panel offsets can be found at the end of the file
; Optimized panel offsets can be found at the end of the file
; Optimized panel offsets can be found at the end of the file
; Optimized panel offsets can be found at the end of the file
; Manually optimized with hdfsee
; Optimized panel offsets can be found at the end of the file
; Manually optimized with hdfsee
; Optimized panel offsets can be found at the end of the file
; Manually optimized with hdfsee
; Camera length from LiTiO calibration
; Manually optimized with hdfsee
; Now all distances between panels is 5.8mm (29 pixels)
; OY: ACHTUNG! Orientation of the 2 halves of the detector might be wrong!
; A bit changed by OY: now 128 panels, rigid groups, bad lines to mask double pixels.
; Fixed errors noticed by Oleksandr
; Beginning of an AGIPD geometry construction by Helen Ginn on Thursday before beam time.
; Global panel positions not guesses
; Local positioning largely - but not entirely - guesses
; fast and slow scan directions have the potential to be accurate.

adu_per_eV = 0.0075  ; no idea
;clen = 0.210
;clen = 0.1185
;+clen = 0.1248
;clen = 0.164 ;for ADDU=-800
;19.57mm per 100ADDU
clen = 0.120
;photon_energy = 9300
photon_energy = 6000
res = 5000 ; 200 um pixels

dim0 = %
dim1 = ss
dim2 = fs
;data = /entry_1/instrument_1/detector_1/data
data = /data/data

mask = /entry_1/instrument_1/detector_1/mask
mask_good = 0x0000
mask_bad = 0xfeff

;bad_p7/min_fs = 0
;bad_p7/min_ss = 3584
;bad_p7/max_fs = 127
;bad_p7/max_ss = 4095

rigid_group_q0 = p0a0,p0a1,p0a2,p0a3,p0a4,p0a5,p0a6,p0a7,p1a0,p1a1,p1a2,p1a3,p1a4,p1a5,p1a6,p1a7,p2a0,p2a1,p2a2,p2a3,p2a4,p2a5,p2a6,p2a7,p3a0,p3a1,p3a2,p3a3,p3a4,p3a5,p3a6,p3a7
rigid_group_q1 = p4a0,p4a1,p4a2,p4a3,p4a4,p4a5,p4a6,p4a7,p5a0,p5a1,p5a2,p5a3,p5a4,p5a5,p5a6,p5a7,p6a0,p6a1,p6a2,p6a3,p6a4,p6a5,p6a6,p6a7,p7a0,p7a1,p7a2,p7a3,p7a4,p7a5,p7a6,p7a7
rigid_group_q2 = p8a0,p8a1,p8a2,p8a3,p8a4,p8a5,p8a6,p8a7,p9a0,p9a1,p9a2,p9a3,p9a4,p9a5,p9a6,p9a7,p10a0,p10a1,p10a2,p10a3,p10a4,p10a5,p10a6,p10a7,p11a0,p11a1,p11a2,p11a3,p11a4,p11a5,p11a6,p11a7
rigid_group_q3 = p12a0,p12a1,p12a2,p12a3,p12a4,p12a5,p12a6,p12a7,p13a0,p13a1,p13a2,p13a3,p13a4,p13a5,p13a6,p13a7,p14a0,p14a1,p14a2,p14a3,p14a4,p14a5,p14a6,p14a7,p15a0,p15a1,p15a2,p15a3,p15a4,p15a5,p15a6,p15a7

rigid_group_p0 = p0a0,p0a1,p0a2,p0a3,p0a4,p0a5,p0a6,p0a7
rigid_group_p1 = p1a0,p1a1,p1a2,p1a3,p1a4,p1a5,p1a6,p1a7
rigid_group_p2 = p2a0,p2a1,p2a2,p2a3,p2a4,p2a5,p2a6,p2a7
rigid_group_p3 = p3a0,p3a1,p3a2,p3a3,p3a4,p3a5,p3a6,p3a7
rigid_group_p4 = p4a0,p4a1,p4a2,p4a3,p4a4,p4a5,p4a6,p4a7
rigid_group_p5 = p5a0,p5a1,p5a2,p5a3,p5a4,p5a5,p5a6,p5a7
rigid_group_p6 = p6a0,p6a1,p6a2,p6a3,p6a4,p6a5,p6a6,p6a7
rigid_group_p7 = p7a0,p7a1,p7a2,p7a3,p7a4,p7a5,p7a6,p7a7
rigid_group_p8 = p8a0,p8a1,p8a2,p8a3,p8a4,p8a5,p8a6,p8a7
rigid_group_p9 = p9a0,p9a1,p9a2,p9a3,p9a4,p9a5,p9a6,p9a7
rigid_group_p10 = p10a0,p10a1,p10a2,p10a3,p10a4,p10a5,p10a6,p10a7
rigid_group_p11 = p11a0,p11a1,p11a2,p11a3,p11a4,p11a5,p11a6,p11a7
rigid_group_p12 = p12a0,p12a1,p12a2,p12a3,p12a4,p12a5,p12a6,p12a7
rigid_group_p13 = p13a0,p13a1,p13a2,p13a3,p13a4,p13a5,p13a6,p13a7
rigid_group_p14 = p14a0,p14a1,p14a2,p14a3,p14a4,p14a5,p14a6,p14a7
rigid_group_p15 = p15a0,p15a1,p15a2,p15a3,p15a4,p15a5,p15a6,p15a7

rigid_group_collection_quadrants = q0,q1,q2,q3
rigid_group_collection_asics = p0,p1,p2,p3,p4,p5,p6,p7,p8,p9,p10,p11,p12,p13,p14,p15

p0a0/min_fs = 0
p0a0/min_ss = 0
p0a0/max_fs = 127
p0a0/max_ss = 63
p0a0/fs = -0.001328x -0.999995y
p0a0/ss = +0.999995x -0.001328y
p0a0/corner_x = -506.338
p0a0/corner_y = 647.036

p0a1/min_fs = 0
p0a1/min_ss = 64
p0a1/max_fs = 127
p0a1/max_ss = 127
p0a1/fs = -0.001328x -0.999995y
p0a1/ss = +0.999995x -0.001328y
p0a1/corner_x = -440.338
p0a1/corner_y = 646.927

p0a2/min_fs = 0
p0a2/min_ss = 128
p0a2/max_fs = 127
p0a2/max_ss = 191
p0a2/fs = -0.001328x -0.999995y
p0a2/ss = +0.999995x -0.001328y
p0a2/corner_x = -374.344
p0a2/corner_y = 646.817

p0a3/min_fs = 0
p0a3/min_ss = 192
p0a3/max_fs = 127
p0a3/max_ss = 255
p0a3/fs = -0.001328x -0.999995y
p0a3/ss = +0.999995x -0.001328y
p0a3/corner_x = -308.342
p0a3/corner_y = 646.707

p0a4/min_fs = 0
p0a4/min_ss = 256
p0a4/max_fs = 127
p0a4/max_ss = 319
p0a4/fs = -0.001328x -0.999995y
p0a4/ss = +0.999995x -0.001328y
p0a4/corner_x = -242.342
p0a4/corner_y = 646.595

p0a5/min_fs = 0
p0a5/min_ss = 320
p0a5/max_fs = 127
p0a5/max_ss = 383
p0a5/fs = -0.001328x -0.999995y
p0a5/ss = +0.999995x -0.001328y
p0a5/corner_x = -176.340
p0a5/corner_y = 646.595

p0a6/min_fs = 0
p0a6/min_ss = 384
p0a6/max_fs = 127
p0a6/max_ss = 447
p0a6/fs = -0.001328x -0.999995y
p0a6/ss = +0.999995x -0.001328y
p0a6/corner_x = -110.340
p0a6/corner_y = 646.510

p0a7/min_fs = 0
p0a7/min_ss = 448
p0a7/max_fs = 127
p0a7/max_ss = 511
p0a7/fs = -0.001328x -0.999995y
p0a7/ss = +0.999995x -0.001328y
p0a7/corner_x = -44.34
p0a7/corner_y = 646.422

p1a0/min_fs = 0
p1a0/min_ss = 512
p1a0/max_fs = 127
p1a0/max_ss = 575
p1a0/fs = -0.001977x -0.999998y
p1a0/ss = +0.999998x -0.001977y
p1a0/corner_x = -506.545
p1a0/corner_y = 489.82

p1a1/min_fs = 0
p1a1/min_ss = 576
p1a1/max_fs = 127
p1a1/max_ss = 639
p1a1/fs = -0.001977x -0.999998y
p1a1/ss = +0.999998x -0.001977y
p1a1/corner_x = -440.547
p1a1/corner_y = 489.701

p1a2/min_fs = 0
p1a2/min_ss = 640
p1a2/max_fs = 127
p1a2/max_ss = 703
p1a2/fs = -0.001977x -0.999998y
p1a2/ss = +0.999998x -0.001977y
p1a2/corner_x = -374.549
p1a2/corner_y = 489.582

p1a3/min_fs = 0
p1a3/min_ss = 704
p1a3/max_fs = 127
p1a3/max_ss = 767
p1a3/fs = -0.001977x -0.999998y
p1a3/ss = +0.999998x -0.001977y
p1a3/corner_x = -308.552
p1a3/corner_y = 489.463

p1a4/min_fs = 0
p1a4/min_ss = 768
p1a4/max_fs = 127
p1a4/max_ss = 831
p1a4/fs = -0.001977x -0.999998y
p1a4/ss = +0.999998x -0.001977y
p1a4/corner_x = -242.554
p1a4/corner_y = 489.345

p1a5/min_fs = 0
p1a5/min_ss = 832
p1a5/max_fs = 127
p1a5/max_ss = 895
p1a5/fs = -0.001977x -0.999998y
p1a5/ss = +0.999998x -0.001977y
p1a5/corner_x = -176.558
p1a5/corner_y = 489.226

p1a6/min_fs = 0
p1a6/min_ss = 896
p1a6/max_fs = 127
p1a6/max_ss = 959
p1a6/fs = -0.001977x -0.999998y
p1a6/ss = +0.999998x -0.001977y
p1a6/corner_x = -110.540
p1a6/corner_y = 489.107

p1a7/min_fs = 0
p1a7/min_ss = 960
p1a7/max_fs = 127
p1a7/max_ss = 1023
p1a7/fs = -0.001977x -0.999998y
p1a7/ss = +0.999998x -0.001977y
p1a7/corner_x = -44.539
p1a7/corner_y = 488.988

p2a0/min_fs = 0
p2a0/min_ss = 1024
p2a0/max_fs = 127
p2a0/max_ss = 1087
p2a0/fs = -0.000961x -1.000001y
p2a0/ss = +1.000001x -0.000961y
p2a0/corner_x = -506.540
p2a0/corner_y = 333.106

p2a1/min_fs = 0
p2a1/min_ss = 1088
p2a1/max_fs = 127
p2a1/max_ss = 1151
p2a1/fs = -0.000961x -1.000001y
p2a1/ss = +1.000001x -0.000961y
p2a1/corner_x = -440.541
p2a1/corner_y = 333.034

p2a2/min_fs = 0
p2a2/min_ss = 1152
p2a2/max_fs = 127
p2a2/max_ss = 1215
p2a2/fs = -0.000961x -1.000001y
p2a2/ss = +1.000001x -0.000961y
p2a2/corner_x = -374.542
p2a2/corner_y = 332.962

p2a3/min_fs = 0
p2a3/min_ss = 1216
p2a3/max_fs = 127
p2a3/max_ss = 1279
p2a3/fs = -0.000961x -1.000001y
p2a3/ss = +1.000001x -0.000961y
p2a3/corner_x = -308.543
p2a3/corner_y = 332.890

p2a4/min_fs = 0
p2a4/min_ss = 1280
p2a4/max_fs = 127
p2a4/max_ss = 1343
p2a4/fs = -0.000961x -1.000001y
p2a4/ss = +1.000001x -0.000961y
p2a4/corner_x = -242.544
p2a4/corner_y = 332.819

p2a5/min_fs = 0
p2a5/min_ss = 1344
p2a5/max_fs = 127
p2a5/max_ss = 1407
p2a5/fs = -0.000961x -1.000001y
p2a5/ss = +1.000001x -0.000961y
p2a5/corner_x = -176.546
p2a5/corner_y = 332.747

p2a6/min_fs = 0
p2a6/min_ss = 1408
p2a6/max_fs = 127
p2a6/max_ss = 1471
p2a6/fs = -0.000961x -1.000001y
p2a6/ss = +1.000001x -0.000961y
p2a6/corner_x = -110.531
p2a6/corner_y = 332.675

p2a7/min_fs = 0
p2a7/min_ss = 1472
p2a7/max_fs = 127
p2a7/max_ss = 1535
p2a7/fs = -0.000961x -1.000001y
p2a7/ss = +1.000001x -0.000961y
p2a7/corner_x = -44.528
p2a7/corner_y = 332.603

p3a0/min_fs = 0
p3a0/min_ss = 1536
p3a0/max_fs = 127
p3a0/max_ss = 1599
p3a0/fs = +0.001590x -0.999999y
p3a0/ss = +0.999999x +0.001590y
p3a0/corner_x = -506.816
p3a0/corner_y = 175.394

p3a1/min_fs = 0
p3a1/min_ss = 1600
p3a1/max_fs = 127
p3a1/max_ss = 1663
p3a1/fs = +0.001590x -0.999999y
p3a1/ss = +0.999999x +0.001590y
p3a1/corner_x = -440.819
p3a1/corner_y = 175.501

p3a2/min_fs = 0
p3a2/min_ss = 1664
p3a2/max_fs = 127
p3a2/max_ss = 1727
p3a2/fs = +0.001590x -0.999999y
p3a2/ss = +0.999999x +0.001590y
p3a2/corner_x = -374.821
p3a2/corner_y = 175.608

p3a3/min_fs = 0
p3a3/min_ss = 1728
p3a3/max_fs = 127
p3a3/max_ss = 1791
p3a3/fs = +0.001590x -0.999999y
p3a3/ss = +0.999999x +0.001590y
p3a3/corner_x = -308.825
p3a3/corner_y = 175.714

p3a4/min_fs = 0
p3a4/min_ss = 1792
p3a4/max_fs = 127
p3a4/max_ss = 1855
p3a4/fs = +0.001590x -0.999999y
p3a4/ss = +0.999999x +0.001590y
p3a4/corner_x = -242.825
p3a4/corner_y = 175.821

p3a5/min_fs = 0
p3a5/min_ss = 1856
p3a5/max_fs = 127
p3a5/max_ss = 1919
p3a5/fs = +0.001590x -0.999999y
p3a5/ss = +0.999999x +0.001590y
p3a5/corner_x = -176.811
p3a5/corner_y = 175.928

p3a6/min_fs = 0
p3a6/min_ss = 1920
p3a6/max_fs = 127
p3a6/max_ss = 1983
p3a6/fs = +0.001590x -0.999999y
p3a6/ss = +0.999999x +0.001590y
p3a6/corner_x = -110.808
p3a6/corner_y = 176.035

p3a7/min_fs = 0
p3a7/min_ss = 1984
p3a7/max_fs = 127
p3a7/max_ss = 2047
p3a7/fs = +0.001590x -0.999999y
p3a7/ss = +0.999999x +0.001590y
p3a7/corner_x = -44.808
p3a7/corner_y = 176.142

p4a0/min_fs = 0
p4a0/min_ss = 2048
p4a0/max_fs = 127
p4a0/max_ss = 2111
p4a0/fs = -0.001899x -0.999999y
p4a0/ss = +0.999999x -0.001899y
p4a0/corner_x = -541.300
p4a0/corner_y = 9.313

p4a1/min_fs = 0
p4a1/min_ss = 2112
p4a1/max_fs = 127
p4a1/max_ss = 2175
p4a1/fs = -0.001899x -0.999999y
p4a1/ss = +0.999999x -0.001899y
p4a1/corner_x = -475.304
p4a1/corner_y = 9.196

p4a2/min_fs = 0
p4a2/min_ss = 2176
p4a2/max_fs = 127
p4a2/max_ss = 2239
p4a2/fs = -0.001899x -0.999999y
p4a2/ss = +0.999999x -0.001899y
p4a2/corner_x = -409.306
p4a2/corner_y = 9.079

p4a3/min_fs = 0
p4a3/min_ss = 2240
p4a3/max_fs = 127
p4a3/max_ss = 2303
p4a3/fs = -0.001899x -0.999999y
p4a3/ss = +0.999999x -0.001899y
p4a3/corner_x = -343.309
p4a3/corner_y = 8.962

p4a4/min_fs = 0
p4a4/min_ss = 2304
p4a4/max_fs = 127
p4a4/max_ss = 2367
p4a4/fs = -0.001899x -0.999999y
p4a4/ss = +0.999999x -0.001899y
p4a4/corner_x = -277.310
p4a4/corner_y = 8.845

p4a5/min_fs = 0
p4a5/min_ss = 2368
p4a5/max_fs = 127
p4a5/max_ss = 2431
p4a5/fs = -0.001899x -0.999999y
p4a5/ss = +0.999999x -0.001899y
p4a5/corner_x = -211.312
p4a5/corner_y = 8.728

p4a6/min_fs = 0
p4a6/min_ss = 2432
p4a6/max_fs = 127
p4a6/max_ss = 2495
p4a6/fs = -0.001899x -0.999999y
p4a6/ss = +0.999999x -0.001899y
p4a6/corner_x = -145.315
p4a6/corner_y = 8.611

p4a7/min_fs = 0
p4a7/min_ss = 2496
p4a7/max_fs = 127
p4a7/max_ss = 2559
p4a7/fs = -0.001899x -0.999999y
p4a7/ss = +0.999999x -0.001899y
p4a7/corner_x = -79.319
p4a7/corner_y = 8.494

p5a0/min_fs = 0
p5a0/min_ss = 2560
p5a0/max_fs = 127
p5a0/max_ss = 2623
p5a0/fs = -0.000318x -1.000000y
p5a0/ss = +1.000000x -0.000318y
p5a0/corner_x = -541.694
p5a0/corner_y = -149.271

p5a1/min_fs = 0
p5a1/min_ss = 2624
p5a1/max_fs = 127
p5a1/max_ss = 2687
p5a1/fs = -0.000318x -1.000000y
p5a1/ss = +1.000000x -0.000318y
p5a1/corner_x = -475.697
p5a1/corner_y = -149.299

p5a2/min_fs = 0
p5a2/min_ss = 2688
p5a2/max_fs = 127
p5a2/max_ss = 2751
p5a2/fs = -0.000318x -1.000000y
p5a2/ss = +1.000000x -0.000318y
p5a2/corner_x = -409.699
p5a2/corner_y = -149.328

p5a3/min_fs = 0
p5a3/min_ss = 2752
p5a3/max_fs = 127
p5a3/max_ss = 2815
p5a3/fs = -0.000318x -1.000000y
p5a3/ss = +1.000000x -0.000318y
p5a3/corner_x = -343.702
p5a3/corner_y = -149.357

p5a4/min_fs = 0
p5a4/min_ss = 2816
p5a4/max_fs = 127
p5a4/max_ss = 2879
p5a4/fs = -0.000318x -1.000000y
p5a4/ss = +1.000000x -0.000318y
p5a4/corner_x = -277.704
p5a4/corner_y = -149.385

p5a5/min_fs = 0
p5a5/min_ss = 2880
p5a5/max_fs = 127
p5a5/max_ss = 2943
p5a5/fs = -0.000318x -1.000000y
p5a5/ss = +1.000000x -0.000318y
p5a5/corner_x = -211.689
p5a5/corner_y = -149.414

p5a6/min_fs = 0
p5a6/min_ss = 2944
p5a6/max_fs = 127
p5a6/max_ss = 3007
p5a6/fs = -0.000318x -1.000000y
p5a6/ss = +1.000000x -0.000318y
p5a6/corner_x = -145.688
p5a6/corner_y = -149.443

p5a7/min_fs = 0
p5a7/min_ss = 3008
p5a7/max_fs = 127
p5a7/max_ss = 3071
p5a7/fs = -0.000318x -1.000000y
p5a7/ss = +1.000000x -0.000318y
p5a7/corner_x = -79.688
p5a7/corner_y = -149.471

p6a0/min_fs = 0
p6a0/min_ss = 3072
p6a0/max_fs = 127
p6a0/max_ss = 3135
p6a0/fs = -0.004196x -0.999992y
p6a0/ss = +0.999992x -0.004196y
p6a0/corner_x = -541.661
p6a0/corner_y = -304.813

p6a1/min_fs = 0
p6a1/min_ss = 3136
p6a1/max_fs = 127
p6a1/max_ss = 3199
p6a1/fs = -0.004196x -0.999992y
p6a1/ss = +0.999992x -0.004196y
p6a1/corner_x = -475.664
p6a1/corner_y = -305.098

p6a2/min_fs = 0
p6a2/min_ss = 3200
p6a2/max_fs = 127
p6a2/max_ss = 3263
p6a2/fs = -0.004196x -0.999992y
p6a2/ss = +0.999992x -0.004196y
p6a2/corner_x = -409.667
p6a2/corner_y = -305.384

p6a3/min_fs = 0
p6a3/min_ss = 3264
p6a3/max_fs = 127
p6a3/max_ss = 3327
p6a3/fs = -0.004196x -0.999992y
p6a3/ss = +0.999992x -0.004196y
p6a3/corner_x = -343.669
p6a3/corner_y = -305.670

p6a4/min_fs = 0
p6a4/min_ss = 3328
p6a4/max_fs = 127
p6a4/max_ss = 3391
p6a4/fs = -0.004196x -0.999992y
p6a4/ss = +0.999992x -0.004196y
p6a4/corner_x = -277.673
p6a4/corner_y = -305.955

p6a5/min_fs = 0
p6a5/min_ss = 3392
p6a5/max_fs = 127
p6a5/max_ss = 3455
p6a5/fs = -0.004196x -0.999992y
p6a5/ss = +0.999992x -0.004196y
p6a5/corner_x = -211.674
p6a5/corner_y = -306.241

p6a6/min_fs = 0
p6a6/min_ss = 3456
p6a6/max_fs = 127
p6a6/max_ss = 3519
p6a6/fs = -0.004196x -0.999992y
p6a6/ss = +0.999992x -0.004196y
p6a6/corner_x = -145.677
p6a6/corner_y = -306.526

p6a7/min_fs = 0
p6a7/min_ss = 3520
p6a7/max_fs = 127
p6a7/max_ss = 3583
p6a7/fs = -0.004196x -0.999992y
p6a7/ss = +0.999992x -0.004196y
p6a7/corner_x = -79.679
p6a7/corner_y = -306.812

p7a0/min_fs = 0
p7a0/min_ss = 3584
p7a0/max_fs = 127
p7a0/max_ss = 3647
p7a0/fs = -0.002957x -0.999994y
p7a0/ss = +0.999994x -0.002957y
p7a0/corner_x = -541.666
p7a0/corner_y = -462.479

p7a1/min_fs = 0
p7a1/min_ss = 3648
p7a1/max_fs = 127
p7a1/max_ss = 3711
p7a1/fs = -0.002957x -0.999994y
p7a1/ss = +0.999994x -0.002957y
p7a1/corner_x = -475.672
p7a1/corner_y = -462.677

p7a2/min_fs = 0
p7a2/min_ss = 3712
p7a2/max_fs = 127
p7a2/max_ss = 3775
p7a2/fs = -0.002957x -0.999994y
p7a2/ss = +0.999994x -0.002957y
p7a2/corner_x = -409.676
p7a2/corner_y = -462.875

p7a3/min_fs = 0
p7a3/min_ss = 3776
p7a3/max_fs = 127
p7a3/max_ss = 3839
p7a3/fs = -0.002957x -0.999994y
p7a3/ss = +0.999994x -0.002957y
p7a3/corner_x = -343.679
p7a3/corner_y = -463.073

p7a4/min_fs = 0
p7a4/min_ss = 3840
p7a4/max_fs = 127
p7a4/max_ss = 3903
p7a4/fs = -0.002957x -0.999994y
p7a4/ss = +0.999994x -0.002957y
p7a4/corner_x = -277.683
p7a4/corner_y = -463.271

p7a5/min_fs = 0
p7a5/min_ss = 3904
p7a5/max_fs = 127
p7a5/max_ss = 3967
p7a5/fs = -0.002957x -0.999994y
p7a5/ss = +0.999994x -0.002957y
p7a5/corner_x = -211.686
p7a5/corner_y = -463.469

p7a6/min_fs = 0
p7a6/min_ss = 3968
p7a6/max_fs = 127
p7a6/max_ss = 4031
p7a6/fs = -0.002957x -0.999994y
p7a6/ss = +0.999994x -0.002957y
p7a6/corner_x = -145.688
p7a6/corner_y = -463.667

p7a7/min_fs = 0
p7a7/min_ss = 4032
p7a7/max_fs = 127
p7a7/max_ss = 4095
p7a7/fs = -0.002957x -0.999994y
p7a7/ss = +0.999994x -0.002957y
p7a7/corner_x = -79.691
p7a7/corner_y = -463.864

p8a0/min_fs = 0
p8a0/min_ss = 4096
p8a0/max_fs = 127
p8a0/max_ss = 4159
p8a0/fs = +0.000124x +1.000000y
p8a0/ss = -1.000000x +0.000124y
p8a0/corner_x = 530.964
p8a0/corner_y = -154.025

p8a1/min_fs = 0
p8a1/min_ss = 4160
p8a1/max_fs = 127
p8a1/max_ss = 4223
p8a1/fs = +0.000124x +1.000000y
p8a1/ss = -1.000000x +0.000124y
p8a1/corner_x = 464.966
p8a1/corner_y = -154.022

p8a2/min_fs = 0
p8a2/min_ss = 4224
p8a2/max_fs = 127
p8a2/max_ss = 4287
p8a2/fs = +0.000124x +1.000000y
p8a2/ss = -1.000000x +0.000124y
p8a2/corner_x = 398.967
p8a2/corner_y = -154.019

p8a3/min_fs = 0
p8a3/min_ss = 4288
p8a3/max_fs = 127
p8a3/max_ss = 4351
p8a3/fs = +0.000124x +1.000000y
p8a3/ss = -1.000000x +0.000124y
p8a3/corner_x = 332.970
p8a3/corner_y = -154.016

p8a4/min_fs = 0
p8a4/min_ss = 4352
p8a4/max_fs = 127
p8a4/max_ss = 4415
p8a4/fs = +0.000124x +1.000000y
p8a4/ss = -1.000000x +0.000124y
p8a4/corner_x = 266.972
p8a4/corner_y = -154.014

p8a5/min_fs = 0
p8a5/min_ss = 4416
p8a5/max_fs = 127
p8a5/max_ss = 4479
p8a5/fs = +0.000124x +1.000000y
p8a5/ss = -1.000000x +0.000124y
p8a5/corner_x = 200.973
p8a5/corner_y = -154.011

p8a6/min_fs = 0
p8a6/min_ss = 4480
p8a6/max_fs = 127
p8a6/max_ss = 4543
p8a6/fs = +0.000124x +1.000000y
p8a6/ss = -1.000000x +0.000124y
p8a6/corner_x = 134.975
p8a6/corner_y = -154.008

p8a7/min_fs = 0
p8a7/min_ss = 4544
p8a7/max_fs = 127
p8a7/max_ss = 4607
p8a7/fs = +0.000124x +1.000000y
p8a7/ss = -1.000000x +0.000124y
p8a7/corner_x = 68.977
p8a7/corner_y = -154.006

p9a0/min_fs = 0
p9a0/min_ss = 4608
p9a0/max_fs = 127
p9a0/max_ss = 4671
p9a0/fs = +0.000404x +0.999999y
p9a0/ss = -0.999999x +0.000404y
p9a0/corner_x = 530.756
p9a0/corner_y = -311.286

p9a1/min_fs = 0
p9a1/min_ss = 4672
p9a1/max_fs = 127
p9a1/max_ss = 4735
p9a1/fs = +0.000404x +0.999999y
p9a1/ss = -0.999999x +0.000404y
p9a1/corner_x = 464.760
p9a1/corner_y = -311.263

p9a2/min_fs = 0
p9a2/min_ss = 4736
p9a2/max_fs = 127
p9a2/max_ss = 4799
p9a2/fs = +0.000404x +0.999999y
p9a2/ss = -0.999999x +0.000404y
p9a2/corner_x = 398.763
p9a2/corner_y = -311.240

p9a3/min_fs = 0
p9a3/min_ss = 4800
p9a3/max_fs = 127
p9a3/max_ss = 4863
p9a3/fs = +0.000404x +0.999999y
p9a3/ss = -0.999999x +0.000404y
p9a3/corner_x = 332.766
p9a3/corner_y = -311.217

p9a4/min_fs = 0
p9a4/min_ss = 4864
p9a4/max_fs = 127
p9a4/max_ss = 4927
p9a4/fs = +0.000404x +0.999999y
p9a4/ss = -0.999999x +0.000404y
p9a4/corner_x = 266.768
p9a4/corner_y = -311.194

p9a5/min_fs = 0
p9a5/min_ss = 4928
p9a5/max_fs = 127
p9a5/max_ss = 4991
p9a5/fs = +0.000404x +0.999999y
p9a5/ss = -0.999999x +0.000404y
p9a5/corner_x = 200.771
p9a5/corner_y = -311.171

p9a6/min_fs = 0
p9a6/min_ss = 4992
p9a6/max_fs = 127
p9a6/max_ss = 5055
p9a6/fs = +0.000404x +0.999999y
p9a6/ss = -0.999999x +0.000404y
p9a6/corner_x = 134.752
p9a6/corner_y = -311.147

p9a7/min_fs = 0
p9a7/min_ss = 5056
p9a7/max_fs = 127
p9a7/max_ss = 5119
p9a7/fs = +0.000404x +0.999999y
p9a7/ss = -0.999999x +0.000404y
p9a7/corner_x = 68.750
p9a7/corner_y = -311.124

p10a0/min_fs = 0
p10a0/min_ss = 5120
p10a0/max_fs = 127
p10a0/max_ss = 5183
p10a0/fs = -0.001205x +0.999999y
p10a0/ss = -0.999999x -0.001205y
p10a0/corner_x = -311.124
p10a0/corner_y = -467.325

p10a1/min_fs = 0
p10a1/min_ss = 5184
p10a1/max_fs = 127
p10a1/max_ss = 5247
p10a1/fs = -0.001205x +0.999999y
p10a1/ss = -0.999999x -0.001205y
p10a1/corner_x = 464.436
p10a1/corner_y = -467.413

p10a2/min_fs = 0
p10a2/min_ss = 5248
p10a2/max_fs = 127
p10a2/max_ss = 5311
p10a2/fs = -0.001205x +0.999999y
p10a2/ss = -0.999999x -0.001205y
p10a2/corner_x = 398.438
p10a2/corner_y = -467.502

p10a3/min_fs = 0
p10a3/min_ss = 5312
p10a3/max_fs = 127
p10a3/max_ss = 5375
p10a3/fs = -0.001205x +0.999999y
p10a3/ss = -0.999999x -0.001205y
p10a3/corner_x = 332.442
p10a3/corner_y = -467.591

p10a4/min_fs = 0
p10a4/min_ss = 5376
p10a4/max_fs = 127
p10a4/max_ss = 5439
p10a4/fs = -0.001205x +0.999999y
p10a4/ss = -0.999999x -0.001205y
p10a4/corner_x = 266.444
p10a4/corner_y = -467.679

p10a5/min_fs = 0
p10a5/min_ss = 5440
p10a5/max_fs = 127
p10a5/max_ss = 5503
p10a5/fs = -0.001205x +0.999999y
p10a5/ss = -0.999999x -0.001205y
p10a5/corner_x = 200.447
p10a5/corner_y = -467.768

p10a6/min_fs = 0
p10a6/min_ss = 5504
p10a6/max_fs = 127
p10a6/max_ss = 5567
p10a6/fs = -0.001205x +0.999999y
p10a6/ss = -0.999999x -0.001205y
p10a6/corner_x = 134.451
p10a6/corner_y = -467.856

p10a7/min_fs = 0
p10a7/min_ss = 5568
p10a7/max_fs = 127
p10a7/max_ss = 5631
p10a7/fs = -0.001205x +0.999999y
p10a7/ss = -0.999999x -0.001205y
p10a7/corner_x = 68.453
p10a7/corner_y = -467.945

p11a0/min_fs = 0
p11a0/min_ss = 5632
p11a0/max_fs = 127
p11a0/max_ss = 5695
p11a0/fs = -0.000520x +0.999999y
p11a0/ss = -0.999999x -0.000520y
p11a0/corner_x = 529.627
p11a0/corner_y = -625.711

p11a1/min_fs = 0
p11a1/min_ss = 5696
p11a1/max_fs = 127
p11a1/max_ss = 5759
p11a1/fs = -0.000520x +0.999999y
p11a1/ss = -0.999999x -0.000520y
p11a1/corner_x = 463.628
p11a1/corner_y = -625.751

p11a2/min_fs = 0
p11a2/min_ss = 5760
p11a2/max_fs = 127
p11a2/max_ss = 5823
p11a2/fs = -0.000520x +0.999999y
p11a2/ss = -0.999999x -0.000520y
p11a2/corner_x = 397.630
p11a2/corner_y = -625.792

p11a3/min_fs = 0
p11a3/min_ss = 5824
p11a3/max_fs = 127
p11a3/max_ss = 5887
p11a3/fs = -0.000520x +0.999999y
p11a3/ss = -0.999999x -0.000520y
p11a3/corner_x = 331.633
p11a3/corner_y = -625.832

p11a4/min_fs = 0
p11a4/min_ss = 5888
p11a4/max_fs = 127
p11a4/max_ss = 5951
p11a4/fs = -0.000520x +0.999999y
p11a4/ss = -0.999999x -0.000520y
p11a4/corner_x = 265.638
p11a4/corner_y = -625.872

p11a5/min_fs = 0
p11a5/min_ss = 5952
p11a5/max_fs = 127
p11a5/max_ss = 6015
p11a5/fs = -0.000520x +0.999999y
p11a5/ss = -0.999999x -0.000520y
p11a5/corner_x = 199.640
p11a5/corner_y = -625.913

p11a6/min_fs = 0
p11a6/min_ss = 6016
p11a6/max_fs = 127
p11a6/max_ss = 6079
p11a6/fs = -0.000520x +0.999999y
p11a6/ss = -0.999999x -0.000520y
p11a6/corner_x = 133.644
p11a6/corner_y = -625.953

p11a7/min_fs = 0
p11a7/min_ss = 6080
p11a7/max_fs = 127
p11a7/max_ss = 6143
p11a7/fs = -0.000520x +0.999999y
p11a7/ss = -0.999999x -0.000520y
p11a7/corner_x = 67.642
p11a7/corner_y = -625.993

p12a0/min_fs = 0
p12a0/min_ss = 6144
p12a0/max_fs = 127
p12a0/max_ss = 6207
p12a0/fs = +0.000306x +1.000000y
p12a0/ss = -1.000000x +0.000306y
p12a0/corner_x = 568.051
p12a0/corner_y = 480.776

p12a1/min_fs = 0
p12a1/min_ss = 6208
p12a1/max_fs = 127
p12a1/max_ss = 6271
p12a1/fs = +0.000306x +1.000000y
p12a1/ss = -1.000000x +0.000306y
p12a1/corner_x = 502.052
p12a1/corner_y = 480.750

p12a2/min_fs = 0
p12a2/min_ss = 6272
p12a2/max_fs = 127
p12a2/max_ss = 6335
p12a2/fs = +0.000306x +1.000000y
p12a2/ss = -1.000000x +0.000306y
p12a2/corner_x = 436.055
p12a2/corner_y = 480.724

p12a3/min_fs = 0
p12a3/min_ss = 6336
p12a3/max_fs = 127
p12a3/max_ss = 6399
p12a3/fs = +0.000306x +1.000000y
p12a3/ss = -1.000000x +0.000306y
p12a3/corner_x = 370.051
p12a3/corner_y = 480.837

p12a4/min_fs = 0
p12a4/min_ss = 6400
p12a4/max_fs = 127
p12a4/max_ss = 6463
p12a4/fs = +0.000306x +1.000000y
p12a4/ss = -1.000000x +0.000306y
p12a4/corner_x = 304.051
p12a4/corner_y = 480.857

p12a5/min_fs = 0
p12a5/min_ss = 6464
p12a5/max_fs = 127
p12a5/max_ss = 6527
p12a5/fs = +0.000306x +1.000000y
p12a5/ss = -1.000000x +0.000306y
p12a5/corner_x = 238.051
p12a5/corner_y = 480.877

p12a6/min_fs = 0
p12a6/min_ss = 6528
p12a6/max_fs = 127
p12a6/max_ss = 6591
p12a6/fs = +0.000306x +1.000000y
p12a6/ss = -1.000000x +0.000306y
p12a6/corner_x = 172.051
p12a6/corner_y = 480.897

p12a7/min_fs = 0
p12a7/min_ss = 6592
p12a7/max_fs = 127
p12a7/max_ss = 6655
p12a7/fs = +0.000306x +1.000000y
p12a7/ss = -1.000000x +0.000306y
p12a7/corner_x = 106.051
p12a7/corner_y = 480.917

p13a0/min_fs = 0
p13a0/min_ss = 6656
p13a0/max_fs = 127
p13a0/max_ss = 6719
p13a0/fs = +0.002537x +0.999996y
p13a0/ss = -0.999996x +0.002537y
p13a0/corner_x = 566.925
p13a0/corner_y = 323.446

p13a1/min_fs = 0
p13a1/min_ss = 6720
p13a1/max_fs = 127
p13a1/max_ss = 6783
p13a1/fs = +0.002537x +0.999996y
p13a1/ss = -0.999996x +0.002537y
p13a1/corner_x = 500.926
p13a1/corner_y = 323.602

p13a2/min_fs = 0
p13a2/min_ss = 6784
p13a2/max_fs = 127
p13a2/max_ss = 6847
p13a2/fs = +0.002537x +0.999996y
p13a2/ss = -0.999996x +0.002537y
p13a2/corner_x = 434.931
p13a2/corner_y = 323.758

p13a3/min_fs = 0
p13a3/min_ss = 6848
p13a3/max_fs = 127
p13a3/max_ss = 6911
p13a3/fs = +0.002537x +0.999996y
p13a3/ss = -0.999996x +0.002537y
p13a3/corner_x = 368.934
p13a3/corner_y = 323.914

p13a4/min_fs = 0
p13a4/min_ss = 6912
p13a4/max_fs = 127
p13a4/max_ss = 6975
p13a4/fs = +0.002537x +0.999996y
p13a4/ss = -0.999996x +0.002537y
p13a4/corner_x = 302.937
p13a4/corner_y = 324.070

p13a5/min_fs = 0
p13a5/min_ss = 6976
p13a5/max_fs = 127
p13a5/max_ss = 7039
p13a5/fs = +0.002537x +0.999996y
p13a5/ss = -0.999996x +0.002537y
p13a5/corner_x = 236.922
p13a5/corner_y = 324.225

p13a6/min_fs = 0
p13a6/min_ss = 7040
p13a6/max_fs = 127
p13a6/max_ss = 7103
p13a6/fs = +0.002537x +0.999996y
p13a6/ss = -0.999996x +0.002537y
p13a6/corner_x = 170.922
p13a6/corner_y = 324.381

p13a7/min_fs = 0
p13a7/min_ss = 7104
p13a7/max_fs = 127
p13a7/max_ss = 7167
p13a7/fs = +0.002537x +0.999996y
p13a7/ss = -0.999996x +0.002537y
p13a7/corner_x = 104.922
p13a7/corner_y = 324.537

p14a0/min_fs = 0
p14a0/min_ss = 7168
p14a0/max_fs = 127
p14a0/max_ss = 7231
p14a0/fs = -0.000234x +1.000000y
p14a0/ss = -1.000000x -0.000234y
p14a0/corner_x = 568.157
p14a0/corner_y = 167.444

p14a1/min_fs = 0
p14a1/min_ss = 7232
p14a1/max_fs = 127
p14a1/max_ss = 7295
p14a1/fs = -0.000234x +1.000000y
p14a1/ss = -1.000000x -0.000234y
p14a1/corner_x = 502.159
p14a1/corner_y = 167.425

p14a2/min_fs = 0
p14a2/min_ss = 7296
p14a2/max_fs = 127
p14a2/max_ss = 7359
p14a2/fs = -0.000234x +1.000000y
p14a2/ss = -1.000000x -0.000234y
p14a2/corner_x = 436.162
p14a2/corner_y = 167.407

p14a3/min_fs = 0
p14a3/min_ss = 7360
p14a3/max_fs = 127
p14a3/max_ss = 7423
p14a3/fs = -0.000234x +1.000000y
p14a3/ss = -1.000000x -0.000234y
p14a3/corner_x = 370.164
p14a3/corner_y = 167.388

p14a4/min_fs = 0
p14a4/min_ss = 7424
p14a4/max_fs = 127
p14a4/max_ss = 7487
p14a4/fs = -0.000234x +1.000000y
p14a4/ss = -1.000000x -0.000234y
p14a4/corner_x = 304.166
p14a4/corner_y = 167.370

p14a5/min_fs = 0
p14a5/min_ss = 7488
p14a5/max_fs = 127
p14a5/max_ss = 7551
p14a5/fs = -0.000234x +1.000000y
p14a5/ss = -1.000000x -0.000234y
p14a5/corner_x = 238.152
p14a5/corner_y = 167.351

p14a6/min_fs = 0
p14a6/min_ss = 7552
p14a6/max_fs = 127
p14a6/max_ss = 7615
p14a6/fs = -0.000234x +1.000000y
p14a6/ss = -1.000000x -0.000234y
p14a6/corner_x = 172.151
p14a6/corner_y = 167.332

p14a7/min_fs = 0
p14a7/min_ss = 7616
p14a7/max_fs = 127
p14a7/max_ss = 7679
p14a7/fs = -0.000234x +1.000000y
p14a7/ss = -1.000000x -0.000234y
p14a7/corner_x = 106.149
p14a7/corner_y = 167.314

p15a0/min_fs = 0
p15a0/min_ss = 7680
p15a0/max_fs = 127
p15a0/max_ss = 7743
p15a0/fs = +0.001282x +1.000001y
p15a0/ss = -1.000001x +0.001282y
p15a0/corner_x = 567.491
p15a0/corner_y = 10.492

p15a1/min_fs = 0
p15a1/min_ss = 7744
p15a1/max_fs = 127
p15a1/max_ss = 7807
p15a1/fs = +0.001282x +1.000001y
p15a1/ss = -1.000001x +0.001282y
p15a1/corner_x = 501.493
p15a1/corner_y = 10.571

p15a2/min_fs = 0
p15a2/min_ss = 7808
p15a2/max_fs = 127
p15a2/max_ss = 7871
p15a2/fs = +0.001282x +1.000001y
p15a2/ss = -1.000001x +0.001282y
p15a2/corner_x = 435.496
p15a2/corner_y = 10.649

p15a3/min_fs = 0
p15a3/min_ss = 7872
p15a3/max_fs = 127
p15a3/max_ss = 7935
p15a3/fs = +0.001282x +1.000001y
p15a3/ss = -1.000001x +0.001282y
p15a3/corner_x = 369.498
p15a3/corner_y = 10.728

p15a4/min_fs = 0
p15a4/min_ss = 7936
p15a4/max_fs = 127
p15a4/max_ss = 7999
p15a4/fs = +0.001282x +1.000001y
p15a4/ss = -1.000001x +0.001282y
p15a4/corner_x = 303.498
p15a4/corner_y = 10.806

p15a5/min_fs = 0
p15a5/min_ss = 8000
p15a5/max_fs = 127
p15a5/max_ss = 8063
p15a5/fs = +0.001282x +1.000001y
p15a5/ss = -1.000001x +0.001282y
p15a5/corner_x = 237.481
p15a5/corner_y = 10.884

p15a6/min_fs = 0
p15a6/min_ss = 8064
p15a6/max_fs = 127
p15a6/max_ss = 8127
p15a6/fs = +0.001282x +1.000001y
p15a6/ss = -1.000001x +0.001282y
p15a6/corner_x = 171.480
p15a6/corner_y = 10.963

p15a7/min_fs = 0
p15a7/min_ss = 8128
p15a7/max_fs = 127
p15a7/max_ss = 8191
p15a7/fs = +0.001282x +1.000001y
p15a7/ss = -1.000001x +0.001282y
p15a7/corner_x = 105.479
p15a7/corner_y = 11.041
















p0a0/coffset = 0.001112
p0a1/coffset = 0.001112
p0a2/coffset = 0.001112
p0a3/coffset = 0.001112
p0a4/coffset = 0.001112
p0a5/coffset = 0.001112
p0a6/coffset = 0.001112
p0a7/coffset = 0.001112
p1a0/coffset = 0.000934
p1a1/coffset = 0.000934
p1a2/coffset = 0.000934
p1a3/coffset = 0.000934
p1a4/coffset = 0.000934
p1a5/coffset = 0.000934
p1a6/coffset = 0.000934
p1a7/coffset = 0.000934
p2a0/coffset = 0.000685
p2a1/coffset = 0.000685
p2a2/coffset = 0.000685
p2a3/coffset = 0.000685
p2a4/coffset = 0.000685
p2a5/coffset = 0.000685
p2a6/coffset = 0.000685
p2a7/coffset = 0.000685
p3a0/coffset = 0.000920
p3a1/coffset = 0.000920
p3a2/coffset = 0.000920
p3a3/coffset = 0.000920
p3a4/coffset = 0.000920
p3a5/coffset = 0.000920
p3a6/coffset = 0.000920
p3a7/coffset = 0.000920
p4a0/coffset = 0.000750
p4a1/coffset = 0.000750
p4a2/coffset = 0.000750
p4a3/coffset = 0.000750
p4a4/coffset = 0.000750
p4a5/coffset = 0.000750
p4a6/coffset = 0.000750
p4a7/coffset = 0.000750
p5a0/coffset = 0.000863
p5a1/coffset = 0.000863
p5a2/coffset = 0.000863
p5a3/coffset = 0.000863
p5a4/coffset = 0.000863
p5a5/coffset = 0.000863
p5a6/coffset = 0.000863
p5a7/coffset = 0.000863
p6a0/coffset = 0.000926
p6a1/coffset = 0.000926
p6a2/coffset = 0.000926
p6a3/coffset = 0.000926
p6a4/coffset = 0.000926
p6a5/coffset = 0.000926
p6a6/coffset = 0.000926
p6a7/coffset = 0.000926
p7a0/coffset = 0.001421
p7a1/coffset = 0.001421
p7a2/coffset = 0.001421
p7a3/coffset = 0.001421
p7a4/coffset = 0.001421
p7a5/coffset = 0.001421
p7a6/coffset = 0.001421
p7a7/coffset = 0.001421
p8a0/coffset = 0.000612
p8a1/coffset = 0.000612
p8a2/coffset = 0.000612
p8a3/coffset = 0.000612
p8a4/coffset = 0.000612
p8a5/coffset = 0.000612
p8a6/coffset = 0.000612
p8a7/coffset = 0.000612
p9a0/coffset = 0.000765
p9a1/coffset = 0.000765
p9a2/coffset = 0.000765
p9a3/coffset = 0.000765
p9a4/coffset = 0.000765
p9a5/coffset = 0.000765
p9a6/coffset = 0.000765
p9a7/coffset = 0.000765
p10a0/coffset = 0.000965
p10a1/coffset = 0.000965
p10a2/coffset = 0.000965
p10a3/coffset = 0.000965
p10a4/coffset = 0.000965
p10a5/coffset = 0.000965
p10a6/coffset = 0.000965
p10a7/coffset = 0.000965
p11a0/coffset = 0.001074
p11a1/coffset = 0.001074
p11a2/coffset = 0.001074
p11a3/coffset = 0.001074
p11a4/coffset = 0.001074
p11a5/coffset = 0.001074
p11a6/coffset = 0.001074
p11a7/coffset = 0.001074
p12a0/coffset = 0.000598
p12a1/coffset = 0.000598
p12a2/coffset = 0.000598
p12a3/coffset = 0.000598
p12a4/coffset = 0.000598
p12a5/coffset = 0.000598
p12a6/coffset = 0.000598
p12a7/coffset = 0.000598
p13a0/coffset = 0.000584
p13a1/coffset = 0.000584
p13a2/coffset = 0.000584
p13a3/coffset = 0.000584
p13a4/coffset = 0.000584
p13a5/coffset = 0.000584
p13a6/coffset = 0.000584
p13a7/coffset = 0.000584
p14a0/coffset = 0.000549
p14a1/coffset = 0.000549
p14a2/coffset = 0.000549
p14a3/coffset = 0.000549
p14a4/coffset = 0.000549
p14a5/coffset = 0.000549
p14a6/coffset = 0.000549
p14a7/coffset = 0.000549
p15a0/coffset = 0.000481
p15a1/coffset = 0.000481
p15a2/coffset = 0.000481
p15a3/coffset = 0.000481
p15a4/coffset = 0.000481
p15a5/coffset = 0.000481
p15a6/coffset = 0.000481
p15a7/coffset = 0.000481
