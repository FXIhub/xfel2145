; KA: Manually optimizaed with hdfsee to match AgBe rings (24.05.2019)
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
clen = 0.720
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
p0a0/corner_x = -515.636
p0a0/corner_y = 622.265

p0a1/min_fs = 0
p0a1/min_ss = 64
p0a1/max_fs = 127
p0a1/max_ss = 127
p0a1/fs = -0.001328x -0.999995y
p0a1/ss = +0.999995x -0.001328y
p0a1/corner_x = -449.636
p0a1/corner_y = 622.156

p0a2/min_fs = 0
p0a2/min_ss = 128
p0a2/max_fs = 127
p0a2/max_ss = 191
p0a2/fs = -0.001328x -0.999995y
p0a2/ss = +0.999995x -0.001328y
p0a2/corner_x = -383.642
p0a2/corner_y = 622.046

p0a3/min_fs = 0
p0a3/min_ss = 192
p0a3/max_fs = 127
p0a3/max_ss = 255
p0a3/fs = -0.001328x -0.999995y
p0a3/ss = +0.999995x -0.001328y
p0a3/corner_x = -317.64
p0a3/corner_y = 621.936

p0a4/min_fs = 0
p0a4/min_ss = 256
p0a4/max_fs = 127
p0a4/max_ss = 319
p0a4/fs = -0.001328x -0.999995y
p0a4/ss = +0.999995x -0.001328y
p0a4/corner_x = -251.64
p0a4/corner_y = 621.827

p0a5/min_fs = 0
p0a5/min_ss = 320
p0a5/max_fs = 127
p0a5/max_ss = 383
p0a5/fs = -0.001328x -0.999995y
p0a5/ss = +0.999995x -0.001328y
p0a5/corner_x = -185.638
p0a5/corner_y = 621.827

p0a6/min_fs = 0
p0a6/min_ss = 384
p0a6/max_fs = 127
p0a6/max_ss = 447
p0a6/fs = -0.001328x -0.999995y
p0a6/ss = +0.999995x -0.001328y
p0a6/corner_x = -119.638
p0a6/corner_y = 621.739

p0a7/min_fs = 0
p0a7/min_ss = 448
p0a7/max_fs = 127
p0a7/max_ss = 511
p0a7/fs = -0.001328x -0.999995y
p0a7/ss = +0.999995x -0.001328y
p0a7/corner_x = -53.6383
p0a7/corner_y = 621.651

p1a0/min_fs = 0
p1a0/min_ss = 512
p1a0/max_fs = 127
p1a0/max_ss = 575
p1a0/fs = -0.001977x -0.999998y
p1a0/ss = +0.999998x -0.001977y
p1a0/corner_x = -515.843
p1a0/corner_y = 465.049

p1a1/min_fs = 0
p1a1/min_ss = 576
p1a1/max_fs = 127
p1a1/max_ss = 639
p1a1/fs = -0.001977x -0.999998y
p1a1/ss = +0.999998x -0.001977y
p1a1/corner_x = -449.845
p1a1/corner_y = 464.93

p1a2/min_fs = 0
p1a2/min_ss = 640
p1a2/max_fs = 127
p1a2/max_ss = 703
p1a2/fs = -0.001977x -0.999998y
p1a2/ss = +0.999998x -0.001977y
p1a2/corner_x = -383.847
p1a2/corner_y = 464.811

p1a3/min_fs = 0
p1a3/min_ss = 704
p1a3/max_fs = 127
p1a3/max_ss = 767
p1a3/fs = -0.001977x -0.999998y
p1a3/ss = +0.999998x -0.001977y
p1a3/corner_x = -317.85
p1a3/corner_y = 464.692

p1a4/min_fs = 0
p1a4/min_ss = 768
p1a4/max_fs = 127
p1a4/max_ss = 831
p1a4/fs = -0.001977x -0.999998y
p1a4/ss = +0.999998x -0.001977y
p1a4/corner_x = -251.852
p1a4/corner_y = 464.574

p1a5/min_fs = 0
p1a5/min_ss = 832
p1a5/max_fs = 127
p1a5/max_ss = 895
p1a5/fs = -0.001977x -0.999998y
p1a5/ss = +0.999998x -0.001977y
p1a5/corner_x = -185.856
p1a5/corner_y = 464.455

p1a6/min_fs = 0
p1a6/min_ss = 896
p1a6/max_fs = 127
p1a6/max_ss = 959
p1a6/fs = -0.001977x -0.999998y
p1a6/ss = +0.999998x -0.001977y
p1a6/corner_x = -119.838
p1a6/corner_y = 464.336

p1a7/min_fs = 0
p1a7/min_ss = 960
p1a7/max_fs = 127
p1a7/max_ss = 1023
p1a7/fs = -0.001977x -0.999998y
p1a7/ss = +0.999998x -0.001977y
p1a7/corner_x = -53.837
p1a7/corner_y = 464.217

