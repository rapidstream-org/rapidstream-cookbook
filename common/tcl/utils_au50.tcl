set MAX_HBM_NUM 32

proc getEnvInt { varName defaultIntValue } {
  set value [expr {[info exists ::env($varName)] ? $::env($varName) : $defaultIntValue}]
  return [expr {int($value)}]
}

proc get_configure_params { config_file } {
  # Return a list of global parameters (part, board, kernel name)

  # Check if the json package is available; if not, install it
  if {[catch {package require json}]} {
      package require json
  }

  # Read the contents of a JSON file into a variable
  set filename "${config_file}"
  set file_content [open $filename r]
  set json_data [read $file_content]
  close $file_content

  # Parse the JSON data into a dictionary
  set parsed_dict [json::json2dict $json_data]


  set misc_dict    [dict get $parsed_dict "misc"]
  set arg2hbm_dict [dict get $parsed_dict "arg2hbm"]

  return [list $misc_dict $arg2hbm_dict]

}

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

proc number_of_processor {} {
    global tcl_platform env
    switch ${tcl_platform(platform)} {
        "windows" {
            return $env(NUMBER_OF_PROCESSORS)
        }

        "unix" {
            if {![catch {open "/proc/cpuinfo"} f]} {
                set cores [regexp -all -line {^processor\s} [read $f]]
                close $f
                if {$cores > 0} {
                    return $cores
                }
            }
        }

        "Darwin" {
            if {![catch {exec {*}$sysctl -n "hw.ncpu"} cores]} {
                return $cores
            }
        }

        default {
            puts "Unknown System"
            return 1
        }
    }
}

proc set_kernel_frequency { KL_FREQ } {
    # Configuration settings for different frequencies
    set config_settings {
        450 {CONFIG.CLKOUT1_DRIVES Buffer CONFIG.CLKOUT1_JITTER 104.289 CONFIG.CLKOUT1_PHASE_ERROR 153.873 CONFIG.CLKOUT1_REQUESTED_OUT_FREQ 450                                                                                                                                                                                                                                                    CONFIG.MMCM_CLKFBOUT_MULT_F 23.625 CONFIG.MMCM_CLKOUT0_DIVIDE_F 2.625                                                                                 }
        400 {CONFIG.CLKOUT1_DRIVES Buffer CONFIG.CLKOUT1_JITTER 146.303 CONFIG.CLKOUT1_PHASE_ERROR 222.305 CONFIG.CLKOUT1_REQUESTED_OUT_FREQ 400.000 CONFIG.CLKOUT2_DRIVES Buffer CONFIG.CLKOUT3_DRIVES Buffer CONFIG.CLKOUT4_DRIVES Buffer CONFIG.CLKOUT5_DRIVES Buffer CONFIG.CLKOUT6_DRIVES Buffer CONFIG.CLKOUT7_DRIVES Buffer CONFIG.FEEDBACK_SOURCE FDBK_AUTO CONFIG.MMCM_BANDWIDTH OPTIMIZED CONFIG.MMCM_CLKFBOUT_MULT_F 48.000 CONFIG.MMCM_CLKOUT0_DIVIDE_F 3.000  CONFIG.MMCM_COMPENSATION AUTO CONFIG.MMCM_DIVCLK_DIVIDE 5 CONFIG.PRIMITIVE MMCM}
        350 {CONFIG.CLKOUT1_DRIVES Buffer CONFIG.CLKOUT1_JITTER 151.657 CONFIG.CLKOUT1_PHASE_ERROR 222.060 CONFIG.CLKOUT1_REQUESTED_OUT_FREQ 350     CONFIG.CLKOUT2_DRIVES Buffer CONFIG.CLKOUT3_DRIVES Buffer CONFIG.CLKOUT4_DRIVES Buffer CONFIG.CLKOUT5_DRIVES Buffer CONFIG.CLKOUT6_DRIVES Buffer CONFIG.CLKOUT7_DRIVES Buffer CONFIG.FEEDBACK_SOURCE FDBK_AUTO CONFIG.MMCM_BANDWIDTH OPTIMIZED CONFIG.MMCM_CLKFBOUT_MULT_F 47.250 CONFIG.MMCM_CLKOUT0_DIVIDE_F 3.375  CONFIG.MMCM_COMPENSATION AUTO CONFIG.MMCM_DIVCLK_DIVIDE 5 CONFIG.PRIMITIVE MMCM}
        300 {CONFIG.CLKOUT1_DRIVES Buffer CONFIG.CLKOUT1_JITTER 152.330 CONFIG.CLKOUT1_PHASE_ERROR 222.305 CONFIG.CLKOUT1_REQUESTED_OUT_FREQ 300.000 CONFIG.CLKOUT2_DRIVES Buffer CONFIG.CLKOUT3_DRIVES Buffer CONFIG.CLKOUT4_DRIVES Buffer CONFIG.CLKOUT5_DRIVES Buffer CONFIG.CLKOUT6_DRIVES Buffer CONFIG.CLKOUT7_DRIVES Buffer CONFIG.FEEDBACK_SOURCE FDBK_AUTO CONFIG.MMCM_BANDWIDTH OPTIMIZED CONFIG.MMCM_CLKFBOUT_MULT_F 48.000 CONFIG.MMCM_CLKOUT0_DIVIDE_F 4.000  CONFIG.MMCM_COMPENSATION AUTO CONFIG.MMCM_DIVCLK_DIVIDE 5 CONFIG.PRIMITIVE MMCM}
        250 {CONFIG.CLKOUT1_DRIVES Buffer CONFIG.CLKOUT1_JITTER 95.013  CONFIG.CLKOUT1_PHASE_ERROR 86.070  CONFIG.CLKOUT1_REQUESTED_OUT_FREQ 250.000 CONFIG.CLKOUT2_DRIVES Buffer CONFIG.CLKOUT3_DRIVES Buffer CONFIG.CLKOUT4_DRIVES Buffer CONFIG.CLKOUT5_DRIVES Buffer CONFIG.CLKOUT6_DRIVES Buffer CONFIG.CLKOUT7_DRIVES Buffer CONFIG.FEEDBACK_SOURCE FDBK_AUTO CONFIG.MMCM_BANDWIDTH OPTIMIZED CONFIG.MMCM_CLKFBOUT_MULT_F 9.500  CONFIG.MMCM_CLKOUT0_DIVIDE_F 4.750  CONFIG.MMCM_COMPENSATION AUTO CONFIG.MMCM_DIVCLK_DIVIDE 1 CONFIG.PRIMITIVE MMCM}
        200 {CONFIG.CLKOUT1_DRIVES Buffer CONFIG.CLKOUT1_JITTER 161.295                                    CONFIG.CLKOUT1_REQUESTED_OUT_FREQ 200                                                                                                                                                                                                                                                                                       CONFIG.MMCM_CLKOUT0_DIVIDE_F 6.000  CONFIG.MMCM_COMPENSATION AUTO                             CONFIG.PRIMITIVE MMCM}
        150 {CONFIG.CLKOUT1_DRIVES Buffer CONFIG.CLKOUT1_JITTER 125.400 CONFIG.CLKOUT1_PHASE_ERROR 154.678 CONFIG.CLKOUT1_REQUESTED_OUT_FREQ 150.000                                                                                                                                                                                                                                                CONFIG.MMCM_CLKFBOUT_MULT_F 24.000 CONFIG.MMCM_CLKOUT0_DIVIDE_F 8.000                                CONFIG.MMCM_DIVCLK_DIVIDE 5                      }
        100 {CONFIG.CLKOUT1_DRIVES Buffer CONFIG.CLKOUT1_JITTER 134.506 CONFIG.CLKOUT1_PHASE_ERROR 154.678 CONFIG.CLKOUT1_REQUESTED_OUT_FREQ 100                                                                                                                                                                                                                                                    CONFIG.MMCM_CLKFBOUT_MULT_F 24.000 CONFIG.MMCM_CLKOUT0_DIVIDE_F 12.000                               CONFIG.MMCM_DIVCLK_DIVIDE 5                      }
    }

    # Check if the frequency setting exists
    if {[dict exists $config_settings $KL_FREQ]} {
        startgroup
        set_property -dict [list {*}[dict get $config_settings $KL_FREQ]] [get_bd_cells kernel_clk]
        endgroup
    } else {
        puts stderr "No valid Kernel Frequency <200MHz, 250MHz, 300MHz, 350MHz, 400MHz, 450MHz>..."
    }
}


proc set_hbm_frequency { HBM_FREQ } {
    array set configMap {
        100 {134.506 154.678 100 24.000 12.000}
        150 {125.400 154.678 150 24.000 8.000 5}
        200 {119.392 154.678 200 24.000 6.000}
        250 {85.152 78.266 250 4.750 4.750 1}
        300 {111.430 154.678 300 24.000 4.000 5}
        310 {178.425 352.538 310 120.125 3.875 25}
        320 {110.215 154.678 320 24.000 3.750}
        330 {178.169 354.739 330 119.625 3.625 25}
        340 {179.007 357.524 340 119.000 3.500 25}
        350 {108.882 153.873 350 23.625  3.375  5}
        360 {171.636 346.603 360 121.500 3.375 25}
        370 {173.961 351.991 370 120.250 3.250 25}
        380 {78.466 78.266 380 4.750 3.125 1}
        390 {77.480 77.206 390 4.875 3.125 1}
        400 {106.119 154.678 400 24.000 3.000 5}
        410 {177.356 362.633 410 117.875 2.875 25}
        420 {169.879 349.819 420 120.750 2.875 25}
        430 {175.308 360.916 430 118.250 2.750 25}
        440 {168.257 348.741 440 121.000 2.750 25}
        450 {104.289 153.873 450 23.625  2.625 5}
    }

    if { ![info exists configMap($HBM_FREQ)] } {
        puts stderr "No valid HBM Frequency <100MHz, 150MHz, 200MHz, 250MHz, 300MHz, 350MHz, 400MHz, 450MHz>..."
        exit 1
    }

    set configValues $configMap($HBM_FREQ)
    startgroup
    set_property -dict [list \
        CONFIG.CLKOUT1_JITTER [lindex $configValues 0] \
        CONFIG.CLKOUT1_PHASE_ERROR [lindex $configValues 1] \
        CONFIG.CLKOUT1_REQUESTED_OUT_FREQ [lindex $configValues 2] \
        CONFIG.MMCM_CLKFBOUT_MULT_F [lindex $configValues 3] \
        CONFIG.MMCM_CLKOUT0_DIVIDE_F [lindex $configValues 4] \
        CONFIG.MMCM_DIVCLK_DIVIDE [lindex $configValues 5] \
    ] [get_bd_cells hbm_axi_clk]
    endgroup

    # Additional settings for specific frequencies
    if { $HBM_FREQ == 250 || $HBM_FREQ == 300 || $HBM_FREQ == 350 || $HBM_FREQ == 400 || $HBM_FREQ == 450 } {
        startgroup
        set_property -dict [list \
            CONFIG.USER_AXI_CLK1_FREQ $HBM_FREQ \
            CONFIG.USER_AXI_CLK_FREQ $HBM_FREQ \
        ] [get_bd_cells hbm_0]
        endgroup
    }
}

