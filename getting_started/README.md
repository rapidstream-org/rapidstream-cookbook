<!--
Copyright (c) 2024 RapidStream Design Automation, Inc. and contributors.  All rights reserved.
The contributor(s) of this file has/have agreed to the RapidStream Contributor License Agreement.
-->

<img src="https://imagedelivery.net/AU8IzMTGgpVmEBfwPILIgw/1b565657-df33-41f9-f29e-0d539743e700/128" width="64px" alt="RapidStream Logo" />

Getting Started
===============

## [AMD Vitis Design](./vitis_source)

* RapidStream can be used as a plugin for the `v++` command in AMD Vitis.
* This recipe demonstrates how to:
    1. Create a RapidStream project.
    2. Specify the Vitis platform.
    3. Add Xilinx Object files (`.xo`).
    4. Generate an optimized `.xo` file for `v++`.

## [Mixed Sources Design](./mixed_sources)

* RapidStream supports various input formats.
* This recipe shows how to:
    1. Add Verilog source files (`.v`).
    2. Specify interface information in Verilog pragmas.
    3. Parse HLS report files for interface details.
    4. Infer interface information from XCI files.
    5. Manually specify the top-level module name and other constraints.

## [Custom Vitis Platforms](./device_factory_vitis_platform)

* RapidStream can infer resource information from a Vitis platform.
* This recipe demonstrates how RapidStream:
    1. Uses Vivado to obtain resource data.
    2. Adjusts availability based on the occupancy of the Vitis shell.

## [Custom Vivado Parts](./device_factory_part_num)

* Defining a Vivado device part for RapidStream is straightforward.
* This recipe shows how to:
    1. Specify pblock information.
    2. Let RapidStream infer resource information from the part number.
