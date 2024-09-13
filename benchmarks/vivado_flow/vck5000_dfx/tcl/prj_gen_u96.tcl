
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
create_project ${_prj_name_} ${_prj_name_} -part xczu3eg-sbva484-1-i
set_property board_part avnet.com:ultra96v2:part0:1.2 [current_project]
add_src_to_project ../v/vadd_bandwidth1r1w
source ../tcl/design_1.tcl
update_compile_order -fileset sources_1
make_wrapper -files [get_files ${_prj_name_}/${_prj_name_}.srcs/sources_1/bd/design_1/design_1.bd] -top
add_files -norecurse ${_prj_name_}/${_prj_name_}.gen/sources_1/bd/design_1/hdl/design_1_wrapper.v
set_property top design_1_wrapper [current_fileset]

#launch_runs impl_1 -to_step write_bitstream -jobs 16
#wait_on_run impl_1
#write_hw_platform -fixed -include_bit -force -file ${_prj_name_}/design_1_wrapper.xsa