p2a0/min_fs = 0
p2a0/min_ss = 1024
p2a0/max_fs = 127
p2a0/max_ss = 1087
p2a0/fs = -0.000961x -1.000001y
p2a0/ss = +1.000001x -0.000961y
p2a0/corner_x = -515.838
p2a0/corner_y = 308.335

p2a1/min_fs = 0
p2a1/min_ss = 1088
p2a1/max_fs = 127
p2a1/max_ss = 1151
p2a1/fs = -0.000961x -1.000001y
p2a1/ss = +1.000001x -0.000961y
p2a1/corner_x = -449.839
p2a1/corner_y = 308.263

p2a2/min_fs = 0
p2a2/min_ss = 1152
p2a2/max_fs = 127
p2a2/max_ss = 1215
p2a2/fs = -0.000961x -1.000001y
p2a2/ss = +1.000001x -0.000961y
p2a2/corner_x = -383.84
p2a2/corner_y = 308.191

p2a3/min_fs = 0
p2a3/min_ss = 1216
p2a3/max_fs = 127
p2a3/max_ss = 1279
p2a3/fs = -0.000961x -1.000001y
p2a3/ss = +1.000001x -0.000961y
p2a3/corner_x = -317.841
p2a3/corner_y = 308.119

p2a4/min_fs = 0
p2a4/min_ss = 1280
p2a4/max_fs = 127
p2a4/max_ss = 1343
p2a4/fs = -0.000961x -1.000001y
p2a4/ss = +1.000001x -0.000961y
p2a4/corner_x = -251.842
p2a4/corner_y = 308.048

p2a5/min_fs = 0
p2a5/min_ss = 1344
p2a5/max_fs = 127
p2a5/max_ss = 1407
p2a5/fs = -0.000961x -1.000001y
p2a5/ss = +1.000001x -0.000961y
p2a5/corner_x = -185.844
p2a5/corner_y = 307.976

p2a6/min_fs = 0
p2a6/min_ss = 1408
p2a6/max_fs = 127
p2a6/max_ss = 1471
p2a6/fs = -0.000961x -1.000001y
p2a6/ss = +1.000001x -0.000961y
p2a6/corner_x = -119.829
p2a6/corner_y = 307.904

p2a7/min_fs = 0
p2a7/min_ss = 1472
p2a7/max_fs = 127
p2a7/max_ss = 1535
p2a7/fs = -0.000961x -1.000001y
p2a7/ss = +1.000001x -0.000961y
p2a7/corner_x = -53.8263
p2a7/corner_y = 307.832

p3a0/min_fs = 0
p3a0/min_ss = 1536
p3a0/max_fs = 127
p3a0/max_ss = 1599
p3a0/fs = +0.001590x -0.999999y
p3a0/ss = +0.999999x +0.001590y
p3a0/corner_x = -516.114
p3a0/corner_y = 150.623

p3a1/min_fs = 0
p3a1/min_ss = 1600
p3a1/max_fs = 127
p3a1/max_ss = 1663
p3a1/fs = +0.001590x -0.999999y
p3a1/ss = +0.999999x +0.001590y
p3a1/corner_x = -450.117
p3a1/corner_y = 150.73

p3a2/min_fs = 0
p3a2/min_ss = 1664
p3a2/max_fs = 127
p3a2/max_ss = 1727
p3a2/fs = +0.001590x -0.999999y
p3a2/ss = +0.999999x +0.001590y
p3a2/corner_x = -384.119
p3a2/corner_y = 150.837

p3a3/min_fs = 0
p3a3/min_ss = 1728
p3a3/max_fs = 127
p3a3/max_ss = 1791
p3a3/fs = +0.001590x -0.999999y
p3a3/ss = +0.999999x +0.001590y
p3a3/corner_x = -318.123
p3a3/corner_y = 150.943

p3a4/min_fs = 0
p3a4/min_ss = 1792
p3a4/max_fs = 127
p3a4/max_ss = 1855
p3a4/fs = +0.001590x -0.999999y
p3a4/ss = +0.999999x +0.001590y
p3a4/corner_x = -252.123
p3a4/corner_y = 151.05

p3a5/min_fs = 0
p3a5/min_ss = 1856
p3a5/max_fs = 127
p3a5/max_ss = 1919
p3a5/fs = +0.001590x -0.999999y
p3a5/ss = +0.999999x +0.001590y
p3a5/corner_x = -186.109
p3a5/corner_y = 151.157

p3a6/min_fs = 0
p3a6/min_ss = 1920
p3a6/max_fs = 127
p3a6/max_ss = 1983
p3a6/fs = +0.001590x -0.999999y
p3a6/ss = +0.999999x +0.001590y
p3a6/corner_x = -120.106
p3a6/corner_y = 151.264

p3a7/min_fs = 0
p3a7/min_ss = 1984
p3a7/max_fs = 127
p3a7/max_ss = 2047
p3a7/fs = +0.001590x -0.999999y
p3a7/ss = +0.999999x +0.001590y
p3a7/corner_x = -54.1063
p3a7/corner_y = 151.371

