<!--
Copyright (c) 2024 RapidStream Design Automation, Inc. and contributors.  All rights reserved.
The contributor(s) of this file has/have agreed to the RapidStream Contributor License Agreement.
-->

<img src="https://imagedelivery.net/AU8IzMTGgpVmEBfwPILIgw/1b565657-df33-41f9-f29e-0d539743e700/128" width="64px" alt="RapidStream Logo" />

# TAPA Design

## Introduction

Rapidsteam is fully compatible with [TAPA](https://github.com/rapidstream-org/rapidstream-tapa).
In this recipe, we illustrate how to create a Xilinx objective file (`.xo`) using TAPA, then optimize the `.xo` file with Rapidstream, and finally utilize the optimized output in the ongoing Vitis development process.


## Xilinx Object Files

[Vitis compiled object files (`.xo`)](https://docs.amd.com/r/en-US/ug1393-vitis-application-acceleration/Design-Topology) are IP packages used in the AMD Vitis kernel development flow for programming the programmable logic (PL) region of target devices.

These files can be [generated from HLS C++ code](https://docs.amd.com/r/en-US/ug1393-vitis-application-acceleration/Developing-PL-Kernels-using-C) using the `v++` command, [packed from RTL code](https://docs.amd.com/r/en-US/ug1393-vitis-application-acceleration/RTL-Kernel-Development-Flow), or created using third-party frameworks like [RapidStream TAPA](https://github.com/rapidstream-org/rapidstream-tapa). In this example, we use `RapidStream TAPA` to generate the `VecAdd.xo` file, but the same flow applies to object files generated through other methods.


## Tutorial

### Step 1: C++ Simulation

Since our
design calls Xilinx Libraries, we need to source the Vitis environment before running the simulation.

```bash
source <Vitis_install_path>/Vitis/2023.2/settings64.sh
```

Before generating the `.xo` file, we recommend running a C++ simulation to verify the correctness of the design. This step is optional but highly recommended. Run the following command or `make csim` to perform C++ simulation:

```bash
tapa g++ design/main.cpp design/VecAdd.cpp \
-I /opt/tools/xilinx/Vitis_HLS/2023.2/include \
-o build/run_u55c.py/main.exe -O2
./build/run_u55c.py/main.exe
```

Your should see the following output:

```bash
I20241010 15:14:52.494259 4113880 task.h:66] running software simulation with TAPA library
kernel time: 0.0197967 s
PASS!
```

### Step 2: Generate the Xilinx Object File (`.xo`)

We use TAPA on top of 2023.2 to generate the `.xo` file. Run the following command or run `make xo`:

```bash
source <Vitis_install_path>/Vitis/2023.2/settings64.sh
mkdir -p build/run_u55c.py
cd build/run_u55c.py && tapa compile \
--top VecAdd \
--part-num xcu280-fsvh2892-2L-e \
--clock-period 3.33 \
-o VecAdd.xo \
-f design/VecAdd.cpp \
2>&1 | tee tapa.log
```

### Step 3 (Optional): Use Vitis --link to Generate the `.xclbin` File

With the `.xo` file generated, you can use `v++ -link` to generate the `.xclbin` file. Run the following command or execute `make hw`:

```bash
v++ -l -t hw \
  --platform  xilinx_u280_gen3x16_xdma_1_202211_1 \
  --kernel VecAdd \
  --connectivity.nk VecAdd:1:VecAdd \
  --config design/link_config.ini \
  --temp_dir build \
  -o build/VecAdd.xclbin \
  build/VecAdd.xo
```

If your machines is equipped with the target FPGA device, you can deploy the optimized design on the FPGA by running the following command:

```bash
./app.exe <path_to_vitis_xclbin>
```

:warning: **Note**: This step can take hours to complete. We recommend using the RapidStream flow to optimize the `.xo` file instead of generating the `.xclbin` file if you are familiar with AMD Vitis flow.


### Step 5: Call RapidStream to Optimize the Design

The RapidStream flow conducts design space exploration and generates optimized `.xo` files by taking the Vitis generated `.xo` as the input. The RapidStream flow for Vitis requires four key inputs:

1. **Device**: Specify the Vitis platform name for `v++`.
2. **Xilinx Object file** (.xo): Provide the file generated by `v++` or Vivado.
3. **Connectivity** (.ini): Include the configuration file for `v++` ([link_config.ini](./design/config/run_u55c.py/link_config.ini)).
4. **Clock targets**: Define the desired clock frequencies.
5. RapidStream automatically handles all other aspects of the flow.

Please refer to [run_u55c.py](./run_u55c.py) for the complete RapidStream flow.
To execute the flow and generate optimized `.xo` files,
Run the following command or execute `make rs_opt`:

```bash
rapidstream ./run_u55c.py
```

When finished, you can locate these files using the following command:

```bash
find ./build/dse/ -name *.xo
```

If everything is successful, you should at least get one optimized `.xo` file located in `./build/dse/candidate_0/exported/VecAdd.xo`.

### Step 6: Check the Group Module Report


RapidStream mandates a clear distinction between communication and computation within user designs.

- In `Group modules`, users are tasked solely with defining inter-submodule communication. For those familiar with Vivado IP Integrator flow, crafting a Group module mirrors the process of connecting IPs in IPI. RapidStream subsequently integrates appropriate pipeline registers into these Group modules.

- In `Leaf modules`, users retain the flexibility to implement diverse computational patterns, as RapidStream leaves these Leaf modules unchanged.

For further details, please consult the [code style](https://docs.rapidstream-da.com/required-coding-style/) section in our Documentation.

To generate a report on group types, execute the commands below or `run make show_groups`:

```bash
rapidstream ../../common/util/get_group.py \
	-i build/passes/0-imported.json \
	-o build/module_types.csv
```

The module types for your design can be found in `build/module_types.csv`. Below, we list the four Group modules. In this design, `VecAdd` serves as a Group module, while the other three modules are added by RapidStream.

| Module Name                      | Group Type     |
|:--------------------------------:|:--------------:|
| VecAdd                           | grouped_module |
|__rs_ap_ctrl_start_ready_pipeline | grouped_module |
|__rs_ff_pipeline                  | grouped_module |
|__rs_hs_pipeline                  | grouped_module |


### Step 7: Use Vitis --link with the Optimized `.xo` File

With the optimized `.xo` file generated, you can use `v++ -link` to generate the `.xclbin` file. Run the following command or run `make`:

```bash
v++ -l -t hw \
  --platform  xilinx_u280_gen3x16_xdma_1_202211_1 \
  --kernel VecAdd \
  --connectivity.nk VecAdd:1:VecAdd \
  --config design/link_config.ini \
  --temp_dir build/rapidstream \
  -o build/VecAdd_rs_opt.xclbin \
  ./build/dse/candidate_0/exported/VecAdd.xo
```


To examine the timing results for each design point, use this command:

```bash
find ./build -name *.xclbin.info
```



If your machines is equipped with the target FPGA device, you can deploy the optimized design on the FPGA by running the following command:

```bash
make host
./app.exe <path_to_optimized_xclbin>
```

## Next Step

  **Click here to [go back to Getting Started](../README.md)**
