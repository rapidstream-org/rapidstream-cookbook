
proc getEnvInt { varName defaultIntValue } {
    set value [expr {[info exists ::env($varName)] ? $::env($varName) : $defaultIntValue}]
    return [expr {int($value)}]
}

if {${argc} != 3} {
    puts "Only got ${argc} arguments!"
	puts stderr "Should -tclargs <part_num> <board_part> <source_dir>. Too few arguments. Exiting."
	exit 1
}

set PART_NUM   "[lindex $argv 0]"
set BOARD_PART "[lindex $argv 1]"
set SRC_DIR    "[lindex $argv 2]"



create_project prj_vivado ./prj_vivado -part ${PART_NUM} -force
if {$BOARD_PART == "dummy"} {
    puts "No board name is specified!"
} else {
    set_property board_part ${BOARD_PART} [current_project]
}

import_files ${SRC_DIR}/hdl
import_files ${SRC_DIR}/hls/solution/syn/verilog
import_ip [glob ${SRC_DIR}/xci/ip/*/*.xci]
source ${SRC_DIR}/hls/solution/syn/verilog/kernel3_fadd_32ns_32ns_32_10_full_dsp_1_ip.tcl
source ${SRC_DIR}/hls/solution/syn/verilog/kernel3_fmul_32ns_32ns_32_5_max_dsp_1_ip.tcl
upgrade_ip -quiet [get_ips *]

set_property top design_1_wrapper [current_fileset]

launch_runs synth_1 -jobs [getEnvInt "VIVADO_SYNTH_JOBS" 16]
wait_on_run synth_1
launch_runs impl_1 -to_step write_bitstream -jobs [getEnvInt "VIVADO_IMPL_JOBS" 16]
wait_on_run impl_1