p4a0/min_fs = 0
p4a0/min_ss = 2048
p4a0/max_fs = 127
p4a0/max_ss = 2111
p4a0/fs = -0.001899x -0.999999y
p4a0/ss = +0.999999x -0.001899y
p4a0/corner_x = -548.422
p4a0/corner_y = -0.67029

p4a1/min_fs = 0
p4a1/min_ss = 2112
p4a1/max_fs = 127
p4a1/max_ss = 2175
p4a1/fs = -0.001899x -0.999999y
p4a1/ss = +0.999999x -0.001899y
p4a1/corner_x = -482.426
p4a1/corner_y = -0.78727

p4a2/min_fs = 0
p4a2/min_ss = 2176
p4a2/max_fs = 127
p4a2/max_ss = 2239
p4a2/fs = -0.001899x -0.999999y
p4a2/ss = +0.999999x -0.001899y
p4a2/corner_x = -416.428
p4a2/corner_y = -0.90427

p4a3/min_fs = 0
p4a3/min_ss = 2240
p4a3/max_fs = 127
p4a3/max_ss = 2303
p4a3/fs = -0.001899x -0.999999y
p4a3/ss = +0.999999x -0.001899y
p4a3/corner_x = -350.431
p4a3/corner_y = -1.02126

p4a4/min_fs = 0
p4a4/min_ss = 2304
p4a4/max_fs = 127
p4a4/max_ss = 2367
p4a4/fs = -0.001899x -0.999999y
p4a4/ss = +0.999999x -0.001899y
p4a4/corner_x = -284.432
p4a4/corner_y = -1.13825

p4a5/min_fs = 0
p4a5/min_ss = 2368
p4a5/max_fs = 127
p4a5/max_ss = 2431
p4a5/fs = -0.001899x -0.999999y
p4a5/ss = +0.999999x -0.001899y
p4a5/corner_x = -218.434
p4a5/corner_y = -1.25524

p4a6/min_fs = 0
p4a6/min_ss = 2432
p4a6/max_fs = 127
p4a6/max_ss = 2495
p4a6/fs = -0.001899x -0.999999y
p4a6/ss = +0.999999x -0.001899y
p4a6/corner_x = -152.437
p4a6/corner_y = -1.37222

p4a7/min_fs = 0
p4a7/min_ss = 2496
p4a7/max_fs = 127
p4a7/max_ss = 2559
p4a7/fs = -0.001899x -0.999999y
p4a7/ss = +0.999999x -0.001899y
p4a7/corner_x = -86.4404
p4a7/corner_y = -1.48921

p5a0/min_fs = 0
p5a0/min_ss = 2560
p5a0/max_fs = 127
p5a0/max_ss = 2623
p5a0/fs = -0.000318x -1.000000y
p5a0/ss = +1.000000x -0.000318y
p5a0/corner_x = -548.816
p5a0/corner_y = -159.254

p5a1/min_fs = 0
p5a1/min_ss = 2624
p5a1/max_fs = 127
p5a1/max_ss = 2687
p5a1/fs = -0.000318x -1.000000y
p5a1/ss = +1.000000x -0.000318y
p5a1/corner_x = -482.819
p5a1/corner_y = -159.282

p5a2/min_fs = 0
p5a2/min_ss = 2688
p5a2/max_fs = 127
p5a2/max_ss = 2751
p5a2/fs = -0.000318x -1.000000y
p5a2/ss = +1.000000x -0.000318y
p5a2/corner_x = -416.821
p5a2/corner_y = -159.311

p5a3/min_fs = 0
p5a3/min_ss = 2752
p5a3/max_fs = 127
p5a3/max_ss = 2815
p5a3/fs = -0.000318x -1.000000y
p5a3/ss = +1.000000x -0.000318y
p5a3/corner_x = -350.824
p5a3/corner_y = -159.34

p5a4/min_fs = 0
p5a4/min_ss = 2816
p5a4/max_fs = 127
p5a4/max_ss = 2879
p5a4/fs = -0.000318x -1.000000y
p5a4/ss = +1.000000x -0.000318y
p5a4/corner_x = -284.826
p5a4/corner_y = -159.368

p5a5/min_fs = 0
p5a5/min_ss = 2880
p5a5/max_fs = 127
p5a5/max_ss = 2943
p5a5/fs = -0.000318x -1.000000y
p5a5/ss = +1.000000x -0.000318y
p5a5/corner_x = -218.811
p5a5/corner_y = -159.397

p5a6/min_fs = 0
p5a6/min_ss = 2944
p5a6/max_fs = 127
p5a6/max_ss = 3007
p5a6/fs = -0.000318x -1.000000y
p5a6/ss = +1.000000x -0.000318y
p5a6/corner_x = -152.81
p5a6/corner_y = -159.426

p5a7/min_fs = 0
p5a7/min_ss = 3008
p5a7/max_fs = 127
p5a7/max_ss = 3071
p5a7/fs = -0.000318x -1.000000y
p5a7/ss = +1.000000x -0.000318y
p5a7/corner_x = -86.8099
p5a7/corner_y = -159.454

