
proc getEnvInt { varName defaultIntValue } {
    set value [expr {[info exists ::env($varName)] ? $::env($varName) : $defaultIntValue}]
    return [expr {int($value)}]
}

if {${argc} != 3} {
    puts "Only got ${argc} arguments!"
	puts stderr "Should -tclargs <part_num> <board_part> <bd_tcl>. Too few arguments. Exiting."
	exit 1
}

set PART_NUM   "[lindex $argv 0]"
set BOARD_PART "[lindex $argv 1]"
set BD_TCL     "[lindex $argv 2]"


create_project prj ./prj -part ${PART_NUM} -force
if {$BOARD_PART == "dummy"} {
    puts "No board name is specified!"
} else {
    set_property board_part ${BOARD_PART} [current_project]
}

import_files run/dse/candidate_0/exported/design
import_ip [glob run/dse/candidate_0/exported/design/*/*.xci]
upgrade_ip -quiet [get_ips *]
generate_target synthesis [ get_files *.xci ]
add_files -fileset constrs_1 -norecurse run/dse/candidate_0/exported/xdc/floorplan.xdc

source ${BD_TCL}

make_wrapper -files [get_files ./prj/prj.srcs/sources_1/bd/design_1/design_1.bd] -top
add_files -norecurse ./prj/prj.gen/sources_1/bd/design_1/hdl/design_1_wrapper.v
set_property top design_1_wrapper [current_fileset]

launch_runs synth_1 -jobs [getEnvInt "VIVADO_SYNTH_JOBS" 16]
wait_on_run synth_1
launch_runs impl_1 -to_step write_bitstream -jobs [getEnvInt "VIVADO_IMPL_JOBS" 16]
wait_on_run impl_1
