
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



create_project prj ./prj -part ${PART_NUM} -force
if {$BOARD_PART == "dummy"} {
    puts "No board name is specified!"
} else {
    set_property board_part ${BOARD_PART} [current_project]
}

import_files ${SRC_DIR}
import_ip [glob ${SRC_DIR}/*/*.xci]
upgrade_ip -quiet [get_ips *]
add_files -fileset constrs_1 -norecurse ${SRC_DIR}/../xdc/floorplan.xdc
set_property top design_1_wrapper [current_fileset]

launch_runs synth_1 -jobs [getEnvInt "VIVADO_SYNTH_JOBS" 16]
wait_on_run synth_1
launch_runs impl_1 -to_step write_bitstream -jobs [getEnvInt "VIVADO_IMPL_JOBS" 16]
wait_on_run impl_1
