
proc getEnvInt { varName defaultIntValue } {
    set value [expr {[info exists ::env($varName)] ? $::env($varName) : $defaultIntValue}]
    return [expr {int($value)}]
}

if {${argc} != 4} {
    puts "Only got ${argc} arguments!"
	puts stderr "Should -tclargs <part_num> <board_part> <bd_tcl> <source_dir>. Too few arguments. Exiting."
	exit 1
}

set PART_NUM   "[lindex $argv 0]"
set BOARD_PART "[lindex $argv 1]"
set BD_TCL     "[lindex $argv 2]"
set SRC_DIR    "[lindex $argv 3]"



create_project prj ./prj -part ${PART_NUM} -force
if {$BOARD_PART == "dummy"} {
    puts "No board name is specified!"
} else {
    set_property board_part ${BOARD_PART} [current_project]
}

import_files ${SRC_DIR}/hls/solution/syn/verilog
source ${SRC_DIR}/hls/solution/syn/verilog/kernel3_fadd_32ns_32ns_32_10_full_dsp_1_ip.tcl
source ${SRC_DIR}/hls/solution/syn/verilog/kernel3_fmul_32ns_32ns_32_5_max_dsp_1_ip.tcl
import_files ${SRC_DIR}/hdl/gnd_driver.v
add_files -fileset constrs_1 -norecurse ${SRC_DIR}/xdc/only_pins_au50.xdc

source ${BD_TCL}

make_wrapper -files [get_files ./prj/prj.srcs/sources_1/bd/design_1/design_1.bd] -top
add_files -norecurse ./prj/prj.gen/sources_1/bd/design_1/hdl/design_1_wrapper.v
set_property top design_1_wrapper [current_fileset]

#launch_runs synth_1 -jobs [getEnvInt "VIVADO_SYNTH_JOBS" 16]
#wait_on_run synth_1
#launch_runs impl_1 -to_step write_bitstream -jobs [getEnvInt "VIVADO_IMPL_JOBS" 16]
#wait_on_run impl_1
