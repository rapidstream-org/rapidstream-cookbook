__copyright__ = """
Copyright (c) 2024 RapidStream Design Automation, Inc. and contributors.  All rights reserved.
The contributor(s) of this file has/have agreed to the RapidStream Contributor License Agreement.
"""

import os
from pathlib import Path

from rapidstream import DeviceFactory

CURR_DIR = os.path.dirname(os.path.abspath(__file__))
CURR_FILE = os.path.basename(__file__)

VITIS_PLATFORM = "xilinx_vck5000_gen4x8_qdma_2_202220_1"
VCK5000_PART_NAME = "xcvc1902-vsvd1760-2MP-e-S"


factory = DeviceFactory(row=2, col=2, part_num=VCK5000_PART_NAME, board_name=None)

for x in range(2):
    for y in range(2):
        pblock = f"-add CLOCKREGION_X{x*4}Y{y*4}:CLOCKREGION_X{x*4+3}Y{y*4+3}"
        factory.set_slot_pblock(x, y, [pblock])


# set SLR crossing capacity
for x in range(2):
    factory.set_slot_capacity(x, 0, north=11520)
    factory.set_slot_capacity(x, 1, north=11520)

    factory.set_slot_capacity(x, 1, south=11520)
    # factory.set_slot_capacity(x, 2, south=11520)

# Set W/E capacity
for y in range(2):
    factory.set_slot_capacity(0, y, east=40320)
    factory.set_slot_capacity(1, y, west=40320)
# factory.set_slot_capacity(0, 2, east=41178)
# factory.set_slot_capacity(1, 2, west=41178)


factory.set_platform_name(VITIS_PLATFORM)
factory.set_user_pblock_name("pblock_dynamic_region")

factory.set_slot_pblock(0, 0, ["-add CLOCKREGION_X0Y1:CLOCKREGION_X4Y2"])
factory.set_slot_pblock(1, 0, ["-add CLOCKREGION_X5Y1:CLOCKREGION_X9Y2"])


factory.set_slot_pblock(
    0,
    1,
    [
        "-add SLICE_X0Y188:SLICE_X187Y327",
        "-add DSP58_CPLX_X0Y94:DSP58_CPLX_X2Y163",
        "-add DSP_X0Y94:DSP_X5Y163",
        "-add IRI_QUAD_X0Y780:IRI_QUAD_X116Y1339",
        "-add NOC_NMU512_X0Y4:NOC_NMU512_X1Y6",
        "-add NOC_NSU512_X0Y4:NOC_NSU512_X1Y6",
        "-add RAMB18_X0Y96:RAMB18_X5Y165",
        "-add RAMB36_X0Y48:RAMB36_X5Y82",
        "-add URAM288_X0Y48:URAM288_X2Y82",
        "-add URAM_CAS_DLY_X0Y2:URAM_CAS_DLY_X2Y2",
    ],
)


factory.set_slot_pblock(
    1,
    1,
    [
        "SLICE_X188Y188:SLICE_X359Y327",
        "DSP58_CPLX_X3Y94:DSP58_CPLX_X5Y163",
        "DSP_X6Y94:DSP_X11Y163",
        "IRI_QUAD_X117Y780:IRI_QUAD_X224Y1339",
        "NOC_NMU512_X2Y4:NOC_NMU512_X3Y6",
        "NOC_NSU512_X2Y4:NOC_NSU512_X3Y6",
        "RAMB18_X6Y96:RAMB18_X11Y165",
        "RAMB36_X6Y48:RAMB36_X11Y82",
        "URAM288_X3Y48:URAM288_X5Y82",
        "URAM_CAS_DLY_X3Y2:URAM_CAS_DLY_X5Y2",
    ],
)


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
