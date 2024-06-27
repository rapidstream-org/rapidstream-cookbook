<!--
Copyright (c) 2024 RapidStream Design Automation, Inc. and contributors.  All rights reserved.
The contributor(s) of this file has/have agreed to the RapidStream Contributor License Agreement.
-->

<img src="https://imagedelivery.net/AU8IzMTGgpVmEBfwPILIgw/1b565657-df33-41f9-f29e-0d539743e700/128" width="64px" alt="RapidStream Logo" />

# Custom Vivado Parts

Adding support for a new FPGA part in RapidStream is straightforward, even if it's not natively supported. This guide demonstrates how to define a custom FPGA part, using the Versal Premium VP1552 device as an example.

## How it works

Users can define their own virtual device based on the part number (e.g, `xcvp1552-vsva3340-2MHP-i-S`). By using rapidstram APIs below, we can define our own vp1552 device. In the [`run.py`](./run.py) script file, we specify the component's part number and divide it into separate slots, such as four rows and two columns, each containing half of an SLR. We configure a set of pblocks for each slot and specify the number of SLR crossing wires connecting the slots. The configured layout is shown in the graph. RapidStream interacts with Vivado to automatically determine the resources available for each slot based on the provided data.

```python
factory = DeviceFactory(
    row=4,
    col=2,
    part_num="xcvp1552-vsva3340-2MHP-i-S",
)
```

We define the virtual slots in units of clock regions.

```python
# Set the pblocks of the device so that each slot contains half of an SLR:
factory.set_slot_pblock(0, 0, ["-add CLOCKREGION_X1Y1:CLOCKREGION_X4Y2"])
factory.set_slot_pblock(1, 0, ["-add CLOCKREGION_X5Y1:CLOCKREGION_X9Y2"])
factory.set_slot_pblock(0, 1, ["-add CLOCKREGION_X1Y3:CLOCKREGION_X4Y4"])
factory.set_slot_pblock(1, 1, ["-add CLOCKREGION_X5Y3:CLOCKREGION_X9Y4"])

factory.set_slot_pblock(0, 2, ["-add CLOCKREGION_X1Y5:CLOCKREGION_X4Y6"])
factory.set_slot_pblock(1, 2, ["-add CLOCKREGION_X5Y5:CLOCKREGION_X9Y6"])
factory.set_slot_pblock(0, 3, ["-add CLOCKREGION_X1Y7:CLOCKREGION_X4Y7"])
factory.set_slot_pblock(1, 3, ["-add CLOCKREGION_X5Y7:CLOCKREGION_X9Y7"])
```

Additionally, set_slot_capacity configures the LAGUNA routing resources for crossing SLR wires. Since the vp1552 contains two SLRs, only the north of SLOT_X0Y1 and SLOT_X1Y1, and the south of SLOT_X0Y2 and SLOT_X1Y2 have SLR crossing capacity.


```python
# There are 18870 total SLL nodes for VP1552:
factory.set_slot_crossing_capacity(0, 1, north=9435)
factory.set_slot_crossing_capacity(1, 1, north=9435)
factory.set_slot_crossing_capacity(0, 2, south=9435)
factory.set_slot_crossing_capacity(1, 2, south=9435)
```

<img src="../img/vp1552_virtual_device.png" height="512px" alt="VP2552 Layout"/>

## Tutorial


To extract the resource for VP1552, run the the following command:

```bash
source <Vitis_install_path>/Vitis/2023.2/settings64.sh
rapidstream ./run.py
```

An example output is:

```
[RS-0001] Invoking Vivado to extract resources of each slot of part "xcvp1552-vsva3340-2MHP-i-S"...
[RS-0047] Running command with PID 1700549: vivado -mode batch -source /tmp/tmpfvea8vwy/get_pblock_resources.tcl
[RS-0002] Resources of each slot of part "xcvp1552-vsva3340-2MHP-i-S" extracted from Vivado:
[RS-0005]   SLOT_X0Y0: lut=234624 ff=469248 bram_18k=658 dsp=1128 uram=188
[RS-0005]   SLOT_X0Y1: lut=187392 ff=374784 bram_18k=504 dsp=864 uram=156
[RS-0005]   SLOT_X0Y2: lut=254976 ff=509952 bram_18k=672 dsp=1152 uram=216
[RS-0005]   SLOT_X0Y3: lut=129536 ff=259072 bram_18k=336 dsp=552 uram=120
[RS-0005]   SLOT_X1Y0: lut=264704 ff=529408 bram_18k=848 dsp=1128 uram=189
[RS-0005]   SLOT_X1Y1: lut=202752 ff=405504 bram_18k=648 dsp=864 uram=144
[RS-0005]   SLOT_X1Y2: lut=288768 ff=577536 bram_18k=864 dsp=1152 uram=192
[RS-0005]   SLOT_X1Y3: lut=138368 ff=276736 bram_18k=432 dsp=552 uram=96
[RS-0003] Resources of each slot in the generated device:
[RS-0005]   SLOT_X0Y0: lut=234624 ff=469248 bram_18k=658 dsp=1128 uram=188
[RS-0005]   SLOT_X0Y1: lut=187392 ff=374784 bram_18k=504 dsp=864 uram=156
[RS-0005]   SLOT_X0Y2: lut=254976 ff=509952 bram_18k=672 dsp=1152 uram=216
[RS-0005]   SLOT_X0Y3: lut=129536 ff=259072 bram_18k=336 dsp=552 uram=120
[RS-0005]   SLOT_X1Y0: lut=264704 ff=529408 bram_18k=848 dsp=1128 uram=189
[RS-0005]   SLOT_X1Y1: lut=202752 ff=405504 bram_18k=648 dsp=864 uram=144
[RS-0005]   SLOT_X1Y2: lut=288768 ff=577536 bram_18k=864 dsp=1152 uram=192
[RS-0005]   SLOT_X1Y3: lut=138368 ff=276736 bram_18k=432 dsp=552 uram=96
```

Next Step
---------
  **Click here to [go back to Getting Started](../README.md)**
