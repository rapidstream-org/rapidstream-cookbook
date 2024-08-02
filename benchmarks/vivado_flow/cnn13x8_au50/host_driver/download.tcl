#-----------------------------------------------------------
# Vivado v2022.2 (64-bit)
# SW Build 3671981 on Fri Oct 14 04:59:54 MDT 2022
# IP Build 3669848 on Fri Oct 14 08:30:02 MDT 2022
# Start of session at: Tue Jul 18 13:26:27 2023
# Process ID: 2627
# Current directory: /home/ylxiao/ws_222/rapidShell/build
# Command line: vivado
# Log file: /home/ylxiao/ws_222/rapidShell/build/vivado.log
# Journal file: /home/ylxiao/ws_222/rapidShell/build/vivado.jou
# Running On: squark, OS: Linux, CPU Frequency: 2711.401 MHz, CPU Physical cores: 8, Host memory: 134893 MB
#-----------------------------------------------------------
set bit  "[lindex $argv 0]"
puts "Downloading ${bit}..."
open_hw_manager
connect_hw_server -allow_non_jtag
open_hw_target
current_hw_device [get_hw_devices xcu50_u55n_0]
refresh_hw_device -update_hw_probes false [lindex [get_hw_devices xcu50_u55n_0] 0]
set_property PROBES.FILE {} [get_hw_devices xcu50_u55n_0]
set_property FULL_PROBES.FILE {} [get_hw_devices xcu50_u55n_0]
set_property PROGRAM.FILE ${bit} [get_hw_devices xcu50_u55n_0]
program_hw_devices [get_hw_devices xcu50_u55n_0]
refresh_hw_device [lindex [get_hw_devices xcu50_u55n_0] 0]
