"""Getting Started: Vector Addition in the Vitis flow

This script demonstrates how to optimize a simple vector addition design in
a Vitis object file. In this example, the object file is generated from the
TAPA compiler. However, by modifying "RadipStreamTAPA" to "RapidStreamVitis",
this script can be used to optimize a design in the standard Vitis flow.
"""

__copyright__ = """
Copyright (c) 2024 RapidStream Design Automation, Inc. and contributors.  All rights reserved.
The contributor(s) of this file has/have agreed to the RapidStream Contributor License Agreement.
"""

from rapidstream import get_u280_vitis_device_factory, RapidStreamTAPA

# Create a RapidStream project in the "run" directory:
rs = RapidStreamTAPA("build")

# Use the "xilinx_u280_gen3x16_xdma_1_202211_1" platform as the device:
u280_factory = get_u280_vitis_device_factory("xilinx_u280_gen3x16_xdma_1_202211_1")
rs.set_virtual_device(u280_factory.generate_virtual_device())

# Add the design object file (".xo") to the project:
rs.add_xo_file("./design/VecAdd.xo")

# Specify the Vitis platform and connectivity configuration:
rs.set_vitis_platform("xilinx_u280_gen3x16_xdma_1_202211_1")
rs.set_vitis_connectivity_config("./design/link_config.ini")

# Set the clock target for the design:
rs.add_clock("ap_clk", period_ns=3)

# Bind all ports to HBM 16-31:
rs.assign_port_to_region(".*", "SLOT_X1Y0:SLOT_X1Y0")

# Force some cells to be placed in a specific region:
rs.assign_cell_to_region("a", "SLOT_X0Y1:SLOT_X0Y1")

# Start the RapidStream optimization process:
rs.run_dse()