"""Getting Started: CNN13x2 in the Vitis flow

This script demonstrates how to optimize a CNN13x2 design in
a Vitis object file. In this example, the object file is generated from the
Vitis_HLS.
"""

__copyright__ = """
Copyright (c) 2024 RapidStream Design Automation, Inc. and contributors.  All rights reserved.
The contributor(s) of this file has/have agreed to the RapidStream Contributor License Agreement.
"""

from rapidstream import get_u50_default_device, RapidStreamHLS
import os
from pathlib import Path
from glob import glob

CURR_DIR = os.path.dirname(os.path.abspath(__file__))

src_dir = f"{CURR_DIR}/design"
temp_dir = f"{CURR_DIR}/build"
kernel_name = "kernel3"
top = "design_1_wrapper"

rs = RapidStreamHLS(
    work_dir=Path(f"{temp_dir}/run"),
    hls_flatten_threshold=5,
)

rs.set_virtual_device(get_u50_default_device())
rs.add_hls_solution(Path(f"{src_dir}/hls/solution"))
rs.add_vlog_files([Path(f) for f in glob(f"{src_dir}/hdl/*.v")])
rs.add_xci_files([Path(f) for f in glob(f"{src_dir}/xci/**/*.xci", recursive=True)])
rs.add_iface_only_xci_files(
    [Path(f) for f in glob(f"{src_dir}/iface_only_xci/**/*.xci", recursive=True)]
)

rs.set_top_module_name(top)
rs.add_flatten_targets([kernel_name])

rs.add_clock("ap_clk", 10)

rs.assign_port_to_region("HBM_CATTRIP", "SLOT_X1Y1:SLOT_X1Y1")
rs.assign_port_to_region("hbm_clk_clk_n", "SLOT_X1Y0:SLOT_X1Y0")
rs.assign_port_to_region("hbm_clk_clk_p", "SLOT_X1Y0:SLOT_X1Y0")
rs.assign_port_to_region("pci_express_x1_rxn", "SLOT_X1Y0:SLOT_X1Y0")
rs.assign_port_to_region("pci_express_x1_rxp", "SLOT_X1Y0:SLOT_X1Y0")
rs.assign_port_to_region("pci_express_x1_txn", "SLOT_X1Y0:SLOT_X1Y0")
rs.assign_port_to_region("pci_express_x1_txp", "SLOT_X1Y0:SLOT_X1Y0")
rs.assign_port_to_region("pcie_perstn", "SLOT_X1Y0:SLOT_X1Y0")
rs.assign_port_to_region("pcie_refclk_clk_n", "SLOT_X1Y0:SLOT_X1Y0")
rs.assign_port_to_region("pcie_refclk_clk_p", "SLOT_X1Y0:SLOT_X1Y0")

rs.assign_cell_to_region(".*kernel_clk.*", "SLOT_X1Y0:SLOT_X1Y0")
rs.assign_cell_to_region(".*hbm_axi_clk.*", "SLOT_X1Y0:SLOT_X1Y0")
rs.assign_cell_to_region(".*smartconnect.*", "SLOT_X1Y0:SLOT_X1Y0")
rs.assign_cell_to_region(".*xdma.*", "SLOT_X1Y0:SLOT_X1Y0")

# rs.run_dse(skip_impl=True)
rs.run_dse()
