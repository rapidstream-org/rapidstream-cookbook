<!--
Copyright (c) 2024 RapidStream Design Automation, Inc. and contributors.  All rights reserved.
The contributor(s) of this file has/have agreed to the RapidStream Contributor License Agreement.
-->

<img src="https://imagedelivery.net/AU8IzMTGgpVmEBfwPILIgw/1b565657-df33-41f9-f29e-0d539743e700/128" width="64px" alt="RapidStream Logo" />

# Mixed Sources Design


This recipe showcases RapidStream's ability to optimize a complex design that combines various source types, such as Verilog RTL, solutions generated using High-Level Synthesis (HLS), and intellectual property (IP) blocks.

`RapidStreamCore` in this recipe is a set of low-level API that provides the flexibility.

## RapidStream Virtual Devices

To automatically optimize layout hints, resource information is required. We have pre-defined options for common devices:
[U50](https://www.xilinx.com/products/boards-and-kits/alveo/u50.html),
[U55c](https://www.xilinx.com/products/boards-and-kits/alveo/u55c.html),
[U250](https://www.xilinx.com/products/boards-and-kits/alveo/u250.html),
[U280](https://www.xilinx.com/products/boards-and-kits/alveo/u280.html),
[VHK158](https://www.xilinx.com/products/boards-and-kits/vhk158.html),
and
[VCK190](https://www.xilinx.com/products/boards-and-kits/vck190.html). However, you can also utilize the `DeviceFactory` to support custom parts and boards.

This example utilizes the predefined U50 virtual device, which divides the FPGA part into four equal slots, each occupying half of a Super Logic Region (SLR):

<img src="https://imagedelivery.net/AU8IzMTGgpVmEBfwPILIgw/ab9bf32c-bb87-4be3-4b4d-8733fe033900/512" width="256px" alt="U50 Partitioning Scheme"/>

## RapidStream for RTL

RapidStream supports Verilog files, including handcrafted or tool-generated ones. The modules in the Verilog file can be basic building blocks, such as [`VecAdd_fsm.v`](./design/rtl/VecAdd_fsm.v), or systems with submodules, such as [`VecAdd.v`](./design/rtl/VecAdd.v).

To specify the interface information in the RTL files, use pragmas as shown in the image below:

<img src="https://imagedelivery.net/AU8IzMTGgpVmEBfwPILIgw/720cee09-e4e5-4ebe-2fcf-689f5ca82e00/1024" width="512px" alt="RTL Pragma Formats"/>

In this example, there are:
* Two handshake interfaces (`RS_HS`):
  * `inbound` interface
  * `outbound` interface
* One default clock interface (`RS_CLK`) named `clk`

For the most up-to-date pragma syntax, refer to the [RapidStream documentation](https://docs.rapidstream-da.com/rtl-interface-pragmas/) or the [`VecAdd.v`](./design/rtl/VecAdd.v) file.

## RapidStream for HLS

RapidStream can integrate modules or systems generated by High-Level Synthesis (HLS) into the project. The interface information is automatically inferred from the HLS reports, such as [Add_csynth.xml](./design/report/Add_csynth.xml), eliminating the need for manual pragma additions to the RTL files.

For instance, `fifo_A_*` interfaces with HLS `ap_fifo` protocols will be inferred as handshake interfaces. RapidStream uses `.xml` files instead of `.rpt` files for this purpose. The `.rpt` screenshot here is for a readable demonstration purpose:

<img src="https://imagedelivery.net/AU8IzMTGgpVmEBfwPILIgw/82ee36f4-1c5d-4ec3-4116-3f91a6a36400/1024" width="512px" alt="HLS Report"/>

## RapidStream for IPs


IP configuration files in the XCI format can be included, as demonstrated in this recipe. For instance, [`Add_fadd_32ns_32ns_32_7_full_dsp_1_ip.xci`](./design/ip/Add_fadd_32ns_32ns_32_7_full_dsp_1_ip.xci) can be added. The interfaces defined in the XCI files will be analyzed, and the files will be utilized to determine resource usage and perform evaluations.

## Design Constraints

When creating manual designs, you must explicitly define the placement of ports on the device by applying constraints. For instance, if you want to assign ports to a specific region, such as HBM 16-31, you need to utilize the appropriate API to allocate the ports to their designated slots.


## RapidStream Flow

Call the RapidStream API to create a design space exploration (DSE) flow by running commands in the terminal.

```bash
source <Vitis_install_path>/Vitis/2023.2/settings64.sh
rapidstream ./run.py
```

## Outputs

The RapidStream flow performs design space exploration and creates optimized design checkpoint (`.dcp`) files. To find these files, run the following command in your terminal:

```bash
find ./build/dse -name *.dcp
```

To review the timing results for each generated design point, use this command:

```bash
find ./build/dse -name timing_summary.rpt
```

These commands will help you locate and analyze the relevant files within the `./build/dse` directory.

## Next Step

  **Click here to [go back to Getting Started](../README.md)**