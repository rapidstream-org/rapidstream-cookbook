<!--
Copyright (c) 2024 RapidStream Design Automation, Inc. and contributors.  All rights reserved.
The contributor(s) of this file has/have agreed to the RapidStream Contributor License Agreement.
-->

<img src="https://imagedelivery.net/AU8IzMTGgpVmEBfwPILIgw/1b565657-df33-41f9-f29e-0d539743e700/128" width="64px" alt="RapidStream Logo" />

# TAPA Flow: Bandwidth23

## Introduction

The AMD Versal device introduces a revolutionary hardware architecture for FPGA developers.
One standout feature is the distributed NoC AXI master/slave ports spread across the entire chip,
which is especially beneficial for kernels requiring numerous ports. For instance, in Alveo devices,
utilizing HBM bandwidth at the chip's base requires routing 32 AXI ports, each 512 bits wide, close
to the HBM—posing significant implementation challenges. With the Versal architecture, however,
these 32 AXI ports can be distributed across different regions of the chip, alleviating local routing congestion.

Nevertheless, routing these ports across the chip introduces the challenge of connecting them
with long wires. To optimize the effectiveness of the NoC architecture, RapidStream can be employed
to automatically insert pipeline registers between distributed logic. This approach not only achieves
high bandwidth through multiple AXI ports but also mitigates the local routing congestion seen in
previous architectures like the Alveo device.


In this recipe, we demonstrate how to leverage RapidStream to optimize a TAPA project that
includes a kernel with 23 AXI ports, each 512 bits wide. The process involves the following key steps:

- Compile the TAPA C++ code into a Vitis-compatible `.xo` file using TAPA.
- Optimize the generated `.xo` file with RapidStream to produce an enhanced `.xo` file.
- Use Vitis to compile the optimized `.xo` file into an .xclbin file for FPGA deployment.

:warning: **Note**: We use `Vitis 2022.2` and `xilinx_vck5000_gen4x8_qdma_2_202220_1` for this tutorial.


## Tutorial

### Step 0 (optional): Run C++ Simulation