p6a0/min_fs = 0
p6a0/min_ss = 3072
p6a0/max_fs = 127
p6a0/max_ss = 3135
p6a0/fs = -0.004196x -0.999992y
p6a0/ss = +0.999992x -0.004196y
p6a0/corner_x = -548.783
p6a0/corner_y = -314.796

p6a1/min_fs = 0
p6a1/min_ss = 3136
p6a1/max_fs = 127
p6a1/max_ss = 3199
p6a1/fs = -0.004196x -0.999992y
p6a1/ss = +0.999992x -0.004196y
p6a1/corner_x = -482.786
p6a1/corner_y = -315.081

p6a2/min_fs = 0
p6a2/min_ss = 3200
p6a2/max_fs = 127
p6a2/max_ss = 3263
p6a2/fs = -0.004196x -0.999992y
p6a2/ss = +0.999992x -0.004196y
p6a2/corner_x = -416.789
p6a2/corner_y = -315.367

p6a3/min_fs = 0
p6a3/min_ss = 3264
p6a3/max_fs = 127
p6a3/max_ss = 3327
p6a3/fs = -0.004196x -0.999992y
p6a3/ss = +0.999992x -0.004196y
p6a3/corner_x = -350.791
p6a3/corner_y = -315.653

p6a4/min_fs = 0
p6a4/min_ss = 3328
p6a4/max_fs = 127
p6a4/max_ss = 3391
p6a4/fs = -0.004196x -0.999992y
p6a4/ss = +0.999992x -0.004196y
p6a4/corner_x = -284.795
p6a4/corner_y = -315.938

p6a5/min_fs = 0
p6a5/min_ss = 3392
p6a5/max_fs = 127
p6a5/max_ss = 3455
p6a5/fs = -0.004196x -0.999992y
p6a5/ss = +0.999992x -0.004196y
p6a5/corner_x = -218.796
p6a5/corner_y = -316.224

p6a6/min_fs = 0
p6a6/min_ss = 3456
p6a6/max_fs = 127
p6a6/max_ss = 3519
p6a6/fs = -0.004196x -0.999992y
p6a6/ss = +0.999992x -0.004196y
p6a6/corner_x = -152.799
p6a6/corner_y = -316.509

p6a7/min_fs = 0
p6a7/min_ss = 3520
p6a7/max_fs = 127
p6a7/max_ss = 3583
p6a7/fs = -0.004196x -0.999992y
p6a7/ss = +0.999992x -0.004196y
p6a7/corner_x = -86.8009
p6a7/corner_y = -316.795

p7a0/min_fs = 0
p7a0/min_ss = 3584
p7a0/max_fs = 127
p7a0/max_ss = 3647
p7a0/fs = -0.002957x -0.999994y
p7a0/ss = +0.999994x -0.002957y
p7a0/corner_x = -548.788
p7a0/corner_y = -472.462

p7a1/min_fs = 0
p7a1/min_ss = 3648
p7a1/max_fs = 127
p7a1/max_ss = 3711
p7a1/fs = -0.002957x -0.999994y
p7a1/ss = +0.999994x -0.002957y
p7a1/corner_x = -482.794
p7a1/corner_y = -472.66

p7a2/min_fs = 0
p7a2/min_ss = 3712
p7a2/max_fs = 127
p7a2/max_ss = 3775
p7a2/fs = -0.002957x -0.999994y
p7a2/ss = +0.999994x -0.002957y
p7a2/corner_x = -416.798
p7a2/corner_y = -472.858

p7a3/min_fs = 0
p7a3/min_ss = 3776
p7a3/max_fs = 127
p7a3/max_ss = 3839
p7a3/fs = -0.002957x -0.999994y
p7a3/ss = +0.999994x -0.002957y
p7a3/corner_x = -350.801
p7a3/corner_y = -473.056

p7a4/min_fs = 0
p7a4/min_ss = 3840
p7a4/max_fs = 127
p7a4/max_ss = 3903
p7a4/fs = -0.002957x -0.999994y
p7a4/ss = +0.999994x -0.002957y
p7a4/corner_x = -284.805
p7a4/corner_y = -473.254

p7a5/min_fs = 0
p7a5/min_ss = 3904
p7a5/max_fs = 127
p7a5/max_ss = 3967
p7a5/fs = -0.002957x -0.999994y
p7a5/ss = +0.999994x -0.002957y
p7a5/corner_x = -218.808
p7a5/corner_y = -473.452

p7a6/min_fs = 0
p7a6/min_ss = 3968
p7a6/max_fs = 127
p7a6/max_ss = 4031
p7a6/fs = -0.002957x -0.999994y
p7a6/ss = +0.999994x -0.002957y
p7a6/corner_x = -152.81
p7a6/corner_y = -473.65

p7a7/min_fs = 0
p7a7/min_ss = 4032
p7a7/max_fs = 127
p7a7/max_ss = 4095
p7a7/fs = -0.002957x -0.999994y
p7a7/ss = +0.999994x -0.002957y
p7a7/corner_x = -86.8126
p7a7/corner_y = -473.847

