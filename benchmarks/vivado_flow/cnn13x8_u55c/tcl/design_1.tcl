
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
# kernel3

# Please add the sources of those modules before sourcing this Tcl script.

# If there is no project opened, this script will create a
# project, but make sure you do not have an existing project
# <./myproj/project_1.xpr> in the current working folder.

set list_projs [get_projects -quiet]
if { $list_projs eq "" } {
   create_project project_1 myproj -part xcu55c-fsvh2892-2L-e
   set_property BOARD_PART xilinx.com:au55c:part0:1.0 [current_project]
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
  set pci_express_x4 [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:pcie_7x_mgt_rtl:1.0 pci_express_x4 ]

  set pcie_refclk [ create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:diff_clock_rtl:1.0 pcie_refclk ]
  set_property -dict [ list \
   CONFIG.FREQ_HZ {100000000} \
   ] $pcie_refclk

  set slr0_freerun_clk [ create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:diff_clock_rtl:1.0 slr0_freerun_clk ]
  set_property -dict [ list \
   CONFIG.FREQ_HZ {100000000} \
   ] $slr0_freerun_clk


  # Create ports
  set pcie_perstn [ create_bd_port -dir I -type rst pcie_perstn ]
  set_property -dict [ list \
   CONFIG.POLARITY {ACTIVE_LOW} \
 ] $pcie_perstn

  # Create instance: apb_sys_reset, and set properties
  set apb_sys_reset [ create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 apb_sys_reset ]

  # Create instance: axi_mem_intercon, and set properties
  set axi_mem_intercon [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 axi_mem_intercon ]
  set_property CONFIG.NUM_MI {1} $axi_mem_intercon


  # Create instance: axi_register_slice_7, and set properties
  set axi_register_slice_7 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_register_slice:2.1 axi_register_slice_7 ]

  # Create instance: axi_register_slice_8, and set properties
  set axi_register_slice_8 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_register_slice:2.1 axi_register_slice_8 ]

  # Create instance: axi_register_slice_9, and set properties
  set axi_register_slice_9 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_register_slice:2.1 axi_register_slice_9 ]

  # Create instance: axi_register_slice_10, and set properties
  set axi_register_slice_10 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_register_slice:2.1 axi_register_slice_10 ]

  # Create instance: axi_register_slice_31, and set properties
  set axi_register_slice_31 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_register_slice:2.1 axi_register_slice_31 ]

  # Create instance: axi_register_slice_32, and set properties
  set axi_register_slice_32 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_register_slice:2.1 axi_register_slice_32 ]

  # Create instance: dma_sys_reset, and set properties
  set dma_sys_reset [ create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 dma_sys_reset ]

  # Create instance: hbm_0, and set properties
  set hbm_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:hbm:1.0 hbm_0 ]
  set_property -dict [list \
    CONFIG.USER_APB_EN {false} \
    CONFIG.USER_HBM_DENSITY {8GB} \
    CONFIG.USER_SAXI_00 {false} \
    CONFIG.USER_SAXI_01 {false} \
    CONFIG.USER_SAXI_03 {false} \
    CONFIG.USER_SAXI_05 {false} \
    CONFIG.USER_SAXI_06 {false} \
    CONFIG.USER_SAXI_07 {false} \
    CONFIG.USER_SAXI_08 {false} \
    CONFIG.USER_SAXI_09 {false} \
    CONFIG.USER_SAXI_10 {true} \
    CONFIG.USER_SAXI_11 {false} \
    CONFIG.USER_SAXI_12 {true} \
    CONFIG.USER_SAXI_13 {false} \
    CONFIG.USER_SAXI_14 {false} \
    CONFIG.USER_SAXI_15 {false} \
    CONFIG.USER_SAXI_17 {false} \
    CONFIG.USER_SAXI_18 {false} \
    CONFIG.USER_SAXI_19 {false} \
    CONFIG.USER_SAXI_20 {true} \
    CONFIG.USER_SAXI_21 {false} \
    CONFIG.USER_SAXI_22 {false} \
    CONFIG.USER_SAXI_23 {false} \
    CONFIG.USER_SAXI_25 {false} \
    CONFIG.USER_SAXI_26 {false} \
    CONFIG.USER_SAXI_27 {false} \
    CONFIG.USER_SAXI_29 {false} \
    CONFIG.USER_SAXI_30 {false} \
    CONFIG.USER_SAXI_31 {true} \
    CONFIG.USER_SINGLE_STACK_SELECTION {RIGHT} \
  ] $hbm_0


  # Create instance: hbm_axi_clk, and set properties
  set hbm_axi_clk [ create_bd_cell -type ip -vlnv xilinx.com:ip:clk_wiz:6.0 hbm_axi_clk ]
  set_property -dict [list \
    CONFIG.CLKOUT1_JITTER {156.775} \
    CONFIG.CLKOUT1_PHASE_ERROR {219.953} \
    CONFIG.CLKOUT1_REQUESTED_OUT_FREQ {225} \
    CONFIG.MMCM_CLKFBOUT_MULT_F {48.375} \
    CONFIG.MMCM_CLKOUT0_DIVIDE_F {5.375} \
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
   CONFIG.FREQ_HZ {400000000} \
 ] [get_bd_intf_pins /kernel3_0/m_axi_gmem_A]

  set_property -dict [ list \
   CONFIG.FREQ_HZ {400000000} \
 ] [get_bd_intf_pins /kernel3_0/m_axi_gmem_B]

  set_property -dict [ list \
   CONFIG.FREQ_HZ {400000000} \
 ] [get_bd_intf_pins /kernel3_0/m_axi_gmem_C]

  set_property -dict [ list \
   CONFIG.FREQ_HZ {400000000} \
 ] [get_bd_intf_pins /kernel3_0/s_axi_control]

  # Create instance: kernel_clk, and set properties
  set kernel_clk [ create_bd_cell -type ip -vlnv xilinx.com:ip:clk_wiz:6.0 kernel_clk ]
  set_property -dict [list \
    CONFIG.CLKOUT1_JITTER {146.303} \
    CONFIG.CLKOUT1_REQUESTED_OUT_FREQ {400} \
    CONFIG.MMCM_CLKOUT0_DIVIDE_F {3.000} \
    CONFIG.RESET_PORT {resetn} \
    CONFIG.RESET_TYPE {ACTIVE_LOW} \
  ] $kernel_clk


  # Create instance: kernel_sys_reset, and set properties
  set kernel_sys_reset [ create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 kernel_sys_reset ]

  # Create instance: smartconnect_7, and set properties
  set smartconnect_7 [ create_bd_cell -type ip -vlnv xilinx.com:ip:smartconnect:1.0 smartconnect_7 ]
  set_property -dict [list \
    CONFIG.NUM_CLKS {2} \
    CONFIG.NUM_SI {1} \
  ] $smartconnect_7


  # Create instance: smartconnect_8, and set properties
  set smartconnect_8 [ create_bd_cell -type ip -vlnv xilinx.com:ip:smartconnect:1.0 smartconnect_8 ]
  set_property -dict [list \
    CONFIG.NUM_CLKS {2} \
    CONFIG.NUM_SI {1} \
  ] $smartconnect_8


  # Create instance: smartconnect_9, and set properties
  set smartconnect_9 [ create_bd_cell -type ip -vlnv xilinx.com:ip:smartconnect:1.0 smartconnect_9 ]
  set_property -dict [list \
    CONFIG.NUM_CLKS {2} \
    CONFIG.NUM_SI {1} \
  ] $smartconnect_9


  # Create instance: util_ds_buf_0, and set properties
  set util_ds_buf_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_ds_buf:2.2 util_ds_buf_0 ]
  set_property -dict [list \
    CONFIG.DIFF_CLK_IN_BOARD_INTERFACE {slr0_freerun_clk} \
    CONFIG.USE_BOARD_FLOW {true} \
  ] $util_ds_buf_0


  # Create instance: util_ds_buf_1, and set properties
  set util_ds_buf_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_ds_buf:2.2 util_ds_buf_1 ]
  set_property CONFIG.C_BUF_TYPE {IBUFDSGTE} $util_ds_buf_1


  # Create instance: xdma_0, and set properties
  set xdma_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xdma:4.1 xdma_0 ]
  set_property -dict [list \
    CONFIG.PCIE_BOARD_INTERFACE {pci_express_x4} \
    CONFIG.SYS_RST_N_BOARD_INTERFACE {pcie_perstn} \
    CONFIG.axi_data_width {128_bit} \
    CONFIG.axist_bypass_en {true} \
    CONFIG.axisten_freq {125} \
    CONFIG.pl_link_cap_max_link_speed {16.0_GT/s} \
    CONFIG.xdma_axi_intf_mm {AXI_Memory_Mapped} \
    CONFIG.xdma_rnum_chnl {4} \
    CONFIG.xdma_wnum_chnl {4} \
  ] $xdma_0


  # Create instance: xdma_0_axi_periph, and set properties
  set xdma_0_axi_periph [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 xdma_0_axi_periph ]
  set_property CONFIG.NUM_MI {1} $xdma_0_axi_periph


  # Create interface connections
  connect_bd_intf_net -intf_net axi_mem_intercon_M00_AXI [get_bd_intf_pins axi_mem_intercon/M00_AXI] [get_bd_intf_pins axi_register_slice_31/S_AXI]
  connect_bd_intf_net -intf_net axi_register_slice_10_M_AXI [get_bd_intf_pins axi_register_slice_10/M_AXI] [get_bd_intf_pins kernel3_0/s_axi_control]
  connect_bd_intf_net -intf_net axi_register_slice_1_M_AXI [get_bd_intf_pins axi_mem_intercon/S00_AXI] [get_bd_intf_pins axi_register_slice_32/M_AXI]
  connect_bd_intf_net -intf_net axi_register_slice_31_M_AXI [get_bd_intf_pins axi_register_slice_31/M_AXI] [get_bd_intf_pins hbm_0/SAXI_12_RT_8HI]
  connect_bd_intf_net -intf_net axi_register_slice_7_M_AXI [get_bd_intf_pins axi_register_slice_7/M_AXI] [get_bd_intf_pins hbm_0/SAXI_10_RT_8HI]
  connect_bd_intf_net -intf_net axi_register_slice_8_M_AXI [get_bd_intf_pins axi_register_slice_8/M_AXI] [get_bd_intf_pins hbm_0/SAXI_04_RT_8HI]
  connect_bd_intf_net -intf_net axi_register_slice_9_M_AXI [get_bd_intf_pins axi_register_slice_9/M_AXI] [get_bd_intf_pins hbm_0/SAXI_02_RT_8HI]
  connect_bd_intf_net -intf_net kernel3_0_m_axi_gmem_A [get_bd_intf_pins kernel3_0/m_axi_gmem_A] [get_bd_intf_pins smartconnect_9/S00_AXI]
  connect_bd_intf_net -intf_net kernel3_0_m_axi_gmem_B [get_bd_intf_pins kernel3_0/m_axi_gmem_B] [get_bd_intf_pins smartconnect_8/S00_AXI]
  connect_bd_intf_net -intf_net kernel3_0_m_axi_gmem_C [get_bd_intf_pins kernel3_0/m_axi_gmem_C] [get_bd_intf_pins smartconnect_7/S00_AXI]
  connect_bd_intf_net -intf_net pcie_refclk_1 [get_bd_intf_ports pcie_refclk] [get_bd_intf_pins util_ds_buf_1/CLK_IN_D]
  connect_bd_intf_net -intf_net slr0_freerun_clk_1 [get_bd_intf_ports slr0_freerun_clk] [get_bd_intf_pins util_ds_buf_0/CLK_IN_D]
  connect_bd_intf_net -intf_net smartconnect_7_M00_AXI [get_bd_intf_pins axi_register_slice_7/S_AXI] [get_bd_intf_pins smartconnect_7/M00_AXI]
  connect_bd_intf_net -intf_net smartconnect_8_M00_AXI [get_bd_intf_pins axi_register_slice_8/S_AXI] [get_bd_intf_pins smartconnect_8/M00_AXI]
  connect_bd_intf_net -intf_net smartconnect_9_M00_AXI [get_bd_intf_pins axi_register_slice_9/S_AXI] [get_bd_intf_pins smartconnect_9/M00_AXI]
  connect_bd_intf_net -intf_net xdma_0_M_AXI [get_bd_intf_pins axi_register_slice_32/S_AXI] [get_bd_intf_pins xdma_0/M_AXI]
  connect_bd_intf_net -intf_net xdma_0_M_AXI_BYPASS [get_bd_intf_pins xdma_0/M_AXI_BYPASS] [get_bd_intf_pins xdma_0_axi_periph/S00_AXI]
  connect_bd_intf_net -intf_net xdma_0_axi_periph_M00_AXI [get_bd_intf_pins axi_register_slice_10/S_AXI] [get_bd_intf_pins xdma_0_axi_periph/M00_AXI]
  connect_bd_intf_net -intf_net xdma_0_pcie_mgt [get_bd_intf_ports pci_express_x4] [get_bd_intf_pins xdma_0/pcie_mgt]

  # Create port connections
  connect_bd_net -net apb_sys_reset_peripheral_aresetn [get_bd_pins apb_sys_reset/peripheral_aresetn] [get_bd_pins hbm_0/APB_0_PRESET_N]
  connect_bd_net -net dma_sys_reset_peripheral_aresetn [get_bd_pins axi_register_slice_32/aresetn] [get_bd_pins dma_sys_reset/peripheral_aresetn]
  connect_bd_net -net hbm_axi_clk_clk_out1 [get_bd_pins axi_mem_intercon/M00_ACLK] [get_bd_pins axi_register_slice_31/aclk] [get_bd_pins axi_register_slice_7/aclk] [get_bd_pins axi_register_slice_8/aclk] [get_bd_pins axi_register_slice_9/aclk] [get_bd_pins hbm_0/AXI_02_ACLK] [get_bd_pins hbm_0/AXI_04_ACLK] [get_bd_pins hbm_0/AXI_10_ACLK] [get_bd_pins hbm_0/AXI_12_ACLK] [get_bd_pins hbm_axi_clk/clk_out1] [get_bd_pins hbm_sys_reset/slowest_sync_clk] [get_bd_pins smartconnect_7/aclk1] [get_bd_pins smartconnect_8/aclk1] [get_bd_pins smartconnect_9/aclk1]
  connect_bd_net -net hbm_axi_clk_locked [get_bd_pins hbm_axi_clk/locked] [get_bd_pins hbm_sys_reset/dcm_locked]
  connect_bd_net -net hbm_sys_reset_interconnect_aresetn [get_bd_pins axi_register_slice_7/aresetn] [get_bd_pins axi_register_slice_8/aresetn] [get_bd_pins axi_register_slice_9/aresetn] [get_bd_pins hbm_sys_reset/interconnect_aresetn]
  connect_bd_net -net hbm_sys_reset_peripheral_aresetn [get_bd_pins axi_mem_intercon/M00_ARESETN] [get_bd_pins axi_register_slice_31/aresetn] [get_bd_pins hbm_0/AXI_02_ARESET_N] [get_bd_pins hbm_0/AXI_04_ARESET_N] [get_bd_pins hbm_0/AXI_10_ARESET_N] [get_bd_pins hbm_0/AXI_12_ARESET_N] [get_bd_pins hbm_sys_reset/peripheral_aresetn]
  connect_bd_net -net kernel_clk_clk_out1 [get_bd_pins axi_register_slice_10/aclk] [get_bd_pins kernel3_0/ap_clk] [get_bd_pins kernel_clk/clk_out1] [get_bd_pins kernel_sys_reset/slowest_sync_clk] [get_bd_pins smartconnect_7/aclk] [get_bd_pins smartconnect_8/aclk] [get_bd_pins smartconnect_9/aclk] [get_bd_pins xdma_0_axi_periph/M00_ACLK]
  connect_bd_net -net kernel_clk_locked [get_bd_pins kernel_clk/locked] [get_bd_pins kernel_sys_reset/dcm_locked]
  connect_bd_net -net kernel_sys_reset_interconnect_aresetn [get_bd_pins kernel_sys_reset/interconnect_aresetn] [get_bd_pins xdma_0_axi_periph/M00_ARESETN]
  connect_bd_net -net kernel_sys_reset_peripheral_aresetn [get_bd_pins axi_register_slice_10/aresetn] [get_bd_pins kernel3_0/ap_rst_n] [get_bd_pins kernel_sys_reset/peripheral_aresetn] [get_bd_pins smartconnect_7/aresetn] [get_bd_pins smartconnect_8/aresetn] [get_bd_pins smartconnect_9/aresetn]
  connect_bd_net -net pcie_perstn_1 [get_bd_ports pcie_perstn] [get_bd_pins xdma_0/sys_rst_n]
  connect_bd_net -net util_ds_buf_0_IBUF_OUT [get_bd_pins apb_sys_reset/slowest_sync_clk] [get_bd_pins hbm_0/APB_0_PCLK] [get_bd_pins hbm_0/HBM_REF_CLK_0] [get_bd_pins util_ds_buf_0/IBUF_OUT]
  connect_bd_net -net util_ds_buf_1_IBUF_OUT [get_bd_pins util_ds_buf_1/IBUF_OUT] [get_bd_pins xdma_0/sys_clk_gt]
  connect_bd_net -net util_ds_buf_IBUF_DS_ODIV2 [get_bd_pins util_ds_buf_1/IBUF_DS_ODIV2] [get_bd_pins xdma_0/sys_clk]
  connect_bd_net -net xdma_0_axi_aclk [get_bd_pins axi_mem_intercon/ACLK] [get_bd_pins axi_mem_intercon/S00_ACLK] [get_bd_pins axi_register_slice_32/aclk] [get_bd_pins dma_sys_reset/slowest_sync_clk] [get_bd_pins hbm_axi_clk/clk_in1] [get_bd_pins kernel_clk/clk_in1] [get_bd_pins xdma_0/axi_aclk] [get_bd_pins xdma_0_axi_periph/ACLK] [get_bd_pins xdma_0_axi_periph/S00_ACLK]
  connect_bd_net -net xdma_0_axi_aresetn [get_bd_pins apb_sys_reset/ext_reset_in] [get_bd_pins axi_mem_intercon/ARESETN] [get_bd_pins axi_mem_intercon/S00_ARESETN] [get_bd_pins dma_sys_reset/ext_reset_in] [get_bd_pins hbm_axi_clk/resetn] [get_bd_pins hbm_sys_reset/ext_reset_in] [get_bd_pins kernel_clk/resetn] [get_bd_pins kernel_sys_reset/ext_reset_in] [get_bd_pins xdma_0/axi_aresetn] [get_bd_pins xdma_0_axi_periph/ARESETN] [get_bd_pins xdma_0_axi_periph/S00_ARESETN]

  # Create address segments
  assign_bd_address -offset 0x000200000000 -range 0x20000000 -target_address_space [get_bd_addr_spaces kernel3_0/m_axi_gmem_A] [get_bd_addr_segs hbm_0/SAXI_02_RT_8HI/HBM_MEM00] -force
  assign_bd_address -offset 0x000220000000 -range 0x20000000 -target_address_space [get_bd_addr_spaces kernel3_0/m_axi_gmem_A] [get_bd_addr_segs hbm_0/SAXI_02_RT_8HI/HBM_MEM01] -force
  assign_bd_address -offset 0x000240000000 -range 0x20000000 -target_address_space [get_bd_addr_spaces kernel3_0/m_axi_gmem_A] [get_bd_addr_segs hbm_0/SAXI_02_RT_8HI/HBM_MEM02] -force
  assign_bd_address -offset 0x000260000000 -range 0x20000000 -target_address_space [get_bd_addr_spaces kernel3_0/m_axi_gmem_A] [get_bd_addr_segs hbm_0/SAXI_02_RT_8HI/HBM_MEM03] -force
  assign_bd_address -offset 0x000280000000 -range 0x20000000 -target_address_space [get_bd_addr_spaces kernel3_0/m_axi_gmem_A] [get_bd_addr_segs hbm_0/SAXI_02_RT_8HI/HBM_MEM04] -force
  assign_bd_address -offset 0x0002A0000000 -range 0x20000000 -target_address_space [get_bd_addr_spaces kernel3_0/m_axi_gmem_A] [get_bd_addr_segs hbm_0/SAXI_02_RT_8HI/HBM_MEM05] -force
  assign_bd_address -offset 0x0002C0000000 -range 0x20000000 -target_address_space [get_bd_addr_spaces kernel3_0/m_axi_gmem_A] [get_bd_addr_segs hbm_0/SAXI_02_RT_8HI/HBM_MEM06] -force
  assign_bd_address -offset 0x0002E0000000 -range 0x20000000 -target_address_space [get_bd_addr_spaces kernel3_0/m_axi_gmem_A] [get_bd_addr_segs hbm_0/SAXI_02_RT_8HI/HBM_MEM07] -force
  assign_bd_address -offset 0x000300000000 -range 0x20000000 -target_address_space [get_bd_addr_spaces kernel3_0/m_axi_gmem_A] [get_bd_addr_segs hbm_0/SAXI_02_RT_8HI/HBM_MEM08] -force
  assign_bd_address -offset 0x000320000000 -range 0x20000000 -target_address_space [get_bd_addr_spaces kernel3_0/m_axi_gmem_A] [get_bd_addr_segs hbm_0/SAXI_02_RT_8HI/HBM_MEM09] -force
  assign_bd_address -offset 0x000340000000 -range 0x20000000 -target_address_space [get_bd_addr_spaces kernel3_0/m_axi_gmem_A] [get_bd_addr_segs hbm_0/SAXI_02_RT_8HI/HBM_MEM10] -force
  assign_bd_address -offset 0x000360000000 -range 0x20000000 -target_address_space [get_bd_addr_spaces kernel3_0/m_axi_gmem_A] [get_bd_addr_segs hbm_0/SAXI_02_RT_8HI/HBM_MEM11] -force
  assign_bd_address -offset 0x000380000000 -range 0x20000000 -target_address_space [get_bd_addr_spaces kernel3_0/m_axi_gmem_A] [get_bd_addr_segs hbm_0/SAXI_02_RT_8HI/HBM_MEM12] -force
  assign_bd_address -offset 0x0003A0000000 -range 0x20000000 -target_address_space [get_bd_addr_spaces kernel3_0/m_axi_gmem_A] [get_bd_addr_segs hbm_0/SAXI_02_RT_8HI/HBM_MEM13] -force
  assign_bd_address -offset 0x0003C0000000 -range 0x20000000 -target_address_space [get_bd_addr_spaces kernel3_0/m_axi_gmem_A] [get_bd_addr_segs hbm_0/SAXI_02_RT_8HI/HBM_MEM14] -force
  assign_bd_address -offset 0x0003E0000000 -range 0x20000000 -target_address_space [get_bd_addr_spaces kernel3_0/m_axi_gmem_A] [get_bd_addr_segs hbm_0/SAXI_02_RT_8HI/HBM_MEM15] -force
  assign_bd_address -offset 0x000200000000 -range 0x20000000 -target_address_space [get_bd_addr_spaces kernel3_0/m_axi_gmem_B] [get_bd_addr_segs hbm_0/SAXI_04_RT_8HI/HBM_MEM00] -force
  assign_bd_address -offset 0x000220000000 -range 0x20000000 -target_address_space [get_bd_addr_spaces kernel3_0/m_axi_gmem_B] [get_bd_addr_segs hbm_0/SAXI_04_RT_8HI/HBM_MEM01] -force
  assign_bd_address -offset 0x000240000000 -range 0x20000000 -target_address_space [get_bd_addr_spaces kernel3_0/m_axi_gmem_B] [get_bd_addr_segs hbm_0/SAXI_04_RT_8HI/HBM_MEM02] -force
  assign_bd_address -offset 0x000260000000 -range 0x20000000 -target_address_space [get_bd_addr_spaces kernel3_0/m_axi_gmem_B] [get_bd_addr_segs hbm_0/SAXI_04_RT_8HI/HBM_MEM03] -force
  assign_bd_address -offset 0x000280000000 -range 0x20000000 -target_address_space [get_bd_addr_spaces kernel3_0/m_axi_gmem_B] [get_bd_addr_segs hbm_0/SAXI_04_RT_8HI/HBM_MEM04] -force
  assign_bd_address -offset 0x0002A0000000 -range 0x20000000 -target_address_space [get_bd_addr_spaces kernel3_0/m_axi_gmem_B] [get_bd_addr_segs hbm_0/SAXI_04_RT_8HI/HBM_MEM05] -force
  assign_bd_address -offset 0x0002C0000000 -range 0x20000000 -target_address_space [get_bd_addr_spaces kernel3_0/m_axi_gmem_B] [get_bd_addr_segs hbm_0/SAXI_04_RT_8HI/HBM_MEM06] -force
  assign_bd_address -offset 0x0002E0000000 -range 0x20000000 -target_address_space [get_bd_addr_spaces kernel3_0/m_axi_gmem_B] [get_bd_addr_segs hbm_0/SAXI_04_RT_8HI/HBM_MEM07] -force
  assign_bd_address -offset 0x000300000000 -range 0x20000000 -target_address_space [get_bd_addr_spaces kernel3_0/m_axi_gmem_B] [get_bd_addr_segs hbm_0/SAXI_04_RT_8HI/HBM_MEM08] -force
  assign_bd_address -offset 0x000320000000 -range 0x20000000 -target_address_space [get_bd_addr_spaces kernel3_0/m_axi_gmem_B] [get_bd_addr_segs hbm_0/SAXI_04_RT_8HI/HBM_MEM09] -force
  assign_bd_address -offset 0x000340000000 -range 0x20000000 -target_address_space [get_bd_addr_spaces kernel3_0/m_axi_gmem_B] [get_bd_addr_segs hbm_0/SAXI_04_RT_8HI/HBM_MEM10] -force
  assign_bd_address -offset 0x000360000000 -range 0x20000000 -target_address_space [get_bd_addr_spaces kernel3_0/m_axi_gmem_B] [get_bd_addr_segs hbm_0/SAXI_04_RT_8HI/HBM_MEM11] -force
  assign_bd_address -offset 0x000380000000 -range 0x20000000 -target_address_space [get_bd_addr_spaces kernel3_0/m_axi_gmem_B] [get_bd_addr_segs hbm_0/SAXI_04_RT_8HI/HBM_MEM12] -force
  assign_bd_address -offset 0x0003A0000000 -range 0x20000000 -target_address_space [get_bd_addr_spaces kernel3_0/m_axi_gmem_B] [get_bd_addr_segs hbm_0/SAXI_04_RT_8HI/HBM_MEM13] -force
  assign_bd_address -offset 0x0003C0000000 -range 0x20000000 -target_address_space [get_bd_addr_spaces kernel3_0/m_axi_gmem_B] [get_bd_addr_segs hbm_0/SAXI_04_RT_8HI/HBM_MEM14] -force
  assign_bd_address -offset 0x0003E0000000 -range 0x20000000 -target_address_space [get_bd_addr_spaces kernel3_0/m_axi_gmem_B] [get_bd_addr_segs hbm_0/SAXI_04_RT_8HI/HBM_MEM15] -force
  assign_bd_address -offset 0x000200000000 -range 0x20000000 -target_address_space [get_bd_addr_spaces kernel3_0/m_axi_gmem_C] [get_bd_addr_segs hbm_0/SAXI_10_RT_8HI/HBM_MEM00] -force
  assign_bd_address -offset 0x000220000000 -range 0x20000000 -target_address_space [get_bd_addr_spaces kernel3_0/m_axi_gmem_C] [get_bd_addr_segs hbm_0/SAXI_10_RT_8HI/HBM_MEM01] -force
  assign_bd_address -offset 0x000240000000 -range 0x20000000 -target_address_space [get_bd_addr_spaces kernel3_0/m_axi_gmem_C] [get_bd_addr_segs hbm_0/SAXI_10_RT_8HI/HBM_MEM02] -force
  assign_bd_address -offset 0x000260000000 -range 0x20000000 -target_address_space [get_bd_addr_spaces kernel3_0/m_axi_gmem_C] [get_bd_addr_segs hbm_0/SAXI_10_RT_8HI/HBM_MEM03] -force
  assign_bd_address -offset 0x000280000000 -range 0x20000000 -target_address_space [get_bd_addr_spaces kernel3_0/m_axi_gmem_C] [get_bd_addr_segs hbm_0/SAXI_10_RT_8HI/HBM_MEM04] -force
  assign_bd_address -offset 0x0002A0000000 -range 0x20000000 -target_address_space [get_bd_addr_spaces kernel3_0/m_axi_gmem_C] [get_bd_addr_segs hbm_0/SAXI_10_RT_8HI/HBM_MEM05] -force
  assign_bd_address -offset 0x0002C0000000 -range 0x20000000 -target_address_space [get_bd_addr_spaces kernel3_0/m_axi_gmem_C] [get_bd_addr_segs hbm_0/SAXI_10_RT_8HI/HBM_MEM06] -force
  assign_bd_address -offset 0x0002E0000000 -range 0x20000000 -target_address_space [get_bd_addr_spaces kernel3_0/m_axi_gmem_C] [get_bd_addr_segs hbm_0/SAXI_10_RT_8HI/HBM_MEM07] -force
  assign_bd_address -offset 0x000300000000 -range 0x20000000 -target_address_space [get_bd_addr_spaces kernel3_0/m_axi_gmem_C] [get_bd_addr_segs hbm_0/SAXI_10_RT_8HI/HBM_MEM08] -force
  assign_bd_address -offset 0x000320000000 -range 0x20000000 -target_address_space [get_bd_addr_spaces kernel3_0/m_axi_gmem_C] [get_bd_addr_segs hbm_0/SAXI_10_RT_8HI/HBM_MEM09] -force
  assign_bd_address -offset 0x000340000000 -range 0x20000000 -target_address_space [get_bd_addr_spaces kernel3_0/m_axi_gmem_C] [get_bd_addr_segs hbm_0/SAXI_10_RT_8HI/HBM_MEM10] -force
  assign_bd_address -offset 0x000360000000 -range 0x20000000 -target_address_space [get_bd_addr_spaces kernel3_0/m_axi_gmem_C] [get_bd_addr_segs hbm_0/SAXI_10_RT_8HI/HBM_MEM11] -force
  assign_bd_address -offset 0x000380000000 -range 0x20000000 -target_address_space [get_bd_addr_spaces kernel3_0/m_axi_gmem_C] [get_bd_addr_segs hbm_0/SAXI_10_RT_8HI/HBM_MEM12] -force
  assign_bd_address -offset 0x0003A0000000 -range 0x20000000 -target_address_space [get_bd_addr_spaces kernel3_0/m_axi_gmem_C] [get_bd_addr_segs hbm_0/SAXI_10_RT_8HI/HBM_MEM13] -force
  assign_bd_address -offset 0x0003C0000000 -range 0x20000000 -target_address_space [get_bd_addr_spaces kernel3_0/m_axi_gmem_C] [get_bd_addr_segs hbm_0/SAXI_10_RT_8HI/HBM_MEM14] -force
  assign_bd_address -offset 0x0003E0000000 -range 0x20000000 -target_address_space [get_bd_addr_spaces kernel3_0/m_axi_gmem_C] [get_bd_addr_segs hbm_0/SAXI_10_RT_8HI/HBM_MEM15] -force
  assign_bd_address -offset 0x000200000000 -range 0x20000000 -target_address_space [get_bd_addr_spaces xdma_0/M_AXI] [get_bd_addr_segs hbm_0/SAXI_12_RT_8HI/HBM_MEM00] -force
  assign_bd_address -offset 0x000220000000 -range 0x20000000 -target_address_space [get_bd_addr_spaces xdma_0/M_AXI] [get_bd_addr_segs hbm_0/SAXI_12_RT_8HI/HBM_MEM01] -force
  assign_bd_address -offset 0x000240000000 -range 0x20000000 -target_address_space [get_bd_addr_spaces xdma_0/M_AXI] [get_bd_addr_segs hbm_0/SAXI_12_RT_8HI/HBM_MEM02] -force
  assign_bd_address -offset 0x000260000000 -range 0x20000000 -target_address_space [get_bd_addr_spaces xdma_0/M_AXI] [get_bd_addr_segs hbm_0/SAXI_12_RT_8HI/HBM_MEM03] -force
  assign_bd_address -offset 0x000280000000 -range 0x20000000 -target_address_space [get_bd_addr_spaces xdma_0/M_AXI] [get_bd_addr_segs hbm_0/SAXI_12_RT_8HI/HBM_MEM04] -force
  assign_bd_address -offset 0x0002A0000000 -range 0x20000000 -target_address_space [get_bd_addr_spaces xdma_0/M_AXI] [get_bd_addr_segs hbm_0/SAXI_12_RT_8HI/HBM_MEM05] -force
  assign_bd_address -offset 0x0002C0000000 -range 0x20000000 -target_address_space [get_bd_addr_spaces xdma_0/M_AXI] [get_bd_addr_segs hbm_0/SAXI_12_RT_8HI/HBM_MEM06] -force
  assign_bd_address -offset 0x0002E0000000 -range 0x20000000 -target_address_space [get_bd_addr_spaces xdma_0/M_AXI] [get_bd_addr_segs hbm_0/SAXI_12_RT_8HI/HBM_MEM07] -force
  assign_bd_address -offset 0x000300000000 -range 0x20000000 -target_address_space [get_bd_addr_spaces xdma_0/M_AXI] [get_bd_addr_segs hbm_0/SAXI_12_RT_8HI/HBM_MEM08] -force
  assign_bd_address -offset 0x000320000000 -range 0x20000000 -target_address_space [get_bd_addr_spaces xdma_0/M_AXI] [get_bd_addr_segs hbm_0/SAXI_12_RT_8HI/HBM_MEM09] -force
  assign_bd_address -offset 0x000340000000 -range 0x20000000 -target_address_space [get_bd_addr_spaces xdma_0/M_AXI] [get_bd_addr_segs hbm_0/SAXI_12_RT_8HI/HBM_MEM10] -force
  assign_bd_address -offset 0x000360000000 -range 0x20000000 -target_address_space [get_bd_addr_spaces xdma_0/M_AXI] [get_bd_addr_segs hbm_0/SAXI_12_RT_8HI/HBM_MEM11] -force
  assign_bd_address -offset 0x000380000000 -range 0x20000000 -target_address_space [get_bd_addr_spaces xdma_0/M_AXI] [get_bd_addr_segs hbm_0/SAXI_12_RT_8HI/HBM_MEM12] -force
  assign_bd_address -offset 0x0003A0000000 -range 0x20000000 -target_address_space [get_bd_addr_spaces xdma_0/M_AXI] [get_bd_addr_segs hbm_0/SAXI_12_RT_8HI/HBM_MEM13] -force
  assign_bd_address -offset 0x0003C0000000 -range 0x20000000 -target_address_space [get_bd_addr_spaces xdma_0/M_AXI] [get_bd_addr_segs hbm_0/SAXI_12_RT_8HI/HBM_MEM14] -force
  assign_bd_address -offset 0x0003E0000000 -range 0x20000000 -target_address_space [get_bd_addr_spaces xdma_0/M_AXI] [get_bd_addr_segs hbm_0/SAXI_12_RT_8HI/HBM_MEM15] -force
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