proc create_shell_design_1 {} {

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
  set scripts_vivado_version 2023.2
  set current_vivado_version [version -short]

  if { [string first $scripts_vivado_version $current_vivado_version] == -1 } {
    puts ""
    if { [string compare $scripts_vivado_version $current_vivado_version] > 0 } {
        catch {common::send_gid_msg -ssname BD::TCL -id 2042 -severity "ERROR" " This script was generated using Vivado <$scripts_vivado_version> and is being run in <$current_vivado_version> of Vivado. Sourcing the script failed since it was created with a future version of Vivado."}

    } else {
      catch {common::send_gid_msg -ssname BD::TCL -id 2041 -severity "ERROR" "This script was generated using Vivado <$scripts_vivado_version> and is being run in <$current_vivado_version> of Vivado. Please run the script in Vivado <$scripts_vivado_version> then open the design in Vivado <$current_vivado_version>. Upgrade the design by running \"Tools => Report => Report IP Status...\", then run write_bd_tcl to create an updated script."}

    }

    return 1
  }

  ################################################################
  # START
  ################################################################

  # To test this script, run the following commands from Vivado Tcl console:
  # source design_1_script.tcl


  # The design that will be created by this Tcl script contains the following
  # module references:
  # gnd_driver, cl

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
  xilinx.com:ip:xdma:4.1\
  xilinx.com:ip:util_ds_buf:2.2\
  xilinx.com:ip:xlconstant:1.1\
  xilinx.com:ip:hbm:1.0\
  xilinx.com:ip:proc_sys_reset:5.0\
  xilinx.com:ip:clk_wiz:6.0\
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
  cl\
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
    set pci_express_x1 [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:pcie_7x_mgt_rtl:1.0 pci_express_x1 ]

    set pcie_refclk [ create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:diff_clock_rtl:1.0 pcie_refclk ]
    set_property -dict [ list \
    CONFIG.FREQ_HZ {100000000} \
    ] $pcie_refclk

    set hbm_clk [ create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:diff_clock_rtl:1.0 hbm_clk ]
    set_property -dict [ list \
    CONFIG.FREQ_HZ {100000000} \
    ] $hbm_clk


    # Create ports
    set pcie_perstn [ create_bd_port -dir I -type rst pcie_perstn ]
    set_property -dict [ list \
    CONFIG.POLARITY {ACTIVE_LOW} \
  ] $pcie_perstn
    set HBM_CATTRIP [ create_bd_port -dir O HBM_CATTRIP ]

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
      CONFIG.xdma_num_usr_irq {16} \
      CONFIG.xdma_rnum_chnl {1} \
      CONFIG.xdma_wnum_chnl {1} \
    ] $xdma_0


    # Create instance: util_ds_buf, and set properties
    set util_ds_buf [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_ds_buf:2.2 util_ds_buf ]
    set_property -dict [list \
      CONFIG.DIFF_CLK_IN_BOARD_INTERFACE {pcie_refclk} \
      CONFIG.USE_BOARD_FLOW {true} \
    ] $util_ds_buf


    # Create instance: xlconstant_0, and set properties
    set xlconstant_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_0 ]
    set_property -dict [list \
      CONFIG.CONST_VAL {0} \
      CONFIG.CONST_WIDTH {16} \
    ] $xlconstant_0


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
      CONFIG.USER_HBM_DENSITY {8GB} \
    ] $hbm_0


    # Create instance: util_ds_buf_0, and set properties
    set util_ds_buf_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_ds_buf:2.2 util_ds_buf_0 ]
    set_property -dict [list \
      CONFIG.DIFF_CLK_IN_BOARD_INTERFACE {hbm_clk} \
      CONFIG.USE_BOARD_FLOW {true} \
    ] $util_ds_buf_0


    # Create instance: proc_sys_reset_2, and set properties
    set proc_sys_reset_2 [ create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 proc_sys_reset_2 ]

    # Create instance: hbm_axi_clk, and set properties
    set hbm_axi_clk [ create_bd_cell -type ip -vlnv xilinx.com:ip:clk_wiz:6.0 hbm_axi_clk ]
    set_property -dict [list \
      CONFIG.CLKOUT1_JITTER {104.289} \
      CONFIG.CLKOUT1_PHASE_ERROR {153.873} \
      CONFIG.CLKOUT1_REQUESTED_OUT_FREQ {450} \
      CONFIG.MMCM_CLKFBOUT_MULT_F {23.625} \
      CONFIG.MMCM_CLKOUT0_DIVIDE_F {2.625} \
      CONFIG.MMCM_DIVCLK_DIVIDE {5} \
      CONFIG.RESET_PORT {resetn} \
      CONFIG.RESET_TYPE {ACTIVE_LOW} \
    ] $hbm_axi_clk


    # Create instance: hbm_sys_reset, and set properties
    set hbm_sys_reset [ create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 hbm_sys_reset ]

    # Create instance: kernel_clk, and set properties
    set kernel_clk [ create_bd_cell -type ip -vlnv xilinx.com:ip:clk_wiz:6.0 kernel_clk ]
    set_property -dict [list \
      CONFIG.RESET_PORT {resetn} \
      CONFIG.RESET_TYPE {ACTIVE_LOW} \
    ] $kernel_clk


    # Create instance: kernel_sys_reset, and set properties
    set kernel_sys_reset [ create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 kernel_sys_reset ]

    # Create instance: cl_0, and set properties
    set block_name cl
    set block_cell_name cl_0
    if { [catch {set cl_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
      catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
      return 1
    } elseif { $cl_0 eq "" } {
      catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
      return 1
    }

    set_property -dict [ list \
    CONFIG.FREQ_HZ {450000000} \
  ] [get_bd_intf_pins /cl_0/M_AXI_HBM00]

    set_property -dict [ list \
    CONFIG.FREQ_HZ {450000000} \
  ] [get_bd_intf_pins /cl_0/M_AXI_HBM01]

    set_property -dict [ list \
    CONFIG.FREQ_HZ {450000000} \
  ] [get_bd_intf_pins /cl_0/M_AXI_HBM02]

    set_property -dict [ list \
    CONFIG.FREQ_HZ {450000000} \
  ] [get_bd_intf_pins /cl_0/M_AXI_HBM03]

    set_property -dict [ list \
    CONFIG.FREQ_HZ {450000000} \
  ] [get_bd_intf_pins /cl_0/M_AXI_HBM04]

    set_property -dict [ list \
    CONFIG.FREQ_HZ {450000000} \
  ] [get_bd_intf_pins /cl_0/M_AXI_HBM05]

    set_property -dict [ list \
    CONFIG.FREQ_HZ {450000000} \
  ] [get_bd_intf_pins /cl_0/M_AXI_HBM06]

    set_property -dict [ list \
    CONFIG.FREQ_HZ {450000000} \
  ] [get_bd_intf_pins /cl_0/M_AXI_HBM07]

    set_property -dict [ list \
    CONFIG.FREQ_HZ {450000000} \
  ] [get_bd_intf_pins /cl_0/M_AXI_HBM08]

    set_property -dict [ list \
    CONFIG.FREQ_HZ {450000000} \
  ] [get_bd_intf_pins /cl_0/M_AXI_HBM09]

    set_property -dict [ list \
    CONFIG.FREQ_HZ {450000000} \
  ] [get_bd_intf_pins /cl_0/M_AXI_HBM10]

    set_property -dict [ list \
    CONFIG.FREQ_HZ {450000000} \
  ] [get_bd_intf_pins /cl_0/M_AXI_HBM11]

    set_property -dict [ list \
    CONFIG.FREQ_HZ {450000000} \
  ] [get_bd_intf_pins /cl_0/M_AXI_HBM12]

    set_property -dict [ list \
    CONFIG.FREQ_HZ {450000000} \
  ] [get_bd_intf_pins /cl_0/M_AXI_HBM13]

    set_property -dict [ list \
    CONFIG.FREQ_HZ {450000000} \
  ] [get_bd_intf_pins /cl_0/M_AXI_HBM14]

    set_property -dict [ list \
    CONFIG.FREQ_HZ {450000000} \
  ] [get_bd_intf_pins /cl_0/M_AXI_HBM15]

    set_property -dict [ list \
    CONFIG.FREQ_HZ {450000000} \
  ] [get_bd_intf_pins /cl_0/M_AXI_HBM16]

    set_property -dict [ list \
    CONFIG.FREQ_HZ {450000000} \
  ] [get_bd_intf_pins /cl_0/M_AXI_HBM17]

    set_property -dict [ list \
    CONFIG.FREQ_HZ {450000000} \
  ] [get_bd_intf_pins /cl_0/M_AXI_HBM18]

    set_property -dict [ list \
    CONFIG.FREQ_HZ {450000000} \
  ] [get_bd_intf_pins /cl_0/M_AXI_HBM19]

    set_property -dict [ list \
    CONFIG.FREQ_HZ {450000000} \
  ] [get_bd_intf_pins /cl_0/M_AXI_HBM20]

    set_property -dict [ list \
    CONFIG.FREQ_HZ {450000000} \
  ] [get_bd_intf_pins /cl_0/M_AXI_HBM21]

    set_property -dict [ list \
    CONFIG.FREQ_HZ {450000000} \
  ] [get_bd_intf_pins /cl_0/M_AXI_HBM22]

    set_property -dict [ list \
    CONFIG.FREQ_HZ {450000000} \
  ] [get_bd_intf_pins /cl_0/M_AXI_HBM23]

    set_property -dict [ list \
    CONFIG.FREQ_HZ {450000000} \
  ] [get_bd_intf_pins /cl_0/M_AXI_HBM24]

    set_property -dict [ list \
    CONFIG.FREQ_HZ {450000000} \
  ] [get_bd_intf_pins /cl_0/M_AXI_HBM25]

    set_property -dict [ list \
    CONFIG.FREQ_HZ {450000000} \
  ] [get_bd_intf_pins /cl_0/M_AXI_HBM26]

    set_property -dict [ list \
    CONFIG.FREQ_HZ {450000000} \
  ] [get_bd_intf_pins /cl_0/M_AXI_HBM27]

    set_property -dict [ list \
    CONFIG.FREQ_HZ {450000000} \
  ] [get_bd_intf_pins /cl_0/M_AXI_HBM28]

    set_property -dict [ list \
    CONFIG.FREQ_HZ {450000000} \
  ] [get_bd_intf_pins /cl_0/M_AXI_HBM29]

    set_property -dict [ list \
    CONFIG.FREQ_HZ {450000000} \
  ] [get_bd_intf_pins /cl_0/M_AXI_HBM30]

    set_property -dict [ list \
    CONFIG.FREQ_HZ {450000000} \
  ] [get_bd_intf_pins /cl_0/M_AXI_HBM31]

    set_property -dict [ list \
    CONFIG.FREQ_HZ {250000000} \
  ] [get_bd_intf_pins /cl_0/S_AXI_BYPASS]

    set_property -dict [ list \
    CONFIG.FREQ_HZ {250000000} \
  ] [get_bd_intf_pins /cl_0/S_AXI_XDMA]

    # Create interface connections
    connect_bd_intf_net -intf_net cl_0_M_AXI_HBM00 [get_bd_intf_pins cl_0/M_AXI_HBM00] [get_bd_intf_pins hbm_0/SAXI_00]
    connect_bd_intf_net -intf_net cl_0_M_AXI_HBM01 [get_bd_intf_pins cl_0/M_AXI_HBM01] [get_bd_intf_pins hbm_0/SAXI_01]
    connect_bd_intf_net -intf_net cl_0_M_AXI_HBM02 [get_bd_intf_pins cl_0/M_AXI_HBM02] [get_bd_intf_pins hbm_0/SAXI_02]
    connect_bd_intf_net -intf_net cl_0_M_AXI_HBM03 [get_bd_intf_pins cl_0/M_AXI_HBM03] [get_bd_intf_pins hbm_0/SAXI_03]
    connect_bd_intf_net -intf_net cl_0_M_AXI_HBM04 [get_bd_intf_pins cl_0/M_AXI_HBM04] [get_bd_intf_pins hbm_0/SAXI_04]
    connect_bd_intf_net -intf_net cl_0_M_AXI_HBM05 [get_bd_intf_pins cl_0/M_AXI_HBM05] [get_bd_intf_pins hbm_0/SAXI_05]
    connect_bd_intf_net -intf_net cl_0_M_AXI_HBM06 [get_bd_intf_pins cl_0/M_AXI_HBM06] [get_bd_intf_pins hbm_0/SAXI_06]
    connect_bd_intf_net -intf_net cl_0_M_AXI_HBM07 [get_bd_intf_pins cl_0/M_AXI_HBM07] [get_bd_intf_pins hbm_0/SAXI_07]
    connect_bd_intf_net -intf_net cl_0_M_AXI_HBM08 [get_bd_intf_pins cl_0/M_AXI_HBM08] [get_bd_intf_pins hbm_0/SAXI_08]
    connect_bd_intf_net -intf_net cl_0_M_AXI_HBM09 [get_bd_intf_pins cl_0/M_AXI_HBM09] [get_bd_intf_pins hbm_0/SAXI_09]
    connect_bd_intf_net -intf_net cl_0_M_AXI_HBM10 [get_bd_intf_pins cl_0/M_AXI_HBM10] [get_bd_intf_pins hbm_0/SAXI_10]
    connect_bd_intf_net -intf_net cl_0_M_AXI_HBM11 [get_bd_intf_pins cl_0/M_AXI_HBM11] [get_bd_intf_pins hbm_0/SAXI_11]
    connect_bd_intf_net -intf_net cl_0_M_AXI_HBM12 [get_bd_intf_pins cl_0/M_AXI_HBM12] [get_bd_intf_pins hbm_0/SAXI_12]
    connect_bd_intf_net -intf_net cl_0_M_AXI_HBM13 [get_bd_intf_pins cl_0/M_AXI_HBM13] [get_bd_intf_pins hbm_0/SAXI_13]
    connect_bd_intf_net -intf_net cl_0_M_AXI_HBM14 [get_bd_intf_pins cl_0/M_AXI_HBM14] [get_bd_intf_pins hbm_0/SAXI_14]
    connect_bd_intf_net -intf_net cl_0_M_AXI_HBM15 [get_bd_intf_pins cl_0/M_AXI_HBM15] [get_bd_intf_pins hbm_0/SAXI_15]
    connect_bd_intf_net -intf_net cl_0_M_AXI_HBM16 [get_bd_intf_pins cl_0/M_AXI_HBM16] [get_bd_intf_pins hbm_0/SAXI_16]
    connect_bd_intf_net -intf_net cl_0_M_AXI_HBM17 [get_bd_intf_pins cl_0/M_AXI_HBM17] [get_bd_intf_pins hbm_0/SAXI_17]
    connect_bd_intf_net -intf_net cl_0_M_AXI_HBM18 [get_bd_intf_pins cl_0/M_AXI_HBM18] [get_bd_intf_pins hbm_0/SAXI_18]
    connect_bd_intf_net -intf_net cl_0_M_AXI_HBM19 [get_bd_intf_pins cl_0/M_AXI_HBM19] [get_bd_intf_pins hbm_0/SAXI_19]
    connect_bd_intf_net -intf_net cl_0_M_AXI_HBM20 [get_bd_intf_pins cl_0/M_AXI_HBM20] [get_bd_intf_pins hbm_0/SAXI_20]
    connect_bd_intf_net -intf_net cl_0_M_AXI_HBM21 [get_bd_intf_pins cl_0/M_AXI_HBM21] [get_bd_intf_pins hbm_0/SAXI_21]
    connect_bd_intf_net -intf_net cl_0_M_AXI_HBM22 [get_bd_intf_pins cl_0/M_AXI_HBM22] [get_bd_intf_pins hbm_0/SAXI_22]
    connect_bd_intf_net -intf_net cl_0_M_AXI_HBM23 [get_bd_intf_pins cl_0/M_AXI_HBM23] [get_bd_intf_pins hbm_0/SAXI_23]
    connect_bd_intf_net -intf_net cl_0_M_AXI_HBM24 [get_bd_intf_pins cl_0/M_AXI_HBM24] [get_bd_intf_pins hbm_0/SAXI_24]
    connect_bd_intf_net -intf_net cl_0_M_AXI_HBM25 [get_bd_intf_pins cl_0/M_AXI_HBM25] [get_bd_intf_pins hbm_0/SAXI_25]
    connect_bd_intf_net -intf_net cl_0_M_AXI_HBM26 [get_bd_intf_pins cl_0/M_AXI_HBM26] [get_bd_intf_pins hbm_0/SAXI_26]
    connect_bd_intf_net -intf_net cl_0_M_AXI_HBM27 [get_bd_intf_pins cl_0/M_AXI_HBM27] [get_bd_intf_pins hbm_0/SAXI_27]
    connect_bd_intf_net -intf_net cl_0_M_AXI_HBM28 [get_bd_intf_pins cl_0/M_AXI_HBM28] [get_bd_intf_pins hbm_0/SAXI_28]
    connect_bd_intf_net -intf_net cl_0_M_AXI_HBM29 [get_bd_intf_pins cl_0/M_AXI_HBM29] [get_bd_intf_pins hbm_0/SAXI_29]
    connect_bd_intf_net -intf_net cl_0_M_AXI_HBM30 [get_bd_intf_pins cl_0/M_AXI_HBM30] [get_bd_intf_pins hbm_0/SAXI_30]
    connect_bd_intf_net -intf_net cl_0_M_AXI_HBM31 [get_bd_intf_pins cl_0/M_AXI_HBM31] [get_bd_intf_pins hbm_0/SAXI_31]
    connect_bd_intf_net -intf_net hbm_clk_1 [get_bd_intf_ports hbm_clk] [get_bd_intf_pins util_ds_buf_0/CLK_IN_D]
    connect_bd_intf_net -intf_net pcie_refclk_1 [get_bd_intf_ports pcie_refclk] [get_bd_intf_pins util_ds_buf/CLK_IN_D]
    connect_bd_intf_net -intf_net xdma_0_M_AXI [get_bd_intf_pins xdma_0/M_AXI] [get_bd_intf_pins cl_0/S_AXI_XDMA]
    connect_bd_intf_net -intf_net xdma_0_M_AXI_BYPASS [get_bd_intf_pins xdma_0/M_AXI_BYPASS] [get_bd_intf_pins cl_0/S_AXI_BYPASS]
    connect_bd_intf_net -intf_net xdma_0_pcie_mgt [get_bd_intf_ports pci_express_x1] [get_bd_intf_pins xdma_0/pcie_mgt]

    # Create port connections
    connect_bd_net -net gnd_driver_0_dout [get_bd_pins gnd_driver_0/dout] [get_bd_ports HBM_CATTRIP]
    connect_bd_net -net hbm_axi_clk_clk_out1 [get_bd_pins hbm_axi_clk/clk_out1] [get_bd_pins hbm_sys_reset/slowest_sync_clk] [get_bd_pins hbm_0/AXI_00_ACLK] [get_bd_pins hbm_0/AXI_01_ACLK] [get_bd_pins hbm_0/AXI_02_ACLK] [get_bd_pins hbm_0/AXI_03_ACLK] [get_bd_pins hbm_0/AXI_04_ACLK] [get_bd_pins hbm_0/AXI_05_ACLK] [get_bd_pins hbm_0/AXI_06_ACLK] [get_bd_pins hbm_0/AXI_07_ACLK] [get_bd_pins hbm_0/AXI_08_ACLK] [get_bd_pins hbm_0/AXI_09_ACLK] [get_bd_pins hbm_0/AXI_10_ACLK] [get_bd_pins hbm_0/AXI_11_ACLK] [get_bd_pins hbm_0/AXI_12_ACLK] [get_bd_pins hbm_0/AXI_13_ACLK] [get_bd_pins hbm_0/AXI_14_ACLK] [get_bd_pins hbm_0/AXI_15_ACLK] [get_bd_pins hbm_0/AXI_16_ACLK] [get_bd_pins hbm_0/AXI_17_ACLK] [get_bd_pins hbm_0/AXI_18_ACLK] [get_bd_pins hbm_0/AXI_19_ACLK] [get_bd_pins hbm_0/AXI_20_ACLK] [get_bd_pins hbm_0/AXI_21_ACLK] [get_bd_pins hbm_0/AXI_22_ACLK] [get_bd_pins hbm_0/AXI_23_ACLK] [get_bd_pins hbm_0/AXI_24_ACLK] [get_bd_pins hbm_0/AXI_25_ACLK] [get_bd_pins hbm_0/AXI_26_ACLK] [get_bd_pins hbm_0/AXI_27_ACLK] [get_bd_pins hbm_0/AXI_28_ACLK] [get_bd_pins hbm_0/AXI_29_ACLK] [get_bd_pins hbm_0/AXI_30_ACLK] [get_bd_pins hbm_0/AXI_31_ACLK] [get_bd_pins cl_0/CLK_HBM]
    connect_bd_net -net hbm_axi_clk_locked [get_bd_pins hbm_axi_clk/locked] [get_bd_pins hbm_sys_reset/dcm_locked]
    connect_bd_net -net hbm_sys_reset_peripheral_aresetn [get_bd_pins hbm_sys_reset/peripheral_aresetn] [get_bd_pins hbm_0/AXI_17_ARESET_N] [get_bd_pins hbm_0/AXI_00_ARESET_N] [get_bd_pins hbm_0/AXI_01_ARESET_N] [get_bd_pins hbm_0/AXI_02_ARESET_N] [get_bd_pins hbm_0/AXI_03_ARESET_N] [get_bd_pins hbm_0/AXI_04_ARESET_N] [get_bd_pins hbm_0/AXI_05_ARESET_N] [get_bd_pins hbm_0/AXI_06_ARESET_N] [get_bd_pins hbm_0/AXI_07_ARESET_N] [get_bd_pins hbm_0/AXI_08_ARESET_N] [get_bd_pins hbm_0/AXI_09_ARESET_N] [get_bd_pins hbm_0/AXI_10_ARESET_N] [get_bd_pins hbm_0/AXI_11_ARESET_N] [get_bd_pins hbm_0/AXI_12_ARESET_N] [get_bd_pins hbm_0/AXI_13_ARESET_N] [get_bd_pins hbm_0/AXI_14_ARESET_N] [get_bd_pins hbm_0/AXI_15_ARESET_N] [get_bd_pins hbm_0/AXI_16_ARESET_N] [get_bd_pins hbm_0/AXI_18_ARESET_N] [get_bd_pins hbm_0/AXI_19_ARESET_N] [get_bd_pins hbm_0/AXI_20_ARESET_N] [get_bd_pins hbm_0/AXI_21_ARESET_N] [get_bd_pins hbm_0/AXI_22_ARESET_N] [get_bd_pins hbm_0/AXI_23_ARESET_N] [get_bd_pins hbm_0/AXI_24_ARESET_N] [get_bd_pins hbm_0/AXI_25_ARESET_N] [get_bd_pins hbm_0/AXI_26_ARESET_N] [get_bd_pins hbm_0/AXI_27_ARESET_N] [get_bd_pins hbm_0/AXI_28_ARESET_N] [get_bd_pins hbm_0/AXI_29_ARESET_N] [get_bd_pins hbm_0/AXI_30_ARESET_N] [get_bd_pins hbm_0/AXI_31_ARESET_N] [get_bd_pins cl_0/ARESETN_HBM]
    connect_bd_net -net kernel_clk_clk_out1 [get_bd_pins kernel_clk/clk_out1] [get_bd_pins kernel_sys_reset/slowest_sync_clk] [get_bd_pins cl_0/CLK_KL]
    connect_bd_net -net kernel_clk_locked [get_bd_pins kernel_clk/locked] [get_bd_pins kernel_sys_reset/dcm_locked]
    connect_bd_net -net kernel_sys_reset_peripheral_aresetn [get_bd_pins kernel_sys_reset/peripheral_aresetn] [get_bd_pins cl_0/ARESETN_KL]
    connect_bd_net -net pcie_perstn_1 [get_bd_ports pcie_perstn] [get_bd_pins xdma_0/sys_rst_n]
    connect_bd_net -net proc_sys_reset_2_peripheral_aresetn [get_bd_pins proc_sys_reset_2/peripheral_aresetn] [get_bd_pins hbm_0/APB_1_PRESET_N] [get_bd_pins hbm_0/APB_0_PRESET_N]
    connect_bd_net -net util_ds_buf_0_IBUF_OUT [get_bd_pins util_ds_buf_0/IBUF_OUT] [get_bd_pins hbm_0/HBM_REF_CLK_0] [get_bd_pins hbm_0/HBM_REF_CLK_1] [get_bd_pins hbm_0/APB_0_PCLK] [get_bd_pins hbm_0/APB_1_PCLK] [get_bd_pins proc_sys_reset_2/slowest_sync_clk]
    connect_bd_net -net util_ds_buf_IBUF_DS_ODIV2 [get_bd_pins util_ds_buf/IBUF_DS_ODIV2] [get_bd_pins xdma_0/sys_clk]
    connect_bd_net -net util_ds_buf_IBUF_OUT [get_bd_pins util_ds_buf/IBUF_OUT] [get_bd_pins xdma_0/sys_clk_gt]
    connect_bd_net -net xdma_0_axi_aclk [get_bd_pins xdma_0/axi_aclk] [get_bd_pins hbm_axi_clk/clk_in1] [get_bd_pins kernel_clk/clk_in1] [get_bd_pins cl_0/CLK_XDMA]
    connect_bd_net -net xdma_0_axi_aresetn [get_bd_pins xdma_0/axi_aresetn] [get_bd_pins proc_sys_reset_2/ext_reset_in] [get_bd_pins hbm_sys_reset/ext_reset_in] [get_bd_pins hbm_axi_clk/resetn] [get_bd_pins kernel_sys_reset/ext_reset_in] [get_bd_pins cl_0/ARESETN_XDMA] [get_bd_pins kernel_clk/resetn]
    connect_bd_net -net xlconstant_0_dout [get_bd_pins xlconstant_0/dout] [get_bd_pins xdma_0/usr_irq_req]

    # Create address segments
    assign_bd_address -offset 0x00000000 -range 0x000200000000 -target_address_space [get_bd_addr_spaces xdma_0/M_AXI] [get_bd_addr_segs cl_0/S_AXI_XDMA/reg0] -force
    assign_bd_address -offset 0x00000000 -range 0x00001000 -target_address_space [get_bd_addr_spaces xdma_0/M_AXI_BYPASS] [get_bd_addr_segs cl_0/S_AXI_BYPASS/reg0] -force
    assign_bd_address -offset 0x00000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM00] [get_bd_addr_segs hbm_0/SAXI_00/HBM_MEM00] -force
    assign_bd_address -offset 0x10000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM00] [get_bd_addr_segs hbm_0/SAXI_00/HBM_MEM01] -force
    assign_bd_address -offset 0x20000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM00] [get_bd_addr_segs hbm_0/SAXI_00/HBM_MEM02] -force
    assign_bd_address -offset 0x30000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM00] [get_bd_addr_segs hbm_0/SAXI_00/HBM_MEM03] -force
    assign_bd_address -offset 0x40000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM00] [get_bd_addr_segs hbm_0/SAXI_00/HBM_MEM04] -force
    assign_bd_address -offset 0x50000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM00] [get_bd_addr_segs hbm_0/SAXI_00/HBM_MEM05] -force
    assign_bd_address -offset 0x60000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM00] [get_bd_addr_segs hbm_0/SAXI_00/HBM_MEM06] -force
    assign_bd_address -offset 0x70000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM00] [get_bd_addr_segs hbm_0/SAXI_00/HBM_MEM07] -force
    assign_bd_address -offset 0x80000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM00] [get_bd_addr_segs hbm_0/SAXI_00/HBM_MEM08] -force
    assign_bd_address -offset 0x90000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM00] [get_bd_addr_segs hbm_0/SAXI_00/HBM_MEM09] -force
    assign_bd_address -offset 0xA0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM00] [get_bd_addr_segs hbm_0/SAXI_00/HBM_MEM10] -force
    assign_bd_address -offset 0xB0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM00] [get_bd_addr_segs hbm_0/SAXI_00/HBM_MEM11] -force
    assign_bd_address -offset 0xC0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM00] [get_bd_addr_segs hbm_0/SAXI_00/HBM_MEM12] -force
    assign_bd_address -offset 0xD0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM00] [get_bd_addr_segs hbm_0/SAXI_00/HBM_MEM13] -force
    assign_bd_address -offset 0xE0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM00] [get_bd_addr_segs hbm_0/SAXI_00/HBM_MEM14] -force
    assign_bd_address -offset 0xF0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM00] [get_bd_addr_segs hbm_0/SAXI_00/HBM_MEM15] -force
    assign_bd_address -offset 0x000100000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM00] [get_bd_addr_segs hbm_0/SAXI_00/HBM_MEM16] -force
    assign_bd_address -offset 0x000110000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM00] [get_bd_addr_segs hbm_0/SAXI_00/HBM_MEM17] -force
    assign_bd_address -offset 0x000120000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM00] [get_bd_addr_segs hbm_0/SAXI_00/HBM_MEM18] -force
    assign_bd_address -offset 0x000130000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM00] [get_bd_addr_segs hbm_0/SAXI_00/HBM_MEM19] -force
    assign_bd_address -offset 0x000140000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM00] [get_bd_addr_segs hbm_0/SAXI_00/HBM_MEM20] -force
    assign_bd_address -offset 0x000150000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM00] [get_bd_addr_segs hbm_0/SAXI_00/HBM_MEM21] -force
    assign_bd_address -offset 0x000160000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM00] [get_bd_addr_segs hbm_0/SAXI_00/HBM_MEM22] -force
    assign_bd_address -offset 0x000170000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM00] [get_bd_addr_segs hbm_0/SAXI_00/HBM_MEM23] -force
    assign_bd_address -offset 0x000180000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM00] [get_bd_addr_segs hbm_0/SAXI_00/HBM_MEM24] -force
    assign_bd_address -offset 0x000190000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM00] [get_bd_addr_segs hbm_0/SAXI_00/HBM_MEM25] -force
    assign_bd_address -offset 0x0001A0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM00] [get_bd_addr_segs hbm_0/SAXI_00/HBM_MEM26] -force
    assign_bd_address -offset 0x0001B0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM00] [get_bd_addr_segs hbm_0/SAXI_00/HBM_MEM27] -force
    assign_bd_address -offset 0x0001C0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM00] [get_bd_addr_segs hbm_0/SAXI_00/HBM_MEM28] -force
    assign_bd_address -offset 0x0001D0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM00] [get_bd_addr_segs hbm_0/SAXI_00/HBM_MEM29] -force
    assign_bd_address -offset 0x0001E0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM00] [get_bd_addr_segs hbm_0/SAXI_00/HBM_MEM30] -force
    assign_bd_address -offset 0x0001F0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM00] [get_bd_addr_segs hbm_0/SAXI_00/HBM_MEM31] -force
    assign_bd_address -offset 0x00000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM01] [get_bd_addr_segs hbm_0/SAXI_01/HBM_MEM00] -force
    assign_bd_address -offset 0x10000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM01] [get_bd_addr_segs hbm_0/SAXI_01/HBM_MEM01] -force
    assign_bd_address -offset 0x20000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM01] [get_bd_addr_segs hbm_0/SAXI_01/HBM_MEM02] -force
    assign_bd_address -offset 0x30000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM01] [get_bd_addr_segs hbm_0/SAXI_01/HBM_MEM03] -force
    assign_bd_address -offset 0x40000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM01] [get_bd_addr_segs hbm_0/SAXI_01/HBM_MEM04] -force
    assign_bd_address -offset 0x50000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM01] [get_bd_addr_segs hbm_0/SAXI_01/HBM_MEM05] -force
    assign_bd_address -offset 0x60000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM01] [get_bd_addr_segs hbm_0/SAXI_01/HBM_MEM06] -force
    assign_bd_address -offset 0x70000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM01] [get_bd_addr_segs hbm_0/SAXI_01/HBM_MEM07] -force
    assign_bd_address -offset 0x80000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM01] [get_bd_addr_segs hbm_0/SAXI_01/HBM_MEM08] -force
    assign_bd_address -offset 0x90000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM01] [get_bd_addr_segs hbm_0/SAXI_01/HBM_MEM09] -force
    assign_bd_address -offset 0xA0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM01] [get_bd_addr_segs hbm_0/SAXI_01/HBM_MEM10] -force
    assign_bd_address -offset 0xB0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM01] [get_bd_addr_segs hbm_0/SAXI_01/HBM_MEM11] -force
    assign_bd_address -offset 0xC0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM01] [get_bd_addr_segs hbm_0/SAXI_01/HBM_MEM12] -force
    assign_bd_address -offset 0xD0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM01] [get_bd_addr_segs hbm_0/SAXI_01/HBM_MEM13] -force
    assign_bd_address -offset 0xE0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM01] [get_bd_addr_segs hbm_0/SAXI_01/HBM_MEM14] -force
    assign_bd_address -offset 0xF0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM01] [get_bd_addr_segs hbm_0/SAXI_01/HBM_MEM15] -force
    assign_bd_address -offset 0x000100000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM01] [get_bd_addr_segs hbm_0/SAXI_01/HBM_MEM16] -force
    assign_bd_address -offset 0x000110000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM01] [get_bd_addr_segs hbm_0/SAXI_01/HBM_MEM17] -force
    assign_bd_address -offset 0x000120000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM01] [get_bd_addr_segs hbm_0/SAXI_01/HBM_MEM18] -force
    assign_bd_address -offset 0x000130000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM01] [get_bd_addr_segs hbm_0/SAXI_01/HBM_MEM19] -force
    assign_bd_address -offset 0x000140000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM01] [get_bd_addr_segs hbm_0/SAXI_01/HBM_MEM20] -force
    assign_bd_address -offset 0x000150000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM01] [get_bd_addr_segs hbm_0/SAXI_01/HBM_MEM21] -force
    assign_bd_address -offset 0x000160000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM01] [get_bd_addr_segs hbm_0/SAXI_01/HBM_MEM22] -force
    assign_bd_address -offset 0x000170000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM01] [get_bd_addr_segs hbm_0/SAXI_01/HBM_MEM23] -force
    assign_bd_address -offset 0x000180000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM01] [get_bd_addr_segs hbm_0/SAXI_01/HBM_MEM24] -force
    assign_bd_address -offset 0x000190000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM01] [get_bd_addr_segs hbm_0/SAXI_01/HBM_MEM25] -force
    assign_bd_address -offset 0x0001A0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM01] [get_bd_addr_segs hbm_0/SAXI_01/HBM_MEM26] -force
    assign_bd_address -offset 0x0001B0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM01] [get_bd_addr_segs hbm_0/SAXI_01/HBM_MEM27] -force
    assign_bd_address -offset 0x0001C0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM01] [get_bd_addr_segs hbm_0/SAXI_01/HBM_MEM28] -force
    assign_bd_address -offset 0x0001D0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM01] [get_bd_addr_segs hbm_0/SAXI_01/HBM_MEM29] -force
    assign_bd_address -offset 0x0001E0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM01] [get_bd_addr_segs hbm_0/SAXI_01/HBM_MEM30] -force
    assign_bd_address -offset 0x0001F0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM01] [get_bd_addr_segs hbm_0/SAXI_01/HBM_MEM31] -force
    assign_bd_address -offset 0x00000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM02] [get_bd_addr_segs hbm_0/SAXI_02/HBM_MEM00] -force
    assign_bd_address -offset 0x10000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM02] [get_bd_addr_segs hbm_0/SAXI_02/HBM_MEM01] -force
    assign_bd_address -offset 0x20000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM02] [get_bd_addr_segs hbm_0/SAXI_02/HBM_MEM02] -force
    assign_bd_address -offset 0x30000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM02] [get_bd_addr_segs hbm_0/SAXI_02/HBM_MEM03] -force
    assign_bd_address -offset 0x40000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM02] [get_bd_addr_segs hbm_0/SAXI_02/HBM_MEM04] -force
    assign_bd_address -offset 0x50000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM02] [get_bd_addr_segs hbm_0/SAXI_02/HBM_MEM05] -force
    assign_bd_address -offset 0x60000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM02] [get_bd_addr_segs hbm_0/SAXI_02/HBM_MEM06] -force
    assign_bd_address -offset 0x70000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM02] [get_bd_addr_segs hbm_0/SAXI_02/HBM_MEM07] -force
    assign_bd_address -offset 0x80000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM02] [get_bd_addr_segs hbm_0/SAXI_02/HBM_MEM08] -force
    assign_bd_address -offset 0x90000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM02] [get_bd_addr_segs hbm_0/SAXI_02/HBM_MEM09] -force
    assign_bd_address -offset 0xA0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM02] [get_bd_addr_segs hbm_0/SAXI_02/HBM_MEM10] -force
    assign_bd_address -offset 0xB0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM02] [get_bd_addr_segs hbm_0/SAXI_02/HBM_MEM11] -force
    assign_bd_address -offset 0xC0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM02] [get_bd_addr_segs hbm_0/SAXI_02/HBM_MEM12] -force
    assign_bd_address -offset 0xD0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM02] [get_bd_addr_segs hbm_0/SAXI_02/HBM_MEM13] -force
    assign_bd_address -offset 0xE0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM02] [get_bd_addr_segs hbm_0/SAXI_02/HBM_MEM14] -force
    assign_bd_address -offset 0xF0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM02] [get_bd_addr_segs hbm_0/SAXI_02/HBM_MEM15] -force
    assign_bd_address -offset 0x000100000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM02] [get_bd_addr_segs hbm_0/SAXI_02/HBM_MEM16] -force
    assign_bd_address -offset 0x000110000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM02] [get_bd_addr_segs hbm_0/SAXI_02/HBM_MEM17] -force
    assign_bd_address -offset 0x000120000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM02] [get_bd_addr_segs hbm_0/SAXI_02/HBM_MEM18] -force
    assign_bd_address -offset 0x000130000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM02] [get_bd_addr_segs hbm_0/SAXI_02/HBM_MEM19] -force
    assign_bd_address -offset 0x000140000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM02] [get_bd_addr_segs hbm_0/SAXI_02/HBM_MEM20] -force
    assign_bd_address -offset 0x000150000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM02] [get_bd_addr_segs hbm_0/SAXI_02/HBM_MEM21] -force
    assign_bd_address -offset 0x000160000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM02] [get_bd_addr_segs hbm_0/SAXI_02/HBM_MEM22] -force
    assign_bd_address -offset 0x000170000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM02] [get_bd_addr_segs hbm_0/SAXI_02/HBM_MEM23] -force
    assign_bd_address -offset 0x000180000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM02] [get_bd_addr_segs hbm_0/SAXI_02/HBM_MEM24] -force
    assign_bd_address -offset 0x000190000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM02] [get_bd_addr_segs hbm_0/SAXI_02/HBM_MEM25] -force
    assign_bd_address -offset 0x0001A0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM02] [get_bd_addr_segs hbm_0/SAXI_02/HBM_MEM26] -force
    assign_bd_address -offset 0x0001B0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM02] [get_bd_addr_segs hbm_0/SAXI_02/HBM_MEM27] -force
    assign_bd_address -offset 0x0001C0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM02] [get_bd_addr_segs hbm_0/SAXI_02/HBM_MEM28] -force
    assign_bd_address -offset 0x0001D0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM02] [get_bd_addr_segs hbm_0/SAXI_02/HBM_MEM29] -force
    assign_bd_address -offset 0x0001E0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM02] [get_bd_addr_segs hbm_0/SAXI_02/HBM_MEM30] -force
    assign_bd_address -offset 0x0001F0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM02] [get_bd_addr_segs hbm_0/SAXI_02/HBM_MEM31] -force
    assign_bd_address -offset 0x00000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM03] [get_bd_addr_segs hbm_0/SAXI_03/HBM_MEM00] -force
    assign_bd_address -offset 0x10000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM03] [get_bd_addr_segs hbm_0/SAXI_03/HBM_MEM01] -force
    assign_bd_address -offset 0x20000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM03] [get_bd_addr_segs hbm_0/SAXI_03/HBM_MEM02] -force
    assign_bd_address -offset 0x30000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM03] [get_bd_addr_segs hbm_0/SAXI_03/HBM_MEM03] -force
    assign_bd_address -offset 0x40000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM03] [get_bd_addr_segs hbm_0/SAXI_03/HBM_MEM04] -force
    assign_bd_address -offset 0x50000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM03] [get_bd_addr_segs hbm_0/SAXI_03/HBM_MEM05] -force
    assign_bd_address -offset 0x60000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM03] [get_bd_addr_segs hbm_0/SAXI_03/HBM_MEM06] -force
    assign_bd_address -offset 0x70000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM03] [get_bd_addr_segs hbm_0/SAXI_03/HBM_MEM07] -force
    assign_bd_address -offset 0x80000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM03] [get_bd_addr_segs hbm_0/SAXI_03/HBM_MEM08] -force
    assign_bd_address -offset 0x90000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM03] [get_bd_addr_segs hbm_0/SAXI_03/HBM_MEM09] -force
    assign_bd_address -offset 0xA0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM03] [get_bd_addr_segs hbm_0/SAXI_03/HBM_MEM10] -force
    assign_bd_address -offset 0xB0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM03] [get_bd_addr_segs hbm_0/SAXI_03/HBM_MEM11] -force
    assign_bd_address -offset 0xC0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM03] [get_bd_addr_segs hbm_0/SAXI_03/HBM_MEM12] -force
    assign_bd_address -offset 0xD0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM03] [get_bd_addr_segs hbm_0/SAXI_03/HBM_MEM13] -force
    assign_bd_address -offset 0xE0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM03] [get_bd_addr_segs hbm_0/SAXI_03/HBM_MEM14] -force
    assign_bd_address -offset 0xF0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM03] [get_bd_addr_segs hbm_0/SAXI_03/HBM_MEM15] -force
    assign_bd_address -offset 0x000100000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM03] [get_bd_addr_segs hbm_0/SAXI_03/HBM_MEM16] -force
    assign_bd_address -offset 0x000110000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM03] [get_bd_addr_segs hbm_0/SAXI_03/HBM_MEM17] -force
    assign_bd_address -offset 0x000120000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM03] [get_bd_addr_segs hbm_0/SAXI_03/HBM_MEM18] -force
    assign_bd_address -offset 0x000130000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM03] [get_bd_addr_segs hbm_0/SAXI_03/HBM_MEM19] -force
    assign_bd_address -offset 0x000140000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM03] [get_bd_addr_segs hbm_0/SAXI_03/HBM_MEM20] -force
    assign_bd_address -offset 0x000150000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM03] [get_bd_addr_segs hbm_0/SAXI_03/HBM_MEM21] -force
    assign_bd_address -offset 0x000160000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM03] [get_bd_addr_segs hbm_0/SAXI_03/HBM_MEM22] -force
    assign_bd_address -offset 0x000170000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM03] [get_bd_addr_segs hbm_0/SAXI_03/HBM_MEM23] -force
    assign_bd_address -offset 0x000180000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM03] [get_bd_addr_segs hbm_0/SAXI_03/HBM_MEM24] -force
    assign_bd_address -offset 0x000190000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM03] [get_bd_addr_segs hbm_0/SAXI_03/HBM_MEM25] -force
    assign_bd_address -offset 0x0001A0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM03] [get_bd_addr_segs hbm_0/SAXI_03/HBM_MEM26] -force
    assign_bd_address -offset 0x0001B0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM03] [get_bd_addr_segs hbm_0/SAXI_03/HBM_MEM27] -force
    assign_bd_address -offset 0x0001C0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM03] [get_bd_addr_segs hbm_0/SAXI_03/HBM_MEM28] -force
    assign_bd_address -offset 0x0001D0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM03] [get_bd_addr_segs hbm_0/SAXI_03/HBM_MEM29] -force
    assign_bd_address -offset 0x0001E0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM03] [get_bd_addr_segs hbm_0/SAXI_03/HBM_MEM30] -force
    assign_bd_address -offset 0x0001F0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM03] [get_bd_addr_segs hbm_0/SAXI_03/HBM_MEM31] -force
    assign_bd_address -offset 0x00000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM04] [get_bd_addr_segs hbm_0/SAXI_04/HBM_MEM00] -force
    assign_bd_address -offset 0x10000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM04] [get_bd_addr_segs hbm_0/SAXI_04/HBM_MEM01] -force
    assign_bd_address -offset 0x20000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM04] [get_bd_addr_segs hbm_0/SAXI_04/HBM_MEM02] -force
    assign_bd_address -offset 0x30000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM04] [get_bd_addr_segs hbm_0/SAXI_04/HBM_MEM03] -force
    assign_bd_address -offset 0x40000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM04] [get_bd_addr_segs hbm_0/SAXI_04/HBM_MEM04] -force
    assign_bd_address -offset 0x50000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM04] [get_bd_addr_segs hbm_0/SAXI_04/HBM_MEM05] -force
    assign_bd_address -offset 0x60000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM04] [get_bd_addr_segs hbm_0/SAXI_04/HBM_MEM06] -force
    assign_bd_address -offset 0x70000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM04] [get_bd_addr_segs hbm_0/SAXI_04/HBM_MEM07] -force
    assign_bd_address -offset 0x80000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM04] [get_bd_addr_segs hbm_0/SAXI_04/HBM_MEM08] -force
    assign_bd_address -offset 0x90000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM04] [get_bd_addr_segs hbm_0/SAXI_04/HBM_MEM09] -force
    assign_bd_address -offset 0xA0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM04] [get_bd_addr_segs hbm_0/SAXI_04/HBM_MEM10] -force
    assign_bd_address -offset 0xB0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM04] [get_bd_addr_segs hbm_0/SAXI_04/HBM_MEM11] -force
    assign_bd_address -offset 0xC0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM04] [get_bd_addr_segs hbm_0/SAXI_04/HBM_MEM12] -force
    assign_bd_address -offset 0xD0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM04] [get_bd_addr_segs hbm_0/SAXI_04/HBM_MEM13] -force
    assign_bd_address -offset 0xE0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM04] [get_bd_addr_segs hbm_0/SAXI_04/HBM_MEM14] -force
    assign_bd_address -offset 0xF0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM04] [get_bd_addr_segs hbm_0/SAXI_04/HBM_MEM15] -force
    assign_bd_address -offset 0x000100000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM04] [get_bd_addr_segs hbm_0/SAXI_04/HBM_MEM16] -force
    assign_bd_address -offset 0x000110000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM04] [get_bd_addr_segs hbm_0/SAXI_04/HBM_MEM17] -force
    assign_bd_address -offset 0x000120000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM04] [get_bd_addr_segs hbm_0/SAXI_04/HBM_MEM18] -force
    assign_bd_address -offset 0x000130000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM04] [get_bd_addr_segs hbm_0/SAXI_04/HBM_MEM19] -force
    assign_bd_address -offset 0x000140000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM04] [get_bd_addr_segs hbm_0/SAXI_04/HBM_MEM20] -force
    assign_bd_address -offset 0x000150000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM04] [get_bd_addr_segs hbm_0/SAXI_04/HBM_MEM21] -force
    assign_bd_address -offset 0x000160000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM04] [get_bd_addr_segs hbm_0/SAXI_04/HBM_MEM22] -force
    assign_bd_address -offset 0x000170000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM04] [get_bd_addr_segs hbm_0/SAXI_04/HBM_MEM23] -force
    assign_bd_address -offset 0x000180000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM04] [get_bd_addr_segs hbm_0/SAXI_04/HBM_MEM24] -force
    assign_bd_address -offset 0x000190000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM04] [get_bd_addr_segs hbm_0/SAXI_04/HBM_MEM25] -force
    assign_bd_address -offset 0x0001A0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM04] [get_bd_addr_segs hbm_0/SAXI_04/HBM_MEM26] -force
    assign_bd_address -offset 0x0001B0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM04] [get_bd_addr_segs hbm_0/SAXI_04/HBM_MEM27] -force
    assign_bd_address -offset 0x0001C0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM04] [get_bd_addr_segs hbm_0/SAXI_04/HBM_MEM28] -force
    assign_bd_address -offset 0x0001D0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM04] [get_bd_addr_segs hbm_0/SAXI_04/HBM_MEM29] -force
    assign_bd_address -offset 0x0001E0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM04] [get_bd_addr_segs hbm_0/SAXI_04/HBM_MEM30] -force
    assign_bd_address -offset 0x0001F0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM04] [get_bd_addr_segs hbm_0/SAXI_04/HBM_MEM31] -force
    assign_bd_address -offset 0x00000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM05] [get_bd_addr_segs hbm_0/SAXI_05/HBM_MEM00] -force
    assign_bd_address -offset 0x10000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM05] [get_bd_addr_segs hbm_0/SAXI_05/HBM_MEM01] -force
    assign_bd_address -offset 0x20000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM05] [get_bd_addr_segs hbm_0/SAXI_05/HBM_MEM02] -force
    assign_bd_address -offset 0x30000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM05] [get_bd_addr_segs hbm_0/SAXI_05/HBM_MEM03] -force
    assign_bd_address -offset 0x40000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM05] [get_bd_addr_segs hbm_0/SAXI_05/HBM_MEM04] -force
    assign_bd_address -offset 0x50000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM05] [get_bd_addr_segs hbm_0/SAXI_05/HBM_MEM05] -force
    assign_bd_address -offset 0x60000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM05] [get_bd_addr_segs hbm_0/SAXI_05/HBM_MEM06] -force
    assign_bd_address -offset 0x70000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM05] [get_bd_addr_segs hbm_0/SAXI_05/HBM_MEM07] -force
    assign_bd_address -offset 0x80000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM05] [get_bd_addr_segs hbm_0/SAXI_05/HBM_MEM08] -force
    assign_bd_address -offset 0x90000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM05] [get_bd_addr_segs hbm_0/SAXI_05/HBM_MEM09] -force
    assign_bd_address -offset 0xA0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM05] [get_bd_addr_segs hbm_0/SAXI_05/HBM_MEM10] -force
    assign_bd_address -offset 0xB0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM05] [get_bd_addr_segs hbm_0/SAXI_05/HBM_MEM11] -force
    assign_bd_address -offset 0xC0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM05] [get_bd_addr_segs hbm_0/SAXI_05/HBM_MEM12] -force
    assign_bd_address -offset 0xD0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM05] [get_bd_addr_segs hbm_0/SAXI_05/HBM_MEM13] -force
    assign_bd_address -offset 0xE0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM05] [get_bd_addr_segs hbm_0/SAXI_05/HBM_MEM14] -force
    assign_bd_address -offset 0xF0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM05] [get_bd_addr_segs hbm_0/SAXI_05/HBM_MEM15] -force
    assign_bd_address -offset 0x000100000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM05] [get_bd_addr_segs hbm_0/SAXI_05/HBM_MEM16] -force
    assign_bd_address -offset 0x000110000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM05] [get_bd_addr_segs hbm_0/SAXI_05/HBM_MEM17] -force
    assign_bd_address -offset 0x000120000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM05] [get_bd_addr_segs hbm_0/SAXI_05/HBM_MEM18] -force
    assign_bd_address -offset 0x000130000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM05] [get_bd_addr_segs hbm_0/SAXI_05/HBM_MEM19] -force
    assign_bd_address -offset 0x000140000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM05] [get_bd_addr_segs hbm_0/SAXI_05/HBM_MEM20] -force
    assign_bd_address -offset 0x000150000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM05] [get_bd_addr_segs hbm_0/SAXI_05/HBM_MEM21] -force
    assign_bd_address -offset 0x000160000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM05] [get_bd_addr_segs hbm_0/SAXI_05/HBM_MEM22] -force
    assign_bd_address -offset 0x000170000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM05] [get_bd_addr_segs hbm_0/SAXI_05/HBM_MEM23] -force
    assign_bd_address -offset 0x000180000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM05] [get_bd_addr_segs hbm_0/SAXI_05/HBM_MEM24] -force
    assign_bd_address -offset 0x000190000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM05] [get_bd_addr_segs hbm_0/SAXI_05/HBM_MEM25] -force
    assign_bd_address -offset 0x0001A0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM05] [get_bd_addr_segs hbm_0/SAXI_05/HBM_MEM26] -force
    assign_bd_address -offset 0x0001B0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM05] [get_bd_addr_segs hbm_0/SAXI_05/HBM_MEM27] -force
    assign_bd_address -offset 0x0001C0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM05] [get_bd_addr_segs hbm_0/SAXI_05/HBM_MEM28] -force
    assign_bd_address -offset 0x0001D0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM05] [get_bd_addr_segs hbm_0/SAXI_05/HBM_MEM29] -force
    assign_bd_address -offset 0x0001E0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM05] [get_bd_addr_segs hbm_0/SAXI_05/HBM_MEM30] -force
    assign_bd_address -offset 0x0001F0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM05] [get_bd_addr_segs hbm_0/SAXI_05/HBM_MEM31] -force
    assign_bd_address -offset 0x00000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM06] [get_bd_addr_segs hbm_0/SAXI_06/HBM_MEM00] -force
    assign_bd_address -offset 0x10000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM06] [get_bd_addr_segs hbm_0/SAXI_06/HBM_MEM01] -force
    assign_bd_address -offset 0x20000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM06] [get_bd_addr_segs hbm_0/SAXI_06/HBM_MEM02] -force
    assign_bd_address -offset 0x30000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM06] [get_bd_addr_segs hbm_0/SAXI_06/HBM_MEM03] -force
    assign_bd_address -offset 0x40000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM06] [get_bd_addr_segs hbm_0/SAXI_06/HBM_MEM04] -force
    assign_bd_address -offset 0x50000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM06] [get_bd_addr_segs hbm_0/SAXI_06/HBM_MEM05] -force
    assign_bd_address -offset 0x60000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM06] [get_bd_addr_segs hbm_0/SAXI_06/HBM_MEM06] -force
    assign_bd_address -offset 0x70000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM06] [get_bd_addr_segs hbm_0/SAXI_06/HBM_MEM07] -force
    assign_bd_address -offset 0x80000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM06] [get_bd_addr_segs hbm_0/SAXI_06/HBM_MEM08] -force
    assign_bd_address -offset 0x90000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM06] [get_bd_addr_segs hbm_0/SAXI_06/HBM_MEM09] -force
    assign_bd_address -offset 0xA0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM06] [get_bd_addr_segs hbm_0/SAXI_06/HBM_MEM10] -force
    assign_bd_address -offset 0xB0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM06] [get_bd_addr_segs hbm_0/SAXI_06/HBM_MEM11] -force
    assign_bd_address -offset 0xC0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM06] [get_bd_addr_segs hbm_0/SAXI_06/HBM_MEM12] -force
    assign_bd_address -offset 0xD0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM06] [get_bd_addr_segs hbm_0/SAXI_06/HBM_MEM13] -force
    assign_bd_address -offset 0xE0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM06] [get_bd_addr_segs hbm_0/SAXI_06/HBM_MEM14] -force
    assign_bd_address -offset 0xF0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM06] [get_bd_addr_segs hbm_0/SAXI_06/HBM_MEM15] -force
    assign_bd_address -offset 0x000100000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM06] [get_bd_addr_segs hbm_0/SAXI_06/HBM_MEM16] -force
    assign_bd_address -offset 0x000110000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM06] [get_bd_addr_segs hbm_0/SAXI_06/HBM_MEM17] -force
    assign_bd_address -offset 0x000120000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM06] [get_bd_addr_segs hbm_0/SAXI_06/HBM_MEM18] -force
    assign_bd_address -offset 0x000130000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM06] [get_bd_addr_segs hbm_0/SAXI_06/HBM_MEM19] -force
    assign_bd_address -offset 0x000140000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM06] [get_bd_addr_segs hbm_0/SAXI_06/HBM_MEM20] -force
    assign_bd_address -offset 0x000150000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM06] [get_bd_addr_segs hbm_0/SAXI_06/HBM_MEM21] -force
    assign_bd_address -offset 0x000160000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM06] [get_bd_addr_segs hbm_0/SAXI_06/HBM_MEM22] -force
    assign_bd_address -offset 0x000170000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM06] [get_bd_addr_segs hbm_0/SAXI_06/HBM_MEM23] -force
    assign_bd_address -offset 0x000180000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM06] [get_bd_addr_segs hbm_0/SAXI_06/HBM_MEM24] -force
    assign_bd_address -offset 0x000190000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM06] [get_bd_addr_segs hbm_0/SAXI_06/HBM_MEM25] -force
    assign_bd_address -offset 0x0001A0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM06] [get_bd_addr_segs hbm_0/SAXI_06/HBM_MEM26] -force
    assign_bd_address -offset 0x0001B0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM06] [get_bd_addr_segs hbm_0/SAXI_06/HBM_MEM27] -force
    assign_bd_address -offset 0x0001C0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM06] [get_bd_addr_segs hbm_0/SAXI_06/HBM_MEM28] -force
    assign_bd_address -offset 0x0001D0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM06] [get_bd_addr_segs hbm_0/SAXI_06/HBM_MEM29] -force
    assign_bd_address -offset 0x0001E0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM06] [get_bd_addr_segs hbm_0/SAXI_06/HBM_MEM30] -force
    assign_bd_address -offset 0x0001F0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM06] [get_bd_addr_segs hbm_0/SAXI_06/HBM_MEM31] -force
    assign_bd_address -offset 0x00000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM07] [get_bd_addr_segs hbm_0/SAXI_07/HBM_MEM00] -force
    assign_bd_address -offset 0x10000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM07] [get_bd_addr_segs hbm_0/SAXI_07/HBM_MEM01] -force
    assign_bd_address -offset 0x20000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM07] [get_bd_addr_segs hbm_0/SAXI_07/HBM_MEM02] -force
    assign_bd_address -offset 0x30000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM07] [get_bd_addr_segs hbm_0/SAXI_07/HBM_MEM03] -force
    assign_bd_address -offset 0x40000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM07] [get_bd_addr_segs hbm_0/SAXI_07/HBM_MEM04] -force
    assign_bd_address -offset 0x50000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM07] [get_bd_addr_segs hbm_0/SAXI_07/HBM_MEM05] -force
    assign_bd_address -offset 0x60000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM07] [get_bd_addr_segs hbm_0/SAXI_07/HBM_MEM06] -force
    assign_bd_address -offset 0x70000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM07] [get_bd_addr_segs hbm_0/SAXI_07/HBM_MEM07] -force
    assign_bd_address -offset 0x80000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM07] [get_bd_addr_segs hbm_0/SAXI_07/HBM_MEM08] -force
    assign_bd_address -offset 0x90000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM07] [get_bd_addr_segs hbm_0/SAXI_07/HBM_MEM09] -force
    assign_bd_address -offset 0xA0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM07] [get_bd_addr_segs hbm_0/SAXI_07/HBM_MEM10] -force
    assign_bd_address -offset 0xB0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM07] [get_bd_addr_segs hbm_0/SAXI_07/HBM_MEM11] -force
    assign_bd_address -offset 0xC0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM07] [get_bd_addr_segs hbm_0/SAXI_07/HBM_MEM12] -force
    assign_bd_address -offset 0xD0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM07] [get_bd_addr_segs hbm_0/SAXI_07/HBM_MEM13] -force
    assign_bd_address -offset 0xE0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM07] [get_bd_addr_segs hbm_0/SAXI_07/HBM_MEM14] -force
    assign_bd_address -offset 0xF0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM07] [get_bd_addr_segs hbm_0/SAXI_07/HBM_MEM15] -force
    assign_bd_address -offset 0x000100000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM07] [get_bd_addr_segs hbm_0/SAXI_07/HBM_MEM16] -force
    assign_bd_address -offset 0x000110000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM07] [get_bd_addr_segs hbm_0/SAXI_07/HBM_MEM17] -force
    assign_bd_address -offset 0x000120000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM07] [get_bd_addr_segs hbm_0/SAXI_07/HBM_MEM18] -force
    assign_bd_address -offset 0x000130000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM07] [get_bd_addr_segs hbm_0/SAXI_07/HBM_MEM19] -force
    assign_bd_address -offset 0x000140000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM07] [get_bd_addr_segs hbm_0/SAXI_07/HBM_MEM20] -force
    assign_bd_address -offset 0x000150000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM07] [get_bd_addr_segs hbm_0/SAXI_07/HBM_MEM21] -force
    assign_bd_address -offset 0x000160000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM07] [get_bd_addr_segs hbm_0/SAXI_07/HBM_MEM22] -force
    assign_bd_address -offset 0x000170000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM07] [get_bd_addr_segs hbm_0/SAXI_07/HBM_MEM23] -force
    assign_bd_address -offset 0x000180000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM07] [get_bd_addr_segs hbm_0/SAXI_07/HBM_MEM24] -force
    assign_bd_address -offset 0x000190000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM07] [get_bd_addr_segs hbm_0/SAXI_07/HBM_MEM25] -force
    assign_bd_address -offset 0x0001A0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM07] [get_bd_addr_segs hbm_0/SAXI_07/HBM_MEM26] -force
    assign_bd_address -offset 0x0001B0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM07] [get_bd_addr_segs hbm_0/SAXI_07/HBM_MEM27] -force
    assign_bd_address -offset 0x0001C0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM07] [get_bd_addr_segs hbm_0/SAXI_07/HBM_MEM28] -force
    assign_bd_address -offset 0x0001D0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM07] [get_bd_addr_segs hbm_0/SAXI_07/HBM_MEM29] -force
    assign_bd_address -offset 0x0001E0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM07] [get_bd_addr_segs hbm_0/SAXI_07/HBM_MEM30] -force
    assign_bd_address -offset 0x0001F0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM07] [get_bd_addr_segs hbm_0/SAXI_07/HBM_MEM31] -force
    assign_bd_address -offset 0x00000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM08] [get_bd_addr_segs hbm_0/SAXI_08/HBM_MEM00] -force
    assign_bd_address -offset 0x10000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM08] [get_bd_addr_segs hbm_0/SAXI_08/HBM_MEM01] -force
    assign_bd_address -offset 0x20000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM08] [get_bd_addr_segs hbm_0/SAXI_08/HBM_MEM02] -force
    assign_bd_address -offset 0x30000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM08] [get_bd_addr_segs hbm_0/SAXI_08/HBM_MEM03] -force
    assign_bd_address -offset 0x40000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM08] [get_bd_addr_segs hbm_0/SAXI_08/HBM_MEM04] -force
    assign_bd_address -offset 0x50000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM08] [get_bd_addr_segs hbm_0/SAXI_08/HBM_MEM05] -force
    assign_bd_address -offset 0x60000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM08] [get_bd_addr_segs hbm_0/SAXI_08/HBM_MEM06] -force
    assign_bd_address -offset 0x70000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM08] [get_bd_addr_segs hbm_0/SAXI_08/HBM_MEM07] -force
    assign_bd_address -offset 0x80000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM08] [get_bd_addr_segs hbm_0/SAXI_08/HBM_MEM08] -force
    assign_bd_address -offset 0x90000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM08] [get_bd_addr_segs hbm_0/SAXI_08/HBM_MEM09] -force
    assign_bd_address -offset 0xA0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM08] [get_bd_addr_segs hbm_0/SAXI_08/HBM_MEM10] -force
    assign_bd_address -offset 0xB0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM08] [get_bd_addr_segs hbm_0/SAXI_08/HBM_MEM11] -force
    assign_bd_address -offset 0xC0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM08] [get_bd_addr_segs hbm_0/SAXI_08/HBM_MEM12] -force
    assign_bd_address -offset 0xD0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM08] [get_bd_addr_segs hbm_0/SAXI_08/HBM_MEM13] -force
    assign_bd_address -offset 0xE0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM08] [get_bd_addr_segs hbm_0/SAXI_08/HBM_MEM14] -force
    assign_bd_address -offset 0xF0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM08] [get_bd_addr_segs hbm_0/SAXI_08/HBM_MEM15] -force
    assign_bd_address -offset 0x000100000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM08] [get_bd_addr_segs hbm_0/SAXI_08/HBM_MEM16] -force
    assign_bd_address -offset 0x000110000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM08] [get_bd_addr_segs hbm_0/SAXI_08/HBM_MEM17] -force
    assign_bd_address -offset 0x000120000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM08] [get_bd_addr_segs hbm_0/SAXI_08/HBM_MEM18] -force
    assign_bd_address -offset 0x000130000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM08] [get_bd_addr_segs hbm_0/SAXI_08/HBM_MEM19] -force
    assign_bd_address -offset 0x000140000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM08] [get_bd_addr_segs hbm_0/SAXI_08/HBM_MEM20] -force
    assign_bd_address -offset 0x000150000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM08] [get_bd_addr_segs hbm_0/SAXI_08/HBM_MEM21] -force
    assign_bd_address -offset 0x000160000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM08] [get_bd_addr_segs hbm_0/SAXI_08/HBM_MEM22] -force
    assign_bd_address -offset 0x000170000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM08] [get_bd_addr_segs hbm_0/SAXI_08/HBM_MEM23] -force
    assign_bd_address -offset 0x000180000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM08] [get_bd_addr_segs hbm_0/SAXI_08/HBM_MEM24] -force
    assign_bd_address -offset 0x000190000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM08] [get_bd_addr_segs hbm_0/SAXI_08/HBM_MEM25] -force
    assign_bd_address -offset 0x0001A0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM08] [get_bd_addr_segs hbm_0/SAXI_08/HBM_MEM26] -force
    assign_bd_address -offset 0x0001B0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM08] [get_bd_addr_segs hbm_0/SAXI_08/HBM_MEM27] -force
    assign_bd_address -offset 0x0001C0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM08] [get_bd_addr_segs hbm_0/SAXI_08/HBM_MEM28] -force
    assign_bd_address -offset 0x0001D0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM08] [get_bd_addr_segs hbm_0/SAXI_08/HBM_MEM29] -force
    assign_bd_address -offset 0x0001E0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM08] [get_bd_addr_segs hbm_0/SAXI_08/HBM_MEM30] -force
    assign_bd_address -offset 0x0001F0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM08] [get_bd_addr_segs hbm_0/SAXI_08/HBM_MEM31] -force
    assign_bd_address -offset 0x00000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM09] [get_bd_addr_segs hbm_0/SAXI_09/HBM_MEM00] -force
    assign_bd_address -offset 0x10000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM09] [get_bd_addr_segs hbm_0/SAXI_09/HBM_MEM01] -force
    assign_bd_address -offset 0x20000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM09] [get_bd_addr_segs hbm_0/SAXI_09/HBM_MEM02] -force
    assign_bd_address -offset 0x30000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM09] [get_bd_addr_segs hbm_0/SAXI_09/HBM_MEM03] -force
    assign_bd_address -offset 0x40000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM09] [get_bd_addr_segs hbm_0/SAXI_09/HBM_MEM04] -force
    assign_bd_address -offset 0x50000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM09] [get_bd_addr_segs hbm_0/SAXI_09/HBM_MEM05] -force
    assign_bd_address -offset 0x60000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM09] [get_bd_addr_segs hbm_0/SAXI_09/HBM_MEM06] -force
    assign_bd_address -offset 0x70000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM09] [get_bd_addr_segs hbm_0/SAXI_09/HBM_MEM07] -force
    assign_bd_address -offset 0x80000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM09] [get_bd_addr_segs hbm_0/SAXI_09/HBM_MEM08] -force
    assign_bd_address -offset 0x90000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM09] [get_bd_addr_segs hbm_0/SAXI_09/HBM_MEM09] -force
    assign_bd_address -offset 0xA0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM09] [get_bd_addr_segs hbm_0/SAXI_09/HBM_MEM10] -force
    assign_bd_address -offset 0xB0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM09] [get_bd_addr_segs hbm_0/SAXI_09/HBM_MEM11] -force
    assign_bd_address -offset 0xC0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM09] [get_bd_addr_segs hbm_0/SAXI_09/HBM_MEM12] -force
    assign_bd_address -offset 0xD0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM09] [get_bd_addr_segs hbm_0/SAXI_09/HBM_MEM13] -force
    assign_bd_address -offset 0xE0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM09] [get_bd_addr_segs hbm_0/SAXI_09/HBM_MEM14] -force
    assign_bd_address -offset 0xF0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM09] [get_bd_addr_segs hbm_0/SAXI_09/HBM_MEM15] -force
    assign_bd_address -offset 0x000100000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM09] [get_bd_addr_segs hbm_0/SAXI_09/HBM_MEM16] -force
    assign_bd_address -offset 0x000110000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM09] [get_bd_addr_segs hbm_0/SAXI_09/HBM_MEM17] -force
    assign_bd_address -offset 0x000120000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM09] [get_bd_addr_segs hbm_0/SAXI_09/HBM_MEM18] -force
    assign_bd_address -offset 0x000130000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM09] [get_bd_addr_segs hbm_0/SAXI_09/HBM_MEM19] -force
    assign_bd_address -offset 0x000140000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM09] [get_bd_addr_segs hbm_0/SAXI_09/HBM_MEM20] -force
    assign_bd_address -offset 0x000150000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM09] [get_bd_addr_segs hbm_0/SAXI_09/HBM_MEM21] -force
    assign_bd_address -offset 0x000160000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM09] [get_bd_addr_segs hbm_0/SAXI_09/HBM_MEM22] -force
    assign_bd_address -offset 0x000170000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM09] [get_bd_addr_segs hbm_0/SAXI_09/HBM_MEM23] -force
    assign_bd_address -offset 0x000180000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM09] [get_bd_addr_segs hbm_0/SAXI_09/HBM_MEM24] -force
    assign_bd_address -offset 0x000190000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM09] [get_bd_addr_segs hbm_0/SAXI_09/HBM_MEM25] -force
    assign_bd_address -offset 0x0001A0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM09] [get_bd_addr_segs hbm_0/SAXI_09/HBM_MEM26] -force
    assign_bd_address -offset 0x0001B0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM09] [get_bd_addr_segs hbm_0/SAXI_09/HBM_MEM27] -force
    assign_bd_address -offset 0x0001C0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM09] [get_bd_addr_segs hbm_0/SAXI_09/HBM_MEM28] -force
    assign_bd_address -offset 0x0001D0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM09] [get_bd_addr_segs hbm_0/SAXI_09/HBM_MEM29] -force
    assign_bd_address -offset 0x0001E0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM09] [get_bd_addr_segs hbm_0/SAXI_09/HBM_MEM30] -force
    assign_bd_address -offset 0x0001F0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM09] [get_bd_addr_segs hbm_0/SAXI_09/HBM_MEM31] -force
    assign_bd_address -offset 0x00000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM10] [get_bd_addr_segs hbm_0/SAXI_10/HBM_MEM00] -force
    assign_bd_address -offset 0x10000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM10] [get_bd_addr_segs hbm_0/SAXI_10/HBM_MEM01] -force
    assign_bd_address -offset 0x20000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM10] [get_bd_addr_segs hbm_0/SAXI_10/HBM_MEM02] -force
    assign_bd_address -offset 0x30000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM10] [get_bd_addr_segs hbm_0/SAXI_10/HBM_MEM03] -force
    assign_bd_address -offset 0x40000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM10] [get_bd_addr_segs hbm_0/SAXI_10/HBM_MEM04] -force
    assign_bd_address -offset 0x50000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM10] [get_bd_addr_segs hbm_0/SAXI_10/HBM_MEM05] -force
    assign_bd_address -offset 0x60000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM10] [get_bd_addr_segs hbm_0/SAXI_10/HBM_MEM06] -force
    assign_bd_address -offset 0x70000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM10] [get_bd_addr_segs hbm_0/SAXI_10/HBM_MEM07] -force
    assign_bd_address -offset 0x80000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM10] [get_bd_addr_segs hbm_0/SAXI_10/HBM_MEM08] -force
    assign_bd_address -offset 0x90000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM10] [get_bd_addr_segs hbm_0/SAXI_10/HBM_MEM09] -force
    assign_bd_address -offset 0xA0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM10] [get_bd_addr_segs hbm_0/SAXI_10/HBM_MEM10] -force
    assign_bd_address -offset 0xB0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM10] [get_bd_addr_segs hbm_0/SAXI_10/HBM_MEM11] -force
    assign_bd_address -offset 0xC0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM10] [get_bd_addr_segs hbm_0/SAXI_10/HBM_MEM12] -force
    assign_bd_address -offset 0xD0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM10] [get_bd_addr_segs hbm_0/SAXI_10/HBM_MEM13] -force
    assign_bd_address -offset 0xE0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM10] [get_bd_addr_segs hbm_0/SAXI_10/HBM_MEM14] -force
    assign_bd_address -offset 0xF0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM10] [get_bd_addr_segs hbm_0/SAXI_10/HBM_MEM15] -force
    assign_bd_address -offset 0x000100000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM10] [get_bd_addr_segs hbm_0/SAXI_10/HBM_MEM16] -force
    assign_bd_address -offset 0x000110000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM10] [get_bd_addr_segs hbm_0/SAXI_10/HBM_MEM17] -force
    assign_bd_address -offset 0x000120000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM10] [get_bd_addr_segs hbm_0/SAXI_10/HBM_MEM18] -force
    assign_bd_address -offset 0x000130000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM10] [get_bd_addr_segs hbm_0/SAXI_10/HBM_MEM19] -force
    assign_bd_address -offset 0x000140000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM10] [get_bd_addr_segs hbm_0/SAXI_10/HBM_MEM20] -force
    assign_bd_address -offset 0x000150000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM10] [get_bd_addr_segs hbm_0/SAXI_10/HBM_MEM21] -force
    assign_bd_address -offset 0x000160000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM10] [get_bd_addr_segs hbm_0/SAXI_10/HBM_MEM22] -force
    assign_bd_address -offset 0x000170000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM10] [get_bd_addr_segs hbm_0/SAXI_10/HBM_MEM23] -force
    assign_bd_address -offset 0x000180000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM10] [get_bd_addr_segs hbm_0/SAXI_10/HBM_MEM24] -force
    assign_bd_address -offset 0x000190000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM10] [get_bd_addr_segs hbm_0/SAXI_10/HBM_MEM25] -force
    assign_bd_address -offset 0x0001A0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM10] [get_bd_addr_segs hbm_0/SAXI_10/HBM_MEM26] -force
    assign_bd_address -offset 0x0001B0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM10] [get_bd_addr_segs hbm_0/SAXI_10/HBM_MEM27] -force
    assign_bd_address -offset 0x0001C0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM10] [get_bd_addr_segs hbm_0/SAXI_10/HBM_MEM28] -force
    assign_bd_address -offset 0x0001D0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM10] [get_bd_addr_segs hbm_0/SAXI_10/HBM_MEM29] -force
    assign_bd_address -offset 0x0001E0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM10] [get_bd_addr_segs hbm_0/SAXI_10/HBM_MEM30] -force
    assign_bd_address -offset 0x0001F0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM10] [get_bd_addr_segs hbm_0/SAXI_10/HBM_MEM31] -force
    assign_bd_address -offset 0x00000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM11] [get_bd_addr_segs hbm_0/SAXI_11/HBM_MEM00] -force
    assign_bd_address -offset 0x10000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM11] [get_bd_addr_segs hbm_0/SAXI_11/HBM_MEM01] -force
    assign_bd_address -offset 0x20000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM11] [get_bd_addr_segs hbm_0/SAXI_11/HBM_MEM02] -force
    assign_bd_address -offset 0x30000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM11] [get_bd_addr_segs hbm_0/SAXI_11/HBM_MEM03] -force
    assign_bd_address -offset 0x40000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM11] [get_bd_addr_segs hbm_0/SAXI_11/HBM_MEM04] -force
    assign_bd_address -offset 0x50000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM11] [get_bd_addr_segs hbm_0/SAXI_11/HBM_MEM05] -force
    assign_bd_address -offset 0x60000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM11] [get_bd_addr_segs hbm_0/SAXI_11/HBM_MEM06] -force
    assign_bd_address -offset 0x70000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM11] [get_bd_addr_segs hbm_0/SAXI_11/HBM_MEM07] -force
    assign_bd_address -offset 0x80000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM11] [get_bd_addr_segs hbm_0/SAXI_11/HBM_MEM08] -force
    assign_bd_address -offset 0x90000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM11] [get_bd_addr_segs hbm_0/SAXI_11/HBM_MEM09] -force
    assign_bd_address -offset 0xA0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM11] [get_bd_addr_segs hbm_0/SAXI_11/HBM_MEM10] -force
    assign_bd_address -offset 0xB0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM11] [get_bd_addr_segs hbm_0/SAXI_11/HBM_MEM11] -force
    assign_bd_address -offset 0xC0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM11] [get_bd_addr_segs hbm_0/SAXI_11/HBM_MEM12] -force
    assign_bd_address -offset 0xD0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM11] [get_bd_addr_segs hbm_0/SAXI_11/HBM_MEM13] -force
    assign_bd_address -offset 0xE0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM11] [get_bd_addr_segs hbm_0/SAXI_11/HBM_MEM14] -force
    assign_bd_address -offset 0xF0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM11] [get_bd_addr_segs hbm_0/SAXI_11/HBM_MEM15] -force
    assign_bd_address -offset 0x000100000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM11] [get_bd_addr_segs hbm_0/SAXI_11/HBM_MEM16] -force
    assign_bd_address -offset 0x000110000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM11] [get_bd_addr_segs hbm_0/SAXI_11/HBM_MEM17] -force
    assign_bd_address -offset 0x000120000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM11] [get_bd_addr_segs hbm_0/SAXI_11/HBM_MEM18] -force
    assign_bd_address -offset 0x000130000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM11] [get_bd_addr_segs hbm_0/SAXI_11/HBM_MEM19] -force
    assign_bd_address -offset 0x000140000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM11] [get_bd_addr_segs hbm_0/SAXI_11/HBM_MEM20] -force
    assign_bd_address -offset 0x000150000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM11] [get_bd_addr_segs hbm_0/SAXI_11/HBM_MEM21] -force
    assign_bd_address -offset 0x000160000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM11] [get_bd_addr_segs hbm_0/SAXI_11/HBM_MEM22] -force
    assign_bd_address -offset 0x000170000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM11] [get_bd_addr_segs hbm_0/SAXI_11/HBM_MEM23] -force
    assign_bd_address -offset 0x000180000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM11] [get_bd_addr_segs hbm_0/SAXI_11/HBM_MEM24] -force
    assign_bd_address -offset 0x000190000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM11] [get_bd_addr_segs hbm_0/SAXI_11/HBM_MEM25] -force
    assign_bd_address -offset 0x0001A0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM11] [get_bd_addr_segs hbm_0/SAXI_11/HBM_MEM26] -force
    assign_bd_address -offset 0x0001B0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM11] [get_bd_addr_segs hbm_0/SAXI_11/HBM_MEM27] -force
    assign_bd_address -offset 0x0001C0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM11] [get_bd_addr_segs hbm_0/SAXI_11/HBM_MEM28] -force
    assign_bd_address -offset 0x0001D0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM11] [get_bd_addr_segs hbm_0/SAXI_11/HBM_MEM29] -force
    assign_bd_address -offset 0x0001E0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM11] [get_bd_addr_segs hbm_0/SAXI_11/HBM_MEM30] -force
    assign_bd_address -offset 0x0001F0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM11] [get_bd_addr_segs hbm_0/SAXI_11/HBM_MEM31] -force
    assign_bd_address -offset 0x00000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM12] [get_bd_addr_segs hbm_0/SAXI_12/HBM_MEM00] -force
    assign_bd_address -offset 0x10000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM12] [get_bd_addr_segs hbm_0/SAXI_12/HBM_MEM01] -force
    assign_bd_address -offset 0x20000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM12] [get_bd_addr_segs hbm_0/SAXI_12/HBM_MEM02] -force
    assign_bd_address -offset 0x30000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM12] [get_bd_addr_segs hbm_0/SAXI_12/HBM_MEM03] -force
    assign_bd_address -offset 0x40000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM12] [get_bd_addr_segs hbm_0/SAXI_12/HBM_MEM04] -force
    assign_bd_address -offset 0x50000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM12] [get_bd_addr_segs hbm_0/SAXI_12/HBM_MEM05] -force
    assign_bd_address -offset 0x60000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM12] [get_bd_addr_segs hbm_0/SAXI_12/HBM_MEM06] -force
    assign_bd_address -offset 0x70000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM12] [get_bd_addr_segs hbm_0/SAXI_12/HBM_MEM07] -force
    assign_bd_address -offset 0x80000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM12] [get_bd_addr_segs hbm_0/SAXI_12/HBM_MEM08] -force
    assign_bd_address -offset 0x90000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM12] [get_bd_addr_segs hbm_0/SAXI_12/HBM_MEM09] -force
    assign_bd_address -offset 0xA0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM12] [get_bd_addr_segs hbm_0/SAXI_12/HBM_MEM10] -force
    assign_bd_address -offset 0xB0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM12] [get_bd_addr_segs hbm_0/SAXI_12/HBM_MEM11] -force
    assign_bd_address -offset 0xC0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM12] [get_bd_addr_segs hbm_0/SAXI_12/HBM_MEM12] -force
    assign_bd_address -offset 0xD0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM12] [get_bd_addr_segs hbm_0/SAXI_12/HBM_MEM13] -force
    assign_bd_address -offset 0xE0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM12] [get_bd_addr_segs hbm_0/SAXI_12/HBM_MEM14] -force
    assign_bd_address -offset 0xF0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM12] [get_bd_addr_segs hbm_0/SAXI_12/HBM_MEM15] -force
    assign_bd_address -offset 0x000100000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM12] [get_bd_addr_segs hbm_0/SAXI_12/HBM_MEM16] -force
    assign_bd_address -offset 0x000110000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM12] [get_bd_addr_segs hbm_0/SAXI_12/HBM_MEM17] -force
    assign_bd_address -offset 0x000120000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM12] [get_bd_addr_segs hbm_0/SAXI_12/HBM_MEM18] -force
    assign_bd_address -offset 0x000130000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM12] [get_bd_addr_segs hbm_0/SAXI_12/HBM_MEM19] -force
    assign_bd_address -offset 0x000140000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM12] [get_bd_addr_segs hbm_0/SAXI_12/HBM_MEM20] -force
    assign_bd_address -offset 0x000150000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM12] [get_bd_addr_segs hbm_0/SAXI_12/HBM_MEM21] -force
    assign_bd_address -offset 0x000160000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM12] [get_bd_addr_segs hbm_0/SAXI_12/HBM_MEM22] -force
    assign_bd_address -offset 0x000170000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM12] [get_bd_addr_segs hbm_0/SAXI_12/HBM_MEM23] -force
    assign_bd_address -offset 0x000180000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM12] [get_bd_addr_segs hbm_0/SAXI_12/HBM_MEM24] -force
    assign_bd_address -offset 0x000190000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM12] [get_bd_addr_segs hbm_0/SAXI_12/HBM_MEM25] -force
    assign_bd_address -offset 0x0001A0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM12] [get_bd_addr_segs hbm_0/SAXI_12/HBM_MEM26] -force
    assign_bd_address -offset 0x0001B0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM12] [get_bd_addr_segs hbm_0/SAXI_12/HBM_MEM27] -force
    assign_bd_address -offset 0x0001C0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM12] [get_bd_addr_segs hbm_0/SAXI_12/HBM_MEM28] -force
    assign_bd_address -offset 0x0001D0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM12] [get_bd_addr_segs hbm_0/SAXI_12/HBM_MEM29] -force
    assign_bd_address -offset 0x0001E0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM12] [get_bd_addr_segs hbm_0/SAXI_12/HBM_MEM30] -force
    assign_bd_address -offset 0x0001F0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM12] [get_bd_addr_segs hbm_0/SAXI_12/HBM_MEM31] -force
    assign_bd_address -offset 0x00000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM13] [get_bd_addr_segs hbm_0/SAXI_13/HBM_MEM00] -force
    assign_bd_address -offset 0x10000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM13] [get_bd_addr_segs hbm_0/SAXI_13/HBM_MEM01] -force
    assign_bd_address -offset 0x20000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM13] [get_bd_addr_segs hbm_0/SAXI_13/HBM_MEM02] -force
    assign_bd_address -offset 0x30000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM13] [get_bd_addr_segs hbm_0/SAXI_13/HBM_MEM03] -force
    assign_bd_address -offset 0x40000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM13] [get_bd_addr_segs hbm_0/SAXI_13/HBM_MEM04] -force
    assign_bd_address -offset 0x50000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM13] [get_bd_addr_segs hbm_0/SAXI_13/HBM_MEM05] -force
    assign_bd_address -offset 0x60000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM13] [get_bd_addr_segs hbm_0/SAXI_13/HBM_MEM06] -force
    assign_bd_address -offset 0x70000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM13] [get_bd_addr_segs hbm_0/SAXI_13/HBM_MEM07] -force
    assign_bd_address -offset 0x80000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM13] [get_bd_addr_segs hbm_0/SAXI_13/HBM_MEM08] -force
    assign_bd_address -offset 0x90000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM13] [get_bd_addr_segs hbm_0/SAXI_13/HBM_MEM09] -force
    assign_bd_address -offset 0xA0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM13] [get_bd_addr_segs hbm_0/SAXI_13/HBM_MEM10] -force
    assign_bd_address -offset 0xB0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM13] [get_bd_addr_segs hbm_0/SAXI_13/HBM_MEM11] -force
    assign_bd_address -offset 0xC0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM13] [get_bd_addr_segs hbm_0/SAXI_13/HBM_MEM12] -force
    assign_bd_address -offset 0xD0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM13] [get_bd_addr_segs hbm_0/SAXI_13/HBM_MEM13] -force
    assign_bd_address -offset 0xE0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM13] [get_bd_addr_segs hbm_0/SAXI_13/HBM_MEM14] -force
    assign_bd_address -offset 0xF0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM13] [get_bd_addr_segs hbm_0/SAXI_13/HBM_MEM15] -force
    assign_bd_address -offset 0x000100000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM13] [get_bd_addr_segs hbm_0/SAXI_13/HBM_MEM16] -force
    assign_bd_address -offset 0x000110000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM13] [get_bd_addr_segs hbm_0/SAXI_13/HBM_MEM17] -force
    assign_bd_address -offset 0x000120000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM13] [get_bd_addr_segs hbm_0/SAXI_13/HBM_MEM18] -force
    assign_bd_address -offset 0x000130000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM13] [get_bd_addr_segs hbm_0/SAXI_13/HBM_MEM19] -force
    assign_bd_address -offset 0x000140000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM13] [get_bd_addr_segs hbm_0/SAXI_13/HBM_MEM20] -force
    assign_bd_address -offset 0x000150000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM13] [get_bd_addr_segs hbm_0/SAXI_13/HBM_MEM21] -force
    assign_bd_address -offset 0x000160000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM13] [get_bd_addr_segs hbm_0/SAXI_13/HBM_MEM22] -force
    assign_bd_address -offset 0x000170000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM13] [get_bd_addr_segs hbm_0/SAXI_13/HBM_MEM23] -force
    assign_bd_address -offset 0x000180000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM13] [get_bd_addr_segs hbm_0/SAXI_13/HBM_MEM24] -force
    assign_bd_address -offset 0x000190000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM13] [get_bd_addr_segs hbm_0/SAXI_13/HBM_MEM25] -force
    assign_bd_address -offset 0x0001A0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM13] [get_bd_addr_segs hbm_0/SAXI_13/HBM_MEM26] -force
    assign_bd_address -offset 0x0001B0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM13] [get_bd_addr_segs hbm_0/SAXI_13/HBM_MEM27] -force
    assign_bd_address -offset 0x0001C0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM13] [get_bd_addr_segs hbm_0/SAXI_13/HBM_MEM28] -force
    assign_bd_address -offset 0x0001D0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM13] [get_bd_addr_segs hbm_0/SAXI_13/HBM_MEM29] -force
    assign_bd_address -offset 0x0001E0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM13] [get_bd_addr_segs hbm_0/SAXI_13/HBM_MEM30] -force
    assign_bd_address -offset 0x0001F0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM13] [get_bd_addr_segs hbm_0/SAXI_13/HBM_MEM31] -force
    assign_bd_address -offset 0x00000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM14] [get_bd_addr_segs hbm_0/SAXI_14/HBM_MEM00] -force
    assign_bd_address -offset 0x10000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM14] [get_bd_addr_segs hbm_0/SAXI_14/HBM_MEM01] -force
    assign_bd_address -offset 0x20000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM14] [get_bd_addr_segs hbm_0/SAXI_14/HBM_MEM02] -force
    assign_bd_address -offset 0x30000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM14] [get_bd_addr_segs hbm_0/SAXI_14/HBM_MEM03] -force
    assign_bd_address -offset 0x40000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM14] [get_bd_addr_segs hbm_0/SAXI_14/HBM_MEM04] -force
    assign_bd_address -offset 0x50000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM14] [get_bd_addr_segs hbm_0/SAXI_14/HBM_MEM05] -force
    assign_bd_address -offset 0x60000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM14] [get_bd_addr_segs hbm_0/SAXI_14/HBM_MEM06] -force
    assign_bd_address -offset 0x70000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM14] [get_bd_addr_segs hbm_0/SAXI_14/HBM_MEM07] -force
    assign_bd_address -offset 0x80000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM14] [get_bd_addr_segs hbm_0/SAXI_14/HBM_MEM08] -force
    assign_bd_address -offset 0x90000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM14] [get_bd_addr_segs hbm_0/SAXI_14/HBM_MEM09] -force
    assign_bd_address -offset 0xA0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM14] [get_bd_addr_segs hbm_0/SAXI_14/HBM_MEM10] -force
    assign_bd_address -offset 0xB0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM14] [get_bd_addr_segs hbm_0/SAXI_14/HBM_MEM11] -force
    assign_bd_address -offset 0xC0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM14] [get_bd_addr_segs hbm_0/SAXI_14/HBM_MEM12] -force
    assign_bd_address -offset 0xD0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM14] [get_bd_addr_segs hbm_0/SAXI_14/HBM_MEM13] -force
    assign_bd_address -offset 0xE0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM14] [get_bd_addr_segs hbm_0/SAXI_14/HBM_MEM14] -force
    assign_bd_address -offset 0xF0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM14] [get_bd_addr_segs hbm_0/SAXI_14/HBM_MEM15] -force
    assign_bd_address -offset 0x000100000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM14] [get_bd_addr_segs hbm_0/SAXI_14/HBM_MEM16] -force
    assign_bd_address -offset 0x000110000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM14] [get_bd_addr_segs hbm_0/SAXI_14/HBM_MEM17] -force
    assign_bd_address -offset 0x000120000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM14] [get_bd_addr_segs hbm_0/SAXI_14/HBM_MEM18] -force
    assign_bd_address -offset 0x000130000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM14] [get_bd_addr_segs hbm_0/SAXI_14/HBM_MEM19] -force
    assign_bd_address -offset 0x000140000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM14] [get_bd_addr_segs hbm_0/SAXI_14/HBM_MEM20] -force
    assign_bd_address -offset 0x000150000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM14] [get_bd_addr_segs hbm_0/SAXI_14/HBM_MEM21] -force
    assign_bd_address -offset 0x000160000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM14] [get_bd_addr_segs hbm_0/SAXI_14/HBM_MEM22] -force
    assign_bd_address -offset 0x000170000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM14] [get_bd_addr_segs hbm_0/SAXI_14/HBM_MEM23] -force
    assign_bd_address -offset 0x000180000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM14] [get_bd_addr_segs hbm_0/SAXI_14/HBM_MEM24] -force
    assign_bd_address -offset 0x000190000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM14] [get_bd_addr_segs hbm_0/SAXI_14/HBM_MEM25] -force
    assign_bd_address -offset 0x0001A0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM14] [get_bd_addr_segs hbm_0/SAXI_14/HBM_MEM26] -force
    assign_bd_address -offset 0x0001B0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM14] [get_bd_addr_segs hbm_0/SAXI_14/HBM_MEM27] -force
    assign_bd_address -offset 0x0001C0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM14] [get_bd_addr_segs hbm_0/SAXI_14/HBM_MEM28] -force
    assign_bd_address -offset 0x0001D0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM14] [get_bd_addr_segs hbm_0/SAXI_14/HBM_MEM29] -force
    assign_bd_address -offset 0x0001E0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM14] [get_bd_addr_segs hbm_0/SAXI_14/HBM_MEM30] -force
    assign_bd_address -offset 0x0001F0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM14] [get_bd_addr_segs hbm_0/SAXI_14/HBM_MEM31] -force
    assign_bd_address -offset 0x00000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM15] [get_bd_addr_segs hbm_0/SAXI_15/HBM_MEM00] -force
    assign_bd_address -offset 0x10000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM15] [get_bd_addr_segs hbm_0/SAXI_15/HBM_MEM01] -force
    assign_bd_address -offset 0x20000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM15] [get_bd_addr_segs hbm_0/SAXI_15/HBM_MEM02] -force
    assign_bd_address -offset 0x30000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM15] [get_bd_addr_segs hbm_0/SAXI_15/HBM_MEM03] -force
    assign_bd_address -offset 0x40000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM15] [get_bd_addr_segs hbm_0/SAXI_15/HBM_MEM04] -force
    assign_bd_address -offset 0x50000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM15] [get_bd_addr_segs hbm_0/SAXI_15/HBM_MEM05] -force
    assign_bd_address -offset 0x60000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM15] [get_bd_addr_segs hbm_0/SAXI_15/HBM_MEM06] -force
    assign_bd_address -offset 0x70000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM15] [get_bd_addr_segs hbm_0/SAXI_15/HBM_MEM07] -force
    assign_bd_address -offset 0x80000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM15] [get_bd_addr_segs hbm_0/SAXI_15/HBM_MEM08] -force
    assign_bd_address -offset 0x90000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM15] [get_bd_addr_segs hbm_0/SAXI_15/HBM_MEM09] -force
    assign_bd_address -offset 0xA0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM15] [get_bd_addr_segs hbm_0/SAXI_15/HBM_MEM10] -force
    assign_bd_address -offset 0xB0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM15] [get_bd_addr_segs hbm_0/SAXI_15/HBM_MEM11] -force
    assign_bd_address -offset 0xC0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM15] [get_bd_addr_segs hbm_0/SAXI_15/HBM_MEM12] -force
    assign_bd_address -offset 0xD0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM15] [get_bd_addr_segs hbm_0/SAXI_15/HBM_MEM13] -force
    assign_bd_address -offset 0xE0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM15] [get_bd_addr_segs hbm_0/SAXI_15/HBM_MEM14] -force
    assign_bd_address -offset 0xF0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM15] [get_bd_addr_segs hbm_0/SAXI_15/HBM_MEM15] -force
    assign_bd_address -offset 0x000100000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM15] [get_bd_addr_segs hbm_0/SAXI_15/HBM_MEM16] -force
    assign_bd_address -offset 0x000110000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM15] [get_bd_addr_segs hbm_0/SAXI_15/HBM_MEM17] -force
    assign_bd_address -offset 0x000120000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM15] [get_bd_addr_segs hbm_0/SAXI_15/HBM_MEM18] -force
    assign_bd_address -offset 0x000130000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM15] [get_bd_addr_segs hbm_0/SAXI_15/HBM_MEM19] -force
    assign_bd_address -offset 0x000140000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM15] [get_bd_addr_segs hbm_0/SAXI_15/HBM_MEM20] -force
    assign_bd_address -offset 0x000150000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM15] [get_bd_addr_segs hbm_0/SAXI_15/HBM_MEM21] -force
    assign_bd_address -offset 0x000160000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM15] [get_bd_addr_segs hbm_0/SAXI_15/HBM_MEM22] -force
    assign_bd_address -offset 0x000170000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM15] [get_bd_addr_segs hbm_0/SAXI_15/HBM_MEM23] -force
    assign_bd_address -offset 0x000180000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM15] [get_bd_addr_segs hbm_0/SAXI_15/HBM_MEM24] -force
    assign_bd_address -offset 0x000190000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM15] [get_bd_addr_segs hbm_0/SAXI_15/HBM_MEM25] -force
    assign_bd_address -offset 0x0001A0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM15] [get_bd_addr_segs hbm_0/SAXI_15/HBM_MEM26] -force
    assign_bd_address -offset 0x0001B0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM15] [get_bd_addr_segs hbm_0/SAXI_15/HBM_MEM27] -force
    assign_bd_address -offset 0x0001C0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM15] [get_bd_addr_segs hbm_0/SAXI_15/HBM_MEM28] -force
    assign_bd_address -offset 0x0001D0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM15] [get_bd_addr_segs hbm_0/SAXI_15/HBM_MEM29] -force
    assign_bd_address -offset 0x0001E0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM15] [get_bd_addr_segs hbm_0/SAXI_15/HBM_MEM30] -force
    assign_bd_address -offset 0x0001F0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM15] [get_bd_addr_segs hbm_0/SAXI_15/HBM_MEM31] -force
    assign_bd_address -offset 0x00000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM16] [get_bd_addr_segs hbm_0/SAXI_16/HBM_MEM00] -force
    assign_bd_address -offset 0x10000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM16] [get_bd_addr_segs hbm_0/SAXI_16/HBM_MEM01] -force
    assign_bd_address -offset 0x20000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM16] [get_bd_addr_segs hbm_0/SAXI_16/HBM_MEM02] -force
    assign_bd_address -offset 0x30000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM16] [get_bd_addr_segs hbm_0/SAXI_16/HBM_MEM03] -force
    assign_bd_address -offset 0x40000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM16] [get_bd_addr_segs hbm_0/SAXI_16/HBM_MEM04] -force
    assign_bd_address -offset 0x50000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM16] [get_bd_addr_segs hbm_0/SAXI_16/HBM_MEM05] -force
    assign_bd_address -offset 0x60000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM16] [get_bd_addr_segs hbm_0/SAXI_16/HBM_MEM06] -force
    assign_bd_address -offset 0x70000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM16] [get_bd_addr_segs hbm_0/SAXI_16/HBM_MEM07] -force
    assign_bd_address -offset 0x80000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM16] [get_bd_addr_segs hbm_0/SAXI_16/HBM_MEM08] -force
    assign_bd_address -offset 0x90000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM16] [get_bd_addr_segs hbm_0/SAXI_16/HBM_MEM09] -force
    assign_bd_address -offset 0xA0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM16] [get_bd_addr_segs hbm_0/SAXI_16/HBM_MEM10] -force
    assign_bd_address -offset 0xB0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM16] [get_bd_addr_segs hbm_0/SAXI_16/HBM_MEM11] -force
    assign_bd_address -offset 0xC0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM16] [get_bd_addr_segs hbm_0/SAXI_16/HBM_MEM12] -force
    assign_bd_address -offset 0xD0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM16] [get_bd_addr_segs hbm_0/SAXI_16/HBM_MEM13] -force
    assign_bd_address -offset 0xE0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM16] [get_bd_addr_segs hbm_0/SAXI_16/HBM_MEM14] -force
    assign_bd_address -offset 0xF0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM16] [get_bd_addr_segs hbm_0/SAXI_16/HBM_MEM15] -force
    assign_bd_address -offset 0x000100000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM16] [get_bd_addr_segs hbm_0/SAXI_16/HBM_MEM16] -force
    assign_bd_address -offset 0x000110000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM16] [get_bd_addr_segs hbm_0/SAXI_16/HBM_MEM17] -force
    assign_bd_address -offset 0x000120000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM16] [get_bd_addr_segs hbm_0/SAXI_16/HBM_MEM18] -force
    assign_bd_address -offset 0x000130000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM16] [get_bd_addr_segs hbm_0/SAXI_16/HBM_MEM19] -force
    assign_bd_address -offset 0x000140000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM16] [get_bd_addr_segs hbm_0/SAXI_16/HBM_MEM20] -force
    assign_bd_address -offset 0x000150000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM16] [get_bd_addr_segs hbm_0/SAXI_16/HBM_MEM21] -force
    assign_bd_address -offset 0x000160000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM16] [get_bd_addr_segs hbm_0/SAXI_16/HBM_MEM22] -force
    assign_bd_address -offset 0x000170000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM16] [get_bd_addr_segs hbm_0/SAXI_16/HBM_MEM23] -force
    assign_bd_address -offset 0x000180000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM16] [get_bd_addr_segs hbm_0/SAXI_16/HBM_MEM24] -force
    assign_bd_address -offset 0x000190000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM16] [get_bd_addr_segs hbm_0/SAXI_16/HBM_MEM25] -force
    assign_bd_address -offset 0x0001A0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM16] [get_bd_addr_segs hbm_0/SAXI_16/HBM_MEM26] -force
    assign_bd_address -offset 0x0001B0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM16] [get_bd_addr_segs hbm_0/SAXI_16/HBM_MEM27] -force
    assign_bd_address -offset 0x0001C0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM16] [get_bd_addr_segs hbm_0/SAXI_16/HBM_MEM28] -force
    assign_bd_address -offset 0x0001D0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM16] [get_bd_addr_segs hbm_0/SAXI_16/HBM_MEM29] -force
    assign_bd_address -offset 0x0001E0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM16] [get_bd_addr_segs hbm_0/SAXI_16/HBM_MEM30] -force
    assign_bd_address -offset 0x0001F0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM16] [get_bd_addr_segs hbm_0/SAXI_16/HBM_MEM31] -force
    assign_bd_address -offset 0x00000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM17] [get_bd_addr_segs hbm_0/SAXI_17/HBM_MEM00] -force
    assign_bd_address -offset 0x10000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM17] [get_bd_addr_segs hbm_0/SAXI_17/HBM_MEM01] -force
    assign_bd_address -offset 0x20000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM17] [get_bd_addr_segs hbm_0/SAXI_17/HBM_MEM02] -force
    assign_bd_address -offset 0x30000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM17] [get_bd_addr_segs hbm_0/SAXI_17/HBM_MEM03] -force
    assign_bd_address -offset 0x40000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM17] [get_bd_addr_segs hbm_0/SAXI_17/HBM_MEM04] -force
    assign_bd_address -offset 0x50000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM17] [get_bd_addr_segs hbm_0/SAXI_17/HBM_MEM05] -force
    assign_bd_address -offset 0x60000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM17] [get_bd_addr_segs hbm_0/SAXI_17/HBM_MEM06] -force
    assign_bd_address -offset 0x70000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM17] [get_bd_addr_segs hbm_0/SAXI_17/HBM_MEM07] -force
    assign_bd_address -offset 0x80000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM17] [get_bd_addr_segs hbm_0/SAXI_17/HBM_MEM08] -force
    assign_bd_address -offset 0x90000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM17] [get_bd_addr_segs hbm_0/SAXI_17/HBM_MEM09] -force
    assign_bd_address -offset 0xA0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM17] [get_bd_addr_segs hbm_0/SAXI_17/HBM_MEM10] -force
    assign_bd_address -offset 0xB0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM17] [get_bd_addr_segs hbm_0/SAXI_17/HBM_MEM11] -force
    assign_bd_address -offset 0xC0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM17] [get_bd_addr_segs hbm_0/SAXI_17/HBM_MEM12] -force
    assign_bd_address -offset 0xD0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM17] [get_bd_addr_segs hbm_0/SAXI_17/HBM_MEM13] -force
    assign_bd_address -offset 0xE0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM17] [get_bd_addr_segs hbm_0/SAXI_17/HBM_MEM14] -force
    assign_bd_address -offset 0xF0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM17] [get_bd_addr_segs hbm_0/SAXI_17/HBM_MEM15] -force
    assign_bd_address -offset 0x000100000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM17] [get_bd_addr_segs hbm_0/SAXI_17/HBM_MEM16] -force
    assign_bd_address -offset 0x000110000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM17] [get_bd_addr_segs hbm_0/SAXI_17/HBM_MEM17] -force
    assign_bd_address -offset 0x000120000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM17] [get_bd_addr_segs hbm_0/SAXI_17/HBM_MEM18] -force
    assign_bd_address -offset 0x000130000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM17] [get_bd_addr_segs hbm_0/SAXI_17/HBM_MEM19] -force
    assign_bd_address -offset 0x000140000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM17] [get_bd_addr_segs hbm_0/SAXI_17/HBM_MEM20] -force
    assign_bd_address -offset 0x000150000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM17] [get_bd_addr_segs hbm_0/SAXI_17/HBM_MEM21] -force
    assign_bd_address -offset 0x000160000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM17] [get_bd_addr_segs hbm_0/SAXI_17/HBM_MEM22] -force
    assign_bd_address -offset 0x000170000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM17] [get_bd_addr_segs hbm_0/SAXI_17/HBM_MEM23] -force
    assign_bd_address -offset 0x000180000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM17] [get_bd_addr_segs hbm_0/SAXI_17/HBM_MEM24] -force
    assign_bd_address -offset 0x000190000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM17] [get_bd_addr_segs hbm_0/SAXI_17/HBM_MEM25] -force
    assign_bd_address -offset 0x0001A0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM17] [get_bd_addr_segs hbm_0/SAXI_17/HBM_MEM26] -force
    assign_bd_address -offset 0x0001B0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM17] [get_bd_addr_segs hbm_0/SAXI_17/HBM_MEM27] -force
    assign_bd_address -offset 0x0001C0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM17] [get_bd_addr_segs hbm_0/SAXI_17/HBM_MEM28] -force
    assign_bd_address -offset 0x0001D0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM17] [get_bd_addr_segs hbm_0/SAXI_17/HBM_MEM29] -force
    assign_bd_address -offset 0x0001E0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM17] [get_bd_addr_segs hbm_0/SAXI_17/HBM_MEM30] -force
    assign_bd_address -offset 0x0001F0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM17] [get_bd_addr_segs hbm_0/SAXI_17/HBM_MEM31] -force
    assign_bd_address -offset 0x00000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM18] [get_bd_addr_segs hbm_0/SAXI_18/HBM_MEM00] -force
    assign_bd_address -offset 0x10000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM18] [get_bd_addr_segs hbm_0/SAXI_18/HBM_MEM01] -force
    assign_bd_address -offset 0x20000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM18] [get_bd_addr_segs hbm_0/SAXI_18/HBM_MEM02] -force
    assign_bd_address -offset 0x30000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM18] [get_bd_addr_segs hbm_0/SAXI_18/HBM_MEM03] -force
    assign_bd_address -offset 0x40000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM18] [get_bd_addr_segs hbm_0/SAXI_18/HBM_MEM04] -force
    assign_bd_address -offset 0x50000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM18] [get_bd_addr_segs hbm_0/SAXI_18/HBM_MEM05] -force
    assign_bd_address -offset 0x60000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM18] [get_bd_addr_segs hbm_0/SAXI_18/HBM_MEM06] -force
    assign_bd_address -offset 0x70000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM18] [get_bd_addr_segs hbm_0/SAXI_18/HBM_MEM07] -force
    assign_bd_address -offset 0x80000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM18] [get_bd_addr_segs hbm_0/SAXI_18/HBM_MEM08] -force
    assign_bd_address -offset 0x90000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM18] [get_bd_addr_segs hbm_0/SAXI_18/HBM_MEM09] -force
    assign_bd_address -offset 0xA0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM18] [get_bd_addr_segs hbm_0/SAXI_18/HBM_MEM10] -force
    assign_bd_address -offset 0xB0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM18] [get_bd_addr_segs hbm_0/SAXI_18/HBM_MEM11] -force
    assign_bd_address -offset 0xC0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM18] [get_bd_addr_segs hbm_0/SAXI_18/HBM_MEM12] -force
    assign_bd_address -offset 0xD0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM18] [get_bd_addr_segs hbm_0/SAXI_18/HBM_MEM13] -force
    assign_bd_address -offset 0xE0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM18] [get_bd_addr_segs hbm_0/SAXI_18/HBM_MEM14] -force
    assign_bd_address -offset 0xF0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM18] [get_bd_addr_segs hbm_0/SAXI_18/HBM_MEM15] -force
    assign_bd_address -offset 0x000100000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM18] [get_bd_addr_segs hbm_0/SAXI_18/HBM_MEM16] -force
    assign_bd_address -offset 0x000110000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM18] [get_bd_addr_segs hbm_0/SAXI_18/HBM_MEM17] -force
    assign_bd_address -offset 0x000120000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM18] [get_bd_addr_segs hbm_0/SAXI_18/HBM_MEM18] -force
    assign_bd_address -offset 0x000130000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM18] [get_bd_addr_segs hbm_0/SAXI_18/HBM_MEM19] -force
    assign_bd_address -offset 0x000140000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM18] [get_bd_addr_segs hbm_0/SAXI_18/HBM_MEM20] -force
    assign_bd_address -offset 0x000150000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM18] [get_bd_addr_segs hbm_0/SAXI_18/HBM_MEM21] -force
    assign_bd_address -offset 0x000160000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM18] [get_bd_addr_segs hbm_0/SAXI_18/HBM_MEM22] -force
    assign_bd_address -offset 0x000170000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM18] [get_bd_addr_segs hbm_0/SAXI_18/HBM_MEM23] -force
    assign_bd_address -offset 0x000180000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM18] [get_bd_addr_segs hbm_0/SAXI_18/HBM_MEM24] -force
    assign_bd_address -offset 0x000190000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM18] [get_bd_addr_segs hbm_0/SAXI_18/HBM_MEM25] -force
    assign_bd_address -offset 0x0001A0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM18] [get_bd_addr_segs hbm_0/SAXI_18/HBM_MEM26] -force
    assign_bd_address -offset 0x0001B0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM18] [get_bd_addr_segs hbm_0/SAXI_18/HBM_MEM27] -force
    assign_bd_address -offset 0x0001C0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM18] [get_bd_addr_segs hbm_0/SAXI_18/HBM_MEM28] -force
    assign_bd_address -offset 0x0001D0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM18] [get_bd_addr_segs hbm_0/SAXI_18/HBM_MEM29] -force
    assign_bd_address -offset 0x0001E0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM18] [get_bd_addr_segs hbm_0/SAXI_18/HBM_MEM30] -force
    assign_bd_address -offset 0x0001F0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM18] [get_bd_addr_segs hbm_0/SAXI_18/HBM_MEM31] -force
    assign_bd_address -offset 0x00000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM19] [get_bd_addr_segs hbm_0/SAXI_19/HBM_MEM00] -force
    assign_bd_address -offset 0x10000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM19] [get_bd_addr_segs hbm_0/SAXI_19/HBM_MEM01] -force
    assign_bd_address -offset 0x20000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM19] [get_bd_addr_segs hbm_0/SAXI_19/HBM_MEM02] -force
    assign_bd_address -offset 0x30000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM19] [get_bd_addr_segs hbm_0/SAXI_19/HBM_MEM03] -force
    assign_bd_address -offset 0x40000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM19] [get_bd_addr_segs hbm_0/SAXI_19/HBM_MEM04] -force
    assign_bd_address -offset 0x50000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM19] [get_bd_addr_segs hbm_0/SAXI_19/HBM_MEM05] -force
    assign_bd_address -offset 0x60000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM19] [get_bd_addr_segs hbm_0/SAXI_19/HBM_MEM06] -force
    assign_bd_address -offset 0x70000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM19] [get_bd_addr_segs hbm_0/SAXI_19/HBM_MEM07] -force
    assign_bd_address -offset 0x80000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM19] [get_bd_addr_segs hbm_0/SAXI_19/HBM_MEM08] -force
    assign_bd_address -offset 0x90000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM19] [get_bd_addr_segs hbm_0/SAXI_19/HBM_MEM09] -force
    assign_bd_address -offset 0xA0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM19] [get_bd_addr_segs hbm_0/SAXI_19/HBM_MEM10] -force
    assign_bd_address -offset 0xB0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM19] [get_bd_addr_segs hbm_0/SAXI_19/HBM_MEM11] -force
    assign_bd_address -offset 0xC0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM19] [get_bd_addr_segs hbm_0/SAXI_19/HBM_MEM12] -force
    assign_bd_address -offset 0xD0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM19] [get_bd_addr_segs hbm_0/SAXI_19/HBM_MEM13] -force
    assign_bd_address -offset 0xE0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM19] [get_bd_addr_segs hbm_0/SAXI_19/HBM_MEM14] -force
    assign_bd_address -offset 0xF0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM19] [get_bd_addr_segs hbm_0/SAXI_19/HBM_MEM15] -force
    assign_bd_address -offset 0x000100000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM19] [get_bd_addr_segs hbm_0/SAXI_19/HBM_MEM16] -force
    assign_bd_address -offset 0x000110000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM19] [get_bd_addr_segs hbm_0/SAXI_19/HBM_MEM17] -force
    assign_bd_address -offset 0x000120000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM19] [get_bd_addr_segs hbm_0/SAXI_19/HBM_MEM18] -force
    assign_bd_address -offset 0x000130000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM19] [get_bd_addr_segs hbm_0/SAXI_19/HBM_MEM19] -force
    assign_bd_address -offset 0x000140000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM19] [get_bd_addr_segs hbm_0/SAXI_19/HBM_MEM20] -force
    assign_bd_address -offset 0x000150000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM19] [get_bd_addr_segs hbm_0/SAXI_19/HBM_MEM21] -force
    assign_bd_address -offset 0x000160000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM19] [get_bd_addr_segs hbm_0/SAXI_19/HBM_MEM22] -force
    assign_bd_address -offset 0x000170000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM19] [get_bd_addr_segs hbm_0/SAXI_19/HBM_MEM23] -force
    assign_bd_address -offset 0x000180000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM19] [get_bd_addr_segs hbm_0/SAXI_19/HBM_MEM24] -force
    assign_bd_address -offset 0x000190000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM19] [get_bd_addr_segs hbm_0/SAXI_19/HBM_MEM25] -force
    assign_bd_address -offset 0x0001A0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM19] [get_bd_addr_segs hbm_0/SAXI_19/HBM_MEM26] -force
    assign_bd_address -offset 0x0001B0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM19] [get_bd_addr_segs hbm_0/SAXI_19/HBM_MEM27] -force
    assign_bd_address -offset 0x0001C0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM19] [get_bd_addr_segs hbm_0/SAXI_19/HBM_MEM28] -force
    assign_bd_address -offset 0x0001D0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM19] [get_bd_addr_segs hbm_0/SAXI_19/HBM_MEM29] -force
    assign_bd_address -offset 0x0001E0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM19] [get_bd_addr_segs hbm_0/SAXI_19/HBM_MEM30] -force
    assign_bd_address -offset 0x0001F0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM19] [get_bd_addr_segs hbm_0/SAXI_19/HBM_MEM31] -force
    assign_bd_address -offset 0x00000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM20] [get_bd_addr_segs hbm_0/SAXI_20/HBM_MEM00] -force
    assign_bd_address -offset 0x10000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM20] [get_bd_addr_segs hbm_0/SAXI_20/HBM_MEM01] -force
    assign_bd_address -offset 0x20000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM20] [get_bd_addr_segs hbm_0/SAXI_20/HBM_MEM02] -force
    assign_bd_address -offset 0x30000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM20] [get_bd_addr_segs hbm_0/SAXI_20/HBM_MEM03] -force
    assign_bd_address -offset 0x40000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM20] [get_bd_addr_segs hbm_0/SAXI_20/HBM_MEM04] -force
    assign_bd_address -offset 0x50000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM20] [get_bd_addr_segs hbm_0/SAXI_20/HBM_MEM05] -force
    assign_bd_address -offset 0x60000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM20] [get_bd_addr_segs hbm_0/SAXI_20/HBM_MEM06] -force
    assign_bd_address -offset 0x70000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM20] [get_bd_addr_segs hbm_0/SAXI_20/HBM_MEM07] -force
    assign_bd_address -offset 0x80000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM20] [get_bd_addr_segs hbm_0/SAXI_20/HBM_MEM08] -force
    assign_bd_address -offset 0x90000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM20] [get_bd_addr_segs hbm_0/SAXI_20/HBM_MEM09] -force
    assign_bd_address -offset 0xA0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM20] [get_bd_addr_segs hbm_0/SAXI_20/HBM_MEM10] -force
    assign_bd_address -offset 0xB0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM20] [get_bd_addr_segs hbm_0/SAXI_20/HBM_MEM11] -force
    assign_bd_address -offset 0xC0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM20] [get_bd_addr_segs hbm_0/SAXI_20/HBM_MEM12] -force
    assign_bd_address -offset 0xD0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM20] [get_bd_addr_segs hbm_0/SAXI_20/HBM_MEM13] -force
    assign_bd_address -offset 0xE0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM20] [get_bd_addr_segs hbm_0/SAXI_20/HBM_MEM14] -force
    assign_bd_address -offset 0xF0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM20] [get_bd_addr_segs hbm_0/SAXI_20/HBM_MEM15] -force
    assign_bd_address -offset 0x000100000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM20] [get_bd_addr_segs hbm_0/SAXI_20/HBM_MEM16] -force
    assign_bd_address -offset 0x000110000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM20] [get_bd_addr_segs hbm_0/SAXI_20/HBM_MEM17] -force
    assign_bd_address -offset 0x000120000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM20] [get_bd_addr_segs hbm_0/SAXI_20/HBM_MEM18] -force
    assign_bd_address -offset 0x000130000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM20] [get_bd_addr_segs hbm_0/SAXI_20/HBM_MEM19] -force
    assign_bd_address -offset 0x000140000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM20] [get_bd_addr_segs hbm_0/SAXI_20/HBM_MEM20] -force
    assign_bd_address -offset 0x000150000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM20] [get_bd_addr_segs hbm_0/SAXI_20/HBM_MEM21] -force
    assign_bd_address -offset 0x000160000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM20] [get_bd_addr_segs hbm_0/SAXI_20/HBM_MEM22] -force
    assign_bd_address -offset 0x000170000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM20] [get_bd_addr_segs hbm_0/SAXI_20/HBM_MEM23] -force
    assign_bd_address -offset 0x000180000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM20] [get_bd_addr_segs hbm_0/SAXI_20/HBM_MEM24] -force
    assign_bd_address -offset 0x000190000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM20] [get_bd_addr_segs hbm_0/SAXI_20/HBM_MEM25] -force
    assign_bd_address -offset 0x0001A0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM20] [get_bd_addr_segs hbm_0/SAXI_20/HBM_MEM26] -force
    assign_bd_address -offset 0x0001B0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM20] [get_bd_addr_segs hbm_0/SAXI_20/HBM_MEM27] -force
    assign_bd_address -offset 0x0001C0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM20] [get_bd_addr_segs hbm_0/SAXI_20/HBM_MEM28] -force
    assign_bd_address -offset 0x0001D0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM20] [get_bd_addr_segs hbm_0/SAXI_20/HBM_MEM29] -force
    assign_bd_address -offset 0x0001E0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM20] [get_bd_addr_segs hbm_0/SAXI_20/HBM_MEM30] -force
    assign_bd_address -offset 0x0001F0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM20] [get_bd_addr_segs hbm_0/SAXI_20/HBM_MEM31] -force
    assign_bd_address -offset 0x00000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM21] [get_bd_addr_segs hbm_0/SAXI_21/HBM_MEM00] -force
    assign_bd_address -offset 0x10000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM21] [get_bd_addr_segs hbm_0/SAXI_21/HBM_MEM01] -force
    assign_bd_address -offset 0x20000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM21] [get_bd_addr_segs hbm_0/SAXI_21/HBM_MEM02] -force
    assign_bd_address -offset 0x30000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM21] [get_bd_addr_segs hbm_0/SAXI_21/HBM_MEM03] -force
    assign_bd_address -offset 0x40000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM21] [get_bd_addr_segs hbm_0/SAXI_21/HBM_MEM04] -force
    assign_bd_address -offset 0x50000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM21] [get_bd_addr_segs hbm_0/SAXI_21/HBM_MEM05] -force
    assign_bd_address -offset 0x60000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM21] [get_bd_addr_segs hbm_0/SAXI_21/HBM_MEM06] -force
    assign_bd_address -offset 0x70000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM21] [get_bd_addr_segs hbm_0/SAXI_21/HBM_MEM07] -force
    assign_bd_address -offset 0x80000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM21] [get_bd_addr_segs hbm_0/SAXI_21/HBM_MEM08] -force
    assign_bd_address -offset 0x90000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM21] [get_bd_addr_segs hbm_0/SAXI_21/HBM_MEM09] -force
    assign_bd_address -offset 0xA0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM21] [get_bd_addr_segs hbm_0/SAXI_21/HBM_MEM10] -force
    assign_bd_address -offset 0xB0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM21] [get_bd_addr_segs hbm_0/SAXI_21/HBM_MEM11] -force
    assign_bd_address -offset 0xC0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM21] [get_bd_addr_segs hbm_0/SAXI_21/HBM_MEM12] -force
    assign_bd_address -offset 0xD0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM21] [get_bd_addr_segs hbm_0/SAXI_21/HBM_MEM13] -force
    assign_bd_address -offset 0xE0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM21] [get_bd_addr_segs hbm_0/SAXI_21/HBM_MEM14] -force
    assign_bd_address -offset 0xF0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM21] [get_bd_addr_segs hbm_0/SAXI_21/HBM_MEM15] -force
    assign_bd_address -offset 0x000100000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM21] [get_bd_addr_segs hbm_0/SAXI_21/HBM_MEM16] -force
    assign_bd_address -offset 0x000110000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM21] [get_bd_addr_segs hbm_0/SAXI_21/HBM_MEM17] -force
    assign_bd_address -offset 0x000120000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM21] [get_bd_addr_segs hbm_0/SAXI_21/HBM_MEM18] -force
    assign_bd_address -offset 0x000130000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM21] [get_bd_addr_segs hbm_0/SAXI_21/HBM_MEM19] -force
    assign_bd_address -offset 0x000140000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM21] [get_bd_addr_segs hbm_0/SAXI_21/HBM_MEM20] -force
    assign_bd_address -offset 0x000150000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM21] [get_bd_addr_segs hbm_0/SAXI_21/HBM_MEM21] -force
    assign_bd_address -offset 0x000160000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM21] [get_bd_addr_segs hbm_0/SAXI_21/HBM_MEM22] -force
    assign_bd_address -offset 0x000170000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM21] [get_bd_addr_segs hbm_0/SAXI_21/HBM_MEM23] -force
    assign_bd_address -offset 0x000180000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM21] [get_bd_addr_segs hbm_0/SAXI_21/HBM_MEM24] -force
    assign_bd_address -offset 0x000190000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM21] [get_bd_addr_segs hbm_0/SAXI_21/HBM_MEM25] -force
    assign_bd_address -offset 0x0001A0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM21] [get_bd_addr_segs hbm_0/SAXI_21/HBM_MEM26] -force
    assign_bd_address -offset 0x0001B0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM21] [get_bd_addr_segs hbm_0/SAXI_21/HBM_MEM27] -force
    assign_bd_address -offset 0x0001C0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM21] [get_bd_addr_segs hbm_0/SAXI_21/HBM_MEM28] -force
    assign_bd_address -offset 0x0001D0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM21] [get_bd_addr_segs hbm_0/SAXI_21/HBM_MEM29] -force
    assign_bd_address -offset 0x0001E0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM21] [get_bd_addr_segs hbm_0/SAXI_21/HBM_MEM30] -force
    assign_bd_address -offset 0x0001F0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM21] [get_bd_addr_segs hbm_0/SAXI_21/HBM_MEM31] -force
    assign_bd_address -offset 0x00000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM22] [get_bd_addr_segs hbm_0/SAXI_22/HBM_MEM00] -force
    assign_bd_address -offset 0x10000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM22] [get_bd_addr_segs hbm_0/SAXI_22/HBM_MEM01] -force
    assign_bd_address -offset 0x20000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM22] [get_bd_addr_segs hbm_0/SAXI_22/HBM_MEM02] -force
    assign_bd_address -offset 0x30000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM22] [get_bd_addr_segs hbm_0/SAXI_22/HBM_MEM03] -force
    assign_bd_address -offset 0x40000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM22] [get_bd_addr_segs hbm_0/SAXI_22/HBM_MEM04] -force
    assign_bd_address -offset 0x50000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM22] [get_bd_addr_segs hbm_0/SAXI_22/HBM_MEM05] -force
    assign_bd_address -offset 0x60000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM22] [get_bd_addr_segs hbm_0/SAXI_22/HBM_MEM06] -force
    assign_bd_address -offset 0x70000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM22] [get_bd_addr_segs hbm_0/SAXI_22/HBM_MEM07] -force
    assign_bd_address -offset 0x80000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM22] [get_bd_addr_segs hbm_0/SAXI_22/HBM_MEM08] -force
    assign_bd_address -offset 0x90000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM22] [get_bd_addr_segs hbm_0/SAXI_22/HBM_MEM09] -force
    assign_bd_address -offset 0xA0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM22] [get_bd_addr_segs hbm_0/SAXI_22/HBM_MEM10] -force
    assign_bd_address -offset 0xB0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM22] [get_bd_addr_segs hbm_0/SAXI_22/HBM_MEM11] -force
    assign_bd_address -offset 0xC0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM22] [get_bd_addr_segs hbm_0/SAXI_22/HBM_MEM12] -force
    assign_bd_address -offset 0xD0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM22] [get_bd_addr_segs hbm_0/SAXI_22/HBM_MEM13] -force
    assign_bd_address -offset 0xE0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM22] [get_bd_addr_segs hbm_0/SAXI_22/HBM_MEM14] -force
    assign_bd_address -offset 0xF0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM22] [get_bd_addr_segs hbm_0/SAXI_22/HBM_MEM15] -force
    assign_bd_address -offset 0x000100000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM22] [get_bd_addr_segs hbm_0/SAXI_22/HBM_MEM16] -force
    assign_bd_address -offset 0x000110000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM22] [get_bd_addr_segs hbm_0/SAXI_22/HBM_MEM17] -force
    assign_bd_address -offset 0x000120000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM22] [get_bd_addr_segs hbm_0/SAXI_22/HBM_MEM18] -force
    assign_bd_address -offset 0x000130000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM22] [get_bd_addr_segs hbm_0/SAXI_22/HBM_MEM19] -force
    assign_bd_address -offset 0x000140000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM22] [get_bd_addr_segs hbm_0/SAXI_22/HBM_MEM20] -force
    assign_bd_address -offset 0x000150000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM22] [get_bd_addr_segs hbm_0/SAXI_22/HBM_MEM21] -force
    assign_bd_address -offset 0x000160000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM22] [get_bd_addr_segs hbm_0/SAXI_22/HBM_MEM22] -force
    assign_bd_address -offset 0x000170000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM22] [get_bd_addr_segs hbm_0/SAXI_22/HBM_MEM23] -force
    assign_bd_address -offset 0x000180000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM22] [get_bd_addr_segs hbm_0/SAXI_22/HBM_MEM24] -force
    assign_bd_address -offset 0x000190000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM22] [get_bd_addr_segs hbm_0/SAXI_22/HBM_MEM25] -force
    assign_bd_address -offset 0x0001A0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM22] [get_bd_addr_segs hbm_0/SAXI_22/HBM_MEM26] -force
    assign_bd_address -offset 0x0001B0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM22] [get_bd_addr_segs hbm_0/SAXI_22/HBM_MEM27] -force
    assign_bd_address -offset 0x0001C0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM22] [get_bd_addr_segs hbm_0/SAXI_22/HBM_MEM28] -force
    assign_bd_address -offset 0x0001D0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM22] [get_bd_addr_segs hbm_0/SAXI_22/HBM_MEM29] -force
    assign_bd_address -offset 0x0001E0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM22] [get_bd_addr_segs hbm_0/SAXI_22/HBM_MEM30] -force
    assign_bd_address -offset 0x0001F0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM22] [get_bd_addr_segs hbm_0/SAXI_22/HBM_MEM31] -force
    assign_bd_address -offset 0x00000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM23] [get_bd_addr_segs hbm_0/SAXI_23/HBM_MEM00] -force
    assign_bd_address -offset 0x10000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM23] [get_bd_addr_segs hbm_0/SAXI_23/HBM_MEM01] -force
    assign_bd_address -offset 0x20000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM23] [get_bd_addr_segs hbm_0/SAXI_23/HBM_MEM02] -force
    assign_bd_address -offset 0x30000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM23] [get_bd_addr_segs hbm_0/SAXI_23/HBM_MEM03] -force
    assign_bd_address -offset 0x40000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM23] [get_bd_addr_segs hbm_0/SAXI_23/HBM_MEM04] -force
    assign_bd_address -offset 0x50000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM23] [get_bd_addr_segs hbm_0/SAXI_23/HBM_MEM05] -force
    assign_bd_address -offset 0x60000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM23] [get_bd_addr_segs hbm_0/SAXI_23/HBM_MEM06] -force
    assign_bd_address -offset 0x70000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM23] [get_bd_addr_segs hbm_0/SAXI_23/HBM_MEM07] -force
    assign_bd_address -offset 0x80000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM23] [get_bd_addr_segs hbm_0/SAXI_23/HBM_MEM08] -force
    assign_bd_address -offset 0x90000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM23] [get_bd_addr_segs hbm_0/SAXI_23/HBM_MEM09] -force
    assign_bd_address -offset 0xA0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM23] [get_bd_addr_segs hbm_0/SAXI_23/HBM_MEM10] -force
    assign_bd_address -offset 0xB0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM23] [get_bd_addr_segs hbm_0/SAXI_23/HBM_MEM11] -force
    assign_bd_address -offset 0xC0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM23] [get_bd_addr_segs hbm_0/SAXI_23/HBM_MEM12] -force
    assign_bd_address -offset 0xD0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM23] [get_bd_addr_segs hbm_0/SAXI_23/HBM_MEM13] -force
    assign_bd_address -offset 0xE0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM23] [get_bd_addr_segs hbm_0/SAXI_23/HBM_MEM14] -force
    assign_bd_address -offset 0xF0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM23] [get_bd_addr_segs hbm_0/SAXI_23/HBM_MEM15] -force
    assign_bd_address -offset 0x000100000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM23] [get_bd_addr_segs hbm_0/SAXI_23/HBM_MEM16] -force
    assign_bd_address -offset 0x000110000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM23] [get_bd_addr_segs hbm_0/SAXI_23/HBM_MEM17] -force
    assign_bd_address -offset 0x000120000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM23] [get_bd_addr_segs hbm_0/SAXI_23/HBM_MEM18] -force
    assign_bd_address -offset 0x000130000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM23] [get_bd_addr_segs hbm_0/SAXI_23/HBM_MEM19] -force
    assign_bd_address -offset 0x000140000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM23] [get_bd_addr_segs hbm_0/SAXI_23/HBM_MEM20] -force
    assign_bd_address -offset 0x000150000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM23] [get_bd_addr_segs hbm_0/SAXI_23/HBM_MEM21] -force
    assign_bd_address -offset 0x000160000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM23] [get_bd_addr_segs hbm_0/SAXI_23/HBM_MEM22] -force
    assign_bd_address -offset 0x000170000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM23] [get_bd_addr_segs hbm_0/SAXI_23/HBM_MEM23] -force
    assign_bd_address -offset 0x000180000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM23] [get_bd_addr_segs hbm_0/SAXI_23/HBM_MEM24] -force
    assign_bd_address -offset 0x000190000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM23] [get_bd_addr_segs hbm_0/SAXI_23/HBM_MEM25] -force
    assign_bd_address -offset 0x0001A0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM23] [get_bd_addr_segs hbm_0/SAXI_23/HBM_MEM26] -force
    assign_bd_address -offset 0x0001B0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM23] [get_bd_addr_segs hbm_0/SAXI_23/HBM_MEM27] -force
    assign_bd_address -offset 0x0001C0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM23] [get_bd_addr_segs hbm_0/SAXI_23/HBM_MEM28] -force
    assign_bd_address -offset 0x0001D0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM23] [get_bd_addr_segs hbm_0/SAXI_23/HBM_MEM29] -force
    assign_bd_address -offset 0x0001E0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM23] [get_bd_addr_segs hbm_0/SAXI_23/HBM_MEM30] -force
    assign_bd_address -offset 0x0001F0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM23] [get_bd_addr_segs hbm_0/SAXI_23/HBM_MEM31] -force
    assign_bd_address -offset 0x00000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM24] [get_bd_addr_segs hbm_0/SAXI_24/HBM_MEM00] -force
    assign_bd_address -offset 0x10000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM24] [get_bd_addr_segs hbm_0/SAXI_24/HBM_MEM01] -force
    assign_bd_address -offset 0x20000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM24] [get_bd_addr_segs hbm_0/SAXI_24/HBM_MEM02] -force
    assign_bd_address -offset 0x30000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM24] [get_bd_addr_segs hbm_0/SAXI_24/HBM_MEM03] -force
    assign_bd_address -offset 0x40000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM24] [get_bd_addr_segs hbm_0/SAXI_24/HBM_MEM04] -force
    assign_bd_address -offset 0x50000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM24] [get_bd_addr_segs hbm_0/SAXI_24/HBM_MEM05] -force
    assign_bd_address -offset 0x60000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM24] [get_bd_addr_segs hbm_0/SAXI_24/HBM_MEM06] -force
    assign_bd_address -offset 0x70000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM24] [get_bd_addr_segs hbm_0/SAXI_24/HBM_MEM07] -force
    assign_bd_address -offset 0x80000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM24] [get_bd_addr_segs hbm_0/SAXI_24/HBM_MEM08] -force
    assign_bd_address -offset 0x90000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM24] [get_bd_addr_segs hbm_0/SAXI_24/HBM_MEM09] -force
    assign_bd_address -offset 0xA0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM24] [get_bd_addr_segs hbm_0/SAXI_24/HBM_MEM10] -force
    assign_bd_address -offset 0xB0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM24] [get_bd_addr_segs hbm_0/SAXI_24/HBM_MEM11] -force
    assign_bd_address -offset 0xC0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM24] [get_bd_addr_segs hbm_0/SAXI_24/HBM_MEM12] -force
    assign_bd_address -offset 0xD0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM24] [get_bd_addr_segs hbm_0/SAXI_24/HBM_MEM13] -force
    assign_bd_address -offset 0xE0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM24] [get_bd_addr_segs hbm_0/SAXI_24/HBM_MEM14] -force
    assign_bd_address -offset 0xF0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM24] [get_bd_addr_segs hbm_0/SAXI_24/HBM_MEM15] -force
    assign_bd_address -offset 0x000100000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM24] [get_bd_addr_segs hbm_0/SAXI_24/HBM_MEM16] -force
    assign_bd_address -offset 0x000110000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM24] [get_bd_addr_segs hbm_0/SAXI_24/HBM_MEM17] -force
    assign_bd_address -offset 0x000120000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM24] [get_bd_addr_segs hbm_0/SAXI_24/HBM_MEM18] -force
    assign_bd_address -offset 0x000130000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM24] [get_bd_addr_segs hbm_0/SAXI_24/HBM_MEM19] -force
    assign_bd_address -offset 0x000140000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM24] [get_bd_addr_segs hbm_0/SAXI_24/HBM_MEM20] -force
    assign_bd_address -offset 0x000150000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM24] [get_bd_addr_segs hbm_0/SAXI_24/HBM_MEM21] -force
    assign_bd_address -offset 0x000160000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM24] [get_bd_addr_segs hbm_0/SAXI_24/HBM_MEM22] -force
    assign_bd_address -offset 0x000170000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM24] [get_bd_addr_segs hbm_0/SAXI_24/HBM_MEM23] -force
    assign_bd_address -offset 0x000180000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM24] [get_bd_addr_segs hbm_0/SAXI_24/HBM_MEM24] -force
    assign_bd_address -offset 0x000190000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM24] [get_bd_addr_segs hbm_0/SAXI_24/HBM_MEM25] -force
    assign_bd_address -offset 0x0001A0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM24] [get_bd_addr_segs hbm_0/SAXI_24/HBM_MEM26] -force
    assign_bd_address -offset 0x0001B0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM24] [get_bd_addr_segs hbm_0/SAXI_24/HBM_MEM27] -force
    assign_bd_address -offset 0x0001C0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM24] [get_bd_addr_segs hbm_0/SAXI_24/HBM_MEM28] -force
    assign_bd_address -offset 0x0001D0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM24] [get_bd_addr_segs hbm_0/SAXI_24/HBM_MEM29] -force
    assign_bd_address -offset 0x0001E0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM24] [get_bd_addr_segs hbm_0/SAXI_24/HBM_MEM30] -force
    assign_bd_address -offset 0x0001F0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM24] [get_bd_addr_segs hbm_0/SAXI_24/HBM_MEM31] -force
    assign_bd_address -offset 0x00000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM25] [get_bd_addr_segs hbm_0/SAXI_25/HBM_MEM00] -force
    assign_bd_address -offset 0x10000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM25] [get_bd_addr_segs hbm_0/SAXI_25/HBM_MEM01] -force
    assign_bd_address -offset 0x20000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM25] [get_bd_addr_segs hbm_0/SAXI_25/HBM_MEM02] -force
    assign_bd_address -offset 0x30000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM25] [get_bd_addr_segs hbm_0/SAXI_25/HBM_MEM03] -force
    assign_bd_address -offset 0x40000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM25] [get_bd_addr_segs hbm_0/SAXI_25/HBM_MEM04] -force
    assign_bd_address -offset 0x50000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM25] [get_bd_addr_segs hbm_0/SAXI_25/HBM_MEM05] -force
    assign_bd_address -offset 0x60000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM25] [get_bd_addr_segs hbm_0/SAXI_25/HBM_MEM06] -force
    assign_bd_address -offset 0x70000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM25] [get_bd_addr_segs hbm_0/SAXI_25/HBM_MEM07] -force
    assign_bd_address -offset 0x80000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM25] [get_bd_addr_segs hbm_0/SAXI_25/HBM_MEM08] -force
    assign_bd_address -offset 0x90000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM25] [get_bd_addr_segs hbm_0/SAXI_25/HBM_MEM09] -force
    assign_bd_address -offset 0xA0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM25] [get_bd_addr_segs hbm_0/SAXI_25/HBM_MEM10] -force
    assign_bd_address -offset 0xB0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM25] [get_bd_addr_segs hbm_0/SAXI_25/HBM_MEM11] -force
    assign_bd_address -offset 0xC0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM25] [get_bd_addr_segs hbm_0/SAXI_25/HBM_MEM12] -force
    assign_bd_address -offset 0xD0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM25] [get_bd_addr_segs hbm_0/SAXI_25/HBM_MEM13] -force
    assign_bd_address -offset 0xE0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM25] [get_bd_addr_segs hbm_0/SAXI_25/HBM_MEM14] -force
    assign_bd_address -offset 0xF0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM25] [get_bd_addr_segs hbm_0/SAXI_25/HBM_MEM15] -force
    assign_bd_address -offset 0x000100000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM25] [get_bd_addr_segs hbm_0/SAXI_25/HBM_MEM16] -force
    assign_bd_address -offset 0x000110000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM25] [get_bd_addr_segs hbm_0/SAXI_25/HBM_MEM17] -force
    assign_bd_address -offset 0x000120000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM25] [get_bd_addr_segs hbm_0/SAXI_25/HBM_MEM18] -force
    assign_bd_address -offset 0x000130000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM25] [get_bd_addr_segs hbm_0/SAXI_25/HBM_MEM19] -force
    assign_bd_address -offset 0x000140000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM25] [get_bd_addr_segs hbm_0/SAXI_25/HBM_MEM20] -force
    assign_bd_address -offset 0x000150000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM25] [get_bd_addr_segs hbm_0/SAXI_25/HBM_MEM21] -force
    assign_bd_address -offset 0x000160000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM25] [get_bd_addr_segs hbm_0/SAXI_25/HBM_MEM22] -force
    assign_bd_address -offset 0x000170000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM25] [get_bd_addr_segs hbm_0/SAXI_25/HBM_MEM23] -force
    assign_bd_address -offset 0x000180000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM25] [get_bd_addr_segs hbm_0/SAXI_25/HBM_MEM24] -force
    assign_bd_address -offset 0x000190000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM25] [get_bd_addr_segs hbm_0/SAXI_25/HBM_MEM25] -force
    assign_bd_address -offset 0x0001A0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM25] [get_bd_addr_segs hbm_0/SAXI_25/HBM_MEM26] -force
    assign_bd_address -offset 0x0001B0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM25] [get_bd_addr_segs hbm_0/SAXI_25/HBM_MEM27] -force
    assign_bd_address -offset 0x0001C0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM25] [get_bd_addr_segs hbm_0/SAXI_25/HBM_MEM28] -force
    assign_bd_address -offset 0x0001D0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM25] [get_bd_addr_segs hbm_0/SAXI_25/HBM_MEM29] -force
    assign_bd_address -offset 0x0001E0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM25] [get_bd_addr_segs hbm_0/SAXI_25/HBM_MEM30] -force
    assign_bd_address -offset 0x0001F0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM25] [get_bd_addr_segs hbm_0/SAXI_25/HBM_MEM31] -force
    assign_bd_address -offset 0x00000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM26] [get_bd_addr_segs hbm_0/SAXI_26/HBM_MEM00] -force
    assign_bd_address -offset 0x10000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM26] [get_bd_addr_segs hbm_0/SAXI_26/HBM_MEM01] -force
    assign_bd_address -offset 0x20000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM26] [get_bd_addr_segs hbm_0/SAXI_26/HBM_MEM02] -force
    assign_bd_address -offset 0x30000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM26] [get_bd_addr_segs hbm_0/SAXI_26/HBM_MEM03] -force
    assign_bd_address -offset 0x40000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM26] [get_bd_addr_segs hbm_0/SAXI_26/HBM_MEM04] -force
    assign_bd_address -offset 0x50000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM26] [get_bd_addr_segs hbm_0/SAXI_26/HBM_MEM05] -force
    assign_bd_address -offset 0x60000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM26] [get_bd_addr_segs hbm_0/SAXI_26/HBM_MEM06] -force
    assign_bd_address -offset 0x70000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM26] [get_bd_addr_segs hbm_0/SAXI_26/HBM_MEM07] -force
    assign_bd_address -offset 0x80000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM26] [get_bd_addr_segs hbm_0/SAXI_26/HBM_MEM08] -force
    assign_bd_address -offset 0x90000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM26] [get_bd_addr_segs hbm_0/SAXI_26/HBM_MEM09] -force
    assign_bd_address -offset 0xA0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM26] [get_bd_addr_segs hbm_0/SAXI_26/HBM_MEM10] -force
    assign_bd_address -offset 0xB0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM26] [get_bd_addr_segs hbm_0/SAXI_26/HBM_MEM11] -force
    assign_bd_address -offset 0xC0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM26] [get_bd_addr_segs hbm_0/SAXI_26/HBM_MEM12] -force
    assign_bd_address -offset 0xD0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM26] [get_bd_addr_segs hbm_0/SAXI_26/HBM_MEM13] -force
    assign_bd_address -offset 0xE0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM26] [get_bd_addr_segs hbm_0/SAXI_26/HBM_MEM14] -force
    assign_bd_address -offset 0xF0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM26] [get_bd_addr_segs hbm_0/SAXI_26/HBM_MEM15] -force
    assign_bd_address -offset 0x000100000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM26] [get_bd_addr_segs hbm_0/SAXI_26/HBM_MEM16] -force
    assign_bd_address -offset 0x000110000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM26] [get_bd_addr_segs hbm_0/SAXI_26/HBM_MEM17] -force
    assign_bd_address -offset 0x000120000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM26] [get_bd_addr_segs hbm_0/SAXI_26/HBM_MEM18] -force
    assign_bd_address -offset 0x000130000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM26] [get_bd_addr_segs hbm_0/SAXI_26/HBM_MEM19] -force
    assign_bd_address -offset 0x000140000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM26] [get_bd_addr_segs hbm_0/SAXI_26/HBM_MEM20] -force
    assign_bd_address -offset 0x000150000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM26] [get_bd_addr_segs hbm_0/SAXI_26/HBM_MEM21] -force
    assign_bd_address -offset 0x000160000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM26] [get_bd_addr_segs hbm_0/SAXI_26/HBM_MEM22] -force
    assign_bd_address -offset 0x000170000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM26] [get_bd_addr_segs hbm_0/SAXI_26/HBM_MEM23] -force
    assign_bd_address -offset 0x000180000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM26] [get_bd_addr_segs hbm_0/SAXI_26/HBM_MEM24] -force
    assign_bd_address -offset 0x000190000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM26] [get_bd_addr_segs hbm_0/SAXI_26/HBM_MEM25] -force
    assign_bd_address -offset 0x0001A0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM26] [get_bd_addr_segs hbm_0/SAXI_26/HBM_MEM26] -force
    assign_bd_address -offset 0x0001B0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM26] [get_bd_addr_segs hbm_0/SAXI_26/HBM_MEM27] -force
    assign_bd_address -offset 0x0001C0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM26] [get_bd_addr_segs hbm_0/SAXI_26/HBM_MEM28] -force
    assign_bd_address -offset 0x0001D0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM26] [get_bd_addr_segs hbm_0/SAXI_26/HBM_MEM29] -force
    assign_bd_address -offset 0x0001E0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM26] [get_bd_addr_segs hbm_0/SAXI_26/HBM_MEM30] -force
    assign_bd_address -offset 0x0001F0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM26] [get_bd_addr_segs hbm_0/SAXI_26/HBM_MEM31] -force
    assign_bd_address -offset 0x00000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM27] [get_bd_addr_segs hbm_0/SAXI_27/HBM_MEM00] -force
    assign_bd_address -offset 0x10000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM27] [get_bd_addr_segs hbm_0/SAXI_27/HBM_MEM01] -force
    assign_bd_address -offset 0x20000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM27] [get_bd_addr_segs hbm_0/SAXI_27/HBM_MEM02] -force
    assign_bd_address -offset 0x30000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM27] [get_bd_addr_segs hbm_0/SAXI_27/HBM_MEM03] -force
    assign_bd_address -offset 0x40000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM27] [get_bd_addr_segs hbm_0/SAXI_27/HBM_MEM04] -force
    assign_bd_address -offset 0x50000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM27] [get_bd_addr_segs hbm_0/SAXI_27/HBM_MEM05] -force
    assign_bd_address -offset 0x60000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM27] [get_bd_addr_segs hbm_0/SAXI_27/HBM_MEM06] -force
    assign_bd_address -offset 0x70000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM27] [get_bd_addr_segs hbm_0/SAXI_27/HBM_MEM07] -force
    assign_bd_address -offset 0x80000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM27] [get_bd_addr_segs hbm_0/SAXI_27/HBM_MEM08] -force
    assign_bd_address -offset 0x90000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM27] [get_bd_addr_segs hbm_0/SAXI_27/HBM_MEM09] -force
    assign_bd_address -offset 0xA0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM27] [get_bd_addr_segs hbm_0/SAXI_27/HBM_MEM10] -force
    assign_bd_address -offset 0xB0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM27] [get_bd_addr_segs hbm_0/SAXI_27/HBM_MEM11] -force
    assign_bd_address -offset 0xC0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM27] [get_bd_addr_segs hbm_0/SAXI_27/HBM_MEM12] -force
    assign_bd_address -offset 0xD0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM27] [get_bd_addr_segs hbm_0/SAXI_27/HBM_MEM13] -force
    assign_bd_address -offset 0xE0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM27] [get_bd_addr_segs hbm_0/SAXI_27/HBM_MEM14] -force
    assign_bd_address -offset 0xF0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM27] [get_bd_addr_segs hbm_0/SAXI_27/HBM_MEM15] -force
    assign_bd_address -offset 0x000100000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM27] [get_bd_addr_segs hbm_0/SAXI_27/HBM_MEM16] -force
    assign_bd_address -offset 0x000110000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM27] [get_bd_addr_segs hbm_0/SAXI_27/HBM_MEM17] -force
    assign_bd_address -offset 0x000120000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM27] [get_bd_addr_segs hbm_0/SAXI_27/HBM_MEM18] -force
    assign_bd_address -offset 0x000130000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM27] [get_bd_addr_segs hbm_0/SAXI_27/HBM_MEM19] -force
    assign_bd_address -offset 0x000140000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM27] [get_bd_addr_segs hbm_0/SAXI_27/HBM_MEM20] -force
    assign_bd_address -offset 0x000150000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM27] [get_bd_addr_segs hbm_0/SAXI_27/HBM_MEM21] -force
    assign_bd_address -offset 0x000160000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM27] [get_bd_addr_segs hbm_0/SAXI_27/HBM_MEM22] -force
    assign_bd_address -offset 0x000170000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM27] [get_bd_addr_segs hbm_0/SAXI_27/HBM_MEM23] -force
    assign_bd_address -offset 0x000180000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM27] [get_bd_addr_segs hbm_0/SAXI_27/HBM_MEM24] -force
    assign_bd_address -offset 0x000190000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM27] [get_bd_addr_segs hbm_0/SAXI_27/HBM_MEM25] -force
    assign_bd_address -offset 0x0001A0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM27] [get_bd_addr_segs hbm_0/SAXI_27/HBM_MEM26] -force
    assign_bd_address -offset 0x0001B0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM27] [get_bd_addr_segs hbm_0/SAXI_27/HBM_MEM27] -force
    assign_bd_address -offset 0x0001C0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM27] [get_bd_addr_segs hbm_0/SAXI_27/HBM_MEM28] -force
    assign_bd_address -offset 0x0001D0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM27] [get_bd_addr_segs hbm_0/SAXI_27/HBM_MEM29] -force
    assign_bd_address -offset 0x0001E0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM27] [get_bd_addr_segs hbm_0/SAXI_27/HBM_MEM30] -force
    assign_bd_address -offset 0x0001F0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM27] [get_bd_addr_segs hbm_0/SAXI_27/HBM_MEM31] -force
    assign_bd_address -offset 0x00000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM28] [get_bd_addr_segs hbm_0/SAXI_28/HBM_MEM00] -force
    assign_bd_address -offset 0x10000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM28] [get_bd_addr_segs hbm_0/SAXI_28/HBM_MEM01] -force
    assign_bd_address -offset 0x20000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM28] [get_bd_addr_segs hbm_0/SAXI_28/HBM_MEM02] -force
    assign_bd_address -offset 0x30000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM28] [get_bd_addr_segs hbm_0/SAXI_28/HBM_MEM03] -force
    assign_bd_address -offset 0x40000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM28] [get_bd_addr_segs hbm_0/SAXI_28/HBM_MEM04] -force
    assign_bd_address -offset 0x50000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM28] [get_bd_addr_segs hbm_0/SAXI_28/HBM_MEM05] -force
    assign_bd_address -offset 0x60000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM28] [get_bd_addr_segs hbm_0/SAXI_28/HBM_MEM06] -force
    assign_bd_address -offset 0x70000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM28] [get_bd_addr_segs hbm_0/SAXI_28/HBM_MEM07] -force
    assign_bd_address -offset 0x80000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM28] [get_bd_addr_segs hbm_0/SAXI_28/HBM_MEM08] -force
    assign_bd_address -offset 0x90000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM28] [get_bd_addr_segs hbm_0/SAXI_28/HBM_MEM09] -force
    assign_bd_address -offset 0xA0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM28] [get_bd_addr_segs hbm_0/SAXI_28/HBM_MEM10] -force
    assign_bd_address -offset 0xB0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM28] [get_bd_addr_segs hbm_0/SAXI_28/HBM_MEM11] -force
    assign_bd_address -offset 0xC0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM28] [get_bd_addr_segs hbm_0/SAXI_28/HBM_MEM12] -force
    assign_bd_address -offset 0xD0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM28] [get_bd_addr_segs hbm_0/SAXI_28/HBM_MEM13] -force
    assign_bd_address -offset 0xE0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM28] [get_bd_addr_segs hbm_0/SAXI_28/HBM_MEM14] -force
    assign_bd_address -offset 0xF0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM28] [get_bd_addr_segs hbm_0/SAXI_28/HBM_MEM15] -force
    assign_bd_address -offset 0x000100000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM28] [get_bd_addr_segs hbm_0/SAXI_28/HBM_MEM16] -force
    assign_bd_address -offset 0x000110000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM28] [get_bd_addr_segs hbm_0/SAXI_28/HBM_MEM17] -force
    assign_bd_address -offset 0x000120000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM28] [get_bd_addr_segs hbm_0/SAXI_28/HBM_MEM18] -force
    assign_bd_address -offset 0x000130000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM28] [get_bd_addr_segs hbm_0/SAXI_28/HBM_MEM19] -force
    assign_bd_address -offset 0x000140000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM28] [get_bd_addr_segs hbm_0/SAXI_28/HBM_MEM20] -force
    assign_bd_address -offset 0x000150000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM28] [get_bd_addr_segs hbm_0/SAXI_28/HBM_MEM21] -force
    assign_bd_address -offset 0x000160000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM28] [get_bd_addr_segs hbm_0/SAXI_28/HBM_MEM22] -force
    assign_bd_address -offset 0x000170000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM28] [get_bd_addr_segs hbm_0/SAXI_28/HBM_MEM23] -force
    assign_bd_address -offset 0x000180000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM28] [get_bd_addr_segs hbm_0/SAXI_28/HBM_MEM24] -force
    assign_bd_address -offset 0x000190000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM28] [get_bd_addr_segs hbm_0/SAXI_28/HBM_MEM25] -force
    assign_bd_address -offset 0x0001A0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM28] [get_bd_addr_segs hbm_0/SAXI_28/HBM_MEM26] -force
    assign_bd_address -offset 0x0001B0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM28] [get_bd_addr_segs hbm_0/SAXI_28/HBM_MEM27] -force
    assign_bd_address -offset 0x0001C0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM28] [get_bd_addr_segs hbm_0/SAXI_28/HBM_MEM28] -force
    assign_bd_address -offset 0x0001D0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM28] [get_bd_addr_segs hbm_0/SAXI_28/HBM_MEM29] -force
    assign_bd_address -offset 0x0001E0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM28] [get_bd_addr_segs hbm_0/SAXI_28/HBM_MEM30] -force
    assign_bd_address -offset 0x0001F0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM28] [get_bd_addr_segs hbm_0/SAXI_28/HBM_MEM31] -force
    assign_bd_address -offset 0x00000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM29] [get_bd_addr_segs hbm_0/SAXI_29/HBM_MEM00] -force
    assign_bd_address -offset 0x10000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM29] [get_bd_addr_segs hbm_0/SAXI_29/HBM_MEM01] -force
    assign_bd_address -offset 0x20000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM29] [get_bd_addr_segs hbm_0/SAXI_29/HBM_MEM02] -force
    assign_bd_address -offset 0x30000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM29] [get_bd_addr_segs hbm_0/SAXI_29/HBM_MEM03] -force
    assign_bd_address -offset 0x40000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM29] [get_bd_addr_segs hbm_0/SAXI_29/HBM_MEM04] -force
    assign_bd_address -offset 0x50000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM29] [get_bd_addr_segs hbm_0/SAXI_29/HBM_MEM05] -force
    assign_bd_address -offset 0x60000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM29] [get_bd_addr_segs hbm_0/SAXI_29/HBM_MEM06] -force
    assign_bd_address -offset 0x70000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM29] [get_bd_addr_segs hbm_0/SAXI_29/HBM_MEM07] -force
    assign_bd_address -offset 0x80000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM29] [get_bd_addr_segs hbm_0/SAXI_29/HBM_MEM08] -force
    assign_bd_address -offset 0x90000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM29] [get_bd_addr_segs hbm_0/SAXI_29/HBM_MEM09] -force
    assign_bd_address -offset 0xA0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM29] [get_bd_addr_segs hbm_0/SAXI_29/HBM_MEM10] -force
    assign_bd_address -offset 0xB0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM29] [get_bd_addr_segs hbm_0/SAXI_29/HBM_MEM11] -force
    assign_bd_address -offset 0xC0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM29] [get_bd_addr_segs hbm_0/SAXI_29/HBM_MEM12] -force
    assign_bd_address -offset 0xD0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM29] [get_bd_addr_segs hbm_0/SAXI_29/HBM_MEM13] -force
    assign_bd_address -offset 0xE0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM29] [get_bd_addr_segs hbm_0/SAXI_29/HBM_MEM14] -force
    assign_bd_address -offset 0xF0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM29] [get_bd_addr_segs hbm_0/SAXI_29/HBM_MEM15] -force
    assign_bd_address -offset 0x000100000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM29] [get_bd_addr_segs hbm_0/SAXI_29/HBM_MEM16] -force
    assign_bd_address -offset 0x000110000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM29] [get_bd_addr_segs hbm_0/SAXI_29/HBM_MEM17] -force
    assign_bd_address -offset 0x000120000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM29] [get_bd_addr_segs hbm_0/SAXI_29/HBM_MEM18] -force
    assign_bd_address -offset 0x000130000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM29] [get_bd_addr_segs hbm_0/SAXI_29/HBM_MEM19] -force
    assign_bd_address -offset 0x000140000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM29] [get_bd_addr_segs hbm_0/SAXI_29/HBM_MEM20] -force
    assign_bd_address -offset 0x000150000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM29] [get_bd_addr_segs hbm_0/SAXI_29/HBM_MEM21] -force
    assign_bd_address -offset 0x000160000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM29] [get_bd_addr_segs hbm_0/SAXI_29/HBM_MEM22] -force
    assign_bd_address -offset 0x000170000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM29] [get_bd_addr_segs hbm_0/SAXI_29/HBM_MEM23] -force
    assign_bd_address -offset 0x000180000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM29] [get_bd_addr_segs hbm_0/SAXI_29/HBM_MEM24] -force
    assign_bd_address -offset 0x000190000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM29] [get_bd_addr_segs hbm_0/SAXI_29/HBM_MEM25] -force
    assign_bd_address -offset 0x0001A0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM29] [get_bd_addr_segs hbm_0/SAXI_29/HBM_MEM26] -force
    assign_bd_address -offset 0x0001B0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM29] [get_bd_addr_segs hbm_0/SAXI_29/HBM_MEM27] -force
    assign_bd_address -offset 0x0001C0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM29] [get_bd_addr_segs hbm_0/SAXI_29/HBM_MEM28] -force
    assign_bd_address -offset 0x0001D0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM29] [get_bd_addr_segs hbm_0/SAXI_29/HBM_MEM29] -force
    assign_bd_address -offset 0x0001E0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM29] [get_bd_addr_segs hbm_0/SAXI_29/HBM_MEM30] -force
    assign_bd_address -offset 0x0001F0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM29] [get_bd_addr_segs hbm_0/SAXI_29/HBM_MEM31] -force
    assign_bd_address -offset 0x00000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM30] [get_bd_addr_segs hbm_0/SAXI_30/HBM_MEM00] -force
    assign_bd_address -offset 0x10000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM30] [get_bd_addr_segs hbm_0/SAXI_30/HBM_MEM01] -force
    assign_bd_address -offset 0x20000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM30] [get_bd_addr_segs hbm_0/SAXI_30/HBM_MEM02] -force
    assign_bd_address -offset 0x30000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM30] [get_bd_addr_segs hbm_0/SAXI_30/HBM_MEM03] -force
    assign_bd_address -offset 0x40000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM30] [get_bd_addr_segs hbm_0/SAXI_30/HBM_MEM04] -force
    assign_bd_address -offset 0x50000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM30] [get_bd_addr_segs hbm_0/SAXI_30/HBM_MEM05] -force
    assign_bd_address -offset 0x60000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM30] [get_bd_addr_segs hbm_0/SAXI_30/HBM_MEM06] -force
    assign_bd_address -offset 0x70000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM30] [get_bd_addr_segs hbm_0/SAXI_30/HBM_MEM07] -force
    assign_bd_address -offset 0x80000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM30] [get_bd_addr_segs hbm_0/SAXI_30/HBM_MEM08] -force
    assign_bd_address -offset 0x90000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM30] [get_bd_addr_segs hbm_0/SAXI_30/HBM_MEM09] -force
    assign_bd_address -offset 0xA0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM30] [get_bd_addr_segs hbm_0/SAXI_30/HBM_MEM10] -force
    assign_bd_address -offset 0xB0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM30] [get_bd_addr_segs hbm_0/SAXI_30/HBM_MEM11] -force
    assign_bd_address -offset 0xC0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM30] [get_bd_addr_segs hbm_0/SAXI_30/HBM_MEM12] -force
    assign_bd_address -offset 0xD0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM30] [get_bd_addr_segs hbm_0/SAXI_30/HBM_MEM13] -force
    assign_bd_address -offset 0xE0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM30] [get_bd_addr_segs hbm_0/SAXI_30/HBM_MEM14] -force
    assign_bd_address -offset 0xF0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM30] [get_bd_addr_segs hbm_0/SAXI_30/HBM_MEM15] -force
    assign_bd_address -offset 0x000100000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM30] [get_bd_addr_segs hbm_0/SAXI_30/HBM_MEM16] -force
    assign_bd_address -offset 0x000110000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM30] [get_bd_addr_segs hbm_0/SAXI_30/HBM_MEM17] -force
    assign_bd_address -offset 0x000120000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM30] [get_bd_addr_segs hbm_0/SAXI_30/HBM_MEM18] -force
    assign_bd_address -offset 0x000130000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM30] [get_bd_addr_segs hbm_0/SAXI_30/HBM_MEM19] -force
    assign_bd_address -offset 0x000140000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM30] [get_bd_addr_segs hbm_0/SAXI_30/HBM_MEM20] -force
    assign_bd_address -offset 0x000150000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM30] [get_bd_addr_segs hbm_0/SAXI_30/HBM_MEM21] -force
    assign_bd_address -offset 0x000160000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM30] [get_bd_addr_segs hbm_0/SAXI_30/HBM_MEM22] -force
    assign_bd_address -offset 0x000170000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM30] [get_bd_addr_segs hbm_0/SAXI_30/HBM_MEM23] -force
    assign_bd_address -offset 0x000180000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM30] [get_bd_addr_segs hbm_0/SAXI_30/HBM_MEM24] -force
    assign_bd_address -offset 0x000190000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM30] [get_bd_addr_segs hbm_0/SAXI_30/HBM_MEM25] -force
    assign_bd_address -offset 0x0001A0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM30] [get_bd_addr_segs hbm_0/SAXI_30/HBM_MEM26] -force
    assign_bd_address -offset 0x0001B0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM30] [get_bd_addr_segs hbm_0/SAXI_30/HBM_MEM27] -force
    assign_bd_address -offset 0x0001C0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM30] [get_bd_addr_segs hbm_0/SAXI_30/HBM_MEM28] -force
    assign_bd_address -offset 0x0001D0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM30] [get_bd_addr_segs hbm_0/SAXI_30/HBM_MEM29] -force
    assign_bd_address -offset 0x0001E0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM30] [get_bd_addr_segs hbm_0/SAXI_30/HBM_MEM30] -force
    assign_bd_address -offset 0x0001F0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM30] [get_bd_addr_segs hbm_0/SAXI_30/HBM_MEM31] -force
    assign_bd_address -offset 0x00000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM31] [get_bd_addr_segs hbm_0/SAXI_31/HBM_MEM00] -force
    assign_bd_address -offset 0x10000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM31] [get_bd_addr_segs hbm_0/SAXI_31/HBM_MEM01] -force
    assign_bd_address -offset 0x20000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM31] [get_bd_addr_segs hbm_0/SAXI_31/HBM_MEM02] -force
    assign_bd_address -offset 0x30000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM31] [get_bd_addr_segs hbm_0/SAXI_31/HBM_MEM03] -force
    assign_bd_address -offset 0x40000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM31] [get_bd_addr_segs hbm_0/SAXI_31/HBM_MEM04] -force
    assign_bd_address -offset 0x50000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM31] [get_bd_addr_segs hbm_0/SAXI_31/HBM_MEM05] -force
    assign_bd_address -offset 0x60000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM31] [get_bd_addr_segs hbm_0/SAXI_31/HBM_MEM06] -force
    assign_bd_address -offset 0x70000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM31] [get_bd_addr_segs hbm_0/SAXI_31/HBM_MEM07] -force
    assign_bd_address -offset 0x80000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM31] [get_bd_addr_segs hbm_0/SAXI_31/HBM_MEM08] -force
    assign_bd_address -offset 0x90000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM31] [get_bd_addr_segs hbm_0/SAXI_31/HBM_MEM09] -force
    assign_bd_address -offset 0xA0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM31] [get_bd_addr_segs hbm_0/SAXI_31/HBM_MEM10] -force
    assign_bd_address -offset 0xB0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM31] [get_bd_addr_segs hbm_0/SAXI_31/HBM_MEM11] -force
    assign_bd_address -offset 0xC0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM31] [get_bd_addr_segs hbm_0/SAXI_31/HBM_MEM12] -force
    assign_bd_address -offset 0xD0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM31] [get_bd_addr_segs hbm_0/SAXI_31/HBM_MEM13] -force
    assign_bd_address -offset 0xE0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM31] [get_bd_addr_segs hbm_0/SAXI_31/HBM_MEM14] -force
    assign_bd_address -offset 0xF0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM31] [get_bd_addr_segs hbm_0/SAXI_31/HBM_MEM15] -force
    assign_bd_address -offset 0x000100000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM31] [get_bd_addr_segs hbm_0/SAXI_31/HBM_MEM16] -force
    assign_bd_address -offset 0x000110000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM31] [get_bd_addr_segs hbm_0/SAXI_31/HBM_MEM17] -force
    assign_bd_address -offset 0x000120000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM31] [get_bd_addr_segs hbm_0/SAXI_31/HBM_MEM18] -force
    assign_bd_address -offset 0x000130000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM31] [get_bd_addr_segs hbm_0/SAXI_31/HBM_MEM19] -force
    assign_bd_address -offset 0x000140000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM31] [get_bd_addr_segs hbm_0/SAXI_31/HBM_MEM20] -force
    assign_bd_address -offset 0x000150000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM31] [get_bd_addr_segs hbm_0/SAXI_31/HBM_MEM21] -force
    assign_bd_address -offset 0x000160000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM31] [get_bd_addr_segs hbm_0/SAXI_31/HBM_MEM22] -force
    assign_bd_address -offset 0x000170000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM31] [get_bd_addr_segs hbm_0/SAXI_31/HBM_MEM23] -force
    assign_bd_address -offset 0x000180000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM31] [get_bd_addr_segs hbm_0/SAXI_31/HBM_MEM24] -force
    assign_bd_address -offset 0x000190000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM31] [get_bd_addr_segs hbm_0/SAXI_31/HBM_MEM25] -force
    assign_bd_address -offset 0x0001A0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM31] [get_bd_addr_segs hbm_0/SAXI_31/HBM_MEM26] -force
    assign_bd_address -offset 0x0001B0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM31] [get_bd_addr_segs hbm_0/SAXI_31/HBM_MEM27] -force
    assign_bd_address -offset 0x0001C0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM31] [get_bd_addr_segs hbm_0/SAXI_31/HBM_MEM28] -force
    assign_bd_address -offset 0x0001D0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM31] [get_bd_addr_segs hbm_0/SAXI_31/HBM_MEM29] -force
    assign_bd_address -offset 0x0001E0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM31] [get_bd_addr_segs hbm_0/SAXI_31/HBM_MEM30] -force
    assign_bd_address -offset 0x0001F0000000 -range 0x10000000 -target_address_space [get_bd_addr_spaces cl_0/M_AXI_HBM31] [get_bd_addr_segs hbm_0/SAXI_31/HBM_MEM31] -force


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

}