p8a0/min_fs = 0
p8a0/min_ss = 4096
p8a0/max_fs = 127
p8a0/max_ss = 4159
p8a0/fs = +0.000124x +1.000000y
p8a0/ss = -1.000000x +0.000124y
p8a0/corner_x = 511.356
p8a0/corner_y = -163.967

p8a1/min_fs = 0
p8a1/min_ss = 4160
p8a1/max_fs = 127
p8a1/max_ss = 4223
p8a1/fs = +0.000124x +1.000000y
p8a1/ss = -1.000000x +0.000124y
p8a1/corner_x = 445.358
p8a1/corner_y = -163.964

p8a2/min_fs = 0
p8a2/min_ss = 4224
p8a2/max_fs = 127
p8a2/max_ss = 4287
p8a2/fs = +0.000124x +1.000000y
p8a2/ss = -1.000000x +0.000124y
p8a2/corner_x = 379.359
p8a2/corner_y = -163.961

p8a3/min_fs = 0
p8a3/min_ss = 4288
p8a3/max_fs = 127
p8a3/max_ss = 4351
p8a3/fs = +0.000124x +1.000000y
p8a3/ss = -1.000000x +0.000124y
p8a3/corner_x = 313.362
p8a3/corner_y = -163.958

p8a4/min_fs = 0
p8a4/min_ss = 4352
p8a4/max_fs = 127
p8a4/max_ss = 4415
p8a4/fs = +0.000124x +1.000000y
p8a4/ss = -1.000000x +0.000124y
p8a4/corner_x = 247.364
p8a4/corner_y = -163.956

p8a5/min_fs = 0
p8a5/min_ss = 4416
p8a5/max_fs = 127
p8a5/max_ss = 4479
p8a5/fs = +0.000124x +1.000000y
p8a5/ss = -1.000000x +0.000124y
p8a5/corner_x = 181.365
p8a5/corner_y = -163.953

p8a6/min_fs = 0
p8a6/min_ss = 4480
p8a6/max_fs = 127
p8a6/max_ss = 4543
p8a6/fs = +0.000124x +1.000000y
p8a6/ss = -1.000000x +0.000124y
p8a6/corner_x = 115.367
p8a6/corner_y = -163.95

p8a7/min_fs = 0
p8a7/min_ss = 4544
p8a7/max_fs = 127
p8a7/max_ss = 4607
p8a7/fs = +0.000124x +1.000000y
p8a7/ss = -1.000000x +0.000124y
p8a7/corner_x = 49.3697
p8a7/corner_y = -163.948

p9a0/min_fs = 0
p9a0/min_ss = 4608
p9a0/max_fs = 127
p9a0/max_ss = 4671
p9a0/fs = +0.000404x +0.999999y
p9a0/ss = -0.999999x +0.000404y
p9a0/corner_x = 511.148
p9a0/corner_y = -321.228

p9a1/min_fs = 0
p9a1/min_ss = 4672
p9a1/max_fs = 127
p9a1/max_ss = 4735
p9a1/fs = +0.000404x +0.999999y
p9a1/ss = -0.999999x +0.000404y
p9a1/corner_x = 445.152
p9a1/corner_y = -321.205

p9a2/min_fs = 0
p9a2/min_ss = 4736
p9a2/max_fs = 127
p9a2/max_ss = 4799
p9a2/fs = +0.000404x +0.999999y
p9a2/ss = -0.999999x +0.000404y
p9a2/corner_x = 379.155
p9a2/corner_y = -321.182

p9a3/min_fs = 0
p9a3/min_ss = 4800
p9a3/max_fs = 127
p9a3/max_ss = 4863
p9a3/fs = +0.000404x +0.999999y
p9a3/ss = -0.999999x +0.000404y
p9a3/corner_x = 313.158
p9a3/corner_y = -321.159

p9a4/min_fs = 0
p9a4/min_ss = 4864
p9a4/max_fs = 127
p9a4/max_ss = 4927
p9a4/fs = +0.000404x +0.999999y
p9a4/ss = -0.999999x +0.000404y
p9a4/corner_x = 247.16
p9a4/corner_y = -321.136

p9a5/min_fs = 0
p9a5/min_ss = 4928
p9a5/max_fs = 127
p9a5/max_ss = 4991
p9a5/fs = +0.000404x +0.999999y
p9a5/ss = -0.999999x +0.000404y
p9a5/corner_x = 181.163
p9a5/corner_y = -321.113

p9a6/min_fs = 0
p9a6/min_ss = 4992
p9a6/max_fs = 127
p9a6/max_ss = 5055
p9a6/fs = +0.000404x +0.999999y
p9a6/ss = -0.999999x +0.000404y
p9a6/corner_x = 115.144
p9a6/corner_y = -321.089

p9a7/min_fs = 0
p9a7/min_ss = 5056
p9a7/max_fs = 127
p9a7/max_ss = 5119
p9a7/fs = +0.000404x +0.999999y
p9a7/ss = -0.999999x +0.000404y
p9a7/corner_x = 49.1423
p9a7/corner_y = -321.066

