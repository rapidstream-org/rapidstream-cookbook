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


create_project prj ./prj -part xcu55c-fsvh2892-2L-e
set_property board_part xilinx.com:au55c:part0:1.0 [current_project]
add_src_to_project /home/vagrantxiao24/ws_232/rapidstream-cookbook/benchmarks/vivado_flow/CNN/cnn13x8/build/kernel3/solution/syn/verilog

source ./design_1.tcl


make_wrapper -files [get_files ./prj/prj.srcs/sources_1/bd/design_1/design_1.bd] -top
add_files -norecurse ./prj/prj.gen/sources_1/bd/design_1/hdl/design_1_wrapper.v
set_property top design_1_wrapper [current_fileset]

#launch_runs synth_1 -jobs [getEnvInt "VIVADO_SYNTH_JOBS" 16]
#wait_on_run synth_1
#launch_runs impl_1 -to_step write_bitstream -jobs [getEnvInt "VIVADO_IMPL_JOBS" 16]
#wait_on_run impl_1


