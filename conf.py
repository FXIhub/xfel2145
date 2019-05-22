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
from backend import add_record

state = {}
state['Facility'] = 'EuXFELtrains'
state['EuXFEL/DataSource'] = 'tcp://10.253.0.51:45000' # Raw
#state['EuXFEL/DataSource'] = 'tcp://10.253.0.51:45011' # Calibrated
state['EuXFEL/DataFormat'] = 'Raw'
state['EuXFEL/MaxTrainAge'] = 4

# Use SelModule = None or remove key to indicate a full detector
# [For simulator, comment if running with full detector, otherwise uncomment]
state['EuXFEL/SelModule'] = 4

event_number = 0
def onEvent(evt):
    global event_number
    event_number += 1
    #analysis.event.printKeys(evt)
    #analysis.event.printNativeKeys(evt)
    analysis.event.printProcessingRate()
    T = evt["eventID"]["Timestamp"]
    #print(event_number, T.timestamp, T.pulseId, T.cellId, T.trainId)
    #print(event_number, T.pulseId, T.cellId, T.trainId)

    # Shape of data: (module, ss, fs, cell)
    if 'EuXFEL/SelModule' in state and state['EuXFEL/SelModule'] != None:
        agipd_module = evt['photonPixelDetectors']['AGIPD'].data[0,:,:,0]
    else:
        agipd_module = evt['photonPixelDetectors']['AGIPD'].data[0,:,:,8]

    # Gain doesn't make physical sense here since the shape is not the same
    agipd_gain = evt['photonPixelDetectors']['AGIPD'].data[:,-1]

    agipd_0 = add_record(evt['analysis'], 'analysis', 'AGIPD', agipd_module)
    plotting.image.plotImage(agipd_0)
    mean = add_record(evt['eventID'], 'analysis', 'mean', agipd_module.mean())
    plotting.line.plotHistory(mean)

# event_number = 0
# def onEvent(evt):
#     global event_number
#     #analysis.event.printKeys(evt)
#     #analysis.event.printNativeKeys(evt)
#     analysis.event.printProcessingRate()
#     T = evt["eventID"]["Timestamp"]
#     #print(event_number, T.timestamp, T.pulseId, T.cellId, T.trainId)
#     agipd_module_8 = evt['photonPixelDetectors']['AGIPD'].data[8]
#     agipd_gain = evt['photonPixelDetectors']['AGIPD'].data[-1]
#     agipd_0 = add_record(evt['analysis'], 'analysis', 'AGIPD', agipd_module_8)
#     plotting.image.plotImage(agipd_0)
#     print(agipd_0.data.shape)
#     event_number += 1
