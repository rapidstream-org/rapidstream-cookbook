"""Getting Started: Mixed Language Vector Addition

`RapidStreamCore` is a set of low-level API that provides the flexibility.
In this demo, we use this API to show how RapidStream Pro works.
"""

__copyright__ = """
Copyright (c) 2024 RapidStream Design Automation, Inc. and contributors.  All rights reserved.
The contributor(s) of this file has/have agreed to the RapidStream Contributor License Agreement.
"""

from rapidstream import RapidStreamCore, get_u50_default_device

# We create a RapidStream Pro project called "build":
rs = RapidStreamCore("build")

# To optimize the design layout, the resource information is needed.
#   * We pre-defined the most common options: U50, U250, U280, VCK190, etc.
#   * DeviceFactory can be used to support custom parts and boards.
# Use the predefined U50 virtual device:
rs.set_virtual_device(get_u50_default_device())

# Add the RTL design files:
#   * Interface information should be specified in the RTL files with pragmas.
rs.add_vlog_dir("./design/rtl")

# Add the HLS design files:
#  * The HLS-generated Verilog files can be imported directly.
#  * The HLS report directory is needed to extract the performance information.
rs.add_vlog_dir("./design/hls")
rs.add_hls_report_dir("./design/report")

# Add the IP files:
#  * The IPs should be packaged as XCI files.
#  * Interface information will be inferred from the XCI files.
rs.add_xci_dir("./design/ip")

# Set the top module name and the target clock period:
rs.set_top_module_name("VecAdd")
rs.add_clock("system_clock", period_ns=2)

# Add design constraints:
#  * Using `assign_port_to_region` to place ports to the specified region.
#  * For example, here, we place all ports to HBM 16-31, lower right corner.
rs.assign_port_to_region(".*", "SLOT_X1Y0:SLOT_X1Y0")

# After the configurations, just start RapidStream:
rs.run_dse()
