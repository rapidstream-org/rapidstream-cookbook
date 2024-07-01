if {${argc} != 3} {
	puts stderr "Should -tclargs <ipi source dir> <board name> <kernelFreq_hbmFreq (MHZ)>. Too few arguments. Exiting."
	exit 1
}

set SRC_ROOT        "[lindex $argv 0]"
set CARD            "[lindex $argv 1]"
set FREQS_MHz       "[lindex $argv 2]"
set values           [split $FREQS_MHz "_"]
set KL_FREQ_MHz     "[lindex $values 0]"
set HBM_FREQ_MHz    "[lindex $values 1]"

# Load the utils.tcl file
set SCRIPT_ROOT  "[file dirname [info script]]"
source ${SCRIPT_ROOT}/utils_${CARD}.tcl

# Get the misc parameters from the config file
set CONFIG_FILE "${SRC_ROOT}/json/config_${CARD}.json"
set result [get_configure_params ${CONFIG_FILE}]
lassign $result misc_params arg2hbm_dict

# Set some global variables
set PART [dict get $misc_params "part"]
set BOARD [dict get $misc_params "board"]

set _xil_proj_name_ "shell_${CARD}"

create_project ${_xil_proj_name_}_prj ${_xil_proj_name_}_${FREQS_MHz}M_prj -part ${PART} -force

# Set project properties
set obj [current_project]
set_property -name "board_part" -value ${BOARD} -objects $obj
add_src_to_project "${SRC_ROOT}/verilog"
add_files -fileset constrs_1 -norecurse ${SRC_ROOT}/xdc/only_pins_${CARD}.xdc
set_property target_constrs_file ${SRC_ROOT}/xdc/only_pins_${CARD}.xdc [current_fileset -constrset]

# create the bd design file
create_shell_design_1

# Change the DCM frequency for the kernel
set_kernel_frequency ${KL_FREQ_MHz}

# Change the DCM frequency for the hbm axi
set_hbm_frequency ${HBM_FREQ_MHz}

# Set the cl M_AXI buses to the correct frequencies
set_property CONFIG.FREQ_HZ [expr ${HBM_FREQ_MHz} * 1000000] [get_bd_intf_pins /cl_0/M_AXI_*]

set wrapper_path [make_wrapper -fileset sources_1 -files [ get_files -norecurse design_1.bd] -top]
add_files -norecurse -fileset sources_1 $wrapper_path

set obj [get_filesets sources_1]
set_property -name "top" -value "design_1_wrapper" -objects $obj
set_property -name "top_auto_set" -value "0" -objects $obj


#launch_runs synth_1 -jobs [expr [number_of_processor] / 4]
launch_runs synth_1 -jobs [getEnvInt "VIVADO_SYNTH_JOBS" 8]

wait_on_run synth_1

open_run synth_1 -name synth_1

write_checkpoint -force ${_xil_proj_name_}_${FREQS_MHz}M_prj/shell.dcp
