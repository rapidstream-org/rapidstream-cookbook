"""Getting Started: CNN13x2 in the Vitis flow

This script demonstrates how to optimize a CNN13x2 design in
a Vitis object file. In this example, the object file is generated from the
Vitis_HLS.
"""

__copyright__ = """
Copyright (c) 2024 RapidStream Design Automation, Inc. and contributors.  All rights reserved.
The contributor(s) of this file has/have agreed to the RapidStream Contributor License Agreement.
"""

from rapidstream import get_u280_default_device, RapidStreamHLS
import os
from pathlib import Path

CURR_DIR = os.path.dirname(os.path.abspath(__file__))

kernel_clk_ns = 3
temp_dir = "build"
kernel_name = "bert_all"

rs = RapidStreamHLS(
    work_dir=Path(f"{temp_dir}/run"),
    hls_flatten_threshold=5,
)

rs.set_virtual_device(get_u280_default_device())
# rs.set_shell_path(shell_path)
rs.add_hls_solution(Path(f"{CURR_DIR}/build/{kernel_name}/solution"))
rs.set_top_module_name(kernel_name)
rs.add_flatten_targets([kernel_name])

rs.add_clock("ap_clk", kernel_clk_ns)

rs.assign_port_to_region(".*", "SLOT_X0Y0:SLOT_X0Y0")

rs.run_dse(skip_impl=True)
