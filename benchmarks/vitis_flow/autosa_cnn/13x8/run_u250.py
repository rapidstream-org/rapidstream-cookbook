__copyright__ = """
Copyright (c) 2024 RapidStream Design Automation, Inc. and contributors.  All rights reserved.
The contributor(s) of this file has/have agreed to the RapidStream Contributor License Agreement.
"""

from pathlib import Path

from rapidstream.assets.device_library.u250.u250 import get_u250_vitis_device_factory
from rapidstream.assets.ui.vitis import RapidStreamVitis

XO_PATH = Path("design/generated/kernel3.xo")
U250_LINK_CONFIG = Path("design/config/link_config_u250.ini")
VITIS_PLATFORM = "xilinx_u250_gen3x16_xdma_4_1_202210_1"


df = get_u250_vitis_device_factory(VITIS_PLATFORM)

# enable DDR in SLR 0, 2 and 3. Reserve resources for the DDR controller
for y in (0, 2, 3):
    df.reduce_slot_area(1, y, lut=18469, ff=20778, bram_18k=51, dsp=3)

work_dir = Path("./build")
rs = RapidStreamVitis(
    work_dir=work_dir / "run",
    hls_flatten_threshold=10,
)

rs.set_virtual_device(df.generate_virtual_device())
rs.add_xo_file(XO_PATH)
rs.set_vitis_platform(VITIS_PLATFORM)
rs.set_vitis_connectivity_config(U250_LINK_CONFIG)

rs.add_clock("ap_clk", period_ns=3)

# ports bind to corresponding DDR regions
# Note that if you want to use DDR in SLR1, you should bind to SLOT_X0Y1 instead of
# SLOT_X1Y1. This is because the Vitis region takes out the entire SLOT_X1Y1
rs.assign_port_to_region("m_axi_gmem_A_.*", "SLOT_X1Y0:SLOT_X1Y0")
rs.assign_port_to_region("m_axi_gmem_B_.*", "SLOT_X1Y2:SLOT_X1Y2")
rs.assign_port_to_region("m_axi_gmem_C_.*", "SLOT_X1Y3:SLOT_X1Y3")

rs.assign_port_to_region("s_axi_control_.*", "SLOT_X1Y0:SLOT_X1Y0")
rs.assign_port_to_region("ap_.*", "SLOT_X1Y0:SLOT_X1Y0")
rs.assign_port_to_region("interrupt", "SLOT_X1Y0:SLOT_X1Y0")

rs.run_dse(
    max_workers=4,
    max_dse_limit=0.6,
    min_dse_limit=0.4,
)
