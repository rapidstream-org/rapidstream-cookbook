<!--
Copyright (c) 2024 RapidStream Design Automation, Inc. and contributors.  All rights reserved.
The contributor(s) of this file has/have agreed to the RapidStream Contributor License Agreement.
-->

<img src="https://imagedelivery.net/AU8IzMTGgpVmEBfwPILIgw/1b565657-df33-41f9-f29e-0d539743e700/128" width="64px" alt="RapidStream Logo" />

# CNN13x4 Benchmark

## Introduction

In this tutorial, we demonstrate the process of creating a Vitis objective file (`.xo`) for a Convolutional Neural Network (CNN) kernel used in [AutoBridge](https://github.com/UCLA-VAST/AutoBridge/tree/master/archive/benchmarks/CNN) with Vitis. We then optimize the `.xo`  file with RapidStream and incorporate the optimized output into the ongoing Vitis development workflow. For this demonstration, we use the Alveo U250 device. To adapt the design for other devices, such as the Alveo U50, Alveo U55C, or Alveo U280, please refer to the [CNN13x2](../../cnn13x2/README.md)  tutorial.


## Tutorial

### Step 1: C++ Simulation

Since our
design calls Xilinx Libraries, we need to source the Vitis environment before running the simulation.

```bash
source <Vitis_install_path>/Vitis/2023.2/settings64.sh
```

Before generating the `.xo` file, we recommend running a C++ simulation to verify the correctness of the design. This step is optional but highly recommended. Run the following command or `make csim` to perform C++ simulation:

```bash
g++ -I ${XILINX_HLS}/include ./design/kernel3.cpp ./design/main.cpp -o main.exe
./main.exe
```

Your should see the following output:

```bash
./main.exe
Passed!
INFO [HLS SIM]: The maximum depth reached by any hls::stream() instance in the design is 32768
```

### Step 2: Targeting Vitis Software Emulation

AMD Vitis provides an easy way to target software emulation for debugging and performance analysis. For this tutorial, we will use Alveo U250 for demonstration (`xilinx_u250_gen3x16_xdma_4_1_202210_1`). You can easily change the `--platform` to other devices in the [`Makefile`](./Makefile). Run the following commands or `make TARGET=sw_emu sw_emu` to perform Vitis software emulation:

```bash
source <Vitis_install_path>/Vitis/2023.2/settings64.sh
source /opt/xilinx/xrt/setup.sh

v++ -c -t sw_emu \
  --platform xilinx_u250_gen3x16_xdma_4_1_202210_1\
  -k kernel3 \
  --temp_dir build \
  -o build/kernel3.xo \
  design/kernel3.cpp design/kernel3.h

v++ -l -t sw_emu \
  --platform xilinx_u250_gen3x16_xdma_4_1_202210_1\
  --kernel kernel3 \
  --connectivity.nk kernel3:1:kernel3 \
  --config design/link_config_hbm.ini \
  --temp_dir build \
  -o build/kernel3.xclbin \
  build/kernel3.xo

g++ -Wall -g -std=c++11 design/host.cpp design/kernel3.h -o app.exe \
  -I${XILINX_XRT}/include/ \
  -I${XILINX_HLS}/include/ \
  -L${XILINX_XRT}/lib/ -lOpenCL -pthread -lrt -lstdc++

XCL_EMULATION_MODE=sw_emu ./app.exe ./build/kernel3.xclbin
```

You would see the following output:

```bash
XCL_EMULATION_MODE=sw_emu ./app.exe build/kernel3.xclbin
INFO: reading build/kernel3.xclbin xclbinfile
INFO: loading: 'build/kernel3.xclbin'
CRITICAL WARNING: [SW-EM 09-0] Unable to find emconfig.json. Using default device "xilinx:pcie-hw-em:7v3:1.0"
Trying to program device[0]: xilinx:pcie-hw-em:7v3:1.0
Kernel Name: kernel3, CU Number: 0, Thread creation status: success
Device[0]: xclbin is loaded successfully!
Kernel Name: kernel3, CU Number: 0, State: Start
Kernel Name: kernel3, CU Number: 0, State: Running
Kernel Name: kernel3, CU Number: 0, State: Idle
TEST PASSED!
device process sw_emu_device done
Kernel Name: kernel3, CU Number: 0, Status: Shutdown
INFO [HLS SIM]: The maximum depth reached by any hls::stream() instance in the design is 32768
```

:warning: **Note**: Clean the sw_emu `.xo` file before next steps by running `make clean`.

### Step 3: Generate the Xilinx Object File (`.xo`)

We use Vitis 2023.2 to generate the `.xo` file. Since we want to disable [free running pipeline (FRP)](https://www.xilinx.com/htmldocs/xilinx2021_2/hls-guidance/200-1553.html) feature for HLS step, we use [hls2rtl.tcl](../../../../common/tcl/hls2rtl.tcl) to compile the C++ code to `.xo` file instead of using `v++`.

Run the following command or run `make clean && make xo`:

```bash
source <Vitis_install_path>/Vitis/2023.2/settings64.sh
make clean
mkdir -p build
vitis_hls ../../../../common/tcl/hls2rtl.tcl \
-l build/vitis_hls_kernel3.log \
-tclargs xcu250-figd2104-2L-e 4 kernel3 design/kernel3.cpp design/kernel3.h
```

### Step 4 (Optional): Use Vitis --link to Generate the `.xclbin` File

:warning: **Note**: This step can take hours to complete. We recommend using the RapidStream flow to optimize the `.xo` file instead of generating the `.xclbin` file if you are familiar with AMD Vitis flow.

With the `.xo` file generated, you can use `v++ -link` to generate the `.xclbin` file. Run the following command or execute `make hw`:

```bash
v++ -l -t hw \
  --platform xilinx_u250_gen3x16_xdma_4_1_202210_1  \
  --kernel kernel3 \
  --connectivity.nk kernel3:1:kernel3 \
  --config design/link_config.ini \
  --temp_dir build \
  -o build/kernel3.xclbin \
  build/kernel3.xo
```

If your machines is equipped with the target FPGA device, you can deploy the optimized design on the FPGA by running the following command:

```bash
./app.exe <path_to_vitis_xclbin>
```




### Step 5: Call RapidStream to Optimize the Design

The RapidStream flow conducts design space exploration and generates optimized `.xo` files by taking the Vitis generated `.xo` as the input. The RapidStream flow for Vitis requires four key inputs:

1. **Device**: Specify the Vitis platform name for `v++`.
2. **Xilinx Object file** (.xo): Provide the file generated by `v++` or Vivado.
3. **Connectivity** (.ini): Include the configuration file for `v++` ([link_config.ini](./design/link_config.ini)).
4. **Clock targets**: Define the desired clock frequencies.
5. RapidStream automatically handles all other aspects of the flow.

Please refer to [run.py](./run.py) for the complete RapidStream flow.
To execute the flow and generate optimized `.xo` files,
Run the following command or execute `make rs_opt`:

```bash
rapidstream ./run_u50.py
```

When finished, you can locate these files using the following command:

```bash
find ./build/dse/ -name *.xo
```

If everything is successful, you should at least get one optimized `.xo` file located in `./build/dse/candidate_0/exported/kernel3.xo`.


### Step 6: Use Vitis --link with the Optimized `.xo` File

With the optimized `.xo` file generated, you can use `v++ -link` to generate the `.xclbin` file. Run the following command:

```bash
v++ -l -t hw \
  --platform xilinx_u250_gen3x16_xdma_4_1_202210_1  \
  --kernel kernel3 \
  --connectivity.nk kernel3:1:kernel3 \
  --config design/link_config.ini \
  --temp_dir build/rapidstream \
  -o build/rapidstream/kernel3_rs_opt.xclbin \
  ./build/dse/candidate_0/exported/kernel3.xo
```


To examine the timing results for each design point, use this command:

```bash
find ./build -name *.xclbin.info
```

If your machine is equipped with the target FPGA device, you can deploy the optimized design on the FPGA by running the following command:

```bash
make host
./app.exe <path_to_optimized_xclbin>
```
