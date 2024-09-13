# Copyright (c) 2024 RapidStream Design Automation, Inc. and contributors.  All rights reserved.
# The contributor(s) of this file has/have agreed to the RapidStream Contributor License Agreement.

create_pblock pblock_1
add_cells_to_pblock [get_pblocks pblock_1] [get_cells -quiet [list design_1_i/vadd_bw_0/inst]]
resize_pblock [get_pblocks pblock_1] -add {SLICE_X60Y44:SLICE_X115Y187}
resize_pblock [get_pblocks pblock_1] -add {DSP58_CPLX_X0Y22:DSP58_CPLX_X0Y93}
resize_pblock [get_pblocks pblock_1] -add {DSP_X0Y22:DSP_X1Y93}
resize_pblock [get_pblocks pblock_1] -add {IRI_QUAD_X36Y204:IRI_QUAD_X70Y779}
resize_pblock [get_pblocks pblock_1] -add {NOC_NMU512_X0Y1:NOC_NMU512_X0Y3}
resize_pblock [get_pblocks pblock_1] -add {NOC_NSU512_X0Y1:NOC_NSU512_X0Y3}
resize_pblock [get_pblocks pblock_1] -add {RAMB18_X1Y24:RAMB18_X2Y95}
resize_pblock [get_pblocks pblock_1] -add {RAMB36_X1Y12:RAMB36_X2Y47}
resize_pblock [get_pblocks pblock_1] -add {URAM288_X1Y12:URAM288_X1Y47}
resize_pblock [get_pblocks pblock_1] -add {URAM_CAS_DLY_X1Y0:URAM_CAS_DLY_X1Y1}
set_property SNAPPING_MODE ON [get_pblocks pblock_1]

set_property DONT_TOUCH true [get_cells design_1_i/vadd_bw_0/inst]
set_property HD.RECONFIGURABLE true [get_cells design_1_i/vadd_bw_0/inst]
