# # Copyright (c) 2024 RapidStream Design Automation, Inc. and contributors.  All rights reserved.
# The contributor(s) of this file has/have agreed to the RapidStream Contributor License Agreement.

set_property PACKAGE_PIN J18      [get_ports "HBM_CATTRIP"]       ;# Bank  68 VCCO - VCC1V8   - IO_L6N_T0U_N11_AD6N_68
set_property IOSTANDARD  LVCMOS18 [get_ports "HBM_CATTRIP"]       ;# Bank  68 VCCO - VCC1V8   - IO_L6N_T0U_N11_AD6N_68
set_property PULLDOWN TRUE        [get_ports "HBM_CATTRIP"]       ;# Bank  68 VCCO - VCC1V8   - IO_L6N_T0U_N11_AD6N_68

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
