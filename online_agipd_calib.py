import h5py
import numpy as np
class AGIPD_Calibrator:
    def __init__(self, filenames, max_pulses=120):
        self._nCells = 176
        self._badpixData       = []
        self._darkOffsetData   = []
        self._relativeGainData = []
        self._gainLevelData    = []
        # Hardcoded pulse filter
        self._pulse_filter = np.ones(self._nCells, dtype='bool')
        self._pulse_filter[max_pulses:] = False
        self._pulse_filter[0] = False
        self._pulse_filter[18::32] = False
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
        #AnalogOffset             Dataset {3, 176, 512, 128} H5T_STD_I16LE
        #Badpixel                 Dataset {3, 176, 512, 128} H5T_STD_U8LE
        #DigitalGainLevel         Dataset {3, 176, 512, 128} H5T_STD_U16LE
        #RelativeGain             Dataset {3, 176, 512, 128} H5T_IEEE_F32LE
        with h5py.File(filename) as f:
            self._badpixData.append(np.asarray(f["Badpixel"]))
            self._darkOffsetData.append(np.asarray(f["AnalogOffset"]))
            self._relativeGainData.append(np.asarray(f["RelativeGain"]))
            self._gainLevelData.append(np.asarray(f["DigitalGainLevel"]))
            self._badpixData = np.transpose(np.array(self._badpixData), axes=(0, 1, 4, 3, 2))[...,self._pulse_filter]
            self._darkOffsetData = np.transpose(np.array(self._darkOffsetData), axes=(0, 1, 4, 3, 2))[...,self._pulse_filter]
            self._relativeGainData = np.transpose(np.array(self._relativeGainData), axes=(0, 1, 4, 3, 2))[...,self._pulse_filter]
            self._gainLevelData = np.transpose(np.array(self._gainLevelData), axes=(0, 1, 4, 3, 2))[...,self._pulse_filter]

    #def calibrate_train(self, evt, aduData, apply_gain_switch=True):
    def calibrate_train(self, evt, aduData, gainData, apply_gain_switch=False):
        npulses = aduData.data.shape[-1]
        outData = aduData.data.copy()
        darkoffset = self._darkOffsetData[..., :npulses]
        relativegain = self._relativeGainData[...,:npulses]
        badpixdata = self._badpixData[...,:npulses]
        gainleveldata = self._gainLevelData[...,:npulses]
        badpixMask = np.ones(aduData.data.shape, dtype=np.bool)

        if apply_gain_switch:
            outData -= self._darkOffsetData[-1][0][:len(outData)]
            outData[gainData > gainleveldata[0,1]] = 32000
            badpixMask = (1 - badpixdata[0,0])
        else:
            pixGainLevel0 = gainData < gainleveldata[0,1]
            pixGainLevel2 = gainData > gainleveldata[0,2]
            pixGainLevel1 = ~(pixGainLevel0 | pixGainLevel2)
            #pixGainLevel1 = pixGainLevel0 == False
            #pixGainLevel2 = np.zeros(shape=gainData.shape, dtype='bool')
            pixGainLevels = [pixGainLevel0, pixGainLevel1, pixGainLevel2]

            for g, pixGain in enumerate(pixGainLevels):
                if not pixGain.any():
                    continue
                outData[pixGain] = (outData[pixGain] - darkoffset[0,g,pixGain]) * relativegain[0,g,pixGain]
                #outData[pixGain] *= (badpixdata[0,g,pixGain] == 0)
                badpixMask[pixGain] = (badpixdata[0,g,pixGain] == 0)
        return outData, badpixMask
