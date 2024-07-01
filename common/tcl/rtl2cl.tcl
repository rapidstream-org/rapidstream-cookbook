if {${argc} != 5} {
	puts stderr "Should -tclargs <ipi source dir> <APP> <CARD> <kernelFreq_hbmFreq (MHZ)> <run_syn/run_gen>. Too few arguments. Exiting."
	exit 1
}

set DESIGN_ROOT  "[lindex $argv 0]"
set APP          "[lindex $argv 1]"
set CARD         "[lindex $argv 2]"
set FREQS        "[lindex $argv 3]"
set RUN_STEP     "[lindex $argv 4]"
set values        [split $FREQS "_"]
set KL_FREQ_MHz   [lindex $values 0]
set HBM_FREQ_MHz  [lindex $values 1]

set _xil_proj_name_ "${APP}_${CARD}"

# Load the utils.tcl file
set SCRIPT_ROOT  "[file dirname [info script]]"
source ${SCRIPT_ROOT}/utils_${CARD}.tcl

# Get the misc parameters from the config file
set CONFIG_FILE "${DESIGN_ROOT}/json/config_${CARD}.json"
set result [get_configure_params ${CONFIG_FILE}]
lassign $result misc_params arg2hbm

# Set the glabal variables
set PART           [dict get $misc_params "part"]
set BOARD          [dict get $misc_params "board"]
set KERNEL_NAME    [dict get $misc_params "kernel_name"]


# Create a vivado project
create_project ${_xil_proj_name_}_cl_prj ${_xil_proj_name_}_${FREQS}M_cl_prj -part ${PART} -force

# Set project properties
set obj [current_project]
set_property -name "board_part" -value ${BOARD} -objects $obj

# Add the source files to the project
add_src_to_project "${DESIGN_ROOT}/${APP}/solution/syn/verilog"
add_src_to_project "${DESIGN_ROOT}/hdl"

# Create Custom Logic bd
create_cl ${misc_params} ${arg2hbm} ${HBM_FREQ_MHz}

# Connect unused ports to dummy ports
add_dummy_ports ${HBM_FREQ_MHz}

# Create a HDL wrapper for the design
set wrapper_path [make_wrapper -fileset sources_1 -files [ get_files -norecurse cl.bd] -top]
add_files -norecurse -fileset sources_1 $wrapper_path
set obj [get_filesets sources_1]
set_property -name "top" -value "cl_wrapper" -objects $obj
set_property -name "top_auto_set" -value "0" -objects $obj


if {${RUN_STEP} == "run_syn"} {
    set_property -name {STEPS.SYNTH_DESIGN.ARGS.MORE OPTIONS} -value {-mode out_of_context} -objects [get_runs synth_1]
    launch_runs synth_1 -jobs [getEnvInt "VIVADO_SYNTH_JOBS" 8]
	wait_on_run synth_1
	open_run synth_1 -name synth_1
	write_checkpoint -force ${_xil_proj_name_}_${FREQS}M_cl_prj/cl.dcp
} else {
	generate_target all [get_files ${_xil_proj_name_}_${FREQS}M_cl_prj/${_xil_proj_name_}_cl_prj.srcs/sources_1/bd/cl/cl.bd]

}
