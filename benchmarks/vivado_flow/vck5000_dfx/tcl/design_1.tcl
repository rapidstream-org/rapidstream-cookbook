
################################################################
# This is a generated script based on design: design_1
#
# Though there are limitations about the generated script,
# the main purpose of this utility is to make learning
# IP Integrator Tcl commands easier.
################################################################

namespace eval _tcl {
proc get_script_folder {} {
   set script_path [file normalize [info script]]
   set script_folder [file dirname $script_path]
   return $script_folder
}
}
variable script_folder
set script_folder [_tcl::get_script_folder]

################################################################
# Check if script is running in correct Vivado version.
################################################################
set scripts_vivado_version 2022.2
set current_vivado_version [version -short]

if { [string first $scripts_vivado_version $current_vivado_version] == -1 } {
   puts ""
   catch {common::send_gid_msg -ssname BD::TCL -id 2041 -severity "ERROR" "This script was generated using Vivado <$scripts_vivado_version> and is being run in <$current_vivado_version> of Vivado. Please run the script in Vivado <$scripts_vivado_version> then open the design in Vivado <$current_vivado_version>. Upgrade the design by running \"Tools => Report => Report IP Status...\", then run write_bd_tcl to create an updated script."}

   return 1
}

################################################################
# START
################################################################

# To test this script, run the following commands from Vivado Tcl console:
# source design_1_script.tcl


# The design that will be created by this Tcl script contains the following
# module references:
# vadd_bw

# Please add the sources of those modules before sourcing this Tcl script.

# If there is no project opened, this script will create a
# project, but make sure you do not have an existing project
# <./myproj/project_1.xpr> in the current working folder.

set list_projs [get_projects -quiet]
if { $list_projs eq "" } {
   create_project project_1 myproj -part xcvc1902-vsvd1760-2MP-e-S
   set_property BOARD_PART xilinx.com:vck5000:part0:1.0 [current_project]
}


# CHANGE DESIGN NAME HERE
variable design_name
set design_name design_1

# If you do not already have an existing IP Integrator design open,
# you can create a design using the following command:
#    create_bd_design $design_name

# Creating design if needed
set errMsg ""
set nRet 0

set cur_design [current_bd_design -quiet]
set list_cells [get_bd_cells -quiet]

if { ${design_name} eq "" } {
   # USE CASES:
   #    1) Design_name not set

   set errMsg "Please set the variable <design_name> to a non-empty value."
   set nRet 1

} elseif { ${cur_design} ne "" && ${list_cells} eq "" } {
   # USE CASES:
   #    2): Current design opened AND is empty AND names same.
   #    3): Current design opened AND is empty AND names diff; design_name NOT in project.
   #    4): Current design opened AND is empty AND names diff; design_name exists in project.

   if { $cur_design ne $design_name } {
      common::send_gid_msg -ssname BD::TCL -id 2001 -severity "INFO" "Changing value of <design_name> from <$design_name> to <$cur_design> since current design is empty."
      set design_name [get_property NAME $cur_design]
   }
   common::send_gid_msg -ssname BD::TCL -id 2002 -severity "INFO" "Constructing design in IPI design <$cur_design>..."

} elseif { ${cur_design} ne "" && $list_cells ne "" && $cur_design eq $design_name } {
   # USE CASES:
   #    5) Current design opened AND has components AND same names.

   set errMsg "Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 1
} elseif { [get_files -quiet ${design_name}.bd] ne "" } {
   # USE CASES:
   #    6) Current opened design, has components, but diff names, design_name exists in project.
   #    7) No opened design, design_name exists in project.

   set errMsg "Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 2

} else {
   # USE CASES:
   #    8) No opened design, design_name not in project.
   #    9) Current opened design, has components, but diff names, design_name not in project.

   common::send_gid_msg -ssname BD::TCL -id 2003 -severity "INFO" "Currently there is no design <$design_name> in project, so creating one..."

   create_bd_design $design_name

   common::send_gid_msg -ssname BD::TCL -id 2004 -severity "INFO" "Making design <$design_name> as current_bd_design."
   current_bd_design $design_name

}

common::send_gid_msg -ssname BD::TCL -id 2005 -severity "INFO" "Currently the variable <design_name> is equal to \"$design_name\"."

if { $nRet != 0 } {
   catch {common::send_gid_msg -ssname BD::TCL -id 2006 -severity "ERROR" $errMsg}
   return $nRet
}

set bCheckIPsPassed 1
##################################################################
# CHECK IPs
##################################################################
set bCheckIPs 1
if { $bCheckIPs == 1 } {
   set list_check_ips "\
xilinx.com:ip:axi_noc:1.0\
xilinx.com:ip:proc_sys_reset:5.0\
xilinx.com:ip:smartconnect:1.0\
xilinx.com:ip:versal_cips:3.3\
"

   set list_ips_missing ""
   common::send_gid_msg -ssname BD::TCL -id 2011 -severity "INFO" "Checking if the following IPs exist in the project's IP catalog: $list_check_ips ."

   foreach ip_vlnv $list_check_ips {
      set ip_obj [get_ipdefs -all $ip_vlnv]
      if { $ip_obj eq "" } {
         lappend list_ips_missing $ip_vlnv
      }
   }

   if { $list_ips_missing ne "" } {
      catch {common::send_gid_msg -ssname BD::TCL -id 2012 -severity "ERROR" "The following IPs are not found in the IP Catalog:\n  $list_ips_missing\n\nResolution: Please add the repository containing the IP(s) to the project." }
      set bCheckIPsPassed 0
   }

}

##################################################################
# CHECK Modules
##################################################################
set bCheckModules 1
if { $bCheckModules == 1 } {
   set list_check_mods "\
vadd_bw\
"

   set list_mods_missing ""
   common::send_gid_msg -ssname BD::TCL -id 2020 -severity "INFO" "Checking if the following modules exist in the project's sources: $list_check_mods ."

   foreach mod_vlnv $list_check_mods {
      if { [can_resolve_reference $mod_vlnv] == 0 } {
         lappend list_mods_missing $mod_vlnv
      }
   }

   if { $list_mods_missing ne "" } {
      catch {common::send_gid_msg -ssname BD::TCL -id 2021 -severity "ERROR" "The following module(s) are not found in the project: $list_mods_missing" }
      common::send_gid_msg -ssname BD::TCL -id 2022 -severity "INFO" "Please add source files for the missing module(s) above."
      set bCheckIPsPassed 0
   }
}