proc set_params {ip_name key_list value_list obj_type} {
  set upperLimit [llength $key_list]
  for {set i 0} {$i < $upperLimit} {incr i} {
    set_property CONFIG.[lindex $key_list $i] [lindex $value_list $i] [${obj_type} ${ip_name}]
  }
}


proc create_axi_reg_slice { ip_name param_list} {
  # param_list = [PROTOCOL, ADDR_WIDTH, DATA_WIDTH]
  set char_list [list PROTOCOL ADDR_WIDTH DATA_WIDTH]
  create_bd_cell -type ip -vlnv xilinx.com:ip:axi_register_slice:2.1 ${ip_name}
  startgroup
    set upperLimit [llength $char_list]
    for {set i 0} {$i < $upperLimit} {incr i} {
      set_property CONFIG.[lindex $char_list $i].VALUE_SRC {USER} [get_bd_cells ${ip_name}]
      set_property CONFIG.[lindex $char_list $i] [lindex $param_list $i] [get_bd_cells ${ip_name}]
    }
  endgroup

  # disable user bit. The current shell.v does not include the user bits.
  # however HLS kernels sometimes will enable those bits which will be propagated
  # to the axi registers by default. As a result, the port list of the kernel and that of the
  # shell will have inconsistency. Thus here we enforce those bits are turned off.
  startgroup
  set_property -dict [list CONFIG.ARUSER_WIDTH.VALUE_SRC USER CONFIG.AWUSER_WIDTH.VALUE_SRC USER CONFIG.RUSER_WIDTH.VALUE_SRC USER CONFIG.BUSER_WIDTH.VALUE_SRC USER CONFIG.WUSER_WIDTH.VALUE_SRC USER] [get_bd_cells ${ip_name}]

  set_property -dict [list \
    CONFIG.ARUSER_WIDTH {0} \
    CONFIG.RUSER_WIDTH {0} \
    CONFIG.AWUSER_WIDTH {0} \
    CONFIG.WUSER_WIDTH {0} \
    CONFIG.BUSER_WIDTH {0} \
  ] [get_bd_cells ${ip_name}]
  endgroup
}

