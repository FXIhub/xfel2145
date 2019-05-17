"""
For testing the EuXFEL backend, start the karabo replay:

./karabo-bridge-replay '0.0.0.0:1234' `/gpfs/exfel/u/scratch/XMPL/201750/p700000/stream_records/SPB_DET_AGIPD1M-1_CAL_APPEND_CORR-2019-02-21T11.04.11Z

from the karabo-bridge (https://github.com/European-XFEL/karabo-bridge-py).
and then start the Hummingbird backend:

./hummingbird.py -b conf.py
"""
import plotting.image
import analysis.agipd
import analysis.event
from backend import add_record

state = {}
state['Facility'] = 'EuXFEL'
state['EuXFEL/DataSource'] = 'tcp://0.0.0.0:1234'
state['EuXFEL/DataFormat'] = 'Calib'

event_number = 0
def onEvent(evt):
    global event_number
    #analysis.event.printKeys(evt)
    #analysis.event.printNativeKeys(evt)
    analysis.event.printProcessingRate()
    T = evt["eventID"]["Timestamp"]
    #print(event_number, T.timestamp, T.pulseId, T.cellId, T.trainId)
    agipd_module_8 = evt['photonPixelDetectors']['AGIPD'].data[8]
    agipd_gain = evt['photonPixelDetectors']['AGIPD'].data[-1]
    agipd_0 = add_record(evt['analysis'], 'analysis', 'AGIPD', agipd_module_8)
    plotting.image.plotImage(agipd_0)
    print(agipd_0.data.shape)
    event_number += 1
