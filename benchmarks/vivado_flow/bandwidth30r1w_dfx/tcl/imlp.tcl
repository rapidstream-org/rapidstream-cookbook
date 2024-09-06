read_checkpoint -cell  design_1_i/vadd_bw_0/inst ./vadd_bw_ooc.dcp
opt_design
place_design
write_checkpoint -force placed.dcp
phys_opt_design
route_design
write_checkpoint -force routed.dcp