proc create_axi_port { ip_name param_list isMaster} {
  # param_list = [DATA_WIDTH PROTOCOL ADDR_WIDTH HAS_REGION NUM_READ_OUTSTANDING NUM_WRITE_OUTSTANDING]
  set char_list [list DATA_WIDTH PROTOCOL ADDR_WIDTH HAS_REGION NUM_READ_OUTSTANDING NUM_WRITE_OUTSTANDING FREQ_HZ]
  if {$isMaster == 1} {
    create_bd_intf_port -mode Master -vlnv xilinx.com:interface:aximm_rtl:1.0 ${ip_name}
  } else {
    create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 ${ip_name}
  }
  set upperLimit [llength $char_list]
  for {set i 0} {$i < $upperLimit} {incr i} {
    set_property CONFIG.[lindex $char_list $i] [lindex $param_list $i] [get_bd_intf_ports ${ip_name}]
  }
}


proc create_smartint { ip_name param_list} {
  set char_list [list NUM_CLKS NUM_SI]
  create_bd_cell -type ip -vlnv xilinx.com:ip:smartconnect:1.0 ${ip_name}
  set_params $ip_name $char_list $param_list get_bd_cells
}

proc create_xdma_datapath { HBM_FREQ_MHz } {
  # Since the DMA by default uses the PCIe block on the rightmost clock region column,
  # we choose to connect it with the right most HBM bank

  # Create axi register slice for smartconnect31=><AXI_REGISTER_SLICE_31>=>HBM31
  set arg_list1 [list AXI3 64 256]
  set ip_name1  "axi_register_slice_31"
  create_axi_reg_slice  $ip_name1 $arg_list1
  connect_bd_net [get_bd_ports CLK_HBM] [get_bd_pins ${ip_name1}/aclk]
  connect_bd_net [get_bd_ports ARESETN_HBM] [get_bd_pins ${ip_name1}/aresetn]

  # XDMA is connected to <HBM AXI31>
  set arg_list2 [list 256 AXI3 64 0 2 2 [expr ${HBM_FREQ_MHz} * 1000000]]
  set ip_name2  "M_AXI_HBM31"
  create_axi_port $ip_name2 $arg_list2 1
  connect_bd_intf_net [get_bd_intf_pins ${ip_name1}/M_AXI] [get_bd_intf_ports $ip_name2]

  # Create axi register slice for XDMA=><AXI_REGISTER_SLICE_XDMA>=>smartconnect
  set arg_list3 [list AXI4 64 64 ]
  set ip_name3 "axi_register_slice_xdma"
  create_axi_reg_slice  $ip_name3 $arg_list3
  connect_bd_net [get_bd_ports CLK_XDMA] [get_bd_pins ${ip_name3}/aclk]
  connect_bd_net [get_bd_ports ARESETN_XDMA] [get_bd_pins ${ip_name3}/aresetn]

  # XDMA is connected to HBM AXI31
  set arg_list4 [list 64 AXI4 64 1 2 2 [expr ${HBM_FREQ_MHz} * 1000000]]
  set ip_name4  "S_AXI_XDMA"
  create_axi_port $ip_name4 $arg_list4 0
  set_property -dict [list CONFIG.ID_WIDTH 4] [get_bd_intf_ports ${ip_name4}]
  connect_bd_intf_net [get_bd_intf_pins ${ip_name3}/S_AXI] [get_bd_intf_ports $ip_name4]

  # Add smartconnect IP for AXI_REGISTER_SLICE_XDMA=><smartconnect31>=>AXI_REGISTER_SLICE_31
  set arg_list5 [list 2 1]
  set ip_name5 "smartconnect_31"
  create_smartint $ip_name5 $arg_list5
  connect_bd_net [get_bd_ports CLK_XDMA] [get_bd_pins ${ip_name5}/aclk]
  connect_bd_net [get_bd_ports CLK_HBM] [get_bd_pins ${ip_name5}/aclk1]
  connect_bd_net [get_bd_ports ARESETN_XDMA] [get_bd_pins ${ip_name5}/aresetn]
  connect_bd_intf_net [get_bd_intf_pins ${ip_name5}/M00_AXI] [get_bd_intf_pins ${ip_name1}/S_AXI]
  connect_bd_intf_net [get_bd_intf_pins ${ip_name3}/M_AXI] [get_bd_intf_pins ${ip_name5}/S00_AXI]
  assign_bd_address -target_address_space /S_AXI_XDMA [get_bd_addr_segs ${ip_name2}/Reg] -force
  set_property offset 0x0000000000000000 [get_bd_addr_segs S_AXI_XDMA/SEG_${ip_name2}_Reg]
  set_property range 8G [get_bd_addr_segs S_AXI_XDMA/SEG_${ip_name2}_Reg]
}

