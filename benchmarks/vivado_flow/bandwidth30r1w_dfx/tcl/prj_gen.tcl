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

set PART "xcu50-fsvh2104-2-e"
set BOARD "xilinx.com:au50dd:part0:1.0"
set SRC_DIR ".."

set _xil_proj_name_ "prj"

create_project ${_xil_proj_name_} ${_xil_proj_name_} -part ${PART} -force
set obj [current_project]
set_property -name "board_part" -value ${BOARD} -objects $obj

add_src_to_project ${SRC_DIR}/vivado/hdl_placeholder
add_src_to_project ${SRC_DIR}/vivado/verilog
add_files -fileset constrs_1 -norecurse ${SRC_DIR}/vivado/only_pins_au50.xdc
source ${SRC_DIR}/vivado/design_1.tcl

make_wrapper -files [get_files prj/prj.srcs/sources_1/bd/design_1/design_1.bd] -top
set wrapper_path [make_wrapper -fileset sources_1 -files [ get_files -norecurse design_1.bd] -top]
add_files -norecurse -fileset sources_1 $wrapper_path
set_property top design_1_wrapper [current_fileset]
update_compile_order -fileset sources_1
