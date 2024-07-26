set_property KEEP_HIERARCHY true [get_cells -hierarchical -regexp -filter {
ORIG_REF_NAME =~ "SLOT_X[0-9]+Y[0-9]+_TO_SLOT_X[0-9]+Y[0-9]+.*"
}]
create_pblock SLOT_X0Y0_TO_SLOT_X0Y0
add_cells_to_pblock [get_pblocks SLOT_X0Y0_TO_SLOT_X0Y0] [get_cells -quiet [list SLOT_X0Y0_TO_SLOT_X0Y0_0]]
resize_pblock [get_pblocks SLOT_X0Y0_TO_SLOT_X0Y0] -add {CLOCKREGION_X0Y0:CLOCKREGION_X3Y3}
set_property CONTAIN_ROUTING 1 [get_pblocks SLOT_X0Y0_TO_SLOT_X0Y0]
set_property EXCLUDE_PLACEMENT 1 [get_pblocks SLOT_X0Y0_TO_SLOT_X0Y0]
set_property IS_SOFT FALSE [get_pblocks SLOT_X0Y0_TO_SLOT_X0Y0]
create_pblock SLOT_X0Y1_TO_SLOT_X0Y1
add_cells_to_pblock [get_pblocks SLOT_X0Y1_TO_SLOT_X0Y1] [get_cells -quiet [list SLOT_X0Y1_TO_SLOT_X0Y1_0]]
resize_pblock [get_pblocks SLOT_X0Y1_TO_SLOT_X0Y1] -add {CLOCKREGION_X0Y4:CLOCKREGION_X3Y7}
set_property CONTAIN_ROUTING 1 [get_pblocks SLOT_X0Y1_TO_SLOT_X0Y1]
set_property EXCLUDE_PLACEMENT 1 [get_pblocks SLOT_X0Y1_TO_SLOT_X0Y1]
set_property IS_SOFT FALSE [get_pblocks SLOT_X0Y1_TO_SLOT_X0Y1]
create_pblock SLOT_X1Y1_TO_SLOT_X1Y1
add_cells_to_pblock [get_pblocks SLOT_X1Y1_TO_SLOT_X1Y1] [get_cells -quiet [list SLOT_X1Y1_TO_SLOT_X1Y1_0]]
resize_pblock [get_pblocks SLOT_X1Y1_TO_SLOT_X1Y1] -add {CLOCKREGION_X4Y4:CLOCKREGION_X7Y7}
set_property CONTAIN_ROUTING 1 [get_pblocks SLOT_X1Y1_TO_SLOT_X1Y1]
set_property EXCLUDE_PLACEMENT 1 [get_pblocks SLOT_X1Y1_TO_SLOT_X1Y1]
set_property IS_SOFT FALSE [get_pblocks SLOT_X1Y1_TO_SLOT_X1Y1]
create_pblock SLOT_X1Y2_TO_SLOT_X1Y2
add_cells_to_pblock [get_pblocks SLOT_X1Y2_TO_SLOT_X1Y2] [get_cells -quiet [list SLOT_X1Y2_TO_SLOT_X1Y2_0]]
resize_pblock [get_pblocks SLOT_X1Y2_TO_SLOT_X1Y2] -add {CLOCKREGION_X4Y8:CLOCKREGION_X7Y11}
set_property CONTAIN_ROUTING 1 [get_pblocks SLOT_X1Y2_TO_SLOT_X1Y2]
set_property EXCLUDE_PLACEMENT 1 [get_pblocks SLOT_X1Y2_TO_SLOT_X1Y2]
set_property IS_SOFT FALSE [get_pblocks SLOT_X1Y2_TO_SLOT_X1Y2]
create_pblock SLOT_X0Y2_TO_SLOT_X0Y2
add_cells_to_pblock [get_pblocks SLOT_X0Y2_TO_SLOT_X0Y2] [get_cells -quiet [list SLOT_X0Y2_TO_SLOT_X0Y2_0]]
resize_pblock [get_pblocks SLOT_X0Y2_TO_SLOT_X0Y2] -add {CLOCKREGION_X0Y8:CLOCKREGION_X3Y11}
set_property CONTAIN_ROUTING 1 [get_pblocks SLOT_X0Y2_TO_SLOT_X0Y2]
set_property EXCLUDE_PLACEMENT 1 [get_pblocks SLOT_X0Y2_TO_SLOT_X0Y2]
set_property IS_SOFT FALSE [get_pblocks SLOT_X0Y2_TO_SLOT_X0Y2]
create_pblock SLOT_X1Y0_TO_SLOT_X1Y0
add_cells_to_pblock [get_pblocks SLOT_X1Y0_TO_SLOT_X1Y0] [get_cells -quiet [list SLOT_X1Y0_TO_SLOT_X1Y0_0]]
resize_pblock [get_pblocks SLOT_X1Y0_TO_SLOT_X1Y0] -add {CLOCKREGION_X4Y0:CLOCKREGION_X7Y3}
set_property CONTAIN_ROUTING 1 [get_pblocks SLOT_X1Y0_TO_SLOT_X1Y0]
set_property EXCLUDE_PLACEMENT 1 [get_pblocks SLOT_X1Y0_TO_SLOT_X1Y0]
set_property IS_SOFT FALSE [get_pblocks SLOT_X1Y0_TO_SLOT_X1Y0]

set_property PACKAGE_PIN AR15 [get_ports {pcie_refclk_clk_p[0]}]
set_property PACKAGE_PIN BF22 [get_ports pcie_perstn]
set_property IOSTANDARD LVCMOS18 [get_ports pcie_perstn]
set_property PACKAGE_PIN BJ24 [get_ports slr0_freerun_clk_clk_p]
set_property IOSTANDARD DIFF_HSTL_I_18 [get_ports slr0_freerun_clk_clk_p]