We use [Rapidstream-TAPA](https://github.com/rapidstream-org/rapidstream-tapa) to compile the tapa C++
code to a `.exe` file. Execute `make csim` in the terminal to perform C simulation, you will see similar
results as below.

```bash
source /opt/tools/xilinx/Vitis/2022.2/settings64.sh
make csim
...
I20241007 14:49:55.675232 1178163 task.h:66] running software simulation with TAPA library
kernel time: 4.2962 s
PASS!
```

### Step 1: Generate the Xilinx Object File (`.xo`)

We use [Rapidstream-TAPA](https://github.com/rapidstream-org/rapidstream-tapa)  to generate the `.xo` file,
with the original C++ source files located in the [design](./design) directory. To compile the C++ code
into a `.xo` file using TAPA, follow the commands provided below. For convenience,
you can also execute the `make xo` command in the terminal, as supported by our Makefile.

```bash
mkdir -p build/run_vck5000.py
cd build/run_vck5000.py && tapa compile \
--top bandwidth23 \
--part-num xcvc1902-vsvd1760-2MP-e-S \
--clock-period 3.33 \
-o bandwidth23.xo \
-f design/bandwidth23.cpp \
2>&1 | tee tapa.log
```

### Step 2: Define Virtual Device

The VCK5000 device is equipped with 4x7 NMU512 and NSU512 ports across the chip (only NMU512 ports are shown). For our design, we focus solely on the FPGA fabric and not the AI Engine. We define four slots for the virtual device, each containing either six or eight NMU512 ports to connect internal logic to the DDR SRAM at the base. A Python-based script, [run_vck5000.py](./run_vck5000.py), is provided as a reference for defining the virtual device using the RapidStream API.


<img src="../../../common/img/vck5000_virtual_device.jpg" width="800px" alt="VCK5000 Device"/>

You can run the `run_vck5000.py` script by invoking RapidStream as shown below, or simply type `make device` in the terminal. This will generate a `device.json` file, which outlines all the device features, including slot resources, slot locations, and more.


```bash
rapidstream run_vck5000.py
```

### Step 3: Use Rapidstream to Optimize `.xo` Design

The RapidStream flow conducts design space exploration and generates solutions  by taking all TAPA-generated `.xo` file as the input.
The RapidStream flow for TAPA requires the following key inputs:

- **tapa-xo-path**: The path to the tapa-generated `xo` file (bandwidth23.xo).
- **device-config**: The virtual device (`device.json`) generated in previous step 2 by calling rapidstream APIs based on platform.
- **floorplan-config**: The configure file ([ab_config.json](design/config/run_vck5000.py/ab_config.json)) to guide integrated Autobridge to floorplan the design.
- **implementation-config**: The configure file ([impl_config.json](design/config/run_vck5000.py/impl_config.json)) to guide Vitis to implement the design (e.g., kernel clock, vitis_platform and etc.).
- **connectivity-ini**: The link configure file ([link_config.ini](design/config/run_vck5000.py/link_config.ini)) to specify how the kernel interfaces are connected the memory controller. This is
the same for vitis link configure file.

We encapulate the rapidstream command for TAPA as `rapidstream-tapaop` for invoking.
You can run the command below or execute `make rs_xo` supported by our [Makefile](Makefile).

```bash
rapidstream-tapaopt --work-dir build/run_vck5000.py \
                    --tapa-xo-path build/run_vck5000.py/bandwidth23.xo \
                    --device-config build/run_vck5000.py/device.json \
                    --floorplan-config design/config/run_vck5000.py/ab_config.json \
                    --implementation-config design/config/run_vck5000.py/impl_config.json \
                    --connectivity-ini design/config/run_vck5000.py/link_config.ini
```

### Step 4: Fix Kernel Interfaces to NoC Network Master Unit (NMU512)

Vitis connects connect kernel interfaces automatically to the AXI slave ports of memory controller.
Next, it can map the AXI slave ports of memory controller to the physical Network Master Units across
the chip according to bandwidth requirements. However, our flooplan is based fixed mapping between
kernel interfaces and MNU512. Therefore, we need to fix the kernel interfaces to the designated
MNU512 ports according to the configure file ([ab_config.json](design/config/run_vck5000.py/ab_config.json)).

To make this hack work, we will call `v++` twice. For the first time, we use `--to_step vpl.synth`
option to generate post-RTL-synthesis design. Next, we use a manual-crafted
`.tcl` file ([fix_noc.tcl](design/config/run_vck5000.py/fix_noc.tcl)) to map AXI slave interfaces
of the memory controller to fixed NOC NMU512 locations and re-synthesize the design. Finally,
we call `v++` second time by using `--from_step vpl.impl` option to reserve the NoC mapping
constraints to implement the whole design.

You can execute `make rs_xclbin` to complete the process.

### Step 5: Check Timing Report

After the design is successfully implemented in previous step, you can check the timing slack my
executing `make all`. The `build.json` file can be found in the work directory `build/run_vck5000.py/build.json`.
We can see the slack is 0.186 ns for 3.333 ns constraint.

```json
{
    "solution_0_global_slack": "0.186",
    "solution_0_target_clk_slack": "0.186",
    "solution_0_target_clk": "3.333ns",
    "solution_0_frequency_achieved": "317.76 MHz"
}
```

### Step 6: Implement Baseline with Vitis

We can call `Vitis` directly to implement the design on VCK5000 by execute `make hw`. After implementation, you
you will see the slack is 0.158 ns for 3.333 ns constraint.

### Step 7: Compasison between Vitis and Rapidstream.

The image below shows the implementation comparison between Vitis and Rapidstream optimized design.


<img src="../../../common/img/vck5000_vitis_rs.jpg" width="800px" alt="Impl Comparison"/>


The table below shows the slack comparisons.

| Implementation Type | Clock Constraint / ns| Timing Slack / ns | Max Frequency / MHz |
|:-------------------:|:--------------------:|:-----------------:|:-------------------:|
| Vitis               | 3.333                | 0.158             | 314.96              |
| Rapidstream         | 3.333                | 0.186             | 317.63              |