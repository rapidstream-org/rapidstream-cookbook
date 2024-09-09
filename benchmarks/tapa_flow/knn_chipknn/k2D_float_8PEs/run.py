__copyright__ = """
Copyright (c) 2024 RapidStream Design Automation, Inc. and contributors.  All rights reserved.
The contributor(s) of this file has/have agreed to the RapidStream Contributor License Agreement.
"""

from rapidstream import get_u280_vitis_device_factory, RapidStreamTAPA
import os

CURR_DIR = os.path.dirname(os.path.abspath(__file__))
INI_PATH = f"{CURR_DIR}/design/config/link_config.ini"
VITIS_PLATFORM = "xilinx_u280_gen3x16_xdma_1_202211_1"
XO_PATH = f"{CURR_DIR}/design/generated/knn.xo"
kernel_name = "Knn"

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

rs = RapidStreamTAPA(f"{CURR_DIR}/build/{os.path.basename(__file__)}")

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
# sp=Knn_1.in_0:HBM[0]
# sp=Knn_1.in_1:HBM[1]
# sp=Knn_1.in_2:HBM[2]
# sp=Knn_1.in_3:HBM[3]
# sp=Knn_1.in_4:HBM[4]
# sp=Knn_1.in_5:HBM[5]
# sp=Knn_1.in_6:HBM[6]
# sp=Knn_1.in_7:HBM[7]
# sp=Knn_1.in_8:HBM[8]
# sp=Knn_1.in_9:HBM[9]
# sp=Knn_1.in_10:HBM[10]
# sp=Knn_1.in_11:HBM[11]
# sp=Knn_1.in_12:HBM[12]
# sp=Knn_1.in_13:HBM[13]
# sp=Knn_1.in_14:HBM[14]
# sp=Knn_1.final_out_dist:HBM[14]
# sp=Knn_1.final_out_id:HBM[14]

rs.assign_port_to_region(".*in_.*", left_slot)
rs.assign_port_to_region(".*final_out.*", left_slot)

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
