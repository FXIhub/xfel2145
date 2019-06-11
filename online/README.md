## Online monitoring from Green analysis corner

Login to the middle computer with your UPEX account and ssh to one of the online analysis nodes (don't use the same as the backend, currently running on exflonc05):

```
ssh -X exflonc06
```

To start the online monitoring, go to the `hummingbird` repository folder and run hummingbird in interactive mode:

```
cd /gpfs/exfel/exp/SPB/201802/p002145/usr/Shared/hummingbird/
python hummingbird.py -i --no-restore
```

The hummingbird GUI will now popup. You must first connect to the backend by clicking `Backends` --> `Add`, then write the node name for the backend (currently `exflonc05`) under `Hostname:` and keep the standard port. Click `OK` to connect to the backend. You should now see its allocated data sets in the list of `Data Sources`. Double-click on one of these sources to show it. You may want to increase the buffer capacity to 10000 for scalar data and 1000 for 2D hits. Feel free to play around with the plot settings, but DO NOT press the right-most button with the white recycle arrow that reads `Reloading configuration` when you hover it. This will reload the configuration file of the backend, which can break the backend if updates to the configuration file are currently in process.

The online nodes should only be used for data recording and online analysis/monitoring, so DO NOT use the online cluser to perform any offline analysis that is running slowly on the Maxwell cluster. This could potentially disturb the data recording and result in that data is lost.