p10a0/min_fs = 0
p10a0/min_ss = 5120
p10a0/max_fs = 127
p10a0/max_ss = 5183
p10a0/fs = -0.001205x +0.999999y
p10a0/ss = -0.999999x -0.001205y
p10a0/corner_x = 510.824
p10a0/corner_y = -477.267

p10a1/min_fs = 0
p10a1/min_ss = 5184
p10a1/max_fs = 127
p10a1/max_ss = 5247
p10a1/fs = -0.001205x +0.999999y
p10a1/ss = -0.999999x -0.001205y
p10a1/corner_x = 444.828
p10a1/corner_y = -477.355

p10a2/min_fs = 0
p10a2/min_ss = 5248
p10a2/max_fs = 127
p10a2/max_ss = 5311
p10a2/fs = -0.001205x +0.999999y
p10a2/ss = -0.999999x -0.001205y
p10a2/corner_x = 378.83
p10a2/corner_y = -477.444

p10a3/min_fs = 0
p10a3/min_ss = 5312
p10a3/max_fs = 127
p10a3/max_ss = 5375
p10a3/fs = -0.001205x +0.999999y
p10a3/ss = -0.999999x -0.001205y
p10a3/corner_x = 312.834
p10a3/corner_y = -477.533

p10a4/min_fs = 0
p10a4/min_ss = 5376
p10a4/max_fs = 127
p10a4/max_ss = 5439
p10a4/fs = -0.001205x +0.999999y
p10a4/ss = -0.999999x -0.001205y
p10a4/corner_x = 246.836
p10a4/corner_y = -477.621

p10a5/min_fs = 0
p10a5/min_ss = 5440
p10a5/max_fs = 127
p10a5/max_ss = 5503
p10a5/fs = -0.001205x +0.999999y
p10a5/ss = -0.999999x -0.001205y
p10a5/corner_x = 180.839
p10a5/corner_y = -477.71

p10a6/min_fs = 0
p10a6/min_ss = 5504
p10a6/max_fs = 127
p10a6/max_ss = 5567
p10a6/fs = -0.001205x +0.999999y
p10a6/ss = -0.999999x -0.001205y
p10a6/corner_x = 114.843
p10a6/corner_y = -477.798

p10a7/min_fs = 0
p10a7/min_ss = 5568
p10a7/max_fs = 127
p10a7/max_ss = 5631
p10a7/fs = -0.001205x +0.999999y
p10a7/ss = -0.999999x -0.001205y
p10a7/corner_x = 48.8455
p10a7/corner_y = -477.887

p11a0/min_fs = 0
p11a0/min_ss = 5632
p11a0/max_fs = 127
p11a0/max_ss = 5695
p11a0/fs = -0.000520x +0.999999y
p11a0/ss = -0.999999x -0.000520y
p11a0/corner_x = 510.019
p11a0/corner_y = -635.653

p11a1/min_fs = 0
p11a1/min_ss = 5696
p11a1/max_fs = 127
p11a1/max_ss = 5759
p11a1/fs = -0.000520x +0.999999y
p11a1/ss = -0.999999x -0.000520y
p11a1/corner_x = 444.02
p11a1/corner_y = -635.693

p11a2/min_fs = 0
p11a2/min_ss = 5760
p11a2/max_fs = 127
p11a2/max_ss = 5823
p11a2/fs = -0.000520x +0.999999y
p11a2/ss = -0.999999x -0.000520y
p11a2/corner_x = 378.022
p11a2/corner_y = -635.734

p11a3/min_fs = 0
p11a3/min_ss = 5824
p11a3/max_fs = 127
p11a3/max_ss = 5887
p11a3/fs = -0.000520x +0.999999y
p11a3/ss = -0.999999x -0.000520y
p11a3/corner_x = 312.025
p11a3/corner_y = -635.774

p11a4/min_fs = 0
p11a4/min_ss = 5888
p11a4/max_fs = 127
p11a4/max_ss = 5951
p11a4/fs = -0.000520x +0.999999y
p11a4/ss = -0.999999x -0.000520y
p11a4/corner_x = 246.03
p11a4/corner_y = -635.814

p11a5/min_fs = 0
p11a5/min_ss = 5952
p11a5/max_fs = 127
p11a5/max_ss = 6015
p11a5/fs = -0.000520x +0.999999y
p11a5/ss = -0.999999x -0.000520y
p11a5/corner_x = 180.032
p11a5/corner_y = -635.855

p11a6/min_fs = 0
p11a6/min_ss = 6016
p11a6/max_fs = 127
p11a6/max_ss = 6079
p11a6/fs = -0.000520x +0.999999y
p11a6/ss = -0.999999x -0.000520y
p11a6/corner_x = 114.036
p11a6/corner_y = -635.895

p11a7/min_fs = 0
p11a7/min_ss = 6080
p11a7/max_fs = 127
p11a7/max_ss = 6143
p11a7/fs = -0.000520x +0.999999y
p11a7/ss = -0.999999x -0.000520y
p11a7/corner_x = 48.0345
p11a7/corner_y = -635.935

