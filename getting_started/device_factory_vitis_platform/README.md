<!--
Copyright (c) 2024 RapidStream Design Automation, Inc. and contributors.  All rights reserved.
The contributor(s) of this file has/have agreed to the RapidStream Contributor License Agreement.
-->

<img src="https://imagedelivery.net/AU8IzMTGgpVmEBfwPILIgw/1b565657-df33-41f9-f29e-0d539743e700/128" width="64px" alt="RapidStream Logo" />

# Custom Vitis Platforms


For those utilizing a Vitis platform, you can input the platform name, such as the U250 with XDMA.  With this information, RapidStream will then calculates the available resources, taking into account what’s already reserved by the Vitis shell.

# How it works

Users can define their own virtual device based on Vitis platform (e.g, `xilinx_u250_gen3x16_xdma_4_1_202210_1`). By using rapidstram APIs below, we can define our own alveo u250 device.

```python
factory = get_u250_vitis_device_factory("xilinx_u250_gen3x16_xdma_4_1_202210_1")
```

Uses can refer to function `get_u250_vitis_device_factory` in `u250.py` located at
your RapidStream installation directory, such as
`<home_dir>/.rapidstream/opt/python3.10/lib/python3.10/site-packages/rapidstream/assets/device_library/u250/u250.py`.

```python
def get_u250_vitis_device_factory(platform: str) -> DeviceFactory:
    """Get a U250 Vitis device factory."""
    df = get_u250_default_device_factory(get_resource=False)

    if platform == "xilinx_u250_gen3x16_xdma_4_1_202210_1":
        df.set_user_pblock_name("pblock_dynamic_region")

        vitis_slr_0 = [
            "-add    {CLOCKREGION_X0Y0:CLOCKREGION_X7Y3}",
            "-remove {SLICE_X146Y230:SLICE_X205Y239 LAGUNA_X20Y220:LAGUNA_X27Y239}",
        ]

        vitis_slr_1 = [
            "-add    {CLOCKREGION_X0Y4:CLOCKREGION_X3Y7}",
            "-remove {SLICE_X115Y240:SLICE_X116Y479}",
        ]

        vitis_slr_2 = [
            "-add    {CLOCKREGION_X0Y8:CLOCKREGION_X7Y11}",
            "-remove {SLICE_X120Y480:SLICE_X202Y491 LAGUNA_X16Y480:LAGUNA_X27Y503}",
        ]

        vitis_slr_3 = [
            "-add {CLOCKREGION_X0Y12:CLOCKREGION_X7Y15}",
        ]

        df.set_slot_pblock(0, 0, vitis_slr_0 + [f"-remove {ULTRASCALE_SLOT_X1Y0}"])
        df.set_slot_pblock(1, 0, vitis_slr_0 + [f"-remove {ULTRASCALE_SLOT_X0Y0}"])

        df.set_slot_pblock(0, 1, vitis_slr_1 + [f"-remove {ULTRASCALE_SLOT_X1Y1}"])
        df.set_slot_pblock(1, 1, vitis_slr_1 + [f"-remove {ULTRASCALE_SLOT_X0Y1}"])

        df.set_slot_pblock(0, 2, vitis_slr_2 + [f"-remove {ULTRASCALE_SLOT_X1Y2}"])
        df.set_slot_pblock(1, 2, vitis_slr_2 + [f"-remove {ULTRASCALE_SLOT_X0Y2}"])

        df.set_slot_pblock(0, 3, vitis_slr_3 + [f"-remove {ULTRASCALE_SLOT_X1Y3}"])
        df.set_slot_pblock(1, 3, vitis_slr_3 + [f"-remove {ULTRASCALE_SLOT_X0Y3}"])

        # the entire right half of SLR 1 is taken away
        df.set_slot_capacity(1, 0, north=0)
        df.set_slot_capacity(1, 1, south=0)
        df.set_slot_capacity(1, 1, north=0)
        df.set_slot_capacity(1, 2, south=0)
        breakpoint()
        df.extract_slot_resources()
        return df

    raise ValueError(f"Unknown platform: {platform}")
```

