__copyright__ = """
Copyright (c) 2024 RapidStream Design Automation, Inc. and contributors.  All rights reserved.
The contributor(s) of this file has/have agreed to the RapidStream Contributor License Agreement.
"""

from rapidstream import get_u280_vitis_device_factory, RapidStreamTAPA
import os

CURR_DIR = os.path.dirname(os.path.abspath(__file__))
INI_PATH = f"{CURR_DIR}/design/link_config.ini"
VITIS_PLATFORM = "xilinx_u280_gen3x16_xdma_1_202211_1"
KERNEL_NAME = "VecAdd"
XO_PATH = f"{CURR_DIR}/design/{KERNEL_NAME}.xo"


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
rs.assign_cell_to_region(".*add_kernel.*", "SLOT_X0Y1:SLOT_X0Y1")
rs.assign_cell_to_region(".*read_mem.*", "SLOT_X0Y0:SLOT_X0Y0")
rs.assign_cell_to_region(".*write_mem.*", "SLOT_X1Y1:SLOT_X1Y1")

# Xustomize the placement strategy:
rs.set_placement_strategy("EarlyBlockPlacement")

# Allow two parallel Vitis implementation
rs.run_dse(
    max_workers=2,
    max_dse_limit=0.85,
    min_dse_limit=0.75,
    partition_strategy="flat",
)