p12a0/min_fs = 0
p12a0/min_ss = 6144
p12a0/max_fs = 127
p12a0/max_ss = 6207
p12a0/fs = +0.000306x +1.000000y
p12a0/ss = -1.000000x +0.000306y
p12a0/corner_x = 545.269
p12a0/corner_y = 456.79

p12a1/min_fs = 0
p12a1/min_ss = 6208
p12a1/max_fs = 127
p12a1/max_ss = 6271
p12a1/fs = +0.000306x +1.000000y
p12a1/ss = -1.000000x +0.000306y
p12a1/corner_x = 479.27
p12a1/corner_y = 456.764

p12a2/min_fs = 0
p12a2/min_ss = 6272
p12a2/max_fs = 127
p12a2/max_ss = 6335
p12a2/fs = +0.000306x +1.000000y
p12a2/ss = -1.000000x +0.000306y
p12a2/corner_x = 413.273
p12a2/corner_y = 456.738

p12a3/min_fs = 0
p12a3/min_ss = 6336
p12a3/max_fs = 127
p12a3/max_ss = 6399
p12a3/fs = +0.000306x +1.000000y
p12a3/ss = -1.000000x +0.000306y
p12a3/corner_x = 347.269
p12a3/corner_y = 456.851

p12a4/min_fs = 0
p12a4/min_ss = 6400
p12a4/max_fs = 127
p12a4/max_ss = 6463
p12a4/fs = +0.000306x +1.000000y
p12a4/ss = -1.000000x +0.000306y
p12a4/corner_x = 281.269
p12a4/corner_y = 456.871

p12a5/min_fs = 0
p12a5/min_ss = 6464
p12a5/max_fs = 127
p12a5/max_ss = 6527
p12a5/fs = +0.000306x +1.000000y
p12a5/ss = -1.000000x +0.000306y
p12a5/corner_x = 215.269
p12a5/corner_y = 456.891

p12a6/min_fs = 0
p12a6/min_ss = 6528
p12a6/max_fs = 127
p12a6/max_ss = 6591
p12a6/fs = +0.000306x +1.000000y
p12a6/ss = -1.000000x +0.000306y
p12a6/corner_x = 149.269
p12a6/corner_y = 456.911

p12a7/min_fs = 0
p12a7/min_ss = 6592
p12a7/max_fs = 127
p12a7/max_ss = 6655
p12a7/fs = +0.000306x +1.000000y
p12a7/ss = -1.000000x +0.000306y
p12a7/corner_x = 83.269
p12a7/corner_y = 456.931

p13a0/min_fs = 0
p13a0/min_ss = 6656
p13a0/max_fs = 127
p13a0/max_ss = 6719
p13a0/fs = +0.002537x +0.999996y
p13a0/ss = -0.999996x +0.002537y
p13a0/corner_x = 544.143
p13a0/corner_y = 299.46

p13a1/min_fs = 0
p13a1/min_ss = 6720
p13a1/max_fs = 127
p13a1/max_ss = 6783
p13a1/fs = +0.002537x +0.999996y
p13a1/ss = -0.999996x +0.002537y
p13a1/corner_x = 478.144
p13a1/corner_y = 299.616

p13a2/min_fs = 0
p13a2/min_ss = 6784
p13a2/max_fs = 127
p13a2/max_ss = 6847
p13a2/fs = +0.002537x +0.999996y
p13a2/ss = -0.999996x +0.002537y
p13a2/corner_x = 412.149
p13a2/corner_y = 299.772

p13a3/min_fs = 0
p13a3/min_ss = 6848
p13a3/max_fs = 127
p13a3/max_ss = 6911
p13a3/fs = +0.002537x +0.999996y
p13a3/ss = -0.999996x +0.002537y
p13a3/corner_x = 346.152
p13a3/corner_y = 299.928

p13a4/min_fs = 0
p13a4/min_ss = 6912
p13a4/max_fs = 127
p13a4/max_ss = 6975
p13a4/fs = +0.002537x +0.999996y
p13a4/ss = -0.999996x +0.002537y
p13a4/corner_x = 280.155
p13a4/corner_y = 300.084

p13a5/min_fs = 0
p13a5/min_ss = 6976
p13a5/max_fs = 127
p13a5/max_ss = 7039
p13a5/fs = +0.002537x +0.999996y
p13a5/ss = -0.999996x +0.002537y
p13a5/corner_x = 214.14
p13a5/corner_y = 300.239

p13a6/min_fs = 0
p13a6/min_ss = 7040
p13a6/max_fs = 127
p13a6/max_ss = 7103
p13a6/fs = +0.002537x +0.999996y
p13a6/ss = -0.999996x +0.002537y
p13a6/corner_x = 148.14
p13a6/corner_y = 300.395

p13a7/min_fs = 0
p13a7/min_ss = 7104
p13a7/max_fs = 127
p13a7/max_ss = 7167
p13a7/fs = +0.002537x +0.999996y
p13a7/ss = -0.999996x +0.002537y
p13a7/corner_x = 82.1399
p13a7/corner_y = 300.551

