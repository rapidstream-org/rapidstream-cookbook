__copyright__ = """
Copyright (c) 2024 RapidStream Design Automation, Inc. and contributors.  All rights reserved.
The contributor(s) of this file has/have agreed to the RapidStream Contributor License Agreement.
"""

from rapidstream import get_u280_vitis_device_factory, RapidStreamTAPA

INI_PATH = "./design/config/link_config.ini"
VITIS_PLATFORM = "xilinx_u280_gen3x16_xdma_1_202211_1"
XO_PATH = "./design/generated/Sextans.xo"


factory = get_u280_vitis_device_factory(VITIS_PLATFORM)

# Reserve resources for the HBM Memory Sub-System.
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

rs = RapidStreamTAPA("./build")

rs.set_virtual_device(factory.generate_virtual_device())
rs.add_xo_file(XO_PATH)
rs.set_vitis_platform(VITIS_PLATFORM)
rs.set_vitis_connectivity_config(INI_PATH)

rs.set_top_module_name("Sextans")
rs.add_clock("ap_clk", 3.33)

rs.add_flatten_targets(["Sextans"])

# Bind ports to HBM 16-31
right_slot = "SLOT_X1Y0:SLOT_X1Y0"
left_slot = "SLOT_X0Y0:SLOT_X0Y0"

# The config file binds the following argument to HBM 0 - 15
# Thus we need to constrain them to the left side of SLR 0
#     sp=Sextans.edge_list_ptr:HBM[0]
#     sp=Sextans.edge_list_ch_0:HBM[1]
#     sp=Sextans.edge_list_ch_1:HBM[2]
#     sp=Sextans.edge_list_ch_2:HBM[3]
#     sp=Sextans.edge_list_ch_3:HBM[4]
#     sp=Sextans.edge_list_ch_4:HBM[5]
#     sp=Sextans.edge_list_ch_5:HBM[6]
#     sp=Sextans.edge_list_ch_6:HBM[7]
#     sp=Sextans.edge_list_ch_7:HBM[8]
#     sp=Sextans.mat_B_ch_0:HBM[9]
#     sp=Sextans.mat_B_ch_1:HBM[10]
#     sp=Sextans.mat_B_ch_2:HBM[11]
#     sp=Sextans.mat_B_ch_3:HBM[12]

left_args = [
    "edge_list_ptr",
    "edge_list_ch_0",
    "edge_list_ch_1",
    "edge_list_ch_2",
    "edge_list_ch_3",
    "edge_list_ch_4",
    "edge_list_ch_5",
    "edge_list_ch_6",
    "edge_list_ch_7",
    "mat_B_ch_0",
    "mat_B_ch_1",
    "mat_B_ch_2",
    "mat_B_ch_3",
]
for arg in left_args:
    rs.assign_port_to_region(f"m_axi_{arg}_.*", left_slot)

# The config file binds the following argument to HBM 16 - 31
# Thus we need to constrain them to the right side of SLR 0
#      sp=Sextans.mat_C_ch_0:HBM[16]
#      sp=Sextans.mat_C_ch_1:HBM[17]
#      sp=Sextans.mat_C_ch_2:HBM[18]
#      sp=Sextans.mat_C_ch_3:HBM[19]
#      sp=Sextans.mat_C_ch_4:HBM[20]
#      sp=Sextans.mat_C_ch_5:HBM[21]
#      sp=Sextans.mat_C_ch_6:HBM[22]
#      sp=Sextans.mat_C_ch_7:HBM[23]
#      sp=Sextans.mat_C_ch_in_0:HBM[24]
#      sp=Sextans.mat_C_ch_in_1:HBM[25]
#      sp=Sextans.mat_C_ch_in_2:HBM[26]
#      sp=Sextans.mat_C_ch_in_3:HBM[27]
#      sp=Sextans.mat_C_ch_in_4:HBM[28]
#      sp=Sextans.mat_C_ch_in_5:HBM[29]
#      sp=Sextans.mat_C_ch_in_6:HBM[30]
#      sp=Sextans.mat_C_ch_in_7:HBM[31]

right_args = [
    "mat_C_ch_0",
    "mat_C_ch_1",
    "mat_C_ch_2",
    "mat_C_ch_3",
    "mat_C_ch_4",
    "mat_C_ch_5",
    "mat_C_ch_6",
    "mat_C_ch_7",
    "mat_C_ch_in_0",
    "mat_C_ch_in_1",
    "mat_C_ch_in_2",
    "mat_C_ch_in_3",
    "mat_C_ch_in_4",
    "mat_C_ch_in_5",
    "mat_C_ch_in_6",
    "mat_C_ch_in_7",
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