if { $bCheckIPsPassed != 1 } {
  common::send_gid_msg -ssname BD::TCL -id 2023 -severity "WARNING" "Will not continue with creation of design due to the error(s) above."
  return 3
}

##################################################################
# DESIGN PROCs
##################################################################



# Procedure to create entire design; Provide argument to make
# procedure reusable. If parentCell is "", will use root.
proc create_root_design { parentCell } {

  variable script_folder
  variable design_name

  if { $parentCell eq "" } {
     set parentCell [get_bd_cells /]
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2090 -severity "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2091 -severity "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj


  # Create interface ports
  set ddr4_c0_sysclk [ create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:diff_clock_rtl:1.0 ddr4_c0_sysclk ]
  set_property -dict [ list \
   CONFIG.FREQ_HZ {200000000} \
   ] $ddr4_c0_sysclk

  set ddr4_sdram_c0 [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:ddr4_rtl:1.0 ddr4_sdram_c0 ]


  # Create ports

  # Create instance: axi_noc_0, and set properties
  set axi_noc_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_noc:1.0 axi_noc_0 ]
  set_property -dict [list \
    CONFIG.CH0_DDR4_0_BOARD_INTERFACE {ddr4_sdram_c0} \
    CONFIG.NUM_CLKS {5} \
    CONFIG.NUM_MI {0} \
    CONFIG.NUM_NSI {1} \
    CONFIG.NUM_SI {5} \
    CONFIG.SI_SIDEBAND_PINS {0,0,0,0,0} \
    CONFIG.sys_clk0_BOARD_INTERFACE {ddr4_c0_sysclk} \
  ] $axi_noc_0


  set_property -dict [ list \
   CONFIG.CONNECTIONS {MC_0 { read_bw {100} write_bw {100} read_avg_burst {4} write_avg_burst {4}}} \
   CONFIG.DEST_IDS {M00_AXI:0x0} \
   CONFIG.NOC_PARAMS {} \
   CONFIG.CATEGORY {ps_cci} \
 ] [get_bd_intf_pins /axi_noc_0/S00_AXI]

  set_property -dict [ list \
   CONFIG.CONNECTIONS {MC_0 { read_bw {1720} write_bw {1720} read_avg_burst {4} write_avg_burst {4}}} \
 ] [get_bd_intf_pins /axi_noc_0/S00_INI]

  set_property -dict [ list \
   CONFIG.CONNECTIONS {MC_0 { read_bw {100} write_bw {100} read_avg_burst {4} write_avg_burst {4}}} \
   CONFIG.DEST_IDS {M00_AXI:0x0} \
   CONFIG.NOC_PARAMS {} \
   CONFIG.CATEGORY {ps_cci} \
 ] [get_bd_intf_pins /axi_noc_0/S01_AXI]

  set_property -dict [ list \
   CONFIG.CONNECTIONS {MC_0 { read_bw {1720} write_bw {1720} read_avg_burst {4} write_avg_burst {4}}} \
   CONFIG.DEST_IDS {M00_AXI:0x0} \
   CONFIG.NOC_PARAMS {} \
   CONFIG.CATEGORY {ps_cci} \
 ] [get_bd_intf_pins /axi_noc_0/S02_AXI]

  set_property -dict [ list \
   CONFIG.CONNECTIONS {MC_0 { read_bw {1720} write_bw {1720} read_avg_burst {4} write_avg_burst {4}}} \
   CONFIG.DEST_IDS {M00_AXI:0x0} \
   CONFIG.NOC_PARAMS {} \
   CONFIG.CATEGORY {ps_cci} \
 ] [get_bd_intf_pins /axi_noc_0/S03_AXI]

  set_property -dict [ list \
   CONFIG.CONNECTIONS {MC_0 { read_bw {1720} write_bw {1720} read_avg_burst {4} write_avg_burst {4}}} \
   CONFIG.DEST_IDS {M00_AXI:0x0} \
   CONFIG.NOC_PARAMS {} \
   CONFIG.CATEGORY {ps_pmc} \
 ] [get_bd_intf_pins /axi_noc_0/S04_AXI]

  set_property -dict [ list \
   CONFIG.ASSOCIATED_BUSIF {S00_AXI} \
 ] [get_bd_pins /axi_noc_0/aclk0]

  set_property -dict [ list \
   CONFIG.ASSOCIATED_BUSIF {S01_AXI} \
 ] [get_bd_pins /axi_noc_0/aclk1]

  set_property -dict [ list \
   CONFIG.ASSOCIATED_BUSIF {S02_AXI} \
 ] [get_bd_pins /axi_noc_0/aclk2]

  set_property -dict [ list \
   CONFIG.ASSOCIATED_BUSIF {S03_AXI} \
 ] [get_bd_pins /axi_noc_0/aclk3]

  set_property -dict [ list \
   CONFIG.ASSOCIATED_BUSIF {S04_AXI} \
 ] [get_bd_pins /axi_noc_0/aclk4]

  # Create instance: axi_noc_1, and set properties
  set axi_noc_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_noc:1.0 axi_noc_1 ]
  set_property -dict [list \
    CONFIG.NUM_MI {0} \
    CONFIG.NUM_NMI {1} \
    CONFIG.NUM_SI {28} \
  ] $axi_noc_1


  set_property -dict [ list \
   CONFIG.CONNECTIONS {M00_INI { read_bw {100} write_bw {100} read_avg_burst {4} write_avg_burst {4}}} \
   CONFIG.DEST_IDS {} \
   CONFIG.NOC_PARAMS {} \
   CONFIG.CATEGORY {pl} \
 ] [get_bd_intf_pins /axi_noc_1/S00_AXI]

  set_property -dict [ list \
   CONFIG.CONNECTIONS {M00_INI { read_bw {100} write_bw {100} read_avg_burst {4} write_avg_burst {4}}} \
   CONFIG.DEST_IDS {} \
   CONFIG.NOC_PARAMS {} \
   CONFIG.CATEGORY {pl} \
 ] [get_bd_intf_pins /axi_noc_1/S01_AXI]

  set_property -dict [ list \
   CONFIG.CONNECTIONS {M00_INI { read_bw {100} write_bw {100} read_avg_burst {4} write_avg_burst {4}}} \
   CONFIG.DEST_IDS {} \
   CONFIG.NOC_PARAMS {} \
   CONFIG.CATEGORY {pl} \
 ] [get_bd_intf_pins /axi_noc_1/S02_AXI]

  set_property -dict [ list \
   CONFIG.CONNECTIONS {M00_INI { read_bw {100} write_bw {100} read_avg_burst {4} write_avg_burst {4}}} \
   CONFIG.DEST_IDS {} \
   CONFIG.NOC_PARAMS {} \
   CONFIG.CATEGORY {pl} \
 ] [get_bd_intf_pins /axi_noc_1/S03_AXI]

  set_property -dict [ list \
   CONFIG.CONNECTIONS {M00_INI { read_bw {100} write_bw {100} read_avg_burst {4} write_avg_burst {4}}} \
   CONFIG.DEST_IDS {} \
   CONFIG.NOC_PARAMS {} \
   CONFIG.CATEGORY {pl} \
 ] [get_bd_intf_pins /axi_noc_1/S04_AXI]

  set_property -dict [ list \
   CONFIG.CONNECTIONS {M00_INI { read_bw {100} write_bw {100} read_avg_burst {4} write_avg_burst {4}}} \
   CONFIG.DEST_IDS {} \
   CONFIG.NOC_PARAMS {} \
   CONFIG.CATEGORY {pl} \
 ] [get_bd_intf_pins /axi_noc_1/S05_AXI]

  set_property -dict [ list \
   CONFIG.CONNECTIONS {M00_INI { read_bw {100} write_bw {100} read_avg_burst {4} write_avg_burst {4}}} \
   CONFIG.DEST_IDS {} \
   CONFIG.NOC_PARAMS {} \
   CONFIG.CATEGORY {pl} \
 ] [get_bd_intf_pins /axi_noc_1/S06_AXI]

  set_property -dict [ list \
   CONFIG.CONNECTIONS {M00_INI { read_bw {100} write_bw {100} read_avg_burst {4} write_avg_burst {4}}} \
   CONFIG.DEST_IDS {} \
   CONFIG.NOC_PARAMS {} \
   CONFIG.CATEGORY {pl} \
 ] [get_bd_intf_pins /axi_noc_1/S07_AXI]

  set_property -dict [ list \
   CONFIG.CONNECTIONS {M00_INI { read_bw {100} write_bw {100} read_avg_burst {4} write_avg_burst {4}}} \
   CONFIG.DEST_IDS {} \
   CONFIG.NOC_PARAMS {} \
   CONFIG.CATEGORY {pl} \
 ] [get_bd_intf_pins /axi_noc_1/S08_AXI]

  set_property -dict [ list \
   CONFIG.CONNECTIONS {M00_INI { read_bw {100} write_bw {100} read_avg_burst {4} write_avg_burst {4}}} \
   CONFIG.DEST_IDS {} \
   CONFIG.NOC_PARAMS {} \
   CONFIG.CATEGORY {pl} \
 ] [get_bd_intf_pins /axi_noc_1/S09_AXI]

  set_property -dict [ list \
   CONFIG.CONNECTIONS {M00_INI { read_bw {100} write_bw {100} read_avg_burst {4} write_avg_burst {4}}} \
   CONFIG.DEST_IDS {} \
   CONFIG.NOC_PARAMS {} \
   CONFIG.CATEGORY {pl} \
 ] [get_bd_intf_pins /axi_noc_1/S10_AXI]

  set_property -dict [ list \
   CONFIG.CONNECTIONS {M00_INI { read_bw {100} write_bw {100} read_avg_burst {4} write_avg_burst {4}}} \
   CONFIG.DEST_IDS {} \
   CONFIG.NOC_PARAMS {} \
   CONFIG.CATEGORY {pl} \
 ] [get_bd_intf_pins /axi_noc_1/S11_AXI]

  set_property -dict [ list \
   CONFIG.CONNECTIONS {M00_INI { read_bw {100} write_bw {100} read_avg_burst {4} write_avg_burst {4}}} \
   CONFIG.DEST_IDS {} \
   CONFIG.NOC_PARAMS {} \
   CONFIG.CATEGORY {pl} \
 ] [get_bd_intf_pins /axi_noc_1/S12_AXI]

  set_property -dict [ list \
   CONFIG.CONNECTIONS {M00_INI { read_bw {100} write_bw {100} read_avg_burst {4} write_avg_burst {4}}} \
   CONFIG.DEST_IDS {} \
   CONFIG.NOC_PARAMS {} \
   CONFIG.CATEGORY {pl} \
 ] [get_bd_intf_pins /axi_noc_1/S13_AXI]

  set_property -dict [ list \
   CONFIG.CONNECTIONS {M00_INI { read_bw {100} write_bw {100} read_avg_burst {4} write_avg_burst {4}}} \
   CONFIG.DEST_IDS {} \
   CONFIG.NOC_PARAMS {} \
   CONFIG.CATEGORY {pl} \
 ] [get_bd_intf_pins /axi_noc_1/S14_AXI]

  set_property -dict [ list \
   CONFIG.CONNECTIONS {M00_INI { read_bw {100} write_bw {100} read_avg_burst {4} write_avg_burst {4}}} \
   CONFIG.DEST_IDS {} \
   CONFIG.NOC_PARAMS {} \
   CONFIG.CATEGORY {pl} \
 ] [get_bd_intf_pins /axi_noc_1/S15_AXI]

  set_property -dict [ list \
   CONFIG.CONNECTIONS {M00_INI { read_bw {100} write_bw {100} read_avg_burst {4} write_avg_burst {4}}} \
   CONFIG.DEST_IDS {} \
   CONFIG.NOC_PARAMS {} \
   CONFIG.CATEGORY {pl} \
 ] [get_bd_intf_pins /axi_noc_1/S16_AXI]

  set_property -dict [ list \
   CONFIG.CONNECTIONS {M00_INI { read_bw {100} write_bw {100} read_avg_burst {4} write_avg_burst {4}}} \
   CONFIG.DEST_IDS {} \
   CONFIG.NOC_PARAMS {} \
   CONFIG.CATEGORY {pl} \
 ] [get_bd_intf_pins /axi_noc_1/S17_AXI]

  set_property -dict [ list \
   CONFIG.CONNECTIONS {M00_INI { read_bw {100} write_bw {100} read_avg_burst {4} write_avg_burst {4}}} \
   CONFIG.DEST_IDS {} \
   CONFIG.NOC_PARAMS {} \
   CONFIG.CATEGORY {pl} \
 ] [get_bd_intf_pins /axi_noc_1/S18_AXI]

  set_property -dict [ list \
   CONFIG.CONNECTIONS {M00_INI { read_bw {100} write_bw {100} read_avg_burst {4} write_avg_burst {4}}} \
   CONFIG.DEST_IDS {} \
   CONFIG.NOC_PARAMS {} \
   CONFIG.CATEGORY {pl} \
 ] [get_bd_intf_pins /axi_noc_1/S19_AXI]

  set_property -dict [ list \
   CONFIG.CONNECTIONS {M00_INI { read_bw {100} write_bw {100} read_avg_burst {4} write_avg_burst {4}}} \
   CONFIG.DEST_IDS {} \
   CONFIG.NOC_PARAMS {} \
   CONFIG.CATEGORY {pl} \
 ] [get_bd_intf_pins /axi_noc_1/S20_AXI]

  set_property -dict [ list \
   CONFIG.CONNECTIONS {M00_INI { read_bw {100} write_bw {100} read_avg_burst {4} write_avg_burst {4}}} \
   CONFIG.DEST_IDS {} \
   CONFIG.NOC_PARAMS {} \
   CONFIG.CATEGORY {pl} \
 ] [get_bd_intf_pins /axi_noc_1/S21_AXI]

  set_property -dict [ list \
   CONFIG.CONNECTIONS {M00_INI { read_bw {100} write_bw {100} read_avg_burst {4} write_avg_burst {4}}} \
   CONFIG.DEST_IDS {} \
   CONFIG.NOC_PARAMS {} \
   CONFIG.CATEGORY {pl} \
 ] [get_bd_intf_pins /axi_noc_1/S22_AXI]

  set_property -dict [ list \
   CONFIG.CONNECTIONS {M00_INI { read_bw {100} write_bw {100} read_avg_burst {4} write_avg_burst {4}}} \
   CONFIG.DEST_IDS {} \
   CONFIG.NOC_PARAMS {} \
   CONFIG.CATEGORY {pl} \
 ] [get_bd_intf_pins /axi_noc_1/S23_AXI]

  set_property -dict [ list \
   CONFIG.CONNECTIONS {M00_INI { read_bw {100} write_bw {100} read_avg_burst {4} write_avg_burst {4}}} \
   CONFIG.DEST_IDS {} \
   CONFIG.NOC_PARAMS {} \
   CONFIG.CATEGORY {pl} \
 ] [get_bd_intf_pins /axi_noc_1/S24_AXI]

  set_property -dict [ list \
   CONFIG.CONNECTIONS {M00_INI { read_bw {100} write_bw {100} read_avg_burst {4} write_avg_burst {4}}} \
   CONFIG.DEST_IDS {} \
   CONFIG.NOC_PARAMS {} \
   CONFIG.CATEGORY {pl} \
 ] [get_bd_intf_pins /axi_noc_1/S25_AXI]

  set_property -dict [ list \
   CONFIG.CONNECTIONS {M00_INI { read_bw {100} write_bw {100} read_avg_burst {4} write_avg_burst {4}}} \
   CONFIG.DEST_IDS {} \
   CONFIG.NOC_PARAMS {} \
   CONFIG.CATEGORY {pl} \
 ] [get_bd_intf_pins /axi_noc_1/S26_AXI]

  set_property -dict [ list \
   CONFIG.CONNECTIONS {M00_INI { read_bw {100} write_bw {100} read_avg_burst {4} write_avg_burst {4}}} \
   CONFIG.DEST_IDS {} \
   CONFIG.NOC_PARAMS {} \
   CONFIG.CATEGORY {pl} \
 ] [get_bd_intf_pins /axi_noc_1/S27_AXI]

  set_property -dict [ list \
   CONFIG.ASSOCIATED_BUSIF {S00_AXI:S01_AXI:S02_AXI:S03_AXI:S04_AXI:S05_AXI:S06_AXI:S07_AXI:S08_AXI:S09_AXI:S10_AXI:S11_AXI:S12_AXI:S13_AXI:S14_AXI:S15_AXI:S16_AXI:S17_AXI:S18_AXI:S19_AXI:S20_AXI:S21_AXI:S22_AXI:S23_AXI:S24_AXI:S25_AXI:S26_AXI:S27_AXI} \
 ] [get_bd_pins /axi_noc_1/aclk0]

  # Create instance: proc_sys_reset_0, and set properties
  set proc_sys_reset_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 proc_sys_reset_0 ]

  # Create instance: smartconnect_0, and set properties
  set smartconnect_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:smartconnect:1.0 smartconnect_0 ]
  set_property -dict [list \
    CONFIG.NUM_CLKS {1} \
    CONFIG.NUM_SI {1} \
  ] $smartconnect_0


  # Create instance: vadd_bw_0, and set properties
  set block_name vadd_bw
  set block_cell_name vadd_bw_0
  if { [catch {set vadd_bw_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $vadd_bw_0 eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }

  set_property -dict [ list \
   CONFIG.FREQ_HZ {99999001} \
   CONFIG.CLK_DOMAIN {bd_70da_pspmc_0_0_pl0_ref_clk} \
 ] [get_bd_intf_pins /vadd_bw_0/m_axi_rmem0]

  set_property -dict [ list \
   CONFIG.FREQ_HZ {99999001} \
 ] [get_bd_intf_pins /vadd_bw_0/m_axi_rmem1]

  set_property -dict [ list \
   CONFIG.FREQ_HZ {99999001} \
 ] [get_bd_intf_pins /vadd_bw_0/m_axi_rmem2]

  set_property -dict [ list \
   CONFIG.FREQ_HZ {99999001} \
 ] [get_bd_intf_pins /vadd_bw_0/m_axi_rmem3]

  set_property -dict [ list \
   CONFIG.FREQ_HZ {99999001} \
 ] [get_bd_intf_pins /vadd_bw_0/m_axi_rmem4]

  set_property -dict [ list \
   CONFIG.FREQ_HZ {99999001} \
 ] [get_bd_intf_pins /vadd_bw_0/m_axi_rmem5]

  set_property -dict [ list \
   CONFIG.FREQ_HZ {99999001} \
 ] [get_bd_intf_pins /vadd_bw_0/m_axi_rmem6]

  set_property -dict [ list \
   CONFIG.FREQ_HZ {99999001} \
 ] [get_bd_intf_pins /vadd_bw_0/m_axi_rmem7]

  set_property -dict [ list \
   CONFIG.FREQ_HZ {99999001} \
 ] [get_bd_intf_pins /vadd_bw_0/m_axi_rmem8]

  set_property -dict [ list \
   CONFIG.FREQ_HZ {99999001} \
 ] [get_bd_intf_pins /vadd_bw_0/m_axi_rmem9]

  set_property -dict [ list \
   CONFIG.FREQ_HZ {99999001} \
 ] [get_bd_intf_pins /vadd_bw_0/m_axi_rmem10]

  set_property -dict [ list \
   CONFIG.FREQ_HZ {99999001} \
 ] [get_bd_intf_pins /vadd_bw_0/m_axi_rmem11]

  set_property -dict [ list \
   CONFIG.FREQ_HZ {99999001} \
 ] [get_bd_intf_pins /vadd_bw_0/m_axi_rmem12]

  set_property -dict [ list \
   CONFIG.FREQ_HZ {99999001} \
 ] [get_bd_intf_pins /vadd_bw_0/m_axi_rmem13]

  set_property -dict [ list \
   CONFIG.FREQ_HZ {99999001} \
 ] [get_bd_intf_pins /vadd_bw_0/m_axi_rmem14]

  set_property -dict [ list \
   CONFIG.FREQ_HZ {99999001} \
 ] [get_bd_intf_pins /vadd_bw_0/m_axi_rmem15]

  set_property -dict [ list \
   CONFIG.FREQ_HZ {99999001} \
 ] [get_bd_intf_pins /vadd_bw_0/m_axi_rmem16]

  set_property -dict [ list \
   CONFIG.FREQ_HZ {99999001} \
 ] [get_bd_intf_pins /vadd_bw_0/m_axi_rmem17]

  set_property -dict [ list \
   CONFIG.FREQ_HZ {99999001} \
 ] [get_bd_intf_pins /vadd_bw_0/m_axi_rmem18]

  set_property -dict [ list \
   CONFIG.FREQ_HZ {99999001} \
 ] [get_bd_intf_pins /vadd_bw_0/m_axi_rmem19]

  set_property -dict [ list \
   CONFIG.FREQ_HZ {99999001} \
 ] [get_bd_intf_pins /vadd_bw_0/m_axi_rmem20]

  set_property -dict [ list \
   CONFIG.FREQ_HZ {99999001} \
 ] [get_bd_intf_pins /vadd_bw_0/m_axi_rmem21]

  set_property -dict [ list \
   CONFIG.FREQ_HZ {99999001} \
 ] [get_bd_intf_pins /vadd_bw_0/m_axi_rmem22]

  set_property -dict [ list \
   CONFIG.FREQ_HZ {99999001} \
 ] [get_bd_intf_pins /vadd_bw_0/m_axi_rmem23]

  set_property -dict [ list \
   CONFIG.FREQ_HZ {99999001} \
 ] [get_bd_intf_pins /vadd_bw_0/m_axi_rmem24]

  set_property -dict [ list \
   CONFIG.FREQ_HZ {99999001} \
 ] [get_bd_intf_pins /vadd_bw_0/m_axi_rmem25]

  set_property -dict [ list \
   CONFIG.FREQ_HZ {99999001} \
 ] [get_bd_intf_pins /vadd_bw_0/m_axi_rmem26]

  set_property -dict [ list \
   CONFIG.FREQ_HZ {99999001} \
 ] [get_bd_intf_pins /vadd_bw_0/m_axi_rmem27]

  set_property -dict [ list \
   CONFIG.FREQ_HZ {99999001} \
   CONFIG.CLK_DOMAIN {bd_70da_pspmc_0_0_pl0_ref_clk} \
 ] [get_bd_intf_pins /vadd_bw_0/s_axi_control]

  # Create instance: versal_cips_0, and set properties
  set versal_cips_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:versal_cips:3.3 versal_cips_0 ]
  set_property -dict [list \
    CONFIG.BOOT_MODE {Custom} \
    CONFIG.CLOCK_MODE {Custom} \
    CONFIG.DDR_MEMORY_MODE {Custom} \
    CONFIG.DEBUG_MODE {JTAG} \
    CONFIG.DESIGN_MODE {1} \
    CONFIG.PS_PL_CONNECTIVITY_MODE {Custom} \
    CONFIG.PS_PMC_CONFIG { \
      CLOCK_MODE {Custom} \
      DDR_MEMORY_MODE {Custom} \
      DEBUG_MODE {JTAG} \
      PMC_CRP_PL0_REF_CTRL_FREQMHZ {100} \
      PMC_USE_PMC_NOC_AXI0 {1} \
      PS_HSDP_EGRESS_TRAFFIC {JTAG} \
      PS_HSDP_INGRESS_TRAFFIC {JTAG} \
      PS_HSDP_MODE {None} \
      PS_NUM_FABRIC_RESETS {1} \
      PS_PL_CONNECTIVITY_MODE {Custom} \
      PS_USE_FPD_CCI_NOC {1} \
      PS_USE_M_AXI_FPD {0} \
      PS_USE_M_AXI_LPD {1} \
      PS_USE_NOC_FPD_CCI0 {0} \
      PS_USE_PMCPL_CLK0 {1} \
      PS_USE_PMCPL_CLK1 {0} \
      PS_USE_PMCPL_CLK2 {0} \
      PS_USE_PMCPL_CLK3 {0} \
      SMON_ALARMS {Set_Alarms_On} \
      SMON_ENABLE_TEMP_AVERAGING {0} \
      SMON_TEMP_AVERAGING_SAMPLES {0} \
    } \
  ] $versal_cips_0


  # Create interface connections
  connect_bd_intf_net -intf_net axi_noc_0_CH0_DDR4_0 [get_bd_intf_ports ddr4_sdram_c0] [get_bd_intf_pins axi_noc_0/CH0_DDR4_0]
  connect_bd_intf_net -intf_net axi_noc_1_M00_INI [get_bd_intf_pins axi_noc_0/S00_INI] [get_bd_intf_pins axi_noc_1/M00_INI]
  connect_bd_intf_net -intf_net ddr4_c0_sysclk_1 [get_bd_intf_ports ddr4_c0_sysclk] [get_bd_intf_pins axi_noc_0/sys_clk0]
  connect_bd_intf_net -intf_net smartconnect_0_M00_AXI [get_bd_intf_pins smartconnect_0/M00_AXI] [get_bd_intf_pins vadd_bw_0/s_axi_control]
  connect_bd_intf_net -intf_net vadd_bw_0_m_axi_rmem0 [get_bd_intf_pins axi_noc_1/S00_AXI] [get_bd_intf_pins vadd_bw_0/m_axi_rmem0]
  connect_bd_intf_net -intf_net vadd_bw_0_m_axi_rmem1 [get_bd_intf_pins axi_noc_1/S01_AXI] [get_bd_intf_pins vadd_bw_0/m_axi_rmem1]
  connect_bd_intf_net -intf_net vadd_bw_0_m_axi_rmem2 [get_bd_intf_pins axi_noc_1/S02_AXI] [get_bd_intf_pins vadd_bw_0/m_axi_rmem2]
  connect_bd_intf_net -intf_net vadd_bw_0_m_axi_rmem3 [get_bd_intf_pins axi_noc_1/S03_AXI] [get_bd_intf_pins vadd_bw_0/m_axi_rmem3]
  connect_bd_intf_net -intf_net vadd_bw_0_m_axi_rmem4 [get_bd_intf_pins axi_noc_1/S04_AXI] [get_bd_intf_pins vadd_bw_0/m_axi_rmem4]
  connect_bd_intf_net -intf_net vadd_bw_0_m_axi_rmem5 [get_bd_intf_pins axi_noc_1/S05_AXI] [get_bd_intf_pins vadd_bw_0/m_axi_rmem5]
  connect_bd_intf_net -intf_net vadd_bw_0_m_axi_rmem6 [get_bd_intf_pins axi_noc_1/S06_AXI] [get_bd_intf_pins vadd_bw_0/m_axi_rmem6]
  connect_bd_intf_net -intf_net vadd_bw_0_m_axi_rmem7 [get_bd_intf_pins axi_noc_1/S07_AXI] [get_bd_intf_pins vadd_bw_0/m_axi_rmem7]
  connect_bd_intf_net -intf_net vadd_bw_0_m_axi_rmem8 [get_bd_intf_pins axi_noc_1/S08_AXI] [get_bd_intf_pins vadd_bw_0/m_axi_rmem8]
  connect_bd_intf_net -intf_net vadd_bw_0_m_axi_rmem9 [get_bd_intf_pins axi_noc_1/S09_AXI] [get_bd_intf_pins vadd_bw_0/m_axi_rmem9]
  connect_bd_intf_net -intf_net vadd_bw_0_m_axi_rmem10 [get_bd_intf_pins axi_noc_1/S10_AXI] [get_bd_intf_pins vadd_bw_0/m_axi_rmem10]
  connect_bd_intf_net -intf_net vadd_bw_0_m_axi_rmem11 [get_bd_intf_pins axi_noc_1/S11_AXI] [get_bd_intf_pins vadd_bw_0/m_axi_rmem11]
  connect_bd_intf_net -intf_net vadd_bw_0_m_axi_rmem12 [get_bd_intf_pins axi_noc_1/S12_AXI] [get_bd_intf_pins vadd_bw_0/m_axi_rmem12]
  connect_bd_intf_net -intf_net vadd_bw_0_m_axi_rmem13 [get_bd_intf_pins axi_noc_1/S13_AXI] [get_bd_intf_pins vadd_bw_0/m_axi_rmem13]
  connect_bd_intf_net -intf_net vadd_bw_0_m_axi_rmem14 [get_bd_intf_pins axi_noc_1/S14_AXI] [get_bd_intf_pins vadd_bw_0/m_axi_rmem14]
  connect_bd_intf_net -intf_net vadd_bw_0_m_axi_rmem15 [get_bd_intf_pins axi_noc_1/S15_AXI] [get_bd_intf_pins vadd_bw_0/m_axi_rmem15]
  connect_bd_intf_net -intf_net vadd_bw_0_m_axi_rmem16 [get_bd_intf_pins axi_noc_1/S16_AXI] [get_bd_intf_pins vadd_bw_0/m_axi_rmem16]
  connect_bd_intf_net -intf_net vadd_bw_0_m_axi_rmem17 [get_bd_intf_pins axi_noc_1/S17_AXI] [get_bd_intf_pins vadd_bw_0/m_axi_rmem17]
  connect_bd_intf_net -intf_net vadd_bw_0_m_axi_rmem18 [get_bd_intf_pins axi_noc_1/S18_AXI] [get_bd_intf_pins vadd_bw_0/m_axi_rmem18]
  connect_bd_intf_net -intf_net vadd_bw_0_m_axi_rmem19 [get_bd_intf_pins axi_noc_1/S19_AXI] [get_bd_intf_pins vadd_bw_0/m_axi_rmem19]
  connect_bd_intf_net -intf_net vadd_bw_0_m_axi_rmem20 [get_bd_intf_pins axi_noc_1/S20_AXI] [get_bd_intf_pins vadd_bw_0/m_axi_rmem20]
  connect_bd_intf_net -intf_net vadd_bw_0_m_axi_rmem21 [get_bd_intf_pins axi_noc_1/S21_AXI] [get_bd_intf_pins vadd_bw_0/m_axi_rmem21]
  connect_bd_intf_net -intf_net vadd_bw_0_m_axi_rmem22 [get_bd_intf_pins axi_noc_1/S22_AXI] [get_bd_intf_pins vadd_bw_0/m_axi_rmem22]
  connect_bd_intf_net -intf_net vadd_bw_0_m_axi_rmem23 [get_bd_intf_pins axi_noc_1/S23_AXI] [get_bd_intf_pins vadd_bw_0/m_axi_rmem23]
  connect_bd_intf_net -intf_net vadd_bw_0_m_axi_rmem24 [get_bd_intf_pins axi_noc_1/S24_AXI] [get_bd_intf_pins vadd_bw_0/m_axi_rmem24]
  connect_bd_intf_net -intf_net vadd_bw_0_m_axi_rmem25 [get_bd_intf_pins axi_noc_1/S25_AXI] [get_bd_intf_pins vadd_bw_0/m_axi_rmem25]
  connect_bd_intf_net -intf_net vadd_bw_0_m_axi_rmem26 [get_bd_intf_pins axi_noc_1/S26_AXI] [get_bd_intf_pins vadd_bw_0/m_axi_rmem26]
  connect_bd_intf_net -intf_net vadd_bw_0_m_axi_rmem27 [get_bd_intf_pins axi_noc_1/S27_AXI] [get_bd_intf_pins vadd_bw_0/m_axi_rmem27]
  connect_bd_intf_net -intf_net versal_cips_0_FPD_CCI_NOC_0 [get_bd_intf_pins axi_noc_0/S00_AXI] [get_bd_intf_pins versal_cips_0/FPD_CCI_NOC_0]
  connect_bd_intf_net -intf_net versal_cips_0_FPD_CCI_NOC_1 [get_bd_intf_pins axi_noc_0/S01_AXI] [get_bd_intf_pins versal_cips_0/FPD_CCI_NOC_1]
  connect_bd_intf_net -intf_net versal_cips_0_FPD_CCI_NOC_2 [get_bd_intf_pins axi_noc_0/S02_AXI] [get_bd_intf_pins versal_cips_0/FPD_CCI_NOC_2]
  connect_bd_intf_net -intf_net versal_cips_0_FPD_CCI_NOC_3 [get_bd_intf_pins axi_noc_0/S03_AXI] [get_bd_intf_pins versal_cips_0/FPD_CCI_NOC_3]
  connect_bd_intf_net -intf_net versal_cips_0_M_AXI_LPD [get_bd_intf_pins smartconnect_0/S00_AXI] [get_bd_intf_pins versal_cips_0/M_AXI_LPD]
  connect_bd_intf_net -intf_net versal_cips_0_PMC_NOC_AXI_0 [get_bd_intf_pins axi_noc_0/S04_AXI] [get_bd_intf_pins versal_cips_0/PMC_NOC_AXI_0]

  # Create port connections
  connect_bd_net -net proc_sys_reset_0_interconnect_aresetn [get_bd_pins proc_sys_reset_0/interconnect_aresetn] [get_bd_pins smartconnect_0/aresetn]
  connect_bd_net -net proc_sys_reset_0_peripheral_aresetn [get_bd_pins proc_sys_reset_0/peripheral_aresetn] [get_bd_pins vadd_bw_0/ap_rst_n]
  connect_bd_net -net versal_cips_0_fpd_cci_noc_axi0_clk [get_bd_pins axi_noc_0/aclk0] [get_bd_pins versal_cips_0/fpd_cci_noc_axi0_clk]
  connect_bd_net -net versal_cips_0_fpd_cci_noc_axi1_clk [get_bd_pins axi_noc_0/aclk1] [get_bd_pins versal_cips_0/fpd_cci_noc_axi1_clk]
  connect_bd_net -net versal_cips_0_fpd_cci_noc_axi2_clk [get_bd_pins axi_noc_0/aclk2] [get_bd_pins versal_cips_0/fpd_cci_noc_axi2_clk]
  connect_bd_net -net versal_cips_0_fpd_cci_noc_axi3_clk [get_bd_pins axi_noc_0/aclk3] [get_bd_pins versal_cips_0/fpd_cci_noc_axi3_clk]
  connect_bd_net -net versal_cips_0_pl0_ref_clk [get_bd_pins axi_noc_1/aclk0] [get_bd_pins proc_sys_reset_0/slowest_sync_clk] [get_bd_pins smartconnect_0/aclk] [get_bd_pins vadd_bw_0/ap_clk] [get_bd_pins versal_cips_0/m_axi_lpd_aclk] [get_bd_pins versal_cips_0/pl0_ref_clk]
  connect_bd_net -net versal_cips_0_pl0_resetn [get_bd_pins proc_sys_reset_0/ext_reset_in] [get_bd_pins versal_cips_0/pl0_resetn]
  connect_bd_net -net versal_cips_0_pmc_axi_noc_axi0_clk [get_bd_pins axi_noc_0/aclk4] [get_bd_pins versal_cips_0/pmc_axi_noc_axi0_clk]

  # Create address segments
  assign_bd_address -offset 0x00000000 -range 0x80000000 -target_address_space [get_bd_addr_spaces vadd_bw_0/m_axi_rmem0] [get_bd_addr_segs axi_noc_0/S00_INI/C0_DDR_LOW0] -force
  assign_bd_address -offset 0x00000000 -range 0x80000000 -target_address_space [get_bd_addr_spaces vadd_bw_0/m_axi_rmem1] [get_bd_addr_segs axi_noc_0/S00_INI/C0_DDR_LOW0] -force
  assign_bd_address -offset 0x00000000 -range 0x80000000 -target_address_space [get_bd_addr_spaces vadd_bw_0/m_axi_rmem10] [get_bd_addr_segs axi_noc_0/S00_INI/C0_DDR_LOW0] -force
  assign_bd_address -offset 0x00000000 -range 0x80000000 -target_address_space [get_bd_addr_spaces vadd_bw_0/m_axi_rmem11] [get_bd_addr_segs axi_noc_0/S00_INI/C0_DDR_LOW0] -force
  assign_bd_address -offset 0x00000000 -range 0x80000000 -target_address_space [get_bd_addr_spaces vadd_bw_0/m_axi_rmem12] [get_bd_addr_segs axi_noc_0/S00_INI/C0_DDR_LOW0] -force
  assign_bd_address -offset 0x00000000 -range 0x80000000 -target_address_space [get_bd_addr_spaces vadd_bw_0/m_axi_rmem13] [get_bd_addr_segs axi_noc_0/S00_INI/C0_DDR_LOW0] -force
  assign_bd_address -offset 0x00000000 -range 0x80000000 -target_address_space [get_bd_addr_spaces vadd_bw_0/m_axi_rmem14] [get_bd_addr_segs axi_noc_0/S00_INI/C0_DDR_LOW0] -force
  assign_bd_address -offset 0x00000000 -range 0x80000000 -target_address_space [get_bd_addr_spaces vadd_bw_0/m_axi_rmem15] [get_bd_addr_segs axi_noc_0/S00_INI/C0_DDR_LOW0] -force
  assign_bd_address -offset 0x00000000 -range 0x80000000 -target_address_space [get_bd_addr_spaces vadd_bw_0/m_axi_rmem16] [get_bd_addr_segs axi_noc_0/S00_INI/C0_DDR_LOW0] -force
  assign_bd_address -offset 0x00000000 -range 0x80000000 -target_address_space [get_bd_addr_spaces vadd_bw_0/m_axi_rmem17] [get_bd_addr_segs axi_noc_0/S00_INI/C0_DDR_LOW0] -force
  assign_bd_address -offset 0x00000000 -range 0x80000000 -target_address_space [get_bd_addr_spaces vadd_bw_0/m_axi_rmem18] [get_bd_addr_segs axi_noc_0/S00_INI/C0_DDR_LOW0] -force
  assign_bd_address -offset 0x00000000 -range 0x80000000 -target_address_space [get_bd_addr_spaces vadd_bw_0/m_axi_rmem19] [get_bd_addr_segs axi_noc_0/S00_INI/C0_DDR_LOW0] -force
  assign_bd_address -offset 0x00000000 -range 0x80000000 -target_address_space [get_bd_addr_spaces vadd_bw_0/m_axi_rmem2] [get_bd_addr_segs axi_noc_0/S00_INI/C0_DDR_LOW0] -force
  assign_bd_address -offset 0x00000000 -range 0x80000000 -target_address_space [get_bd_addr_spaces vadd_bw_0/m_axi_rmem20] [get_bd_addr_segs axi_noc_0/S00_INI/C0_DDR_LOW0] -force
  assign_bd_address -offset 0x00000000 -range 0x80000000 -target_address_space [get_bd_addr_spaces vadd_bw_0/m_axi_rmem21] [get_bd_addr_segs axi_noc_0/S00_INI/C0_DDR_LOW0] -force
  assign_bd_address -offset 0x00000000 -range 0x80000000 -target_address_space [get_bd_addr_spaces vadd_bw_0/m_axi_rmem22] [get_bd_addr_segs axi_noc_0/S00_INI/C0_DDR_LOW0] -force
  assign_bd_address -offset 0x00000000 -range 0x80000000 -target_address_space [get_bd_addr_spaces vadd_bw_0/m_axi_rmem23] [get_bd_addr_segs axi_noc_0/S00_INI/C0_DDR_LOW0] -force
  assign_bd_address -offset 0x00000000 -range 0x80000000 -target_address_space [get_bd_addr_spaces vadd_bw_0/m_axi_rmem24] [get_bd_addr_segs axi_noc_0/S00_INI/C0_DDR_LOW0] -force
  assign_bd_address -offset 0x00000000 -range 0x80000000 -target_address_space [get_bd_addr_spaces vadd_bw_0/m_axi_rmem25] [get_bd_addr_segs axi_noc_0/S00_INI/C0_DDR_LOW0] -force
  assign_bd_address -offset 0x00000000 -range 0x80000000 -target_address_space [get_bd_addr_spaces vadd_bw_0/m_axi_rmem26] [get_bd_addr_segs axi_noc_0/S00_INI/C0_DDR_LOW0] -force
  assign_bd_address -offset 0x00000000 -range 0x80000000 -target_address_space [get_bd_addr_spaces vadd_bw_0/m_axi_rmem27] [get_bd_addr_segs axi_noc_0/S00_INI/C0_DDR_LOW0] -force
  assign_bd_address -offset 0x00000000 -range 0x80000000 -target_address_space [get_bd_addr_spaces vadd_bw_0/m_axi_rmem3] [get_bd_addr_segs axi_noc_0/S00_INI/C0_DDR_LOW0] -force
  assign_bd_address -offset 0x00000000 -range 0x80000000 -target_address_space [get_bd_addr_spaces vadd_bw_0/m_axi_rmem4] [get_bd_addr_segs axi_noc_0/S00_INI/C0_DDR_LOW0] -force
  assign_bd_address -offset 0x00000000 -range 0x80000000 -target_address_space [get_bd_addr_spaces vadd_bw_0/m_axi_rmem5] [get_bd_addr_segs axi_noc_0/S00_INI/C0_DDR_LOW0] -force
  assign_bd_address -offset 0x00000000 -range 0x80000000 -target_address_space [get_bd_addr_spaces vadd_bw_0/m_axi_rmem6] [get_bd_addr_segs axi_noc_0/S00_INI/C0_DDR_LOW0] -force
  assign_bd_address -offset 0x00000000 -range 0x80000000 -target_address_space [get_bd_addr_spaces vadd_bw_0/m_axi_rmem7] [get_bd_addr_segs axi_noc_0/S00_INI/C0_DDR_LOW0] -force
  assign_bd_address -offset 0x00000000 -range 0x80000000 -target_address_space [get_bd_addr_spaces vadd_bw_0/m_axi_rmem8] [get_bd_addr_segs axi_noc_0/S00_INI/C0_DDR_LOW0] -force
  assign_bd_address -offset 0x00000000 -range 0x80000000 -target_address_space [get_bd_addr_spaces vadd_bw_0/m_axi_rmem9] [get_bd_addr_segs axi_noc_0/S00_INI/C0_DDR_LOW0] -force
  assign_bd_address -offset 0x00000000 -range 0x80000000 -target_address_space [get_bd_addr_spaces versal_cips_0/FPD_CCI_NOC_0] [get_bd_addr_segs axi_noc_0/S00_AXI/C0_DDR_LOW0] -force
  assign_bd_address -offset 0x00000000 -range 0x80000000 -target_address_space [get_bd_addr_spaces versal_cips_0/FPD_CCI_NOC_1] [get_bd_addr_segs axi_noc_0/S01_AXI/C0_DDR_LOW0] -force
  assign_bd_address -offset 0x00000000 -range 0x80000000 -target_address_space [get_bd_addr_spaces versal_cips_0/FPD_CCI_NOC_2] [get_bd_addr_segs axi_noc_0/S02_AXI/C0_DDR_LOW0] -force
  assign_bd_address -offset 0x00000000 -range 0x80000000 -target_address_space [get_bd_addr_spaces versal_cips_0/FPD_CCI_NOC_3] [get_bd_addr_segs axi_noc_0/S03_AXI/C0_DDR_LOW0] -force
  assign_bd_address -offset 0x80000000 -range 0x00001000 -target_address_space [get_bd_addr_spaces versal_cips_0/M_AXI_LPD] [get_bd_addr_segs vadd_bw_0/s_axi_control/reg0] -force
  assign_bd_address -offset 0x00000000 -range 0x80000000 -target_address_space [get_bd_addr_spaces versal_cips_0/PMC_NOC_AXI_0] [get_bd_addr_segs axi_noc_0/S04_AXI/C0_DDR_LOW0] -force


  # Restore current instance
  current_bd_instance $oldCurInst

  validate_bd_design
  save_bd_design
}
# End of create_root_design()


##################################################################
# MAIN FLOW
##################################################################

create_root_design ""
