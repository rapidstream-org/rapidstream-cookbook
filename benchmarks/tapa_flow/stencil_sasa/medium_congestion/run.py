__copyright__ = """
Copyright (c) 2024 RapidStream Design Automation, Inc. and contributors.  All rights reserved.
The contributor(s) of this file has/have agreed to the RapidStream Contributor License Agreement.
"""

from rapidstream import get_u280_vitis_device_factory, RapidStreamTAPA
import os

CURR_DIR = os.path.dirname(os.path.abspath(__file__))
INI_PATH = f"{CURR_DIR}/design/config/link_config.ini"
VITIS_PLATFORM = "xilinx_u280_gen3x16_xdma_1_202211_1"
XO_PATH = f"{CURR_DIR}/design/generated/unikernel.xo"
kernel_name = "unikernel"

factory = get_u280_vitis_device_factory(VITIS_PLATFORM)

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
factory.reduce_slot_area(1, 0, lut=5000 * 16, ff=6500 * 16)
factory.reduce_slot_area(0, 0, lut=5000 * 13, ff=6500 * 13)

# For this U280 platform, the right most DSP column on the boundary between
# dynamic/static region is not usable. So we need to adjust the DSP count
# to reflect the actual available DSPs.
print("Reducing DSP of (1, 1) to make it less congested")
factory.reduce_slot_area(1, 1, dsp=100)

rs = RapidStreamTAPA(f"{CURR_DIR}/build")

rs.set_virtual_device(factory.generate_virtual_device())
rs.add_xo_file(XO_PATH)
rs.set_vitis_platform(VITIS_PLATFORM)
rs.set_vitis_connectivity_config(INI_PATH)

rs.set_top_module_name(kernel_name)
rs.add_clock("ap_clk", 3.33)

rs.add_flatten_targets([kernel_name])

# Bind ports to HBM 16-31
right_slot = "SLOT_X1Y0:SLOT_X1Y0"
left_slot = "SLOT_X0Y0:SLOT_X0Y0"
# The config file binds the following argument to HBM 0 - 15
# sp=unikernel.in_0:HBM[0]
# sp=unikernel.out_0:HBM[1]
# sp=unikernel.in_1:HBM[2]
# sp=unikernel.out_1:HBM[3]
# sp=unikernel.in_2:HBM[4]
# sp=unikernel.out_2:HBM[5]
# sp=unikernel.in_3:HBM[6]
# sp=unikernel.out_3:HBM[7]
# sp=unikernel.in_4:HBM[8]
# sp=unikernel.out_4:HBM[9]
# sp=unikernel.in_5:HBM[10]
# sp=unikernel.out_5:HBM[11]
# sp=unikernel.in_6:HBM[12]
# sp=unikernel.out_6:HBM[13]
# sp=unikernel.in_7:HBM[14]
# sp=unikernel.out_7:HBM[15]

left_args = [
    "in_0",
    "out_0",
    "in_1",
    "out_1",
    "in_2",
    "out_2",
    "in_3",
    "out_3",
    "in_4",
    "out_4",
    "in_5",
    "out_5",
    "in_6",
    "out_6",
    "in_7",
    "out_7",
]


for arg in left_args:
    rs.assign_port_to_region(f"m_axi_{arg}_.*", left_slot)

# The config file binds the following argument to HBM 16 - 31
# sp=unikernel.in_8:HBM[17]
# sp=unikernel.out_8:HBM[18]
# sp=unikernel.in_9:HBM[19]
# sp=unikernel.out_9:HBM[20]
# sp=unikernel.in_10:HBM[21]
# sp=unikernel.out_10:HBM[22]
# sp=unikernel.in_11:HBM[23]
# sp=unikernel.out_11:HBM[24]

right_args = [
    "in_8",
    "out_8",
    "in_9",
    "out_9",
    "in_10",
    "out_10",
    "in_11",
    "out_11",
]

for arg in right_args:
    rs.assign_port_to_region(f"m_axi_{arg}_.*", right_slot)


# Constrain the remaining control ports.
# All ports must be constrained to a specific slot:
rs.assign_port_to_region("s_axi_control_.*", left_slot)
rs.assign_port_to_region("ap_clk", left_slot)
rs.assign_port_to_region("ap_rst_n", left_slot)
rs.assign_port_to_region("interrupt", left_slot)

# Xustomize the placement strategy:
rs.set_placement_strategy("EarlyBlockPlacement")

# Allow two parallel Vitis implementation
rs.run_dse(
    max_workers=2,
    max_dse_limit=0.85,
    min_dse_limit=0.75,
    partition_strategy="flat",
)