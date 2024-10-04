

if {${argc} != 1} {
	puts stderr "Should -tclargs <PRE PATH> <CONFIG_JSON_NAME>. Too few arguments. Exiting."
	exit 1
}

set PRE_PATH   "[lindex $argv 0]"

open_project ${PRE_PATH}/prj.xpr
open_bd_design ${PRE_PATH}/prj.srcs/sources_1/bd/ext_platform/ext_platform.bd

set_property -dict [list CONFIG.PHYSICAL_LOC {NOC_NMU512_X0Y0 }] [get_bd_intf_pins /noc_ddr4_0/S00_AXI]
set_property -dict [list CONFIG.PHYSICAL_LOC {NOC_NMU512_X0Y1 }] [get_bd_intf_pins /noc_ddr4_0/S01_AXI]
set_property -dict [list CONFIG.PHYSICAL_LOC {NOC_NMU512_X0Y2 }] [get_bd_intf_pins /noc_ddr4_0/S02_AXI]
set_property -dict [list CONFIG.PHYSICAL_LOC {NOC_NMU512_X0Y3 }] [get_bd_intf_pins /noc_ddr4_0/S03_AXI]
set_property -dict [list CONFIG.PHYSICAL_LOC {NOC_NMU512_X0Y4 }] [get_bd_intf_pins /noc_ddr4_0/S04_AXI]
set_property -dict [list CONFIG.PHYSICAL_LOC {NOC_NMU512_X0Y5 }] [get_bd_intf_pins /noc_ddr4_0/S05_AXI]
set_property -dict [list CONFIG.PHYSICAL_LOC {NOC_NMU512_X0Y6 }] [get_bd_intf_pins /noc_ddr4_0/S06_AXI]
set_property -dict [list CONFIG.PHYSICAL_LOC {NOC_NMU512_X0Y7 }] [get_bd_intf_pins /noc_ddr4_0/S07_AXI]
set_property -dict [list CONFIG.PHYSICAL_LOC {NOC_NMU512_X0Y8 }] [get_bd_intf_pins /noc_ddr4_0/S08_AXI]
set_property -dict [list CONFIG.PHYSICAL_LOC {NOC_NMU512_X0Y9 }] [get_bd_intf_pins /noc_ddr4_0/S09_AXI]
set_property -dict [list CONFIG.PHYSICAL_LOC {NOC_NMU512_X0Y10}] [get_bd_intf_pins /noc_ddr4_0/S10_AXI]
set_property -dict [list CONFIG.PHYSICAL_LOC {NOC_NMU512_X0Y11}] [get_bd_intf_pins /noc_ddr4_0/S11_AXI]
set_property -dict [list CONFIG.PHYSICAL_LOC {NOC_NMU512_X0Y12}] [get_bd_intf_pins /noc_ddr4_0/S12_AXI]
set_property -dict [list CONFIG.PHYSICAL_LOC {NOC_NMU512_X1Y0 }] [get_bd_intf_pins /noc_ddr4_0/S13_AXI]
set_property -dict [list CONFIG.PHYSICAL_LOC {NOC_NMU512_X1Y1 }] [get_bd_intf_pins /noc_ddr4_0/S14_AXI]
set_property -dict [list CONFIG.PHYSICAL_LOC {NOC_NMU512_X1Y2 }] [get_bd_intf_pins /noc_ddr4_0/S15_AXI]
set_property -dict [list CONFIG.PHYSICAL_LOC {NOC_NMU512_X1Y3 }] [get_bd_intf_pins /noc_ddr4_0/S16_AXI]
set_property -dict [list CONFIG.PHYSICAL_LOC {NOC_NMU512_X1Y4 }] [get_bd_intf_pins /noc_ddr4_0/S17_AXI]
set_property -dict [list CONFIG.PHYSICAL_LOC {NOC_NMU512_X1Y5 }] [get_bd_intf_pins /noc_ddr4_0/S18_AXI]
set_property -dict [list CONFIG.PHYSICAL_LOC {NOC_NMU512_X1Y6 }] [get_bd_intf_pins /noc_ddr4_0/S19_AXI]
set_property -dict [list CONFIG.PHYSICAL_LOC {NOC_NMU512_X1Y7 }] [get_bd_intf_pins /noc_ddr4_0/S20_AXI]
set_property -dict [list CONFIG.PHYSICAL_LOC {NOC_NMU512_X1Y8 }] [get_bd_intf_pins /noc_ddr4_0/S21_AXI]
set_property -dict [list CONFIG.PHYSICAL_LOC {NOC_NMU512_X1Y9 }] [get_bd_intf_pins /noc_ddr4_0/S22_AXI]
set_property -dict [list CONFIG.PHYSICAL_LOC {NOC_NMU512_X1Y10}] [get_bd_intf_pins /noc_ddr4_0/S23_AXI]
set_property -dict [list CONFIG.PHYSICAL_LOC {NOC_NMU512_X1Y11}] [get_bd_intf_pins /noc_ddr4_0/S24_AXI]
set_property -dict [list CONFIG.PHYSICAL_LOC {NOC_NMU512_X1Y12}] [get_bd_intf_pins /noc_ddr4_0/S25_AXI]

