<!--
Copyright (c) 2024 RapidStream Design Automation, Inc. and contributors.  All rights reserved.
The contributor(s) of this file has/have agreed to the RapidStream Contributor License Agreement.
-->

<img src="https://imagedelivery.net/AU8IzMTGgpVmEBfwPILIgw/1b565657-df33-41f9-f29e-0d539743e700/128" width="64px" alt="RapidStream Logo" />

# CNN13x2 Vivado Design Flow

Although AMD Vitis is widely used for its support of high-level languages, Vivado remains the industry standard for FPGA development. In this tutorial, we will demonstrate how RapidStream optimizes the target logic and integrates it back into the standard Vivado workflow to improve timing.


## 1. Rapidstream Project Format

At this moment, Rapidstream mainly accepts text-based input sources as shown below.

<img src="../../../getting_started/img/rapidstream_input.png" width="1024px" alt="RapidStream Logo" />


Design modules can be represented by `.v`, `.tcl`, or `.xci` (Xilinx Compiled IP) files. Interface information can be described within the Verilog code as outlined in [getting_started/mixed_sources](../../../getting_started/mixed_sources). Alternatively, if your modules are compiled using `vitis_hls`, you can provide `.rpt` or `.xml` files.

We present a sample Vivado project to illustrate the organization of source code within the [design](design) directory. The source file hierarchy is detailed below:

- Handcrafted Verilog files are located in the [design/hdl](design/hdl) directory.
- Vitis HLS-generated solutions, including Verilog files and HLS report files, are stored in the [design/hls](design/hls) directory.
- Xilinx IPs can be represented using .xci files in the [design/xci/ip](design/xci/ip/).
- Constraint files are found in the [design/xdc](design/xdc) directory.
- [impl_prj.tcl](./design/impl_prj.tcl) controls the vivado compilation flow.

```bash
.
├── design
    ├── hdl
    │   ├── bd_0004.v
    │   ├── ......
    │   └── gnd_driver.v
    ├── hls
    │   └── solution
    │       └── syn
    │           ├── report
    │           │   ├── A_IO_L2_in_10_csynth.rpt
    │           │   ├── A_IO_L2_in_10_csynth.xml
    │           │   ├── ......
    │           │   ├── PE_wrapper_9_1_csynth.rpt
    │           │   └── PE_wrapper_9_1_csynth.xml
    │           └── verilog
    │               ├── kernel3_A_IO_L2_in_10.v
    │               ├── ......
    │               └── kernel3.v
    ├── xci
    │   └── ip
    │       ├── bd_0004_m00e_0
    │       │   └── bd_0004_m00e_0.xci
    │       ├── ......
    │       └── kernel3_fmul_32ns_32ns_32_5_max_dsp_1_ip
    │           └── kernel3_fmul_32ns_32ns_32_5_max_dsp_1_ip.xci
    ├── xdc
    │   └── only_pins_au50.xdc
    └── impl_prj.tcl
```

## Tutorial


### Step 1 (optional): Generate Bitstreams from Vivado Source Files

The sample design provides identical Vivado source code for RTL developers. The TCL script ([design/impl_prj.tcl](design/impl_prj.tcl)) manages the Vivado compilation flow.

To execute, run the following command or use `make clean && make vivado_hw`:

```bash
source <Vitis_install_path>/Vitis/2022.2/settings64.sh
cd build
vivado -mode batch -source ../design/impl_prj.tcl \
-tclargs xcu50-fsvh2104-2-e \
xilinx.com:au50dd:part0:1.0 \
../design
```

:warning: **Note**: This step may take several hours to complete and provides the baseline for this project. Alternatively, you can review the compilation metadata to obtain the frequency and area report without running the entire process [here](./archive/metadata_vivado).


### Step 2: Call RapidStream to Optimize the Design

The RapidStream flow conducts design space exploration and generates solutions (Verilog, XCI, XDC, etc.) by taking all the text-based source files as the input.
The RapidStream flow for Vivado requires the following key inputs:

- **Device**: virtual device define by calling rapidstream APIs based on part number (e.g., `xcvu9p-flga2104-2L-e`).
- **HLS_solution**: A directory which includes all the HLS-generated files (Verilog, XML, RPT, etc.).
- **Verilog Files**: All the RTL source files.
- **XCI Files**: Xilinx Compiled IP files.
- **top_module_name**: Top module name for the kernel.
- **Clock**: All the clock and frequencies.

The basic usage of rapidstream is shown below.

```python
rs = RapidStreamHLS(
    work_dir=Path(f"{temp_dir}/run"),
    hls_flatten_threshold=5,
)

rs.set_virtual_device(get_u50_default_device())
rs.add_hls_solution(Path(f"{src_dir}/hls/solution"))
rs.add_vlog_files([Path(f) for f in glob(f"{src_dir}/hdl/*.v")])
rs.add_xci_files([Path(f) for f in glob(f"{src_dir}/xci/**/*.xci", recursive=True)])
rs.add_iface_only_xci_files(
    [Path(f) for f in glob(f"{src_dir}/iface_only_xci/**/*.xci", recursive=True)]
)
```