p14a0/min_fs = 0
p14a0/min_ss = 7168
p14a0/max_fs = 127
p14a0/max_ss = 7231
p14a0/fs = -0.000234x +1.000000y
p14a0/ss = -1.000000x -0.000234y
p14a0/corner_x = 545.375
p14a0/corner_y = 143.458

p14a1/min_fs = 0
p14a1/min_ss = 7232
p14a1/max_fs = 127
p14a1/max_ss = 7295
p14a1/fs = -0.000234x +1.000000y
p14a1/ss = -1.000000x -0.000234y
p14a1/corner_x = 479.377
p14a1/corner_y = 143.439

p14a2/min_fs = 0
p14a2/min_ss = 7296
p14a2/max_fs = 127
p14a2/max_ss = 7359
p14a2/fs = -0.000234x +1.000000y
p14a2/ss = -1.000000x -0.000234y
p14a2/corner_x = 413.38
p14a2/corner_y = 143.421

p14a3/min_fs = 0
p14a3/min_ss = 7360
p14a3/max_fs = 127
p14a3/max_ss = 7423
p14a3/fs = -0.000234x +1.000000y
p14a3/ss = -1.000000x -0.000234y
p14a3/corner_x = 347.382
p14a3/corner_y = 143.402

p14a4/min_fs = 0
p14a4/min_ss = 7424
p14a4/max_fs = 127
p14a4/max_ss = 7487
p14a4/fs = -0.000234x +1.000000y
p14a4/ss = -1.000000x -0.000234y
p14a4/corner_x = 281.384
p14a4/corner_y = 143.384

p14a5/min_fs = 0
p14a5/min_ss = 7488
p14a5/max_fs = 127
p14a5/max_ss = 7551
p14a5/fs = -0.000234x +1.000000y
p14a5/ss = -1.000000x -0.000234y
p14a5/corner_x = 215.37
p14a5/corner_y = 143.365

p14a6/min_fs = 0
p14a6/min_ss = 7552
p14a6/max_fs = 127
p14a6/max_ss = 7615
p14a6/fs = -0.000234x +1.000000y
p14a6/ss = -1.000000x -0.000234y
p14a6/corner_x = 149.369
p14a6/corner_y = 143.346

p14a7/min_fs = 0
p14a7/min_ss = 7616
p14a7/max_fs = 127
p14a7/max_ss = 7679
p14a7/fs = -0.000234x +1.000000y
p14a7/ss = -1.000000x -0.000234y
p14a7/corner_x = 83.367
p14a7/corner_y = 143.328

p15a0/min_fs = 0
p15a0/min_ss = 7680
p15a0/max_fs = 127
p15a0/max_ss = 7743
p15a0/fs = +0.001282x +1.000001y
p15a0/ss = -1.000001x +0.001282y
p15a0/corner_x = 544.709
p15a0/corner_y = -13.494

p15a1/min_fs = 0
p15a1/min_ss = 7744
p15a1/max_fs = 127
p15a1/max_ss = 7807
p15a1/fs = +0.001282x +1.000001y
p15a1/ss = -1.000001x +0.001282y
p15a1/corner_x = 478.711
p15a1/corner_y = -13.4156

p15a2/min_fs = 0
p15a2/min_ss = 7808
p15a2/max_fs = 127
p15a2/max_ss = 7871
p15a2/fs = +0.001282x +1.000001y
p15a2/ss = -1.000001x +0.001282y
p15a2/corner_x = 412.714
p15a2/corner_y = -13.3372

p15a3/min_fs = 0
p15a3/min_ss = 7872
p15a3/max_fs = 127
p15a3/max_ss = 7935
p15a3/fs = +0.001282x +1.000001y
p15a3/ss = -1.000001x +0.001282y
p15a3/corner_x = 346.716
p15a3/corner_y = -13.2587

p15a4/min_fs = 0
p15a4/min_ss = 7936
p15a4/max_fs = 127
p15a4/max_ss = 7999
p15a4/fs = +0.001282x +1.000001y
p15a4/ss = -1.000001x +0.001282y
p15a4/corner_x = 280.716
p15a4/corner_y = -13.1803

p15a5/min_fs = 0
p15a5/min_ss = 8000
p15a5/max_fs = 127
p15a5/max_ss = 8063
p15a5/fs = +0.001282x +1.000001y
p15a5/ss = -1.000001x +0.001282y
p15a5/corner_x = 214.699
p15a5/corner_y = -13.1018

p15a6/min_fs = 0
p15a6/min_ss = 8064
p15a6/max_fs = 127
p15a6/max_ss = 8127
p15a6/fs = +0.001282x +1.000001y
p15a6/ss = -1.000001x +0.001282y
p15a6/corner_x = 148.698
p15a6/corner_y = -13.0234

p15a7/min_fs = 0
p15a7/min_ss = 8128
p15a7/max_fs = 127
p15a7/max_ss = 8191
p15a7/fs = +0.001282x +1.000001y
p15a7/ss = -1.000001x +0.001282y
p15a7/corner_x = 82.6973
p15a7/corner_y = -12.9449
















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
