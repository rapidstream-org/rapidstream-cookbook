<!--
Copyright (c) 2024 RapidStream Design Automation, Inc. and contributors.  All rights reserved.
The contributor(s) of this file has/have agreed to the RapidStream Contributor License Agreement.
-->

<img src="https://imagedelivery.net/AU8IzMTGgpVmEBfwPILIgw/1b565657-df33-41f9-f29e-0d539743e700/128" width="64px" alt="RapidStream Logo" />

RapidStream Cookbook
====================

RapidStream Cookbook offers a curated set of Python script templates and in-depth tutorials designed to guide you in optimizing your FPGA designs efficiently using RapidStream's Python-driven development flows.


Composing Large-Scale FPGA-Based Systems
----------------------------------------

[RapidStream](https://rapidstream-da.com/) is a streamlined development flow for modern FPGAs, designed to help users quickly create high-performance systems. By working alongside FPGA vendor tools, RapidStream allows for the easy integration of small building blocks into complex, high-frequency designs. Users can take advantage of RapidStream's Python-based scripting language to efficiently implement high-performance FPGA accelerators using software-defined flows.


Where to Start
--------------

If you're new to RapidStream and want to learn the basics or get a quick overview of how it works, you may read [rapidstream documents](https://docs.rapidstream-da.com/) and check out the recipes in the [Getting Started](./getting_started) section. Once you're familiar with the fundamentals, explore real-world applications of RapidStream on various benchmarks in the [Benchmarks](./benchmarks) section.

To get a local copy of the RapidStream Cookbook repository, clone it to your system by running the following command:

```bash
git clone https://github.com/rapidstream-org/rapidstream-cookbook.git
cd rapidstream-cookbook
```

You must have RapidStream installed, a valid RapidStream license, and a valid Vivado Design Suite license to download or run the cookbooks. If you are an academic researcher or would like to contribute to this cookbook, please contact us at https://rapidstream-da.com/ for a free RapidStream license.

We recommend using Vivado version 2023.2 or later. Source the Vivado settings script before running the RapidStream Python scripts. For example, to source the Vivado settings script, run the following command:


```bash
source <Vivado_installation_path>/Vivado/2023.2/settings64.sh
```

All RapidStream Python script recipes (`*.py`) in this cookbook should be executed using the `rapidstream` command. For example, to run `getting_started/mixed_sources/run.py`, use the following command:

```bash
rapidstream getting_started/mixed_sources/run.py
```

The default branch always matches the latest RapidStream release. Please update your software before using the recipes.


Recipes
-------

<table border="0" width="100%">
    <tbody>
        <tr><td colspan="3"  align="center"><h2><a href="./getting_started">Getting Started</a></h2></td></tr>
        <tr><td colspan="3">
            Begin your journey with RapidStream by integrating the flow into your FPGA vendor tool. No prior experience required – start from here!
        </td></tr>
        <tr><td colspan="3"><strong>Basic Usages</strong></td></tr>
        <tr>
            <td><a href="./getting_started/vitis_source">AMD Vitis Design</a></td>
            <td><a href="./getting_started/mixed_sources">Mixed Sources Design</a></td>
        </tr>
        <tr><td colspan="3"><strong>Custom Devices</strong></td></tr>
        <tr>
            <td><a href="./getting_started/device_factory_vitis_platform">Custom Vitis Platforms</a></td>
            <td><a href="./getting_started/device_factory_part_num">Custom Vivado Parts</a></td>
        </tr>
    </tbody>
</table>



<table border="0" width="100%">
    <tbody>
        <tr><td colspan="5"  align="center"><h2><a href="./benchmarks/vitis_flow">Vitis Flow Benchmarks</a></h2></td></tr>
        <tr><td colspan="5">
            Discover how RapidStream flow streamlines FPGA acceleration design of state-of-the-art architectures, enabling you to achieve optimal performance for performance-critical systems.
        </td></tr>
        <tr><td colspan="5"><strong>Scientific Computation</strong></td></tr>
        <tr>
            <td ><strong>Design</strong></td>
            <td><strong>Developer</strong></td>
            <td><strong>Platforms</strong></td>
            <td><strong>Sources</strong></td>
            <td><strong>Purpose</strong></td>
        </tr>
        <tr>
            <td><a href="./benchmarks/vitis_flow/cnn13x2">CNN13x2</a></td>
            <td><a href="https://github.com/UCLA-VAST/AutoBridge">AutoBridge</a></td>
            <td align="center"> <a href="https://www.xilinx.com/products/boards-and-kits/alveo/u50.html"> U50 </a><br>
                <a href="https://www.xilinx.com/products/boards-and-kits/alveo/u55c.html"> U55c </a><br>
                <a href="https://www.xilinx.com/products/boards-and-kits/alveo/u280.html"> U280 </a><br>
                <a href="https://www.xilinx.com/products/boards-and-kits/alveo/u250.html"> U250 </a></td>
            <td>Vitis HLS</td>
            <td>An HLS accelerator for the convolutional neural network kernel.</td>
        </tr>
        <tr>
            <td><a href="./benchmarks/vitis_flow/cnn13x4_16">CNN13x{4..16}</a></td>
            <td><a href="https://github.com/UCLA-VAST/AutoBridge">AutoBridge</a></td>
            <td align="center">
            <a href="https://www.xilinx.com/products/boards-and-kits/alveo/u250.html"> U250 </a></td>
            <td>Vitis HLS</td>
            <td>An HLS accelerator for the convolutional neural network kernel.</td>
        </tr>
        <tr>
            <td><a href="./benchmarks/vitis_flow/LLM/">LLM</a></td>
            <td><a href="https://dl.acm.org/doi/10.1145/3656177">Chen <i>et al.</i><br/>(TRETS)</a></a></td>
            <td align="center"> <a href="https://www.xilinx.com/products/boards-and-kits/alveo/u50.html"> U50 </a><br>
                <a href="https://www.xilinx.com/products/boards-and-kits/alveo/u55c.html"> U55c </a><br>
                <a href="https://www.xilinx.com/products/boards-and-kits/alveo/u280.html"> U280 </a><br>
                <a href="https://www.xilinx.com/products/boards-and-kits/alveo/u250.html"> U250 </a></td>
            <td>Vitis HLS</td>
            <td>A model-specific spatial acceleration for Large Language Model (LLM) inference on FPGAs.</td>
        </tr>
    </tbody>
</table>


<table border="0" width="100%">
    <tbody>
        <tr><td colspan="5"  align="center"><h2><a href="./benchmarks/vivado_flow">Vivado Flow Benchmarks</a></h2></td></tr>
        <tr><td colspan="5">
            Discover how RapidStream flow streamlines FPGA acceleration design of state-of-the-art architectures, enabling you to achieve optimal performance for performance-critical systems.
        </td></tr>
        <tr><td colspan="5"><strong>Scientific Computation</strong></td></tr>
        <tr>
            <td ><strong>Design</strong></td>
            <td><strong>Developer</strong></td>
            <td><strong>Platforms</strong></td>
            <td><strong>Sources</strong></td>
            <td><strong>Purpose</strong></td>
        </tr>
        <tr>
            <td><a href="./benchmarks/vivado_flow/CNN">CNN</a></td>
            <td><a href="https://github.com/UCLA-VAST/AutoBridge">AutoBridge</a></td>
            <td align="center"> <a href="https://www.xilinx.com/products/boards-and-kits/alveo/u50.html"> RapidShell (U50) </a><br>
            <td>Vitis HLS</td>
            <td>An HLS accelerator for the convolutional neural network kernel.</td>
        </tr>
        <tr>
            <td><a href="./benchmarks/vitis_flow/cnn13x2">LLM</a></td>
            <td><a href="https://dl.acm.org/doi/10.1145/3656177">Chen <i>et al.</i><br/>(TRETS)</a></a></td>
            <td align="center"> <a href="https://www.xilinx.com/products/boards-and-kits/alveo/u50.html"> VCK190 </a><br>
                <a href="https://www.xilinx.com/products/boards-and-kits/alveo/u55c.html"> VHK158 </a><br>
                <a href="https://www.xilinx.com/products/boards-and-kits/alveo/u280.html"> VP1552 </a><br>
                <a href="https://www.xilinx.com/products/boards-and-kits/alveo/u250.html"> VU9P </a></td>
            <td> Vitis HLS, Manual Verilog
            </td>
            <td>A model-specific spatial acceleration for Large Language Model (LLM) inference on FPGAs.</td>
        </tr>
    </tbody>
</table>


<table border="0" width="100%">
    <tbody>
        <tr><td colspan="5"  align="center"><h2><a href="./benchmarks/tapa_flow/">TAPA Flow Benchmarks</a></h2></td></tr>
        <tr><td colspan="5">
            Discover how RapidStream flow streamlines FPGA acceleration design of state-of-the-art architectures, enabling you to achieve optimal performance for performance-critical systems.
        </td></tr>
        <tr><td colspan="5"><strong>Scientific Computation</strong></td></tr>
        <tr>
            <td ><strong>Design</strong></td>
            <td><strong>Developer</strong></td>
            <td><strong>Platforms</strong></td>
            <td><strong>Sources</strong></td>
            <td><strong>Purpose</strong></td>
        </tr>
            <td><a href="./benchmarks/sextans_sparse_matrix_multiplication">Sextans</a></td>
            <td><a href="https://dl.acm.org/doi/abs/10.1145/3490422.3502357">Song <i>et al.</i><br/>(FPGA '22)</a></td>
            <td>Vitis U250 XDMA</td>
            <td>TAPA HLS</td>
            <td>Accelerator for general-purpose sparse-matrix dense-matrix multiplication.</td>
        </tr>
        <tr>
            <td><a href="./benchmarks/autosa_cnn">Convolutional neural network</a></td>
            <td><a href="https://dl.acm.org/doi/10.1145/3431920.3439292">Wang <i>et al.</i><br/>(FPGA '21)</a></td>
            <td>Vitis U250 XDMA</td>
            <td>Vitis HLS</td>
            <td>Systolic array accelerator for a convolutional neural network layer.</td>
        </tr>
    </tbody>
</table>


How to Get Help
---------------

* For questions about the RapidStream software, contact your sales representative.
* For questions or issues about the recipes, create an [issue](https://github.com/rapidstream-org/rapidstream-cookbook/issues/new).


Contributing
------------

To get a free academic license of RapidStream for contributing to the cookbook or showcasing your FPGA design success story, simply [reach out to us](https://rapidstream-da.com/contact-us). Fork this repository, add your design or usage guide, and create a pull request. We'll gladly include your contribution and help increase your project's visibility.

### Quality Assurance

All tests and `pre-commit` checks shall pass before committing to the repository.

Before making the first commit, install `pre-commit` for Git by running the following commands:

```bash
pip install pre-commit
pre-commit install
```

You may then run `pre-commit` to check if the formatting and linting are correct:

```bash
pre-commit run
```

We use [Conventional Commits](https://www.conventionalcommits.org/en/v1.0.0/) as our commit message guideline.

### Editors

Visual Studio Code users could configure to use RapidStream as the Python interpreter, run:

```bash
which rapidstream
```

Then enter the output into the Command Palette (⇧⌘P on macOS, or Shift-Ctrl-P on other platforms): `Python: Select Interpreter > Enter interpreter path....`.

Licensing
---------

The RapidStream Cookbook is an open source project managed by RapidStream Design Automation, Inc., who is authorized by the contributors to license the software under the MIT license.

The repository includes some data files generated by the Vivado Design Suite that are copyrighted by Advanced Micro Devices (AMD), Inc. These files are provided for informational purposes only and are subject to AMD's licensing terms and conditions. The MIT open-source license of this repository does not apply to the these copyrighted files, and AMD's licensing terms and conditions solely govern the use of these copyrighted files. By accessing or using these copyrighted files in this repository, you acknowledge that you have a valid AMD Vivado license and agree to comply with all applicable licensing terms and conditions. The repository maintainers make no representations or warranties regarding these copyrighted files and shall not be held liable for any issues arising from their use. It is your responsibility to ensure compliance with AMD's licensing terms and conditions. For more information about AMD's licensing terms and conditions, please refer to the AMD website or contact AMD directly. By using this repository, you agree to indemnify and hold harmless the repository maintainers from any claims, damages, or liabilities arising from your use of the AMD copyrighted files.

Contributor License Agreement (CLA)
-----------------------------------

By contributing to this open-source repository, you agree to the RapidStream Contributor License Agreement.

Under this agreement, you grant to RapidStream Design Automation, Inc. and to recipients of software distributed by RapidStream a perpetual, worldwide, non-exclusive, no-charge, royalty-free, irrevocable copyright license to reproduce, prepare derivative works of, publicly display, publicly perform, sublicense, and distribute your contributions and such derivative works. You also grant to RapidStream Design Automation, Inc. and to recipients of software distributed by RapidStream a perpetual, worldwide, non-exclusive, no-charge, royalty-free, irrevocable patent license to make, have made, use, offer to sell, sell, import, and otherwise transfer the work,

Please note that this is a summary of the licensing terms, and the full text of the [MIT](LICENSE) and the [RapidStream Contributor License Agreement](CLA.md) should be consulted for detailed legal information.


-----

Copyright (c) 2024 RapidStream Design Automation, Inc. and contributors. All rights reserved.


Common Issues
-------------

Below list some common issues user may encounter.

### 1. Vivado Path Missing

Error Message:

```bash
...
  File "/home/vagrantxiao24/.rapidstream/opt/python3.10/lib/python3.10/subprocess.py", line 1863, in _execute_child
    raise child_exception_type(errno_num, err_msg,  err_filename)
FileNotFoundError: [Errno 2] No such file or directory:  'vivado'
make: *** [Makefile:24: rs_opt] Error 1
```


Rapidstream relies on Vivado to compile the designs. If you encounter the error above, you should source the `Vivado` setup scripts first.

Command to resolve:

```bash
source <Vitis_install_path>/Vitis/2023.2/settings64.sh
```
