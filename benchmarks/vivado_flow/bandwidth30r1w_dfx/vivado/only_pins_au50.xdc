# # Copyright (c) 2024 RapidStream Design Automation, Inc. and contributors.  All rights reserved.
# The contributor(s) of this file has/have agreed to the RapidStream Contributor License Agreement.

set_property PACKAGE_PIN J18 [get_ports HBM_CATTRIP]
set_property IOSTANDARD LVCMOS18 [get_ports HBM_CATTRIP]
set_property PULLDOWN true [get_ports HBM_CATTRIP]

#set_disable_timing -from [get_clocks your_clk_name] -to [get_clocks your_clk_name]
#set_disable_timing -from [get_clocks your_clk_name] -to [get_clocks your_clk_name] -through [get_ports|get_pins|get_cells your_specific_port_or_pin_or_cell]
#create_pblock p_shell
#resize_pblock [get_pblocks p_shell] -add {SLICE_X221Y0:SLICE_X232Y239}
#resize_pblock [get_pblocks p_shell] -add {BUFG_GT_X1Y0:BUFG_GT_X1Y95}
#resize_pblock [get_pblocks p_shell] -add {BUFG_GT_SYNC_X1Y0:BUFG_GT_SYNC_X1Y59}
#resize_pblock [get_pblocks p_shell] -add {DSP48E2_X31Y0:DSP48E2_X31Y89}
#resize_pblock [get_pblocks p_shell] -add {LAGUNA_X30Y0:LAGUNA_X31Y119}
#resize_pblock [get_pblocks p_shell] -add {RAMB18_X13Y0:RAMB18_X13Y95}
#resize_pblock [get_pblocks p_shell] -add {RAMB36_X13Y0:RAMB36_X13Y47}



#add_cells_to_pblock [get_pblocks p_shell] [get_cells -quiet [list gnd_driver_0 util_ds_buf xdma_0 ]]
#set_property SNAPPING_MODE ON [get_pblocks p_shell]
#set_property EXCLUDE_PLACEMENT 1 [get_pblocks p_shell]
#set_property CONTAIN_ROUTING   1 [get_pblocks p_shell]


create_pblock tapa_region
resize_pblock [get_pblocks tapa_region] -add {SLICE_X122Y240:SLICE_X175Y299 SLICE_X0Y150:SLICE_X205Y179}
resize_pblock [get_pblocks tapa_region] -add {BIAS_X0Y5:BIAS_X0Y5}
resize_pblock [get_pblocks tapa_region] -add {BITSLICE_CONTROL_X0Y20:BITSLICE_CONTROL_X0Y23}
resize_pblock [get_pblocks tapa_region] -add {BITSLICE_RX_TX_X0Y130:BITSLICE_RX_TX_X0Y155}
resize_pblock [get_pblocks tapa_region] -add {BITSLICE_TX_X0Y20:BITSLICE_TX_X0Y23}
resize_pblock [get_pblocks tapa_region] -add {BUFCE_LEAF_X624Y16:BUFCE_LEAF_X895Y19}
resize_pblock [get_pblocks tapa_region] -add {BUFCE_ROW_FSR_X140Y4:BUFCE_ROW_FSR_X199Y4}
resize_pblock [get_pblocks tapa_region] -add {DSP48E2_X16Y90:DSP48E2_X24Y113 DSP48E2_X0Y54:DSP48E2_X29Y65}
resize_pblock [get_pblocks tapa_region] -add {HARD_SYNC_X18Y8:HARD_SYNC_X21Y9}
resize_pblock [get_pblocks tapa_region] -add {HPIOBDIFFINBUF_X0Y60:HPIOBDIFFINBUF_X0Y71}
resize_pblock [get_pblocks tapa_region] -add {HPIOBDIFFOUTBUF_X0Y60:HPIOBDIFFOUTBUF_X0Y71}
resize_pblock [get_pblocks tapa_region] -add {HPIOB_DCI_SNGL_X0Y10:HPIOB_DCI_SNGL_X0Y15}
resize_pblock [get_pblocks tapa_region] -add {HPIO_RCLK_PRBS_X0Y3:HPIO_RCLK_PRBS_X0Y3}
resize_pblock [get_pblocks tapa_region] -add {HPIO_VREF_SITE_X0Y5:HPIO_VREF_SITE_X0Y5}
resize_pblock [get_pblocks tapa_region] -add {IOB_X0Y130:IOB_X0Y155}
resize_pblock [get_pblocks tapa_region] -add {LAGUNA_X16Y120:LAGUNA_X23Y239}
resize_pblock [get_pblocks tapa_region] -add {RAMB18_X9Y96:RAMB18_X10Y119 RAMB18_X0Y60:RAMB18_X11Y71}
resize_pblock [get_pblocks tapa_region] -add {RAMB36_X9Y48:RAMB36_X10Y59 RAMB36_X0Y30:RAMB36_X11Y35}
resize_pblock [get_pblocks tapa_region] -add {RIU_OR_X0Y10:RIU_OR_X0Y11}
resize_pblock [get_pblocks tapa_region] -add {URAM288_X2Y64:URAM288_X3Y79 URAM288_X0Y40:URAM288_X4Y47}
resize_pblock [get_pblocks tapa_region] -add {CLOCKREGION_X0Y5:CLOCKREGION_X7Y7 CLOCKREGION_X6Y4:CLOCKREGION_X7Y4 CLOCKREGION_X0Y4:CLOCKREGION_X3Y4 CLOCKREGION_X0Y3:CLOCKREGION_X6Y3}
set_property SNAPPING_MODE ON [get_pblocks tapa_region]
add_cells_to_pblock [get_pblocks tapa_region] [get_cells -quiet [list design_1_i/vadd_bw_0/inst]]

set_property DONT_TOUCH true [get_cells design_1_i/vadd_bw_0/inst]
set_property HD.RECONFIGURABLE true [get_cells design_1_i/vadd_bw_0/inst]