proc create_kernel_control_path { kernel_name } {
  # Create XDMA_BYPASS peripheral
  set ip_name "xdma_0_axi_periph"
  create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 ${ip_name}
  set_property CONFIG.NUM_MI {1} [get_bd_cells ${ip_name}]
  connect_bd_net [get_bd_pins ${ip_name}/ACLK]        [get_bd_ports CLK_XDMA]
  connect_bd_net [get_bd_pins ${ip_name}/S00_ACLK]    [get_bd_ports CLK_XDMA]
  connect_bd_net [get_bd_pins ${ip_name}/M00_ACLK]    [get_bd_ports CLK_KL]
  connect_bd_net [get_bd_pins ${ip_name}/ARESETN]     [get_bd_ports ARESETN_XDMA]
  connect_bd_net [get_bd_pins ${ip_name}/S00_ARESETN] [get_bd_ports ARESETN_XDMA]
  connect_bd_net [get_bd_pins ${ip_name}/M00_ARESETN] [get_bd_ports ARESETN_KL]

  # Create kernel IP axi_control=><kernel>=>smartconnect01
  create_bd_cell -type module -reference ${kernel_name} ${kernel_name}_0
  connect_bd_net [get_bd_pins ${kernel_name}_0/ap_clk] [get_bd_ports CLK_KL]
  connect_bd_net [get_bd_pins ${kernel_name}_0/ap_rst_n] [get_bd_ports ARESETN_KL]
  connect_bd_intf_net -boundary_type upper [get_bd_intf_pins xdma_0_axi_periph/M00_AXI] [get_bd_intf_pins ${kernel_name}_0/s_axi_control]


  # Creat a port to control xdma_0_axi_periph
  create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 S_AXI_BYPASS
  set_property -dict [list \
    CONFIG.ADDR_WIDTH 64 \
    CONFIG.DATA_WIDTH 64 \
    CONFIG.HAS_BURST 1 \
    CONFIG.HAS_CACHE 1 \
    CONFIG.HAS_LOCK 1 \
    CONFIG.HAS_PROT 1 \
    CONFIG.HAS_QOS 1 \
    CONFIG.HAS_REGION 1 \
    CONFIG.ID_WIDTH 4 \
    CONFIG.MAX_BURST_LENGTH 256 \
    CONFIG.NUM_READ_OUTSTANDING 2 \
    CONFIG.NUM_READ_THREADS 2 \
    CONFIG.NUM_WRITE_OUTSTANDING 2 \
    CONFIG.NUM_WRITE_THREADS 2 \
    CONFIG.PROTOCOL AXI4 \
    CONFIG.SUPPORTS_NARROW_BURST 1\
  ] [get_bd_intf_ports S_AXI_BYPASS]
  connect_bd_intf_net [get_bd_intf_pins xdma_0_axi_periph/S00_AXI] [get_bd_intf_ports S_AXI_BYPASS]
  assign_bd_address -target_address_space /S_AXI_BYPASS [get_bd_addr_segs ${kernel_name}_0/s_axi_control/reg0] -force
}

