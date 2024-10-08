<!--
Copyright (c) 2024 RapidStream Design Automation, Inc. and contributors.  All rights reserved.
The contributor(s) of this file has/have agreed to the RapidStream Contributor License Agreement.
-->

<img src="https://imagedelivery.net/AU8IzMTGgpVmEBfwPILIgw/1b565657-df33-41f9-f29e-0d539743e700/128" width="64px" alt="RapidStream Logo" />

# TAPA Flow: ORC Decoder

## Introduction


In this recipe, we demonstrate how to use RapidStream to optimize TAPA projects. The basic steps include:

- Compile the TAPA C++ code into a Vitis-compatible .xo file using TAPA.
- Optimize the .xo file with RapidStream to obtain an optimized .xo file.
- Use Vitis to compile the optimized .xo file into an .xclbin file for FPGA deployment.

## Tutorial

### Step 1 (Done): Generate the Xilinx Object File (`.xo`)


We utilize TAPA to generate the `.xo` file. If you have not installed TAPA, we've already compiled the C++ source to `.xo` using TAPA. The original C++ source files are located in [design/src](design/src). The generated `.xo` file can be found at [design/generated/data_decoding.xo](design/generated/data_decoding.xo). To compile C++ to `.xo` using TAPA, we use the script [design/run_tapa.sh](design/run_tapa.sh), with the detailed commands shown below. For your convenience, we have also backed up all the generated metadata by TAPA in the [design/generated](design/generated/) directory.

```bash
mkdir -p build/run_u55c.py
cd build/run_u55c.py && tapa compile \
--top data_decoding \
--part-num xcu55c-fsvh2892-2L-e \
--clock-period 3.33 \
-o data_decoding.xo \
-f $< \
2>&1 | tee tapa.log


```



### Step 2: Define Virtual Device

In this tutorial, we use the [Alveo U55C](https://www.amd.com/en/products/accelerators/alveo/u55c/a-u55c-p00g-pq-g.html) as an example. The device is organized into six slots, each
containing 16 clock regions of logic. In actual implementations, the available resource of each slot is reduced
 based on the platform specifics, as some resources are reserved for shell logic.

<img src="../../../common/img/au55c_virtual_device.jpg" width="400px" alt="AU55C Device"/>

To generate a `device.json` file that details the device features, such as slot resources and
 locations, you can either run the `run_u55c.py` script by invoking RapidStream as shown below or
 simply enter `make device` in the terminal.

```bash
rapidstream run_u55c.py
```


### Step 3: Use Rapidstream to Optimize `.xo` Design

The RapidStream flow conducts design space exploration and generates solutions  by taking all TAPA-generated `.xo` file as the input.
The RapidStream flow for TAPA requires the following key inputs:

- **tapa-xo-path**: The path to the tapa-generated `xo` file (data_decoding.xo).
- **device-config**: The virtual device (`device.json`) generated in previous step 2 by calling rapidstream APIs based on platform.
- **floorplan-config**: The configure file ([floorplan_config.json](design/config/run_u55c.py/floorplan_config.json)) to guide integrated Autobridge to floorplan the design.
- **implementation-config**: The configure file ([impl_config.json](design/config/run_u55c.py/impl_config.json)) to guide Vitis to implement the design (e.g., kernel clock, vitis_platform and etc.).
- **connectivity-ini**: The link configure file ([link_config.ini](design/config/run_u55c.py/link_config.ini)) to specify how the kernel interfaces are connected the memory controller. This is
the same for vitis link configure file.

We encapulate the rapidstream command for TAPA as `rapidstream-tapaopt` for invoking.
You can run the command below or execute `make all` supported by our [Makefile](Makefile).

```bash
rapidstream-tapaopt --work-dir build/run_u55c.py \
                    --tapa-xo-path design/generated/data_decoding.xo \
                    --device-config build/run_u55c.py/device.json \
                    --floorplan-config design/config/run_u55c.py/floorplan_config.json \
                    --implementation-config design/config/run_u55c.py/impl_config.json \
                    --connectivity-ini design/config/run_u55c.py/link_config.ini
```


If everything is successful, you should at least get one optimized `.xclbin` file.


### Step 4: Check the Group Module Report


RapidStream mandates a clear distinction between communication and computation within user designs.

- In `Group modules`, users are tasked solely with defining inter-submodule communication. For those familiar with Vivado IP Integrator flow, crafting a Group module mirrors the process of connecting IPs in IPI. RapidStream subsequently integrates appropriate pipeline registers into these Group modules.

- In `Leaf modules`, users retain the flexibility to implement diverse computational patterns, as RapidStream leaves these Leaf modules unchanged.

For further details, please consult the [code style](https://docs.rapidstream-da.com/required-coding-style/) section in our Documentation.

To generate a report on group types, execute the commands below or `run make show_groups`:

```bash
rapidstream ../../../common/util/get_group.py \
	-i build/passes/0-imported.json \
	-o build/module_types.csv
```

The module types for your design can be found in `build/module_types.csv`. Below, we list the four Group modules. In this design, `Callipepla` serves as a Group module, while the other three modules are added by RapidStream.

| Module Name                      | Group Type     |
|:--------------------------------:|:--------------:|
| data_decoding                    | grouped_module |
|__rs_ap_ctrl_start_ready_pipeline | grouped_module |
|__rs_ff_pipeline                  | grouped_module |
|__rs_hs_pipeline                  | grouped_module |
