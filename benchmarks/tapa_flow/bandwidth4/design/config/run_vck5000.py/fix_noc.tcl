

if {${argc} != 1} {
	puts stderr "Should -tclargs <PRE PATH> <CONFIG_JSON_NAME>. Too few arguments. Exiting."
	exit 1
}

set PRE_PATH   "[lindex $argv 0]"

open_project ${PRE_PATH}/prj.xpr
open_bd_design ${PRE_PATH}/prj.srcs/my_rm/bd/ulp_inst_0/ulp_inst_0.bd

set_property -dict [list CONFIG.PHYSICAL_LOC {NOC_NMU512_X0Y0}] [get_bd_intf_pins /axi_noc_kernel0/S00_AXI]
set_property -dict [list CONFIG.PHYSICAL_LOC {NOC_NMU512_X2Y0}] [get_bd_intf_pins /axi_noc_kernel0/S01_AXI]
set_property -dict [list CONFIG.PHYSICAL_LOC {NOC_NMU512_X0Y4}] [get_bd_intf_pins /axi_noc_kernel0/S02_AXI]
set_property -dict [list CONFIG.PHYSICAL_LOC {NOC_NMU512_X2Y4}] [get_bd_intf_pins /axi_noc_kernel0/S03_AXI]

save_bd_design
validate_bd_design
save_bd_design
reset_run my_rm_synth_1
launch_runs  my_rm_synth_1 -jobs 16
wait_on_run  my_rm_synth_1