For this setup, we define 8 slots for the virtual device based on units of clock regions, as shown in Figure (a) below. However, the AMD Vitis platform usually reserves some regions to implement its own hardware shell, which includes XDMA, DCMs, thermo-monitors, and other components. By running `generate_virtual_device` in the [`run.py`](run.py) script below, RapidStream will mask out the logic reserved by AMD, generate the final implementation region, and extract the real resources available for users, as shown in Figure (c).

```python
device = factory.generate_virtual_device()
```

<img src="../img/au250_virtual_device.png" width="1000px" alt="RapidStream Logo" />


## Tutorial
Run command to extract resources of each slot of the platform:

```bash
rapidstream ./run.py
```

The output of this recipe looks like this:

```
[RS-0001] Invoking Vivado to extract resources of each slot of part "xcu250-figd2104-2L-e"...
[RS-0047] Running command with PID 1532299: vivado -mode batch -source /tmp/tmp5fy5rueh/get_pblock_resources.tcl
Resource ff is not found in the report  /tmp/tmp5fy5rueh/x1y1.rpt
Resource lut is not found in the report /tmp/tmp5fy5rueh/x1y1.rpt
Resource bram_18k is not found in the report /tmp/tmp5fy5rueh/x1y1.rpt
Resource dsp is not found in the report /tmp/tmp5fy5rueh/x1y1.rpt
Resource uram is not found in the report /tmp/tmp5fy5rueh/x1y1.rpt
[RS-0002] Resources of each slot of part "xcu250-figd2104-2L-e" extracted from Vivado:
[RS-0005]   SLOT_X0Y0: lut=216960 ff=433920 bram_18k=768 dsp=1536 uram=128
[RS-0005]   SLOT_X0Y1: lut=213120 ff=426240 bram_18k=768 dsp=1536 uram=128
[RS-0005]   SLOT_X0Y2: lut=216960 ff=433920 bram_18k=768 dsp=1536 uram=128
[RS-0005]   SLOT_X0Y3: lut=216960 ff=433920 bram_18k=768 dsp=1536 uram=128
[RS-0005]   SLOT_X1Y0: lut=210560 ff=421120 bram_18k=576 dsp=1536 uram=192
[RS-0005]   SLOT_X1Y1: lut=0 ff=0 bram_18k=0 dsp=0 uram=0
[RS-0005]   SLOT_X1Y2: lut=207648 ff=415296 bram_18k=576 dsp=1536 uram=192
[RS-0005]   SLOT_X1Y3: lut=215040 ff=430080 bram_18k=576 dsp=1536 uram=192
[RS-0003] Resources of each slot in the generated device:
[RS-0005]   SLOT_X0Y0: lut=216960 ff=433920 bram_18k=768 dsp=1536 uram=128
[RS-0005]   SLOT_X0Y1: lut=213120 ff=426240 bram_18k=768 dsp=1536 uram=128
[RS-0005]   SLOT_X0Y2: lut=216960 ff=433920 bram_18k=768 dsp=1536 uram=128
[RS-0005]   SLOT_X0Y3: lut=216960 ff=433920 bram_18k=768 dsp=1536 uram=128
[RS-0005]   SLOT_X1Y0: lut=210560 ff=421120 bram_18k=576 dsp=1536 uram=192
[RS-0005]   SLOT_X1Y1: lut=0 ff=0 bram_18k=0 dsp=0 uram=0
[RS-0005]   SLOT_X1Y2: lut=207648 ff=415296 bram_18k=576 dsp=1536 uram=192
[RS-0005]   SLOT_X1Y3: lut=215040 ff=430080 bram_18k=576 dsp=1536 uram=192
```

In this recipe, Slot X1Y1 have no available resources because it's occupied by the Vitis shell.


Next Step
---------
  **Click here to [go back to Getting Started](../README.md)**
