
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



proc add_src_to_project { dir } {
  set contents [glob -nocomplain -directory $dir *]
  foreach item $contents {
    if { [regexp {.*\.tcl} $item] } {
      source $item
    } else {
      add_files $item
    }
  }
}

proc getEnvInt { varName defaultIntValue } {
  set value [expr {[info exists ::env($varName)] ? $::env($varName) : $defaultIntValue}]
  return [expr {int($value)}]
}


create_project -force prj ./prj -part ${PART_NUM}
set_property board_part ${BOARD_PART} [current_project]
add_src_to_project ${SRC_DIR}/hls/solution/syn/verilog
add_files -fileset constrs_1 -norecurse ${SRC_DIR}/xdc/pins.xdc

# get prj_gen.tcl dir. design_1.tcl should be in the same directory.
set SCRIPT_ROOT  "[file dirname [info script]]"
source ${SCRIPT_ROOT}/design_1.tcl


make_wrapper -files [get_files ./prj/prj.srcs/sources_1/bd/design_1/design_1.bd] -top
add_files -norecurse ./prj/prj.gen/sources_1/bd/design_1/hdl/design_1_wrapper.v
set_property top design_1_wrapper [current_fileset]

launch_runs synth_1 -jobs [getEnvInt "VIVADO_SYNTH_JOBS" 16]
wait_on_run synth_1
launch_runs impl_1 -to_step write_bitstream -jobs [getEnvInt "VIVADO_IMPL_JOBS" 16]
wait_on_run impl_1
