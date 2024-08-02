
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
# gnd_driver, kernel3

# Please add the sources of those modules before sourcing this Tcl script.

# If there is no project opened, this script will create a
# project, but make sure you do not have an existing project
# <./myproj/project_1.xpr> in the current working folder.

set list_projs [get_projects -quiet]
if { $list_projs eq "" } {
   create_project project_1 myproj -part xcu50-fsvh2104-2-e
   set_property BOARD_PART xilinx.com:au50dd:part0:1.0 [current_project]
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
xilinx.com:ip:proc_sys_reset:5.0\
xilinx.com:ip:axi_register_slice:2.1\
xilinx.com:ip:hbm:1.0\
xilinx.com:ip:clk_wiz:6.0\
xilinx.com:ip:smartconnect:1.0\
xilinx.com:ip:util_ds_buf:2.2\
xilinx.com:ip:xdma:4.1\
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
gnd_driver\
kernel3\
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
  set hbm_clk [ create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:diff_clock_rtl:1.0 hbm_clk ]
  set_property -dict [ list \
   CONFIG.FREQ_HZ {100000000} \
   ] $hbm_clk

  set pci_express_x1 [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:pcie_7x_mgt_rtl:1.0 pci_express_x1 ]

  set pcie_refclk [ create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:diff_clock_rtl:1.0 pcie_refclk ]
  set_property -dict [ list \
   CONFIG.FREQ_HZ {100000000} \
   ] $pcie_refclk


  # Create ports
  set HBM_CATTRIP [ create_bd_port -dir O HBM_CATTRIP ]
  set pcie_perstn [ create_bd_port -dir I -type rst pcie_perstn ]
  set_property -dict [ list \
   CONFIG.POLARITY {ACTIVE_LOW} \
 ] $pcie_perstn

  # Create instance: apb_sys_reset, and set properties
  set apb_sys_reset [ create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 apb_sys_reset ]

  # Create instance: axi_register_slice_28, and set properties
  set axi_register_slice_28 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_register_slice:2.1 axi_register_slice_28 ]

  # Create instance: axi_register_slice_29, and set properties
  set axi_register_slice_29 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_register_slice:2.1 axi_register_slice_29 ]

  # Create instance: axi_register_slice_30, and set properties
  set axi_register_slice_30 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_register_slice:2.1 axi_register_slice_30 ]

  # Create instance: axi_register_slice_31, and set properties
  set axi_register_slice_31 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_register_slice:2.1 axi_register_slice_31 ]

  # Create instance: gnd_driver_0, and set properties
  set block_name gnd_driver
  set block_cell_name gnd_driver_0
  if { [catch {set gnd_driver_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $gnd_driver_0 eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }

  # Create instance: hbm_0, and set properties
  set hbm_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:hbm:1.0 hbm_0 ]
  set_property -dict [list \
    CONFIG.USER_APB_EN {false} \
    CONFIG.USER_HBM_DENSITY {4GB} \
    CONFIG.USER_MC_ENABLE_00 {TRUE} \
    CONFIG.USER_MC_ENABLE_01 {TRUE} \
    CONFIG.USER_MC_ENABLE_02 {TRUE} \
    CONFIG.USER_MC_ENABLE_03 {TRUE} \
    CONFIG.USER_MC_ENABLE_04 {TRUE} \
    CONFIG.USER_MC_ENABLE_05 {TRUE} \
    CONFIG.USER_MC_ENABLE_06 {TRUE} \
    CONFIG.USER_MC_ENABLE_07 {TRUE} \
    CONFIG.USER_SAXI_00 {false} \
    CONFIG.USER_SAXI_01 {false} \
    CONFIG.USER_SAXI_02 {false} \
    CONFIG.USER_SAXI_03 {false} \
    CONFIG.USER_SAXI_04 {false} \
    CONFIG.USER_SAXI_05 {false} \
    CONFIG.USER_SAXI_06 {false} \
    CONFIG.USER_SAXI_07 {false} \
    CONFIG.USER_SAXI_08 {false} \
    CONFIG.USER_SAXI_09 {false} \
    CONFIG.USER_SAXI_10 {false} \
    CONFIG.USER_SAXI_11 {false} \
    CONFIG.USER_SAXI_12 {true} \
    CONFIG.USER_SAXI_13 {true} \
    CONFIG.USER_SAXI_14 {true} \
    CONFIG.USER_SAXI_15 {true} \
    CONFIG.USER_SAXI_16 {false} \
    CONFIG.USER_SAXI_17 {false} \
    CONFIG.USER_SAXI_18 {false} \
    CONFIG.USER_SAXI_19 {false} \
    CONFIG.USER_SAXI_20 {false} \
    CONFIG.USER_SAXI_21 {false} \
    CONFIG.USER_SAXI_22 {false} \
    CONFIG.USER_SAXI_23 {false} \
    CONFIG.USER_SAXI_24 {false} \
    CONFIG.USER_SAXI_25 {false} \
    CONFIG.USER_SAXI_26 {false} \
    CONFIG.USER_SAXI_27 {false} \
    CONFIG.USER_SINGLE_STACK_SELECTION {RIGHT} \
  ] $hbm_0


  # Create instance: hbm_axi_clk, and set properties
  set hbm_axi_clk [ create_bd_cell -type ip -vlnv xilinx.com:ip:clk_wiz:6.0 hbm_axi_clk ]
  set_property -dict [list \
    CONFIG.CLKOUT1_JITTER {111.430} \
    CONFIG.CLKOUT1_REQUESTED_OUT_FREQ {300} \
    CONFIG.MMCM_CLKOUT0_DIVIDE_F {4.000} \
    CONFIG.RESET_PORT {resetn} \
    CONFIG.RESET_TYPE {ACTIVE_LOW} \
  ] $hbm_axi_clk


  # Create instance: hbm_sys_reset, and set properties
  set hbm_sys_reset [ create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 hbm_sys_reset ]

  # Create instance: kernel3_0, and set properties
  set block_name kernel3
  set block_cell_name kernel3_0
  if { [catch {set kernel3_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $kernel3_0 eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }

  set_property -dict [ list \
   CONFIG.FREQ_HZ {300000000} \
 ] [get_bd_intf_pins /kernel3_0/m_axi_gmem_A]

  set_property -dict [ list \
   CONFIG.FREQ_HZ {300000000} \
 ] [get_bd_intf_pins /kernel3_0/m_axi_gmem_B]

  set_property -dict [ list \
   CONFIG.FREQ_HZ {300000000} \
 ] [get_bd_intf_pins /kernel3_0/m_axi_gmem_C]

  set_property -dict [ list \
   CONFIG.FREQ_HZ {300000000} \
 ] [get_bd_intf_pins /kernel3_0/s_axi_control]

  # Create instance: kernel_clk, and set properties
  set kernel_clk [ create_bd_cell -type ip -vlnv xilinx.com:ip:clk_wiz:6.0 kernel_clk ]
  set_property -dict [list \
    CONFIG.CLKOUT1_JITTER {111.430} \
    CONFIG.CLKOUT1_REQUESTED_OUT_FREQ {300} \
    CONFIG.MMCM_CLKOUT0_DIVIDE_F {4.000} \
    CONFIG.RESET_PORT {resetn} \
    CONFIG.RESET_TYPE {ACTIVE_LOW} \
  ] $kernel_clk


  # Create instance: kernel_sys_reset, and set properties
  set kernel_sys_reset [ create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 kernel_sys_reset ]

  # Create instance: smartconnect_28, and set properties
  set smartconnect_28 [ create_bd_cell -type ip -vlnv xilinx.com:ip:smartconnect:1.0 smartconnect_28 ]
  set_property -dict [list \
    CONFIG.NUM_CLKS {2} \
    CONFIG.NUM_SI {1} \
  ] $smartconnect_28


  # Create instance: smartconnect_29, and set properties
  set smartconnect_29 [ create_bd_cell -type ip -vlnv xilinx.com:ip:smartconnect:1.0 smartconnect_29 ]
  set_property -dict [list \
    CONFIG.NUM_CLKS {2} \
    CONFIG.NUM_SI {1} \
  ] $smartconnect_29


  # Create instance: smartconnect_30, and set properties
  set smartconnect_30 [ create_bd_cell -type ip -vlnv xilinx.com:ip:smartconnect:1.0 smartconnect_30 ]
  set_property -dict [list \
    CONFIG.NUM_CLKS {2} \
    CONFIG.NUM_SI {1} \
  ] $smartconnect_30


  # Create instance: smartconnect_31, and set properties
  set smartconnect_31 [ create_bd_cell -type ip -vlnv xilinx.com:ip:smartconnect:1.0 smartconnect_31 ]
  set_property -dict [list \
    CONFIG.NUM_CLKS {2} \
    CONFIG.NUM_SI {1} \
  ] $smartconnect_31


  # Create instance: util_ds_buf, and set properties
  set util_ds_buf [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_ds_buf:2.2 util_ds_buf ]
  set_property -dict [list \
    CONFIG.DIFF_CLK_IN_BOARD_INTERFACE {pcie_refclk} \
    CONFIG.USE_BOARD_FLOW {true} \
  ] $util_ds_buf


  # Create instance: util_ds_buf_0, and set properties
  set util_ds_buf_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_ds_buf:2.2 util_ds_buf_0 ]
  set_property -dict [list \
    CONFIG.DIFF_CLK_IN_BOARD_INTERFACE {hbm_clk} \
    CONFIG.USE_BOARD_FLOW {true} \
  ] $util_ds_buf_0


  # Create instance: xdma_0, and set properties
  set xdma_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xdma:4.1 xdma_0 ]
  set_property -dict [list \
    CONFIG.PCIE_BOARD_INTERFACE {pci_express_x1} \
    CONFIG.SYS_RST_N_BOARD_INTERFACE {pcie_perstn} \
    CONFIG.axi_data_width {64_bit} \
    CONFIG.axist_bypass_en {true} \
    CONFIG.axisten_freq {250} \
    CONFIG.cfg_mgmt_if {false} \
    CONFIG.pcie_extended_tag {false} \
    CONFIG.pf0_class_code_base {05} \
    CONFIG.pf0_class_code_sub {80} \
    CONFIG.pf0_device_id {7021} \
    CONFIG.pf0_interrupt_pin {NONE} \
    CONFIG.pf0_msi_enabled {false} \
    CONFIG.pf0_msix_enabled {true} \
    CONFIG.pf0_sub_class_interface_menu {Generic_XT_compatible_serial_controller} \
    CONFIG.pl_link_cap_max_link_speed {16.0_GT/s} \
    CONFIG.xdma_axi_intf_mm {AXI_Memory_Mapped} \
    CONFIG.xdma_rnum_chnl {1} \
    CONFIG.xdma_wnum_chnl {1} \
  ] $xdma_0


  # Create instance: xdma_0_axi_periph, and set properties
  set xdma_0_axi_periph [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 xdma_0_axi_periph ]
  set_property CONFIG.NUM_MI {1} $xdma_0_axi_periph


  # Create interface connections
  connect_bd_intf_net -intf_net axi_register_slice_28_M_AXI [get_bd_intf_pins axi_register_slice_28/M_AXI] [get_bd_intf_pins hbm_0/SAXI_12_RT]
  connect_bd_intf_net -intf_net axi_register_slice_29_M_AXI [get_bd_intf_pins axi_register_slice_29/M_AXI] [get_bd_intf_pins hbm_0/SAXI_13_RT]
  connect_bd_intf_net -intf_net axi_register_slice_30_M_AXI [get_bd_intf_pins axi_register_slice_30/M_AXI] [get_bd_intf_pins hbm_0/SAXI_14_RT]
  connect_bd_intf_net -intf_net axi_register_slice_31_M_AXI [get_bd_intf_pins axi_register_slice_31/M_AXI] [get_bd_intf_pins hbm_0/SAXI_15_RT]
  connect_bd_intf_net -intf_net hbm_clk_1 [get_bd_intf_ports hbm_clk] [get_bd_intf_pins util_ds_buf_0/CLK_IN_D]
  connect_bd_intf_net -intf_net kernel3_0_m_axi_gmem_A [get_bd_intf_pins kernel3_0/m_axi_gmem_A] [get_bd_intf_pins smartconnect_28/S00_AXI]
  connect_bd_intf_net -intf_net kernel3_0_m_axi_gmem_B [get_bd_intf_pins kernel3_0/m_axi_gmem_B] [get_bd_intf_pins smartconnect_29/S00_AXI]
  connect_bd_intf_net -intf_net kernel3_0_m_axi_gmem_C [get_bd_intf_pins kernel3_0/m_axi_gmem_C] [get_bd_intf_pins smartconnect_30/S00_AXI]
  connect_bd_intf_net -intf_net pcie_refclk_1 [get_bd_intf_ports pcie_refclk] [get_bd_intf_pins util_ds_buf/CLK_IN_D]
  connect_bd_intf_net -intf_net smartconnect_28_M00_AXI [get_bd_intf_pins axi_register_slice_28/S_AXI] [get_bd_intf_pins smartconnect_28/M00_AXI]
  connect_bd_intf_net -intf_net smartconnect_29_M00_AXI [get_bd_intf_pins axi_register_slice_29/S_AXI] [get_bd_intf_pins smartconnect_29/M00_AXI]
  connect_bd_intf_net -intf_net smartconnect_30_M00_AXI [get_bd_intf_pins axi_register_slice_30/S_AXI] [get_bd_intf_pins smartconnect_30/M00_AXI]
  connect_bd_intf_net -intf_net smartconnect_31_M00_AXI [get_bd_intf_pins axi_register_slice_31/S_AXI] [get_bd_intf_pins smartconnect_31/M00_AXI]
  connect_bd_intf_net -intf_net xdma_0_M_AXI [get_bd_intf_pins smartconnect_31/S00_AXI] [get_bd_intf_pins xdma_0/M_AXI]
  connect_bd_intf_net -intf_net xdma_0_M_AXI_BYPASS [get_bd_intf_pins xdma_0/M_AXI_BYPASS] [get_bd_intf_pins xdma_0_axi_periph/S00_AXI]
  connect_bd_intf_net -intf_net xdma_0_axi_periph_M00_AXI [get_bd_intf_pins kernel3_0/s_axi_control] [get_bd_intf_pins xdma_0_axi_periph/M00_AXI]
  connect_bd_intf_net -intf_net xdma_0_pcie_mgt [get_bd_intf_ports pci_express_x1] [get_bd_intf_pins xdma_0/pcie_mgt]

  # Create port connections
  connect_bd_net -net apb_sys_reset_peripheral_aresetn [get_bd_pins apb_sys_reset/peripheral_aresetn] [get_bd_pins hbm_0/APB_0_PRESET_N]
  connect_bd_net -net gnd_driver_0_dout [get_bd_ports HBM_CATTRIP] [get_bd_pins gnd_driver_0/dout]
  connect_bd_net -net hbm_axi_clk_clk_out1 [get_bd_pins axi_register_slice_28/aclk] [get_bd_pins axi_register_slice_29/aclk] [get_bd_pins axi_register_slice_30/aclk] [get_bd_pins axi_register_slice_31/aclk] [get_bd_pins hbm_0/AXI_12_ACLK] [get_bd_pins hbm_0/AXI_13_ACLK] [get_bd_pins hbm_0/AXI_14_ACLK] [get_bd_pins hbm_0/AXI_15_ACLK] [get_bd_pins hbm_axi_clk/clk_out1] [get_bd_pins hbm_sys_reset/slowest_sync_clk] [get_bd_pins smartconnect_28/aclk1] [get_bd_pins smartconnect_29/aclk1] [get_bd_pins smartconnect_30/aclk1] [get_bd_pins smartconnect_31/aclk1]
  connect_bd_net -net hbm_axi_clk_locked [get_bd_pins hbm_axi_clk/locked] [get_bd_pins hbm_sys_reset/dcm_locked]
  connect_bd_net -net hbm_sys_reset_peripheral_aresetn [get_bd_pins axi_register_slice_28/aresetn] [get_bd_pins axi_register_slice_29/aresetn] [get_bd_pins axi_register_slice_30/aresetn] [get_bd_pins axi_register_slice_31/aresetn] [get_bd_pins hbm_0/AXI_12_ARESET_N] [get_bd_pins hbm_0/AXI_13_ARESET_N] [get_bd_pins hbm_0/AXI_14_ARESET_N] [get_bd_pins hbm_0/AXI_15_ARESET_N] [get_bd_pins hbm_sys_reset/peripheral_aresetn]
  connect_bd_net -net kernel_clk_clk_out1 [get_bd_pins kernel3_0/ap_clk] [get_bd_pins kernel_clk/clk_out1] [get_bd_pins kernel_sys_reset/slowest_sync_clk] [get_bd_pins smartconnect_28/aclk] [get_bd_pins smartconnect_29/aclk] [get_bd_pins smartconnect_30/aclk] [get_bd_pins xdma_0_axi_periph/M00_ACLK]
  connect_bd_net -net kernel_clk_locked [get_bd_pins kernel_clk/locked] [get_bd_pins kernel_sys_reset/dcm_locked]
  connect_bd_net -net kernel_sys_reset_peripheral_aresetn [get_bd_pins kernel3_0/ap_rst_n] [get_bd_pins kernel_sys_reset/peripheral_aresetn] [get_bd_pins smartconnect_28/aresetn] [get_bd_pins smartconnect_29/aresetn] [get_bd_pins smartconnect_30/aresetn] [get_bd_pins xdma_0_axi_periph/M00_ARESETN]
  connect_bd_net -net pcie_perstn_1 [get_bd_ports pcie_perstn] [get_bd_pins xdma_0/sys_rst_n]
  connect_bd_net -net util_ds_buf_0_IBUF_OUT [get_bd_pins apb_sys_reset/slowest_sync_clk] [get_bd_pins hbm_0/APB_0_PCLK] [get_bd_pins hbm_0/HBM_REF_CLK_0] [get_bd_pins util_ds_buf_0/IBUF_OUT]
  connect_bd_net -net util_ds_buf_IBUF_DS_ODIV2 [get_bd_pins util_ds_buf/IBUF_DS_ODIV2] [get_bd_pins xdma_0/sys_clk]
  connect_bd_net -net util_ds_buf_IBUF_OUT [get_bd_pins util_ds_buf/IBUF_OUT] [get_bd_pins xdma_0/sys_clk_gt]
  connect_bd_net -net xdma_0_axi_aclk [get_bd_pins gnd_driver_0/clk] [get_bd_pins hbm_axi_clk/clk_in1] [get_bd_pins kernel_clk/clk_in1] [get_bd_pins smartconnect_31/aclk] [get_bd_pins xdma_0/axi_aclk] [get_bd_pins xdma_0_axi_periph/ACLK] [get_bd_pins xdma_0_axi_periph/S00_ACLK]
  connect_bd_net -net xdma_0_axi_aresetn [get_bd_pins apb_sys_reset/ext_reset_in] [get_bd_pins gnd_driver_0/rst_n] [get_bd_pins hbm_axi_clk/resetn] [get_bd_pins hbm_sys_reset/ext_reset_in] [get_bd_pins kernel_clk/resetn] [get_bd_pins kernel_sys_reset/ext_reset_in] [get_bd_pins smartconnect_31/aresetn] [get_bd_pins xdma_0/axi_aresetn] [get_bd_pins xdma_0_axi_periph/ARESETN] [get_bd_pins xdma_0_axi_periph/S00_ARESETN]

  # Create address segments
  assign_bd_address -offset 0x000100000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces kernel3_0/m_axi_gmem_A] [get_bd_addr_segs hbm_0/SAXI_12_RT/HBM_MEM00] -force
  assign_bd_address -offset 0x000110000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces kernel3_0/m_axi_gmem_A] [get_bd_addr_segs hbm_0/SAXI_12_RT/HBM_MEM01] -force
  assign_bd_address -offset 0x000120000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces kernel3_0/m_axi_gmem_A] [get_bd_addr_segs hbm_0/SAXI_12_RT/HBM_MEM02] -force
  assign_bd_address -offset 0x000130000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces kernel3_0/m_axi_gmem_A] [get_bd_addr_segs hbm_0/SAXI_12_RT/HBM_MEM03] -force
  assign_bd_address -offset 0x000140000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces kernel3_0/m_axi_gmem_A] [get_bd_addr_segs hbm_0/SAXI_12_RT/HBM_MEM04] -force
  assign_bd_address -offset 0x000150000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces kernel3_0/m_axi_gmem_A] [get_bd_addr_segs hbm_0/SAXI_12_RT/HBM_MEM05] -force
  assign_bd_address -offset 0x000160000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces kernel3_0/m_axi_gmem_A] [get_bd_addr_segs hbm_0/SAXI_12_RT/HBM_MEM06] -force
  assign_bd_address -offset 0x000170000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces kernel3_0/m_axi_gmem_A] [get_bd_addr_segs hbm_0/SAXI_12_RT/HBM_MEM07] -force
  assign_bd_address -offset 0x000180000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces kernel3_0/m_axi_gmem_A] [get_bd_addr_segs hbm_0/SAXI_12_RT/HBM_MEM08] -force
  assign_bd_address -offset 0x000190000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces kernel3_0/m_axi_gmem_A] [get_bd_addr_segs hbm_0/SAXI_12_RT/HBM_MEM09] -force
  assign_bd_address -offset 0x0001A0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces kernel3_0/m_axi_gmem_A] [get_bd_addr_segs hbm_0/SAXI_12_RT/HBM_MEM10] -force
  assign_bd_address -offset 0x0001B0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces kernel3_0/m_axi_gmem_A] [get_bd_addr_segs hbm_0/SAXI_12_RT/HBM_MEM11] -force
  assign_bd_address -offset 0x0001C0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces kernel3_0/m_axi_gmem_A] [get_bd_addr_segs hbm_0/SAXI_12_RT/HBM_MEM12] -force
  assign_bd_address -offset 0x0001D0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces kernel3_0/m_axi_gmem_A] [get_bd_addr_segs hbm_0/SAXI_12_RT/HBM_MEM13] -force
  assign_bd_address -offset 0x0001E0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces kernel3_0/m_axi_gmem_A] [get_bd_addr_segs hbm_0/SAXI_12_RT/HBM_MEM14] -force
  assign_bd_address -offset 0x0001F0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces kernel3_0/m_axi_gmem_A] [get_bd_addr_segs hbm_0/SAXI_12_RT/HBM_MEM15] -force
  assign_bd_address -offset 0x000100000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces kernel3_0/m_axi_gmem_B] [get_bd_addr_segs hbm_0/SAXI_13_RT/HBM_MEM00] -force
  assign_bd_address -offset 0x000110000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces kernel3_0/m_axi_gmem_B] [get_bd_addr_segs hbm_0/SAXI_13_RT/HBM_MEM01] -force
  assign_bd_address -offset 0x000120000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces kernel3_0/m_axi_gmem_B] [get_bd_addr_segs hbm_0/SAXI_13_RT/HBM_MEM02] -force
  assign_bd_address -offset 0x000130000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces kernel3_0/m_axi_gmem_B] [get_bd_addr_segs hbm_0/SAXI_13_RT/HBM_MEM03] -force
  assign_bd_address -offset 0x000140000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces kernel3_0/m_axi_gmem_B] [get_bd_addr_segs hbm_0/SAXI_13_RT/HBM_MEM04] -force
  assign_bd_address -offset 0x000150000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces kernel3_0/m_axi_gmem_B] [get_bd_addr_segs hbm_0/SAXI_13_RT/HBM_MEM05] -force
  assign_bd_address -offset 0x000160000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces kernel3_0/m_axi_gmem_B] [get_bd_addr_segs hbm_0/SAXI_13_RT/HBM_MEM06] -force
  assign_bd_address -offset 0x000170000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces kernel3_0/m_axi_gmem_B] [get_bd_addr_segs hbm_0/SAXI_13_RT/HBM_MEM07] -force
  assign_bd_address -offset 0x000180000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces kernel3_0/m_axi_gmem_B] [get_bd_addr_segs hbm_0/SAXI_13_RT/HBM_MEM08] -force
  assign_bd_address -offset 0x000190000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces kernel3_0/m_axi_gmem_B] [get_bd_addr_segs hbm_0/SAXI_13_RT/HBM_MEM09] -force
  assign_bd_address -offset 0x0001A0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces kernel3_0/m_axi_gmem_B] [get_bd_addr_segs hbm_0/SAXI_13_RT/HBM_MEM10] -force
  assign_bd_address -offset 0x0001B0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces kernel3_0/m_axi_gmem_B] [get_bd_addr_segs hbm_0/SAXI_13_RT/HBM_MEM11] -force
  assign_bd_address -offset 0x0001C0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces kernel3_0/m_axi_gmem_B] [get_bd_addr_segs hbm_0/SAXI_13_RT/HBM_MEM12] -force
  assign_bd_address -offset 0x0001D0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces kernel3_0/m_axi_gmem_B] [get_bd_addr_segs hbm_0/SAXI_13_RT/HBM_MEM13] -force
  assign_bd_address -offset 0x0001E0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces kernel3_0/m_axi_gmem_B] [get_bd_addr_segs hbm_0/SAXI_13_RT/HBM_MEM14] -force
  assign_bd_address -offset 0x0001F0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces kernel3_0/m_axi_gmem_B] [get_bd_addr_segs hbm_0/SAXI_13_RT/HBM_MEM15] -force
  assign_bd_address -offset 0x000100000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces kernel3_0/m_axi_gmem_C] [get_bd_addr_segs hbm_0/SAXI_14_RT/HBM_MEM00] -force
  assign_bd_address -offset 0x000110000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces kernel3_0/m_axi_gmem_C] [get_bd_addr_segs hbm_0/SAXI_14_RT/HBM_MEM01] -force
  assign_bd_address -offset 0x000120000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces kernel3_0/m_axi_gmem_C] [get_bd_addr_segs hbm_0/SAXI_14_RT/HBM_MEM02] -force
  assign_bd_address -offset 0x000130000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces kernel3_0/m_axi_gmem_C] [get_bd_addr_segs hbm_0/SAXI_14_RT/HBM_MEM03] -force
  assign_bd_address -offset 0x000140000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces kernel3_0/m_axi_gmem_C] [get_bd_addr_segs hbm_0/SAXI_14_RT/HBM_MEM04] -force
  assign_bd_address -offset 0x000150000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces kernel3_0/m_axi_gmem_C] [get_bd_addr_segs hbm_0/SAXI_14_RT/HBM_MEM05] -force
  assign_bd_address -offset 0x000160000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces kernel3_0/m_axi_gmem_C] [get_bd_addr_segs hbm_0/SAXI_14_RT/HBM_MEM06] -force
  assign_bd_address -offset 0x000170000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces kernel3_0/m_axi_gmem_C] [get_bd_addr_segs hbm_0/SAXI_14_RT/HBM_MEM07] -force
  assign_bd_address -offset 0x000180000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces kernel3_0/m_axi_gmem_C] [get_bd_addr_segs hbm_0/SAXI_14_RT/HBM_MEM08] -force
  assign_bd_address -offset 0x000190000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces kernel3_0/m_axi_gmem_C] [get_bd_addr_segs hbm_0/SAXI_14_RT/HBM_MEM09] -force
  assign_bd_address -offset 0x0001A0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces kernel3_0/m_axi_gmem_C] [get_bd_addr_segs hbm_0/SAXI_14_RT/HBM_MEM10] -force
  assign_bd_address -offset 0x0001B0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces kernel3_0/m_axi_gmem_C] [get_bd_addr_segs hbm_0/SAXI_14_RT/HBM_MEM11] -force
  assign_bd_address -offset 0x0001C0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces kernel3_0/m_axi_gmem_C] [get_bd_addr_segs hbm_0/SAXI_14_RT/HBM_MEM12] -force
  assign_bd_address -offset 0x0001D0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces kernel3_0/m_axi_gmem_C] [get_bd_addr_segs hbm_0/SAXI_14_RT/HBM_MEM13] -force
  assign_bd_address -offset 0x0001E0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces kernel3_0/m_axi_gmem_C] [get_bd_addr_segs hbm_0/SAXI_14_RT/HBM_MEM14] -force
  assign_bd_address -offset 0x0001F0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces kernel3_0/m_axi_gmem_C] [get_bd_addr_segs hbm_0/SAXI_14_RT/HBM_MEM15] -force
  assign_bd_address -offset 0x000100000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces xdma_0/M_AXI] [get_bd_addr_segs hbm_0/SAXI_15_RT/HBM_MEM00] -force
  assign_bd_address -offset 0x000110000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces xdma_0/M_AXI] [get_bd_addr_segs hbm_0/SAXI_15_RT/HBM_MEM01] -force
  assign_bd_address -offset 0x000120000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces xdma_0/M_AXI] [get_bd_addr_segs hbm_0/SAXI_15_RT/HBM_MEM02] -force
  assign_bd_address -offset 0x000130000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces xdma_0/M_AXI] [get_bd_addr_segs hbm_0/SAXI_15_RT/HBM_MEM03] -force
  assign_bd_address -offset 0x000140000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces xdma_0/M_AXI] [get_bd_addr_segs hbm_0/SAXI_15_RT/HBM_MEM04] -force
  assign_bd_address -offset 0x000150000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces xdma_0/M_AXI] [get_bd_addr_segs hbm_0/SAXI_15_RT/HBM_MEM05] -force
  assign_bd_address -offset 0x000160000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces xdma_0/M_AXI] [get_bd_addr_segs hbm_0/SAXI_15_RT/HBM_MEM06] -force
  assign_bd_address -offset 0x000170000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces xdma_0/M_AXI] [get_bd_addr_segs hbm_0/SAXI_15_RT/HBM_MEM07] -force
  assign_bd_address -offset 0x000180000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces xdma_0/M_AXI] [get_bd_addr_segs hbm_0/SAXI_15_RT/HBM_MEM08] -force
  assign_bd_address -offset 0x000190000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces xdma_0/M_AXI] [get_bd_addr_segs hbm_0/SAXI_15_RT/HBM_MEM09] -force
  assign_bd_address -offset 0x0001A0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces xdma_0/M_AXI] [get_bd_addr_segs hbm_0/SAXI_15_RT/HBM_MEM10] -force
  assign_bd_address -offset 0x0001B0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces xdma_0/M_AXI] [get_bd_addr_segs hbm_0/SAXI_15_RT/HBM_MEM11] -force
  assign_bd_address -offset 0x0001C0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces xdma_0/M_AXI] [get_bd_addr_segs hbm_0/SAXI_15_RT/HBM_MEM12] -force
  assign_bd_address -offset 0x0001D0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces xdma_0/M_AXI] [get_bd_addr_segs hbm_0/SAXI_15_RT/HBM_MEM13] -force
  assign_bd_address -offset 0x0001E0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces xdma_0/M_AXI] [get_bd_addr_segs hbm_0/SAXI_15_RT/HBM_MEM14] -force
  assign_bd_address -offset 0x0001F0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces xdma_0/M_AXI] [get_bd_addr_segs hbm_0/SAXI_15_RT/HBM_MEM15] -force
  assign_bd_address -offset 0x00000000 -range 0x00001000 -target_address_space [get_bd_addr_spaces xdma_0/M_AXI_BYPASS] [get_bd_addr_segs kernel3_0/s_axi_control/reg0] -force


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
