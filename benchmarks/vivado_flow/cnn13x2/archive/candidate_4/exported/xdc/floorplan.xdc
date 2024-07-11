# Copyright (c) 2024 RapidStream Design Automation, Inc. and contributors.  All rights reserved.
# The contributor(s) of this file has/have agreed to the RapidStream Contributor License Agreement.

puts "Apply floorplan pblocks for Vivado flow."
set_property KEEP_HIERARCHY true [get_cells -hierarchical -regexp -filter {
ORIG_REF_NAME =~ "SLOT_X[0-9]+Y[0-9]+_TO_SLOT_X[0-9]+Y[0-9]+.*"
}]

create_pblock SLOT_X0Y1_TO_SLOT_X0Y1
add_cells_to_pblock [get_pblocks SLOT_X0Y1_TO_SLOT_X0Y1] [get_cells -quiet [list SLOT_X0Y1_TO_SLOT_X0Y1_0]]
resize_pblock [get_pblocks SLOT_X0Y1_TO_SLOT_X0Y1] -add {CLOCKREGION_X0Y4:CLOCKREGION_X3Y7}
set_property CONTAIN_ROUTING 1 [get_pblocks SLOT_X0Y1_TO_SLOT_X0Y1]
set_property EXCLUDE_PLACEMENT 1 [get_pblocks SLOT_X0Y1_TO_SLOT_X0Y1]
set_property IS_SOFT FALSE [get_pblocks SLOT_X0Y1_TO_SLOT_X0Y1]
create_pblock SLOT_X1Y0_TO_SLOT_X1Y0
add_cells_to_pblock [get_pblocks SLOT_X1Y0_TO_SLOT_X1Y0] [get_cells -quiet [list SLOT_X1Y0_TO_SLOT_X1Y0_0]]
resize_pblock [get_pblocks SLOT_X1Y0_TO_SLOT_X1Y0] -add {CLOCKREGION_X4Y0:CLOCKREGION_X7Y3}
set_property CONTAIN_ROUTING 1 [get_pblocks SLOT_X1Y0_TO_SLOT_X1Y0]
set_property EXCLUDE_PLACEMENT 1 [get_pblocks SLOT_X1Y0_TO_SLOT_X1Y0]
set_property IS_SOFT FALSE [get_pblocks SLOT_X1Y0_TO_SLOT_X1Y0]
create_pblock SLOT_X0Y0_TO_SLOT_X0Y0
add_cells_to_pblock [get_pblocks SLOT_X0Y0_TO_SLOT_X0Y0] [get_cells -quiet [list SLOT_X0Y0_TO_SLOT_X0Y0_0]]
resize_pblock [get_pblocks SLOT_X0Y0_TO_SLOT_X0Y0] -add {CLOCKREGION_X0Y0:CLOCKREGION_X3Y3}
set_property CONTAIN_ROUTING 1 [get_pblocks SLOT_X0Y0_TO_SLOT_X0Y0]
set_property EXCLUDE_PLACEMENT 1 [get_pblocks SLOT_X0Y0_TO_SLOT_X0Y0]
set_property IS_SOFT FALSE [get_pblocks SLOT_X0Y0_TO_SLOT_X0Y0]
create_pblock SLOT_X1Y1_TO_SLOT_X1Y1
add_cells_to_pblock [get_pblocks SLOT_X1Y1_TO_SLOT_X1Y1] [get_cells -quiet [list SLOT_X1Y1_TO_SLOT_X1Y1_0]]
resize_pblock [get_pblocks SLOT_X1Y1_TO_SLOT_X1Y1] -add {CLOCKREGION_X4Y4:CLOCKREGION_X7Y7}
set_property CONTAIN_ROUTING 1 [get_pblocks SLOT_X1Y1_TO_SLOT_X1Y1]
set_property EXCLUDE_PLACEMENT 1 [get_pblocks SLOT_X1Y1_TO_SLOT_X1Y1]
set_property IS_SOFT FALSE [get_pblocks SLOT_X1Y1_TO_SLOT_X1Y1]
unset target_cells
unset target_cells
unset target_cells
unset target_cells
set_property PACKAGE_PIN J18 [get_ports HBM_CATTRIP]
set_property IOSTANDARD LVCMOS18 [get_ports HBM_CATTRIP]
set_property PULLDOWN true [get_ports HBM_CATTRIP]
