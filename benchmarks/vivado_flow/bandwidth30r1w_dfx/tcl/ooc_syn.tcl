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

set _xil_proj_name_ "ooc_prj"

create_project ${_xil_proj_name_} ${_xil_proj_name_} -part ${PART} -force
set obj [current_project]
set_property -name "board_part" -value ${BOARD} -objects $obj

add_src_to_project ${SRC_DIR}/vivado/hdl

synth_design -top vadd_bw -part xcu50-fsvh2104-2-e -incremental_mode off -mode out_of_context
