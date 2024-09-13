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

set _prj_name_ "project_1"
create_project -force ${_prj_name_} ${_prj_name_} -part xcvc1902-vsvd1760-2MP-e-S
set_property board_part xilinx.com:vck5000:part0:1.0 [current_project]
add_src_to_project ../v/vadd_bandwidth28r28w_placeholder
source ../tcl/design_1.tcl
update_compile_order -fileset sources_1
make_wrapper -files [get_files ${_prj_name_}/${_prj_name_}.srcs/sources_1/bd/design_1/design_1.bd] -top
add_files -norecurse ${_prj_name_}/${_prj_name_}.gen/sources_1/bd/design_1/hdl/design_1_wrapper.v
update_compile_order -fileset sources_1
set_property top design_1_wrapper [current_fileset]
add_files -fileset constrs_1 ../xdc/pdef1.xdc
set_property target_constrs_file ../xdc/pdef1.xdc [current_fileset -constrset]

launch_runs synth_1 -jobs 16
wait_on_run synth_1
open_run synth_1 -name synth_1
write_checkpoint -force overlay.dcp

#launch_runs impl_1 -to_step write_device_image -jobs 16
#wait_on_run impl_1
#write_hw_platform -fixed -include_bit -force -file$ {_prj_name_}/design_1_wrapper.xsa
