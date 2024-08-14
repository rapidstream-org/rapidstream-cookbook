__copyright__ = """
Copyright (c) 2024 RapidStream Design Automation, Inc. and contributors.  All rights reserved.
The contributor(s) of this file has/have agreed to the RapidStream Contributor License Agreement.
"""

from rapidstream import DeviceFactory, RapidStreamTAPA
import os

CURR_DIR = os.path.dirname(os.path.abspath(__file__))
INI_PATH = f"{CURR_DIR}/design/link_config.ini"
VITIS_PLATFORM = "xilinx_u280_gen3x16_xdma_1_202211_1"
KERNEL_NAME = "digit_recognizer"
XO_PATH = f"{CURR_DIR}/design/{KERNEL_NAME}.xo"


# copied from impl.xdc inside the platform package
U280_LOWER2SLOTS = [
    "-add {SLICE_X206Y0:SLICE_X232Y59 SLICE_X176Y60:SLICE_X196Y239 SLICE_X117Y180:SLICE_X145Y239}",  # noqa
    "-add {DSP48E2_X25Y18:DSP48E2_X28Y89 DSP48E2_X16Y66:DSP48E2_X19Y89 DSP48E2_X30Y0:DSP48E2_X31Y17}",  # noqa
    "-add {LAGUNA_X24Y0:LAGUNA_X27Y119 LAGUNA_X16Y0:LAGUNA_X19Y119}",
    "-add {RAMB18_X11Y24:RAMB18_X11Y95 RAMB18_X8Y72:RAMB18_X9Y95 RAMB18_X12Y0:RAMB18_X13Y23}",  # noqa
    "-add {RAMB36_X11Y12:RAMB36_X11Y47 RAMB36_X8Y36:RAMB36_X9Y47 RAMB36_X12Y0:RAMB36_X13Y11}",  # noqa
    "-add {URAM288_X4Y16:URAM288_X4Y63 URAM288_X2Y48:URAM288_X2Y63}",
    "-add {CLOCKREGION_X5Y3:CLOCKREGION_X5Y3 CLOCKREGION_X0Y3:CLOCKREGION_X3Y3 CLOCKREGION_X0Y1:CLOCKREGION_X5Y2 CLOCKREGION_X0Y0:CLOCKREGION_X6Y0}",  # noqa
    "-add {SLICE_X176Y240:SLICE_X196Y479}",
    "-add {DSP48E2_X25Y90:DSP48E2_X28Y185}",
    "-add {LAGUNA_X24Y120:LAGUNA_X27Y359}",
    "-add {RAMB18_X11Y96:RAMB18_X11Y191}",
    "-add {RAMB36_X11Y48:RAMB36_X11Y95}",
    "-add {URAM288_X4Y64:URAM288_X4Y127}",
    "-add {CLOCKREGION_X0Y4:CLOCKREGION_X5Y7}",
]


factory = DeviceFactory(row=1, col=2, part_num="xcu280-fsvh2892-2L-e", board_name=None)
factory.set_user_pblock_name("pblock_dynamic_region")
factory.set_slot_pblock(
    0, 0, U280_LOWER2SLOTS + ["-remove CLOCKREGION_X4Y0:CLOCKREGION_X7Y7"]
)
factory.set_slot_pblock(
    1, 0, U280_LOWER2SLOTS + ["-remove CLOCKREGION_X0Y0:CLOCKREGION_X3Y7"]
)
factory.extract_slot_resources()
factory.reduce_slot_area(0, 0, lut=407000)
factory.reduce_slot_area(1, 0, lut=285000)
factory.set_slot_capacity(0, 0, north=11520)

# For this U280 platform, the right most DSP column on the boundary between
# dynamic/static region is not usable. So we need to adjust the DSP count
# to reflect the actual available DSPs.
print("Reducing DSP of (1, 1) to make it less congested")
factory.reduce_slot_area(1, 0, dsp=100)

rs = RapidStreamTAPA(f"{CURR_DIR}/build/{os.path.basename(__file__)}")

rs.set_virtual_device(factory.generate_virtual_device())
rs.add_xo_file(XO_PATH)
rs.set_vitis_platform(VITIS_PLATFORM)
rs.set_vitis_connectivity_config(INI_PATH)

rs.set_top_module_name(KERNEL_NAME)
rs.add_clock("ap_clk", 3.33)

rs.add_flatten_targets([KERNEL_NAME])

# Bind ports to HBM 16-31
right_slot = "SLOT_X1Y0:SLOT_X1Y0"
left_slot = "SLOT_X0Y0:SLOT_X0Y0"
# The config file binds the following argument to HBM 0 - 15
# Thus we need to constrain them to the left side of SLR 0
# sp=workload.input_bv:HBM[0]
# sp=workload.key_in:HBM[1]
# sp=workload.out_bits:HBM[2]

rs.assign_port_to_region(".*", left_slot)

# Xustomize the placement strategy:
rs.set_placement_strategy("EarlyBlockPlacement")

# Allow two parallel Vitis implementation
rs.run_dse(
    max_workers=2,
    max_dse_limit=0.85,
    min_dse_limit=0.75,
    partition_strategy="flat",
)