proc create_basic_ports {} {
  # Create clock and reset
  create_bd_port -dir I -type clk -freq_hz 100000000 CLK_HBM
  create_bd_port -dir I -type clk -freq_hz 100000000 CLK_XDMA
  create_bd_port -dir I -type clk -freq_hz 100000000 CLK_KL

  create_bd_port -dir I -type rst ARESETN_HBM
  create_bd_port -dir I -type rst ARESETN_XDMA
  create_bd_port -dir I -type rst ARESETN_KL
}

proc zfill2digit {mem_num} {
  if { $mem_num < 10 } {
    return "0${mem_num}"
  } else {
    return "${mem_num}"
  }
}

proc extract_mem_interface { input_string } {
  # Use the regexp command to match the pattern in the input string
  if {[regexp {(\w+)\[(\d+)\]} $input_string match mem_type _port_num]} {
      if { $mem_type != "HBM" && $mem_type != "DDR" && $mem_type != "PLRAM" } {
        error "Memory type not supported, please use HBM, DDR or PLRAM"
        return
      }
      set port_num [zfill2digit ${_port_num}]
      return [list $mem_type $port_num]
  } else {
      error "Pattern not found in the input string, eg. HBM[0]"
      return
  }
}

proc create_kernel_master {arg2hbm kernel_name HBM_FREQ_MHz} {
# Iterate over the dictionary using the dict for command
  dict for {kernel_port mem_port} $arg2hbm {
    set result [extract_mem_interface $mem_port]
    # Split the result list into two strings
    lassign $result mem_type mem_num

    # Create axi register slice for smartconnect0<X>=><AXI_REGISTER_SLICE_0<X>>=>HBM0<X>
    set arg_list1 [list AXI3 64 256]
    set ip_name1 "axi_register_slice_${mem_num}"
    create_axi_reg_slice ${ip_name1} ${arg_list1}
    connect_bd_net [get_bd_ports CLK_HBM] [get_bd_pins ${ip_name1}/aclk]
    connect_bd_net [get_bd_ports ARESETN_HBM] [get_bd_pins ${ip_name1}/aresetn]

    # Create axi ports for smartconnect0<X> => AXI_REGISTER_SLICE_0<X> => <HBM0<X>>
    set arg_list2 [list 256 AXI3 64 0 2 2 [expr ${HBM_FREQ_MHz} * 1000000]]
    set ip_name2 "M_AXI_HBM$mem_num"
    create_axi_port ${ip_name2} ${arg_list2} 1
    connect_bd_intf_net [get_bd_intf_pins ${ip_name1}/M_AXI] [get_bd_intf_ports ${ip_name2}]


    # Add smartconnect IP for AXI_REGISTER_SLICE_XDMA=><smartconnect$mem_num>=>AXI_REGISTER_SLICE_$mem_num
    set arg_list3 [list 2 1]
    set ip_name3 "smartconnect_$mem_num"
    create_smartint $ip_name3 $arg_list3
    connect_bd_net [get_bd_ports CLK_KL] [get_bd_pins ${ip_name3}/aclk]
    connect_bd_net [get_bd_ports CLK_HBM] [get_bd_pins ${ip_name3}/aclk1]
    connect_bd_net [get_bd_ports ARESETN_KL] [get_bd_pins ${ip_name3}/aresetn]
    connect_bd_intf_net [get_bd_intf_pins ${kernel_name}_0/${kernel_port}] [get_bd_intf_pins smartconnect_${mem_num}/S00_AXI]
    connect_bd_intf_net [get_bd_intf_pins ${ip_name3}/M00_AXI] [get_bd_intf_pins axi_register_slice_$mem_num/S_AXI]

    # Assign address to the kernel port
    assign_bd_address -target_address_space /${kernel_name}_0/${kernel_port} [get_bd_addr_segs M_AXI_HBM${mem_num}/Reg] -force
    set_property offset 0x0000000000000000 [get_bd_addr_segs ${kernel_name}_0/${kernel_port}/SEG_M_AXI_HBM${mem_num}_Reg]
    set_property range 8G [get_bd_addr_segs ${kernel_name}_0/${kernel_port}/SEG_M_AXI_HBM${mem_num}_Reg]
  }
}

