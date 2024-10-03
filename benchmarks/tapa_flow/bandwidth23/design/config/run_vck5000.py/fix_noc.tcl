

if {${argc} != 1} {
	puts stderr "Should -tclargs <PRE PATH> <CONFIG_JSON_NAME>. Too few arguments. Exiting."
	exit 1
}

set PRE_PATH   "[lindex $argv 0]"

open_project ${PRE_PATH}/prj.xpr
open_bd_design ${PRE_PATH}/prj.srcs/my_rm/bd/ulp_inst_0/ulp_inst_0.bd

set_property -dict [list CONFIG.PHYSICAL_LOC {NOC_NMU512_X0Y0}] [get_bd_intf_pins /axi_noc_kernel0/S00_AXI]
set_property -dict [list CONFIG.PHYSICAL_LOC {NOC_NMU512_X0Y1}] [get_bd_intf_pins /axi_noc_kernel0/S01_AXI]
set_property -dict [list CONFIG.PHYSICAL_LOC {NOC_NMU512_X0Y2}] [get_bd_intf_pins /axi_noc_kernel0/S02_AXI]
set_property -dict [list CONFIG.PHYSICAL_LOC {NOC_NMU512_X0Y3}] [get_bd_intf_pins /axi_noc_kernel0/S03_AXI]
set_property -dict [list CONFIG.PHYSICAL_LOC {NOC_NMU512_X1Y0}] [get_bd_intf_pins /axi_noc_kernel0/S04_AXI]
set_property -dict [list CONFIG.PHYSICAL_LOC {NOC_NMU512_X1Y1}] [get_bd_intf_pins /axi_noc_kernel0/S05_AXI]
set_property -dict [list CONFIG.PHYSICAL_LOC {NOC_NMU512_X1Y2}] [get_bd_intf_pins /axi_noc_kernel0/S06_AXI]
set_property -dict [list CONFIG.PHYSICAL_LOC {NOC_NMU512_X0Y4}] [get_bd_intf_pins /axi_noc_kernel0/S07_AXI]
set_property -dict [list CONFIG.PHYSICAL_LOC {NOC_NMU512_X1Y4}] [get_bd_intf_pins /axi_noc_kernel0/S08_AXI]
set_property -dict [list CONFIG.PHYSICAL_LOC {NOC_NMU512_X1Y5}] [get_bd_intf_pins /axi_noc_kernel0/S09_AXI]
set_property -dict [list CONFIG.PHYSICAL_LOC {NOC_NMU512_X1Y6}] [get_bd_intf_pins /axi_noc_kernel0/S10_AXI]
set_property -dict [list CONFIG.PHYSICAL_LOC {NOC_NMU512_X2Y0}] [get_bd_intf_pins /axi_noc_kernel0/S11_AXI]
set_property -dict [list CONFIG.PHYSICAL_LOC {NOC_NMU512_X2Y1}] [get_bd_intf_pins /axi_noc_kernel0/S12_AXI]
set_property -dict [list CONFIG.PHYSICAL_LOC {NOC_NMU512_X2Y2}] [get_bd_intf_pins /axi_noc_kernel0/S13_AXI]
set_property -dict [list CONFIG.PHYSICAL_LOC {NOC_NMU512_X2Y3}] [get_bd_intf_pins /axi_noc_kernel0/S14_AXI]
set_property -dict [list CONFIG.PHYSICAL_LOC {NOC_NMU512_X3Y0}] [get_bd_intf_pins /axi_noc_kernel0/S15_AXI]
set_property -dict [list CONFIG.PHYSICAL_LOC {NOC_NMU512_X3Y1}] [get_bd_intf_pins /axi_noc_kernel0/S16_AXI]
set_property -dict [list CONFIG.PHYSICAL_LOC {NOC_NMU512_X3Y2}] [get_bd_intf_pins /axi_noc_kernel0/S17_AXI]
set_property -dict [list CONFIG.PHYSICAL_LOC {NOC_NMU512_X2Y4}] [get_bd_intf_pins /axi_noc_kernel0/S18_AXI]
set_property -dict [list CONFIG.PHYSICAL_LOC {NOC_NMU512_X2Y5}] [get_bd_intf_pins /axi_noc_kernel0/S19_AXI]
set_property -dict [list CONFIG.PHYSICAL_LOC {NOC_NMU512_X2Y6}] [get_bd_intf_pins /axi_noc_kernel0/S20_AXI]
set_property -dict [list CONFIG.PHYSICAL_LOC {NOC_NMU512_X3Y5}] [get_bd_intf_pins /axi_noc_kernel0/S21_AXI]
set_property -dict [list CONFIG.PHYSICAL_LOC {NOC_NMU512_X3Y6}] [get_bd_intf_pins /axi_noc_kernel0/S22_AXI]


save_bd_design
validate_bd_design
save_bd_design
reset_run my_rm_synth_1
launch_runs  my_rm_synth_1 -jobs 16
wait_on_run  my_rm_synth_1
