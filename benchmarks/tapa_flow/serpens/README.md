<!--
Copyright (c) 2024 RapidStream Design Automation, Inc. and contributors.  All rights reserved.
The contributor(s) of this file has/have agreed to the RapidStream Contributor License Agreement.
-->

<img src="https://imagedelivery.net/AU8IzMTGgpVmEBfwPILIgw/1b565657-df33-41f9-f29e-0d539743e700/128" width="64px" alt="RapidStream Logo" />

# General-Purpose Sparse Matrix-Vector Multiplication

## Introduction


In this recipe, we demonstrate how to use RapidStream to optimize TAPA projects. [TAPA](https://tapa.readthedocs.io/en/release/overview/overview.html), a dataflow HLS framework, features fast compilation, an expressive programming model, and the ability to generate high-frequency FPGA accelerators. We will guide you through the process using a High bandwidth memory based accelerator for general-purpose sparse matrix-vector multiplication from [Serpnes](https://github.com/linghaosong/Serpens). The basic steps include:

- Compile the HLS C++ code into a Vitis-compatible .xo file using TAPA.
- Optimize the .xo file with RapidStream to obtain an optimized .xo file.
- Use Vitis to compile the optimized .xo file into an .xclbin file for FPGA deployment.

## Tutorial

### Step 1: Generate the Xilinx Object File (`.xo`)


We utilize TAPA to generate the `.xo` file. If you have not installed TAPA, we've already compiled the C++ source to `.xo` using TAPA. The original C++ source files are located in [design/src](design/src). The generated `.xo` file can be found at [design/generated/Serpens.xo](design/generated/Serpens.xo). To compile C++ to `.xo` using TAPA, we use the script [design/run_tapa.sh](design/run_tapa.sh), with the detailed commands shown below. For your convenience, we have also backed up all the generated metadata by TAPA in the [design/generated](design/generated/) directory.

```bash
WORK_DIR=generated

tapac \
  --work-dir ${WORK_DIR} \
  --top Serpens \
  --part-num xcu280-fsvh2892-2L-e \
  --clock-period 3.33 \
  -o ${WORK_DIR}/Serpens.xo \
  --connectivity design/config/link_config_a24.ini \
  design/src/serpens.cpp \
  2>&1 | tee ${WORK_DIR}/tapa.log
```

### Step 2: Use Rapidstream to Optimize `.xo` Design


The RapidStream flow conducts design space exploration and generates solutions  by taking all TAPA-generated `.xo` file as the input.
The RapidStream flow for TAPA requires the following key inputs:

- **Platform**: The Vitis platform (e.g., `xilinx_u280_gen3x16_xdma_1_202211_1`).
- **Device**: virtual device define by calling rapidstream APIs based on platform (e.g., `get_u280_vitis_device_factory`).
- **.xo file**: The `.xo` file generated by TAPA
- **Connectivity** (.ini): Include the configuration file for `v++` ([link_config_a24.ini](design/config/link_config_a24.ini)).
- **top_module_name**: Top module name for the kernel.
- **Clock**: All the clock and frequencies.
- **Flatten Module**: Within a design, not all modules need to be optimized. The flatten module name is the target module rapidstream will optimize.

The Python snippet below shows how we initiate rapidstream instance to set up the rapidstream environment.

```Python
from rapidstream import get_u280_vitis_device_factory, RapidStreamTAPA
import os

CURR_DIR = os.path.dirname(os.path.abspath(__file__))
INI_PATH = f"{CURR_DIR}/design/config/link_config_a24.ini"
VITIS_PLATFORM = "xilinx_u280_gen3x16_xdma_1_202211_1"
XO_PATH = f"{CURR_DIR}/design/generated/Sextans.xo"
factory = get_u280_vitis_device_factory(VITIS_PLATFORM)
rs = RapidStreamTAPA(f"{CURR_DIR}build")
rs.set_virtual_device(factory.generate_virtual_device())
rs.add_xo_file(XO_PATH)
rs.set_vitis_platform(VITIS_PLATFORM)
rs.set_vitis_connectivity_config(INI_PATH)
rs.set_top_module_name("Sextans")
rs.add_clock("ap_clk", 3.33)
rs.add_flatten_targets(["Sextans"])
```

To leverage the multi-port capabilities of high-bandwidth memory, we utilize nearly 32 AXI ports of HBM, as illustrated below.

<img src="../../../getting_started/img/au280_sextans.png" width="800px" alt="au280_callipepla" />


As a result, it is necessary to assign the kernel ports to the appropriate slots. The Python code below demonstrates this process. For comprehensive linking details, please refer to the [design/config/link_config_a24.ini](design/config/link_config_a24.ini) file.

 ```Python
right_slot = "SLOT_X1Y0:SLOT_X1Y0"
left_slot = "SLOT_X0Y0:SLOT_X0Y0"
left_args = [
    "edge_list_ptr",
    "edge_list_ch_0",
    "edge_list_ch_1",
    "edge_list_ch_2",
    "edge_list_ch_3",
    "edge_list_ch_4",
    "edge_list_ch_5",
    "edge_list_ch_6",
    "edge_list_ch_7",
    "mat_B_ch_0",
    "mat_B_ch_1",
    "mat_B_ch_2",
    "mat_B_ch_3",
]
for arg in left_args:
    rs.assign_port_to_region(f"m_axi_{arg}_.*", left_slot)
right_args = [
    "mat_C_ch_0",
    "mat_C_ch_1",
    "mat_C_ch_2",
    "mat_C_ch_3",
    "mat_C_ch_4",
    "mat_C_ch_5",
    "mat_C_ch_6",
    "mat_C_ch_7",
    "mat_C_ch_in_0",
    "mat_C_ch_in_1",
    "mat_C_ch_in_2",
    "mat_C_ch_in_3",
    "mat_C_ch_in_4",
    "mat_C_ch_in_5",
    "mat_C_ch_in_6",
    "mat_C_ch_in_7",
]
for arg in right_args:
    rs.assign_port_to_region(f"m_axi_{arg}_.*", right_slot)
rs.assign_port_to_region("s_axi_control_.*", left_slot)
rs.assign_port_to_region("ap_clk", left_slot)
rs.assign_port_to_region("ap_rst_n", left_slot)
rs.assign_port_to_region("interrupt", left_slot)
```

For the complete detail, please refore to [./run.py](./run.py) file. Call the rapidstream by launching the command below or `make all`.

```bash
rapidstream run.py
```

If everything is successful, you should at least get one optimized `.xclbin` file.