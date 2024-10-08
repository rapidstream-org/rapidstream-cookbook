__copyright__ = """
Copyright (c) 2024 RapidStream Design Automation, Inc. and contributors.  All rights reserved.
The contributor(s) of this file has/have agreed to the RapidStream Contributor License Agreement.
"""

from pathlib import Path
from rapidstream import get_u55c_vitis_device_factory
import os

CURR_DIR = os.path.dirname(os.path.abspath(__file__))
CURR_FILE = os.path.basename(__file__)
VITIS_PLATFORM = (
    "xilinx_u55c_gen3x16_xdma_3_202210_1"  # "xilinx_u280_gen3x16_xdma_1_202211_1"
)

factory = get_u55c_vitis_device_factory(VITIS_PLATFORM)

factory.reduce_slot_area(1, 0, lut=50000, ff=60000)
factory.reduce_slot_area(0, 0, lut=50000, ff=60000)
factory.reduce_slot_area(1, 1, dsp=100)

factory.generate_virtual_device(Path(f"{CURR_DIR}/build/{CURR_FILE}/device.json"))


# ab_config = FloorplanConfig(
#    port_pre_assignments={".*": "SLOT_X0Y0:SLOT_X0Y0"},
# )
# ab_config.save_to_file("test.json")
