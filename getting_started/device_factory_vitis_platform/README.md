<!--
Copyright (c) 2024 RapidStream Design Automation, Inc. and contributors.  All rights reserved.
The contributor(s) of this file has/have agreed to the RapidStream Contributor License Agreement.
-->

<img src="https://imagedelivery.net/AU8IzMTGgpVmEBfwPILIgw/1b565657-df33-41f9-f29e-0d539743e700/128" width="64px" alt="RapidStream Logo" />

Custom Vitis Platforms
======================

For those utilizing a Vitis platform, you can input the platform name, such as the U250 with XDMA.  With this information, RapidStream will then calculates the available resources, taking into account what’s already reserved by the Vitis shell.

Run command to extract resources of each slot of the platform:

```bash
rapidstream ./run.py
```

The output of this recipe looks like this:

```
[RS-0001] Invoking Vivado to extract resources of each slot of part "xcu250-figd2104-2L-e"...
[RS-0047] Running command with PID 2329551: vivado -mode batch -source /tmp/tmpoms0oj6_/get_pblock_resources.tcl
[RS-0002] Resources of each slot of part "xcu250-figd2104-2L-e" extracted from Vivado:
[RS-0005]   SLOT_X0Y0: lut=216960 ff=433920 bram_18k=768 dsp=1536 uram=128
[RS-0005]   SLOT_X0Y1: lut=213120 ff=426240 bram_18k=768 dsp=1536 uram=128
[RS-0005]   SLOT_X0Y2: lut=216960 ff=433920 bram_18k=768 dsp=1536 uram=128
[RS-0005]   SLOT_X0Y3: lut=216960 ff=433920 bram_18k=768 dsp=1536 uram=128
[RS-0005]   SLOT_X1Y0: lut=210560 ff=421120 bram_18k=576 dsp=1536 uram=192
[RS-0005]   SLOT_X1Y1: lut=0 ff=0 bram_18k=0 dsp=0 uram=0
[RS-0005]   SLOT_X1Y2: lut=207648 ff=415296 bram_18k=576 dsp=1536 uram=192
[RS-0005]   SLOT_X1Y3: lut=215040 ff=430080 bram_18k=576 dsp=1536 uram=192
```

In this recipe, Slot X1Y1 have no available resources because it's occupied by the Vitis shell:

<img src="https://imagedelivery.net/AU8IzMTGgpVmEBfwPILIgw/0c011f29-9654-432f-d73d-97b41337fc00/1024" height="512px" alt="U250 Layout"/>

Next Step
---------
  **Click here to [go back to Getting Started](../README.md)**
