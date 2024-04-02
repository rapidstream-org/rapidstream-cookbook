"""Getting Started: Device Factory for Vitis Platforms

This this demo, we present the method to specify the Vitis platform used in
a RapidStream project and let the framework automatically extract the device
resources from the platform.
"""

__copyright__ = """
Copyright (c) 2024 RapidStream Design Automation, Inc. and contributors.  All rights reserved.
The contributor(s) of this file has/have agreed to the RapidStream Contributor License Agreement.
"""

from rapidstream import get_u250_vitis_device_factory

# Use the predefined factory for the Xilinx U250 Vitis platform, with the
# platform name "xilinx_u250_gen3x16_xdma_4_1_202210_1" specified:
factory = get_u250_vitis_device_factory("xilinx_u250_gen3x16_xdma_4_1_202210_1")

# The device can be supplied as the virtual device for the RapidStream APIs:
device = factory.generate_virtual_device()
# rs.set_virtual_device(device)