set_property -dict [list CONFIG.PHYSICAL_LOC {NOC_NMU512_X2Y0 }] [get_bd_intf_pins /noc_ddr4_1/S00_AXI]
set_property -dict [list CONFIG.PHYSICAL_LOC {NOC_NMU512_X2Y1 }] [get_bd_intf_pins /noc_ddr4_1/S01_AXI]
set_property -dict [list CONFIG.PHYSICAL_LOC {NOC_NMU512_X2Y2 }] [get_bd_intf_pins /noc_ddr4_1/S02_AXI]
set_property -dict [list CONFIG.PHYSICAL_LOC {NOC_NMU512_X2Y3 }] [get_bd_intf_pins /noc_ddr4_1/S03_AXI]
set_property -dict [list CONFIG.PHYSICAL_LOC {NOC_NMU512_X2Y4 }] [get_bd_intf_pins /noc_ddr4_1/S04_AXI]
set_property -dict [list CONFIG.PHYSICAL_LOC {NOC_NMU512_X2Y5 }] [get_bd_intf_pins /noc_ddr4_1/S05_AXI]
set_property -dict [list CONFIG.PHYSICAL_LOC {NOC_NMU512_X2Y6 }] [get_bd_intf_pins /noc_ddr4_1/S06_AXI]
set_property -dict [list CONFIG.PHYSICAL_LOC {NOC_NMU512_X2Y7 }] [get_bd_intf_pins /noc_ddr4_1/S07_AXI]
set_property -dict [list CONFIG.PHYSICAL_LOC {NOC_NMU512_X2Y8 }] [get_bd_intf_pins /noc_ddr4_1/S08_AXI]
set_property -dict [list CONFIG.PHYSICAL_LOC {NOC_NMU512_X2Y9 }] [get_bd_intf_pins /noc_ddr4_1/S09_AXI]
set_property -dict [list CONFIG.PHYSICAL_LOC {NOC_NMU512_X2Y10}] [get_bd_intf_pins /noc_ddr4_1/S10_AXI]
set_property -dict [list CONFIG.PHYSICAL_LOC {NOC_NMU512_X2Y11}] [get_bd_intf_pins /noc_ddr4_1/S11_AXI]
set_property -dict [list CONFIG.PHYSICAL_LOC {NOC_NMU512_X2Y12}] [get_bd_intf_pins /noc_ddr4_1/S12_AXI]
set_property -dict [list CONFIG.PHYSICAL_LOC {NOC_NMU512_X3Y0 }] [get_bd_intf_pins /noc_ddr4_1/S13_AXI]
set_property -dict [list CONFIG.PHYSICAL_LOC {NOC_NMU512_X3Y1 }] [get_bd_intf_pins /noc_ddr4_1/S14_AXI]
set_property -dict [list CONFIG.PHYSICAL_LOC {NOC_NMU512_X3Y2 }] [get_bd_intf_pins /noc_ddr4_1/S15_AXI]
set_property -dict [list CONFIG.PHYSICAL_LOC {NOC_NMU512_X3Y3 }] [get_bd_intf_pins /noc_ddr4_1/S16_AXI]
set_property -dict [list CONFIG.PHYSICAL_LOC {NOC_NMU512_X3Y4 }] [get_bd_intf_pins /noc_ddr4_1/S17_AXI]
set_property -dict [list CONFIG.PHYSICAL_LOC {NOC_NMU512_X3Y5 }] [get_bd_intf_pins /noc_ddr4_1/S18_AXI]
set_property -dict [list CONFIG.PHYSICAL_LOC {NOC_NMU512_X3Y6 }] [get_bd_intf_pins /noc_ddr4_1/S19_AXI]
set_property -dict [list CONFIG.PHYSICAL_LOC {NOC_NMU512_X3Y7 }] [get_bd_intf_pins /noc_ddr4_1/S20_AXI]
set_property -dict [list CONFIG.PHYSICAL_LOC {NOC_NMU512_X3Y8 }] [get_bd_intf_pins /noc_ddr4_1/S21_AXI]
set_property -dict [list CONFIG.PHYSICAL_LOC {NOC_NMU512_X3Y9 }] [get_bd_intf_pins /noc_ddr4_1/S22_AXI]
set_property -dict [list CONFIG.PHYSICAL_LOC {NOC_NMU512_X3Y10}] [get_bd_intf_pins /noc_ddr4_1/S23_AXI]
set_property -dict [list CONFIG.PHYSICAL_LOC {NOC_NMU512_X3Y11}] [get_bd_intf_pins /noc_ddr4_1/S24_AXI]
set_property -dict [list CONFIG.PHYSICAL_LOC {NOC_NMU512_X3Y12}] [get_bd_intf_pins /noc_ddr4_1/S25_AXI]


save_bd_design
validate_bd_design
save_bd_design
reset_run synth_1
launch_runs synth_1 -jobs 16
wait_on_run  synth_1
