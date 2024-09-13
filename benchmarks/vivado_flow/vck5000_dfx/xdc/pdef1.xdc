# Copyright (c) 2024 RapidStream Design Automation, Inc. and contributors.  All rights reserved.
# The contributor(s) of this file has/have agreed to the RapidStream Contributor License Agreement.

create_pblock tapa_region
add_cells_to_pblock [get_pblocks tapa_region] [get_cells -quiet [list design_1_i/vadd_bw_0/inst]]
resize_pblock [get_pblocks tapa_region] -add {SLICE_X52Y12:SLICE_X331Y326}
resize_pblock [get_pblocks tapa_region] -add {BUFG_FABRIC_X0Y95:BUFG_FABRIC_X4Y0}
resize_pblock [get_pblocks tapa_region] -add {DSP58_CPLX_X0Y6:DSP58_CPLX_X5Y162}
resize_pblock [get_pblocks tapa_region] -add {DSP_X0Y6:DSP_X11Y162}
resize_pblock [get_pblocks tapa_region] -add {GCLK_DELAY_X1Y191:GCLK_DELAY_X5Y0}
resize_pblock [get_pblocks tapa_region] -add {GCLK_PD_X3Y0:GCLK_PD_X13Y239 GCLK_PD_X2Y24:GCLK_PD_X2Y215}
resize_pblock [get_pblocks tapa_region] -add {GCLK_TAPS_DECODE_VNOC_X0Y3:GCLK_TAPS_DECODE_VNOC_X3Y0}
resize_pblock [get_pblocks tapa_region] -add {GCLK_TAPS_DECODE_VNOC_PS_X0Y0:GCLK_TAPS_DECODE_VNOC_PS_X0Y0}
resize_pblock [get_pblocks tapa_region] -add {IRI_QUAD_X36Y76:IRI_QUAD_X206Y1335}
resize_pblock [get_pblocks tapa_region] -add {RAMB18_X1Y8:RAMB18_X11Y163}
resize_pblock [get_pblocks tapa_region] -add {RAMB36_X1Y4:RAMB36_X11Y81}
resize_pblock [get_pblocks tapa_region] -add {URAM288_X1Y4:URAM288_X4Y81}
resize_pblock [get_pblocks tapa_region] -add {URAM_CAS_DLY_X1Y0:URAM_CAS_DLY_X4Y2}
set_property SNAPPING_MODE ON [get_pblocks tapa_region]

set_property DONT_TOUCH true [get_cells design_1_i/vadd_bw_0/inst]
set_property HD.RECONFIGURABLE true [get_cells design_1_i/vadd_bw_0/inst]