Next, we need to set the top module name. Xilinx-designed IPs are renowned for their
reliability and high frequencies. Typically, the critical path lies within user-defined logic
or kernels. We can set the optimization target by calling the `add_flatten_targets` API.
The Python code snippet is shown below:

```python
rs.set_top_module_name(top)
rs.add_flatten_targets([kernel_name])
```

We need to set the IO pads to the right slots. The python code is shown below.

```python
rs.assign_port_to_region("HBM_CATTRIP", "SLOT_X1Y1:SLOT_X1Y1")
rs.assign_port_to_region("hbm_clk_clk_n", "SLOT_X1Y0:SLOT_X1Y0")
rs.assign_port_to_region("hbm_clk_clk_p", "SLOT_X1Y0:SLOT_X1Y0")
rs.assign_port_to_region("pci_express_x1_rxn", "SLOT_X1Y0:SLOT_X1Y0")
rs.assign_port_to_region("pci_express_x1_rxp", "SLOT_X1Y0:SLOT_X1Y0")
rs.assign_port_to_region("pci_express_x1_txn", "SLOT_X1Y0:SLOT_X1Y0")
rs.assign_port_to_region("pci_express_x1_txp", "SLOT_X1Y0:SLOT_X1Y0")
rs.assign_port_to_region("pcie_perstn", "SLOT_X1Y0:SLOT_X1Y0")
rs.assign_port_to_region("pcie_refclk_clk_n", "SLOT_X1Y0:SLOT_X1Y0")
rs.assign_port_to_region("pcie_refclk_clk_p", "SLOT_X1Y0:SLOT_X1Y0")
```

Some cells have specific layout locations. For example, `XDMA` can only be mapped to the PCIe instances in `SLOT_X1Y0`. The python code is shown below.

```python
rs.assign_cell_to_region(".*kernel_clk.*", "SLOT_X1Y0:SLOT_X1Y0")
rs.assign_cell_to_region(".*hbm_axi_clk.*", "SLOT_X1Y0:SLOT_X1Y0")
rs.assign_cell_to_region(".*smartconnect.*", "SLOT_X1Y0:SLOT_X1Y0")
rs.assign_cell_to_region(".*xdma.*", "SLOT_X1Y0:SLOT_X1Y0")
```

For the complete RapidStream flow, please refer to [run_au50.py](./run_au50.py).
Perform the RapidStream optimization by running the following command or executing make rs_opt. For your convenience,
we have also backed up the RapidStream optimized source code in [archive/candidate_4](archive/candidate_4).

```bash
rapidstream ./run_au50.py
```

If everything is successful, you should obtain at least one post-synthesis synth.dcp file along with all the source files for the design, located in `build/run/dse/candidate_0`.

### Step 3: Generate Bitstreams from Rapidstream Optimized Source Files

Based on the source files generated by rapistream located at `build/run/dse/candidate_0`, we can call `Vivado` to compile the source files to bitstream.
The TCL code snippet shows how we import the all the source files into Vivado project.

```tcl
import_files run/dse/candidate_0/exported/design
import_ip [glob run/dse/candidate_0/exported/design/*/*.xci]
upgrade_ip -quiet [get_ips *]
generate_target synthesis [ get_files *.xci ]
add_files -fileset constrs_1 -norecurse run/dse/candidate_0/exported/xdc/floorplan.xdc
```
You can run commands below or execute `make all` to get the final bitstream.

```bash
cd build \
vivado -mode batch -source ../tcl/impl.tcl \
-tclargs xcu50-fsvh2104-2-e \
xilinx.com:au50dd:part0:1.0 \
run/dse/candidate_0/exported/design
```

If everything goes successfully, you should find the generated bitstream (prj/prj.runs/impl_1/design_1_wrapper.bit)


### Step 4 (optional): Download Bitstream

If your machine is also equipped with [Alveo U50 Card](https://www.xilinx.com/products/boards-and-kits/alveo/u50.html), you can download the default bitstream generated in Step 3 by running `make download_bit`.

If you want to download the bitstream generated in Step 1 by Vivado source code, you can point to the right bitstream by execute the command below.

```bash
make downlaod_bit BIT=$(pwd)/build/prj_vivado/prj_vivado.runs/impl_1/design_1_wrapper.bit
```

### Step 5 (optional): Run Application

If you successfully downloaded the bitstream into Alveo U50, now you can run the application on the CPU side by calling the scripts we provide in [host_driver](host_driver) directory. For this tutorial, you can just execute the command below.

```bash
make run
```

You should see the results as below.

```
Kernel is still running...
0x0000000a

Kernel is completed!

/dev/xdma0_c2h_0 ** Average ByteSize = 212992, 464.062164 MB/s
/dev/xdma0_c2h_0 ** Average ByteSize = 131072, 484.155396 MB/s
/dev/xdma0_c2h_0 ** Average ByteSize = 106496, 485.115723 MB/s
Info: All tests in run_tests.sh passed.
make[1]: Leaving directory '/home/ylxiao/workspace/rapidstream-cookbook/benchmarks/vivado_flow/cnn13x2/host_driver'
```
