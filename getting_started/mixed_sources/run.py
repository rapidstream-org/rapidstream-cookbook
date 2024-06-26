"""Getting Started: Mixed Language Vector Addition

`RapidStreamHLS` is a set of low-level API that provides the flexibility.
In this demo, we use this API to show how RapidStream Pro works.
"""

__copyright__ = """
Copyright (c) 2024 RapidStream Design Automation, Inc. and contributors.  All rights reserved.
The contributor(s) of this file has/have agreed to the RapidStream Contributor License Agreement.
"""

from rapidstream import RapidStreamHLS, get_u50_default_device
import os

CURR_DIR = os.path.dirname(os.path.abspath(__file__))

# We create a RapidStream Pro project called "build":
rs = RapidStreamHLS(f"{CURR_DIR}/build")

# To optimize the design layout, the resource information is needed.
#   * We pre-defined the most common options: U50, U250, U280, VCK190, etc.
#   * DeviceFactory can be used to support custom parts and boards.
# Use the predefined U50 virtual device:
rs.set_virtual_device(get_u50_default_device())

# Add the RTL design files:
#   * Interface information should be specified in the RTL files with pragmas.
rs.add_vlog_dir(f"{CURR_DIR}/design/rtl")

# Add the HLS design files:
#  * The HLS-generated Verilog files can be imported directly.
#  * The HLS report directory is needed to extract the interface information.
rs.add_hls_solution(f"{CURR_DIR}/build/kernel_add/solution")
rs.add_hls_solution(f"{CURR_DIR}/build/read_mem/solution")
rs.add_hls_solution(f"{CURR_DIR}/build/write_mem/solution")


# Add the IP files:
#  * The IPs should be packaged as XCI files.
#  * Interface information will be inferred from the XCI files.
rs.add_xci_dir(f"{CURR_DIR}/design/xci/ip/design_1_proc_sys_reset_0_0")

# Set the top module name and the target clock period:
rs.set_top_module_name("VecAddMix")
rs.add_clock("ap_clk", period_ns=2)

# Add design constraints:
#  * Using `assign_port_to_region` to place ports to the specified region.
#  * For example, here, we place all ports to HBM 16-31, lower right corner.
rs.assign_port_to_region(".*", "SLOT_X1Y0:SLOT_X1Y0")
rs.assign_cell_to_region(".*kernel_add.*", "SLOT_X0Y1:SLOT_X0Y1")
rs.assign_cell_to_region(".*fifo_read2kernel0.*", "SLOT_X0Y1:SLOT_X0Y1")
rs.assign_cell_to_region(".*fifo_read2kernel1.*", "SLOT_X0Y0:SLOT_X0Y0")
rs.assign_cell_to_region(".*fifo_kernel2write.*", "SLOT_X1Y1:SLOT_X1Y1")


# After the configurations, just start RapidStream:
rs.run_dse()
