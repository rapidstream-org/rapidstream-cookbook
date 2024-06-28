if {${argc} < 4} {
	puts stderr "Should -tclargs <PART> <cpp src>. Too few arguments. ($argv) Exiting."
	exit 1
}

set PART       "[lindex $argv 0]"
set CLK_PERIOD "[lindex $argv 1]"
set TOP        "[lindex $argv 2]"
set SRC_FILE   "[lindex $argv 3]"


open_project build/${TOP}
set_top ${TOP}
foreach src_file [lrange $argv 3 end] {
    add_files "${src_file}"
}
open_solution solution
set_part ${PART}
create_clock -period ${CLK_PERIOD}ns -name default
config_dataflow -strict_mode warning
#set_clock_uncertainty 27.000000%
config_rtl -enable_maxiConservative=1
config_interface -m_axi_addr64
config_sdx -target xocc

set_param hls.enable_hidden_option_error false
config_rtl -enableFreeRunPipeline=false
config_rtl -disableAutoFreeRunPipeline=true

# csim_design
csynth_design
# cosim_design -rtl verilog -setup

export_design -format xo -output ./${TOP}.xo
close_project
puts "HLS completed successfully"
exit
