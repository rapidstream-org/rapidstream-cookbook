__copyright__ = """
Copyright (c) 2024 RapidStream Design Automation, Inc. and contributors.  All rights reserved.
The contributor(s) of this file has/have agreed to the RapidStream Contributor License Agreement.
"""

from rapidstream import get_u55c_vitis_device_factory
import os
from pathlib import Path

CURR_DIR = os.path.dirname(os.path.abspath(__file__))
CURR_FILE = os.path.basename(__file__)

VITIS_PLATFORM = "xilinx_u55c_gen3x16_xdma_3_202210_1"
XO_PATH = f"{CURR_DIR}/design/generated/data_decoding.xo"

factory = get_u55c_vitis_device_factory(VITIS_PLATFORM)

# Reserve resource for the HBM Memory Sub-System.
# The HMSS is not part of the user kernel so the partition optimization process
# is unaware of its existence. We need to manually reserve resources for it.
# For 512-bit HBM channels, each HBM channel uses approximately the following resources:
# AREA_PER_HBM_CHANNEL = {
#     "LUT": 5000,
#     "FF": 6500,
#     "BRAM": 0,
#     "URAM": 0,
#     "DSP": 0,
# }
factory.reduce_slot_area(0, 0, lut=150800)
factory.reduce_slot_area(0, 1, lut=146960)
factory.reduce_slot_area(0, 2, lut=146960)
factory.reduce_slot_area(1, 0, lut=128000)
factory.reduce_slot_area(1, 1, lut=107840)
factory.reduce_slot_area(1, 2, lut=115120)


# For this U280 platform, the right most DSP column on the boundary between
# dynamic/static region is not usable. So we need to adjust the DSP count
# to reflect the actual available DSPs.
print("Reducing DSP of (1, 1) to make it less congested")
factory.reduce_slot_area(1, 1, dsp=100)
factory.generate_virtual_device(Path(f"{CURR_DIR}/build/{CURR_FILE}/device.json"))
