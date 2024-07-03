<!--
Copyright (c) 2024 RapidStream Design Automation, Inc. and contributors.  All rights reserved.
The contributor(s) of this file has/have agreed to the RapidStream Contributor License Agreement.
-->

<img src="https://imagedelivery.net/AU8IzMTGgpVmEBfwPILIgw/1b565657-df33-41f9-f29e-0d539743e700/128" width="64px" alt="RapidStream Logo" />

# CNN13x16 Benchmark

## Introduction

Despite the emergence of Vitis, Vivado remains the mainstream development tool in the industry.
In this recipe, we demonstrate how to optimize the Convolutional Neural Network (CNN) kernel from [AutoBridge](https://github.com/UCLA-VAST/AutoBridge/tree/master/archive/benchmarks/CNN) which can be integrated by Vivado for development. The kernel will be compiled by `vitis_hls` to generate Verilog files and HLS reports. Next, RapidStream will parse the reports and Verilog files to optimize the design and generate refined Verilog files. Subsequently, we will use Vivado to integrate the optimized kernel with the basic firmware (XDMA, PLL, AXI crossbars and etc.), enabling communication with the host CPU for application deployment.



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

### Step 2: Generate HLS Solution by `vitis_hls`

We use Vitis 2023.2 to generate the HLS solutions. Since we want to disable [free running pipeline (FRP)](https://www.xilinx.com/htmldocs/xilinx2021_2/hls-guidance/200-1553.html) feature for HLS step, we use [hls2rtl.tcl](../../../../common/tcl/hls2rtl.tcl) to compile the C++ code to HLS solutions.

Run the following command or run `make clean && make hls`:

```bash
source <Vitis_install_path>/Vitis/2023.2/settings64.sh
make clean
mkdir -p build
vitis_hls ../../../../common/tcl/hls2rtl.tcl \
  -l build/vitis_hls_kernel3.log \
  -tclargs \
  xcu50-fsvh2104-2-e \
  3 \
  kernel3 \
  0 \
  design/kernel3.cpp \
  design/kernel3.h
```

### Step 3: Call `vivado` to Generate the Custom Logic IPI Project

As we descripted in the [RapidShell Document](../README.md), we will first create an IP Integrated project by `vivado` according to [config_au50](./json/config_au50.json). Here will conduect this step by running command below or executing `make cl`.

As described in the [RapidShell Document](../README.md), we will first create an IP-integrated (IPI) project in `vivado` according to [config_au50.json](./json/config_au50.json). This step can be conducted by running the following commands or by executing `make cl`:

```bash
mkdir -p build
cp -rf ../../../../common/hdl build
cp -rf ./json build

cd build
vivado -mode -batch -source ../../../../common/tcl2cl \
-log cl.log \
-journal cl.jou \
-tclargs \
$(pwd) \
kernel3 \
au50 \
300_400 \
run_gen
```

For `vivado`, we need to deliver four augements by `-tclargs`:
- source path
- kernel name
- card name
- <kernel frequency (MHz)>_<HBM axi frequency (MHz)>
- run_gen: only products are generated and no synthesis is performed.



### Step 4: Call RapidStream to Optimize the Design

The RapidStream flow conducts design space exploration and generates solutions (Verilog, XCI, XDC, etc.) by taking the Vitis generated solutions as the input. The RapidStream flow for Vitis requires four key inputs:

- **Device**: virtual device define by calling rapidstream APIs based on part number (e.g., `xcu50-fsvh2104-2-e`).
- **Shell Path** (.dcp): Provided by rapidshell framework to read in optimized kernel dcp.
- **HLS_solution**: A directory which includes all the HLS-generated files (Verilog, XML, RPT, etc.).
- **Verilog Files**: All the RTL source files.
- **XCI Files**: Xilinx Compiled IP files.
- **top_module_name**: Top module name for the kernel.
- **Clock**: All the clock and frequencies.

Please refer to [run_au50.py](./run_au50.py) for the complete RapidStream flow.

To support the optimization for Xilinx IP-Integration (IPI) projects, we provide a tool to convert the IPI project to all text-based source files (Verilog, XCI, XML, etc.).
The usage is show in the python sippet below.
Users need to specify the Verilog input directories, HLS solution directories, and XDC input directories.
Based on the top name (here is "cl"), the `IpiProjectConverter` can convert the Xilinx IPI project to a proper format which can be processed by rapidsteam. Please refer to [run_au50.py](./run_au50.py)

```python
IpiProjectConverter(
    verilog_input_dirs,
    hls_solution_dirs,
    xdc_input_dirs,
).ipi_to_text_prj("cl", txt_prj_name)
```

Perform the rapidstream optimization by calling command below or executing `make all`:

```bash
rapidstream ./run_u50.py
```

If everything is successful, you should at least get one post-synthesis `synth.dcp` file or one post-routed `route.dcp` file located in `build/run/dse/candidate_0`.


### Step 5 (optional): Bitstream Deployment

If your machine is iquipped with Alveo U50, you can generate the bitstream based on the post-routed `.dcp` file in step 4, and download the bitstream into the real FPGA device. Next, you need to reboot, not power off and power on, the host PC. Next, execute the bash script `host/run_test.sh`. You should see correct results as below.

```bash
0 second...
1 second...
2 second...
3 second...
device: /dev/xdma0_bypass, address: 0x0 (0x0+0x0), access write.
access width: word (32-bits)
character device /dev/xdma0_bypass opened.
Memory 0x0 mapped at address 0x7ff562ae6000.
Write 32-bits value 0x00000010 to 0x0 (0x0x7ff562ae6000)
device: /dev/xdma0_bypass, address: 0x0 (0x0+0x0), access write.
access width: word (32-bits)
character device /dev/xdma0_bypass opened.
Memory 0x0 mapped at address 0x7f41cdab6000.
Read 32-bit value at address 0x0 (0x7f41cdab6000): 0x0000000a
/dev/xdma0_c2h_0 ** Average ByteSize = 212992, 558.327759 MB/s
/dev/xdma0_c2h_0 ** Average ByteSize = 131072, 473.302002 MB/s
/dev/xdma0_c2h_0 ** Average ByteSize = 106496, 400.963867 MB/s
Info: All tests in run_tests.sh passed.
```
