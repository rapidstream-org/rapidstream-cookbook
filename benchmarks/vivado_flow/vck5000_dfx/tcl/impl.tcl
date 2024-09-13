
open_checkpoint overlay.dcp
read_checkpoint -cell design_1_i/vadd_bw_0/inst ./vadd_bw.dcp
opt_design
place_design
phys_opt_design
route_design
write_checkpoint -force routed.dcp
update_design -cell design_1_i/vadd_bw_0/inst -black_box
lock_design -level routing
write_checkpoint -force pr_overlay.dcp
