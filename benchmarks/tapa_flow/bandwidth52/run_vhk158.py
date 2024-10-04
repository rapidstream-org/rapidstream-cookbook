__copyright__ = """
Copyright (c) 2024 RapidStream Design Automation, Inc. and contributors.  All rights reserved.
The contributor(s) of this file has/have agreed to the RapidStream Contributor License Agreement.
"""

import os
from pathlib import Path

from rapidstream import DeviceFactory

CURR_DIR = os.path.dirname(os.path.abspath(__file__))
CURR_FILE = os.path.basename(__file__)

VITIS_PLATFORM = "base_pfm_vhk1581"
VCK5000_PART_NAME = "xcvh1582-vsva3697-2MP-e-S"


factory = DeviceFactory(row=4, col=2, part_num=VCK5000_PART_NAME, board_name=None)

factory.set_slot_pblock(0, 0, ["-add CLOCKREGION_X0Y1:CLOCKREGION_X4Y2"])
factory.set_slot_pblock(1, 0, ["-add CLOCKREGION_X5Y1:CLOCKREGION_X9Y2"])
factory.set_slot_pblock(0, 1, ["-add CLOCKREGION_X0Y3:CLOCKREGION_X4Y4"])
factory.set_slot_pblock(1, 1, ["-add CLOCKREGION_X5Y3:CLOCKREGION_X9Y4"])
factory.set_slot_pblock(0, 2, ["-add CLOCKREGION_X0Y5:CLOCKREGION_X4Y6"])
factory.set_slot_pblock(1, 2, ["-add CLOCKREGION_X5Y5:CLOCKREGION_X9Y6"])
factory.set_slot_pblock(0, 3, ["-add CLOCKREGION_X0Y7:CLOCKREGION_X4Y7"])
factory.set_slot_pblock(1, 3, ["-add CLOCKREGION_X5Y7:CLOCKREGION_X9Y7"])


# set SLR crossing capacity
for x in range(2):
    factory.set_slot_capacity(x, 1, north=11520)

# Set W/E capacity
for y in range(4):
    factory.set_slot_capacity(0, y, east=40320)
    factory.set_slot_capacity(1, y, west=40320)

factory.set_platform_name(VITIS_PLATFORM)
factory.set_user_pblock_name("pblock_dynamic_region")


# Vitis uses 4395 nets from SLR0 to SLR1
# factory.set_slot_capacity(1, 0, north=11520 - 4395)
# factory.set_slot_capacity(1, 1, north=11520 - 4395)

# Vitis uses 4185 nets from SLR1 to SLR2
# factory.set_slot_capacity(1, 1, south=11520 - 4185)

# set hbm tags
factory.set_slot_tags(
    0,
    0,
    [f"NMU512_X{x}Y{y}" for x in range(0, 2) for y in range(0, 4)]
    + ["S_AXI_CONTROL", "CLK_RST"],
)
factory.set_slot_tags(
    1, 0, [f"NMU512_X{x}Y{y}" for x in range(2, 4) for y in range(0, 4)]
)
factory.set_slot_tags(
    0, 1, [f"NMU512_X{x}Y{y}" for x in range(0, 2) for y in range(4, 7)]
)
factory.set_slot_tags(
    1, 1, [f"NMU512_X{x}Y{y}" for x in range(2, 4) for y in range(4, 7)]
)
factory.set_slot_tags(
    0, 2, [f"NMU512_X{x}Y{y}" for x in range(0, 2) for y in range(7, 11)]
)
factory.set_slot_tags(
    1, 2, [f"NMU512_X{x}Y{y}" for x in range(2, 4) for y in range(7, 11)]
)
factory.set_slot_tags(
    0, 3, [f"NMU512_X{x}Y{y}" for x in range(0, 2) for y in range(11, 13)]
)
factory.set_slot_tags(
    1, 3, [f"NMU512_X{x}Y{y}" for x in range(2, 4) for y in range(11, 13)]
)


factory.extract_slot_resources()


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
# factory.reduce_slot_area(0, 0, lut=150800)
# factory.reduce_slot_area(0, 1, lut=146960)
# factory.reduce_slot_area(1, 0, lut=128000)
# factory.reduce_slot_area(1, 1, lut=107840)


# For this U280 platform, the right most DSP column on the boundary between
# dynamic/static region is not usable. So we need to adjust the DSP count
# to reflect the actual available DSPs.
print("Reducing DSP of (1, 1) to make it less congested")
factory.reduce_slot_area(1, 1, dsp=100)
factory.generate_virtual_device(Path(f"{CURR_DIR}/build/{CURR_FILE}/device.json"))