proc create_cl { misc_params arg2hbm HBM_FREQ_MHz} {
  # Create a bd file for Custom Logic
  create_bd_design "cl"

  create_basic_ports
  create_xdma_datapath ${HBM_FREQ_MHz}

  set kernel_name [dict get $misc_params "kernel_name"]
  create_kernel_control_path ${kernel_name}
  create_kernel_master $arg2hbm ${kernel_name} ${HBM_FREQ_MHz}

}

proc add_dummy_ports { HBM_FREQ_MHz } {

  for {set i 0} {$i < 32 } {incr i 1} {
    set mem_num [zfill2digit $i]

    if { [get_bd_intf_ports M_AXI_HBM$mem_num] == "" } {
      set arg_list1 [list 256 AXI3 64 0 2 2 [expr ${HBM_FREQ_MHz} * 1000000]]
      set ip_name1 "M_AXI_HBM$mem_num"
      create_axi_port ${ip_name1} ${arg_list1} 1

      set ip_name2 "axi_gnd_$mem_num"
      create_bd_cell -type module -reference axi_gnd ${ip_name2}
      set_property CONFIG.FREQ_HZ [expr ${HBM_FREQ_MHz} * 1000000 ] [get_bd_intf_pins /${ip_name2}/M_AXI_HBM]
      connect_bd_intf_net [get_bd_intf_ports ${ip_name1}] [get_bd_intf_pins /${ip_name2}/M_AXI_HBM]
      connect_bd_net [get_bd_ports CLK_HBM] [get_bd_pins ${ip_name2}/CLK_HBM]
      connect_bd_net [get_bd_ports ARESETN_HBM] [get_bd_pins ${ip_name2}/ARESETN_HBM]

      # Assign address to the dummy port
      assign_bd_address -target_address_space /${ip_name2}/M_AXI_HBM [get_bd_addr_segs ${ip_name1}/Reg] -force
      set_property offset 0x0000000000000000 [get_bd_addr_segs ${ip_name2}/M_AXI_HBM/SEG_${ip_name1}_Reg]
      set_property range 8G [get_bd_addr_segs ${ip_name2}/M_AXI_HBM/SEG_${ip_name1}_Reg]
    }
  }
}
