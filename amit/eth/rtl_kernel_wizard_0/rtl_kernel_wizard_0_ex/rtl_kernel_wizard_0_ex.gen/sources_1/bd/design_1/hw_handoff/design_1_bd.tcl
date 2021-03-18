
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
set scripts_vivado_version 2020.2
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
# dsp_send, dsp_send, rtl_kernel_wizard_0_control_s_axi, serial_pipe, serial_pipe, serial_pipe

# Please add the sources of those modules before sourcing this Tcl script.

# If there is no project opened, this script will create a
# project, but make sure you do not have an existing project
# <./myproj/project_1.xpr> in the current working folder.

set list_projs [get_projects -quiet]
if { $list_projs eq "" } {
   create_project project_1 myproj -part xcu280-fsvh2892-2L-e
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
  set S00_AXI_0 [ create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 S00_AXI_0 ]
  set_property -dict [ list \
   CONFIG.ADDR_WIDTH {32} \
   CONFIG.ARUSER_WIDTH {0} \
   CONFIG.AWUSER_WIDTH {0} \
   CONFIG.BUSER_WIDTH {0} \
   CONFIG.DATA_WIDTH {32} \
   CONFIG.HAS_BRESP {1} \
   CONFIG.HAS_BURST {1} \
   CONFIG.HAS_CACHE {1} \
   CONFIG.HAS_LOCK {1} \
   CONFIG.HAS_PROT {1} \
   CONFIG.HAS_QOS {1} \
   CONFIG.HAS_REGION {0} \
   CONFIG.HAS_RRESP {1} \
   CONFIG.HAS_WSTRB {1} \
   CONFIG.ID_WIDTH {0} \
   CONFIG.MAX_BURST_LENGTH {1} \
   CONFIG.NUM_READ_OUTSTANDING {2} \
   CONFIG.NUM_READ_THREADS {1} \
   CONFIG.NUM_WRITE_OUTSTANDING {2} \
   CONFIG.NUM_WRITE_THREADS {1} \
   CONFIG.PROTOCOL {AXI4LITE} \
   CONFIG.READ_WRITE_MODE {READ_WRITE} \
   CONFIG.RUSER_BITS_PER_BYTE {0} \
   CONFIG.RUSER_WIDTH {0} \
   CONFIG.SUPPORTS_NARROW_BURST {0} \
   CONFIG.WUSER_BITS_PER_BYTE {0} \
   CONFIG.WUSER_WIDTH {0} \
   ] $S00_AXI_0

  set gt_ref_clk_0 [ create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:diff_clock_rtl:1.0 gt_ref_clk_0 ]
  set_property -dict [ list \
   CONFIG.FREQ_HZ {156250000} \
   ] $gt_ref_clk_0

  set gt_ref_clk_1 [ create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:diff_clock_rtl:1.0 gt_ref_clk_1 ]
  set_property -dict [ list \
   CONFIG.FREQ_HZ {156250000} \
   ] $gt_ref_clk_1

  set gt_serial_port_0 [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:gt_rtl:1.0 gt_serial_port_0 ]

  set gt_serial_port_1 [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:gt_rtl:1.0 gt_serial_port_1 ]


  # Create ports
  set ACLK_EN_0 [ create_bd_port -dir I ACLK_EN_0 ]
  set ARESET_0 [ create_bd_port -dir I ARESET_0 ]
  set aclk_0 [ create_bd_port -dir I -type clk aclk_0 ]
  set_property -dict [ list \
   CONFIG.ASSOCIATED_BUSIF {S00_AXI_0} \
 ] $aclk_0
  set ap_done_0 [ create_bd_port -dir I ap_done_0 ]
  set ap_idle_0 [ create_bd_port -dir I ap_idle_0 ]
  set ap_ready_0 [ create_bd_port -dir I ap_ready_0 ]
  set ap_start_0 [ create_bd_port -dir O ap_start_0 ]
  set axi00_ptr0_0 [ create_bd_port -dir O -from 63 -to 0 axi00_ptr0_0 ]
  set interrupt_0 [ create_bd_port -dir O -type intr interrupt_0 ]
  set locked [ create_bd_port -dir I locked ]
  set scalar00_0 [ create_bd_port -dir O -from 31 -to 0 scalar00_0 ]

  # Create instance: cmac_usplus_0, and set properties
  set cmac_usplus_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:cmac_usplus:3.1 cmac_usplus_0 ]
  set_property -dict [ list \
   CONFIG.CMAC_CAUI4_MODE {1} \
   CONFIG.CMAC_CORE_SELECT {CMACE4_X0Y5} \
   CONFIG.GT_GROUP_SELECT {X0Y40~X0Y43} \
   CONFIG.GT_REF_CLK_FREQ {156.25} \
   CONFIG.GT_RX_BUFFER_BYPASS {0} \
   CONFIG.LANE10_GT_LOC {NA} \
   CONFIG.LANE1_GT_LOC {X0Y40} \
   CONFIG.LANE2_GT_LOC {X0Y41} \
   CONFIG.LANE3_GT_LOC {X0Y42} \
   CONFIG.LANE4_GT_LOC {X0Y43} \
   CONFIG.LANE5_GT_LOC {NA} \
   CONFIG.LANE6_GT_LOC {NA} \
   CONFIG.LANE7_GT_LOC {NA} \
   CONFIG.LANE8_GT_LOC {NA} \
   CONFIG.LANE9_GT_LOC {NA} \
   CONFIG.NUM_LANES {4x25} \
   CONFIG.PLL_TYPE {QPLL0} \
   CONFIG.RX_FLOW_CONTROL {0} \
   CONFIG.RX_GT_BUFFER {1} \
   CONFIG.TX_FLOW_CONTROL {0} \
   CONFIG.USER_INTERFACE {AXIS} \
 ] $cmac_usplus_0

  # Create instance: cmac_usplus_1, and set properties
  set cmac_usplus_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:cmac_usplus:3.1 cmac_usplus_1 ]
  set_property -dict [ list \
   CONFIG.CMAC_CAUI4_MODE {1} \
   CONFIG.CMAC_CORE_SELECT {CMACE4_X0Y7} \
   CONFIG.GT_GROUP_SELECT {X0Y44~X0Y47} \
   CONFIG.GT_REF_CLK_FREQ {156.25} \
   CONFIG.GT_RX_BUFFER_BYPASS {0} \
   CONFIG.LANE10_GT_LOC {NA} \
   CONFIG.LANE1_GT_LOC {X0Y44} \
   CONFIG.LANE2_GT_LOC {X0Y45} \
   CONFIG.LANE3_GT_LOC {X0Y46} \
   CONFIG.LANE4_GT_LOC {X0Y47} \
   CONFIG.LANE5_GT_LOC {NA} \
   CONFIG.LANE6_GT_LOC {NA} \
   CONFIG.LANE7_GT_LOC {NA} \
   CONFIG.LANE8_GT_LOC {NA} \
   CONFIG.LANE9_GT_LOC {NA} \
   CONFIG.NUM_LANES {4x25} \
   CONFIG.PLL_TYPE {QPLL1} \
   CONFIG.RX_FLOW_CONTROL {0} \
   CONFIG.RX_GT_BUFFER {1} \
   CONFIG.TX_FLOW_CONTROL {0} \
   CONFIG.USER_INTERFACE {AXIS} \
 ] $cmac_usplus_1

  # Create instance: dsp_send_0, and set properties
  set block_name dsp_send
  set block_cell_name dsp_send_0
  if { [catch {set dsp_send_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $dsp_send_0 eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: dsp_send_1, and set properties
  set block_name dsp_send
  set block_cell_name dsp_send_1
  if { [catch {set dsp_send_1 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $dsp_send_1 eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: embedded_test_ip_wra_0, and set properties
  set embedded_test_ip_wra_0 [ create_bd_cell -type ip -vlnv stfc_tech:user:embedded_test_ip_wrapper:1.0 embedded_test_ip_wra_0 ]

  set_property -dict [ list \
   CONFIG.POLARITY {ACTIVE_HIGH} \
 ] [get_bd_pins /embedded_test_ip_wra_0/chk_axi4s_s_rst]

  set_property -dict [ list \
   CONFIG.POLARITY {ACTIVE_HIGH} \
 ] [get_bd_pins /embedded_test_ip_wra_0/gen_axi4s_m_rst]

  # Create instance: embedded_test_ip_wra_1, and set properties
  set embedded_test_ip_wra_1 [ create_bd_cell -type ip -vlnv stfc_tech:user:embedded_test_ip_wrapper:1.0 embedded_test_ip_wra_1 ]

  set_property -dict [ list \
   CONFIG.POLARITY {ACTIVE_HIGH} \
 ] [get_bd_pins /embedded_test_ip_wra_1/chk_axi4s_s_rst]

  set_property -dict [ list \
   CONFIG.POLARITY {ACTIVE_HIGH} \
 ] [get_bd_pins /embedded_test_ip_wra_1/gen_axi4s_m_rst]

  # Create instance: ila_0, and set properties
  set ila_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:ila:6.2 ila_0 ]
  set_property -dict [ list \
   CONFIG.ALL_PROBE_SAME_MU_CNT {1} \
   CONFIG.C_ADV_TRIGGER {false} \
   CONFIG.C_ENABLE_ILA_AXI_MON {false} \
   CONFIG.C_EN_STRG_QUAL {0} \
   CONFIG.C_INPUT_PIPE_STAGES {3} \
   CONFIG.C_MONITOR_TYPE {Native} \
   CONFIG.C_NUM_OF_PROBES {17} \
   CONFIG.C_PROBE0_MU_CNT {1} \
   CONFIG.C_PROBE10_MU_CNT {1} \
   CONFIG.C_PROBE11_MU_CNT {1} \
   CONFIG.C_PROBE12_MU_CNT {1} \
   CONFIG.C_PROBE13_MU_CNT {1} \
   CONFIG.C_PROBE13_WIDTH {4} \
   CONFIG.C_PROBE14_MU_CNT {1} \
   CONFIG.C_PROBE14_WIDTH {4} \
   CONFIG.C_PROBE1_MU_CNT {1} \
   CONFIG.C_PROBE2_MU_CNT {1} \
   CONFIG.C_PROBE3_MU_CNT {1} \
   CONFIG.C_PROBE4_MU_CNT {1} \
   CONFIG.C_PROBE5_MU_CNT {1} \
   CONFIG.C_PROBE6_MU_CNT {1} \
   CONFIG.C_PROBE7_MU_CNT {1} \
   CONFIG.C_PROBE8_MU_CNT {1} \
   CONFIG.C_PROBE9_MU_CNT {1} \
 ] $ila_0

  # Create instance: ila_1, and set properties
  set ila_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:ila:6.2 ila_1 ]
  set_property -dict [ list \
   CONFIG.ALL_PROBE_SAME_MU_CNT {1} \
   CONFIG.C_ADV_TRIGGER {false} \
   CONFIG.C_ENABLE_ILA_AXI_MON {true} \
   CONFIG.C_EN_STRG_QUAL {0} \
   CONFIG.C_INPUT_PIPE_STAGES {3} \
   CONFIG.C_MONITOR_TYPE {AXI} \
   CONFIG.C_NUM_OF_PROBES {19} \
   CONFIG.C_PROBE0_MU_CNT {1} \
   CONFIG.C_PROBE10_MU_CNT {1} \
   CONFIG.C_PROBE11_MU_CNT {1} \
   CONFIG.C_PROBE12_MU_CNT {1} \
   CONFIG.C_PROBE13_MU_CNT {1} \
   CONFIG.C_PROBE13_WIDTH {1} \
   CONFIG.C_PROBE14_MU_CNT {1} \
   CONFIG.C_PROBE14_WIDTH {1} \
   CONFIG.C_PROBE15_MU_CNT {1} \
   CONFIG.C_PROBE16_MU_CNT {1} \
   CONFIG.C_PROBE17_MU_CNT {1} \
   CONFIG.C_PROBE18_MU_CNT {1} \
   CONFIG.C_PROBE19_MU_CNT {1} \
   CONFIG.C_PROBE1_MU_CNT {1} \
   CONFIG.C_PROBE20_MU_CNT {1} \
   CONFIG.C_PROBE21_MU_CNT {1} \
   CONFIG.C_PROBE22_MU_CNT {1} \
   CONFIG.C_PROBE23_MU_CNT {1} \
   CONFIG.C_PROBE24_MU_CNT {1} \
   CONFIG.C_PROBE25_MU_CNT {1} \
   CONFIG.C_PROBE26_MU_CNT {1} \
   CONFIG.C_PROBE27_MU_CNT {1} \
   CONFIG.C_PROBE28_MU_CNT {1} \
   CONFIG.C_PROBE29_MU_CNT {1} \
   CONFIG.C_PROBE2_MU_CNT {1} \
   CONFIG.C_PROBE30_MU_CNT {1} \
   CONFIG.C_PROBE31_MU_CNT {1} \
   CONFIG.C_PROBE32_MU_CNT {1} \
   CONFIG.C_PROBE33_MU_CNT {1} \
   CONFIG.C_PROBE34_MU_CNT {1} \
   CONFIG.C_PROBE35_MU_CNT {1} \
   CONFIG.C_PROBE36_MU_CNT {1} \
   CONFIG.C_PROBE37_MU_CNT {1} \
   CONFIG.C_PROBE38_MU_CNT {1} \
   CONFIG.C_PROBE39_MU_CNT {1} \
   CONFIG.C_PROBE3_MU_CNT {1} \
   CONFIG.C_PROBE40_MU_CNT {1} \
   CONFIG.C_PROBE41_MU_CNT {1} \
   CONFIG.C_PROBE42_MU_CNT {1} \
   CONFIG.C_PROBE43_MU_CNT {1} \
   CONFIG.C_PROBE4_MU_CNT {1} \
   CONFIG.C_PROBE5_MU_CNT {1} \
   CONFIG.C_PROBE6_MU_CNT {1} \
   CONFIG.C_PROBE7_MU_CNT {1} \
   CONFIG.C_PROBE8_MU_CNT {1} \
   CONFIG.C_PROBE9_MU_CNT {1} \
 ] $ila_1

  # Create instance: proc_sys_reset_0, and set properties
  set proc_sys_reset_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 proc_sys_reset_0 ]

  # Create instance: proc_sys_reset_1, and set properties
  set proc_sys_reset_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 proc_sys_reset_1 ]

  # Create instance: rtl_kernel_wizard_0_0, and set properties
  set block_name rtl_kernel_wizard_0_control_s_axi
  set block_cell_name rtl_kernel_wizard_0_0
  if { [catch {set rtl_kernel_wizard_0_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $rtl_kernel_wizard_0_0 eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
    set_property -dict [ list \
   CONFIG.C_S_AXI_ADDR_WIDTH {12} \
 ] $rtl_kernel_wizard_0_0

  # Create instance: serial_pipe_0, and set properties
  set block_name serial_pipe
  set block_cell_name serial_pipe_0
  if { [catch {set serial_pipe_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $serial_pipe_0 eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: serial_pipe_1, and set properties
  set block_name serial_pipe
  set block_cell_name serial_pipe_1
  if { [catch {set serial_pipe_1 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $serial_pipe_1 eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: serial_pipe_2, and set properties
  set block_name serial_pipe
  set block_cell_name serial_pipe_2
  if { [catch {set serial_pipe_2 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $serial_pipe_2 eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: smartconnect_0, and set properties
  set smartconnect_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:smartconnect:1.0 smartconnect_0 ]
  set_property -dict [ list \
   CONFIG.NUM_MI {4} \
   CONFIG.NUM_SI {1} \
 ] $smartconnect_0

  # Create instance: smartconnect_1, and set properties
  set smartconnect_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:smartconnect:1.0 smartconnect_1 ]
  set_property -dict [ list \
   CONFIG.NUM_MI {2} \
   CONFIG.NUM_SI {1} \
 ] $smartconnect_1

  # Create instance: udp_core_eval_0, and set properties
  set udp_core_eval_0 [ create_bd_cell -type ip -vlnv stfc_tech:user:udp_core_eval:1.0 udp_core_eval_0 ]

  set_property -dict [ list \
   CONFIG.POLARITY {ACTIVE_HIGH} \
 ] [get_bd_pins /udp_core_eval_0/rx_axis_s_rst]

  set_property -dict [ list \
   CONFIG.POLARITY {ACTIVE_HIGH} \
 ] [get_bd_pins /udp_core_eval_0/tx_axis_m_rst]

  # Create instance: udp_core_eval_1, and set properties
  set udp_core_eval_1 [ create_bd_cell -type ip -vlnv stfc_tech:user:udp_core_eval:1.0 udp_core_eval_1 ]

  set_property -dict [ list \
   CONFIG.POLARITY {ACTIVE_HIGH} \
 ] [get_bd_pins /udp_core_eval_1/rx_axis_s_rst]

  set_property -dict [ list \
   CONFIG.POLARITY {ACTIVE_HIGH} \
 ] [get_bd_pins /udp_core_eval_1/tx_axis_m_rst]

  # Create instance: util_vector_logic_0, and set properties
  set util_vector_logic_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_vector_logic:2.0 util_vector_logic_0 ]
  set_property -dict [ list \
   CONFIG.C_OPERATION {not} \
   CONFIG.C_SIZE {1} \
   CONFIG.LOGO_FILE {data/sym_notgate.png} \
 ] $util_vector_logic_0

  # Create instance: util_vector_logic_2, and set properties
  set util_vector_logic_2 [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_vector_logic:2.0 util_vector_logic_2 ]
  set_property -dict [ list \
   CONFIG.C_OPERATION {not} \
   CONFIG.C_SIZE {1} \
   CONFIG.LOGO_FILE {data/sym_notgate.png} \
 ] $util_vector_logic_2

  # Create instance: util_vector_logic_4, and set properties
  set util_vector_logic_4 [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_vector_logic:2.0 util_vector_logic_4 ]
  set_property -dict [ list \
   CONFIG.C_OPERATION {not} \
   CONFIG.C_SIZE {1} \
   CONFIG.LOGO_FILE {data/sym_notgate.png} \
 ] $util_vector_logic_4

  # Create instance: util_vector_logic_5, and set properties
  set util_vector_logic_5 [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_vector_logic:2.0 util_vector_logic_5 ]
  set_property -dict [ list \
   CONFIG.C_OPERATION {not} \
   CONFIG.C_SIZE {1} \
   CONFIG.LOGO_FILE {data/sym_notgate.png} \
 ] $util_vector_logic_5

  # Create instance: util_vector_logic_6, and set properties
  set util_vector_logic_6 [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_vector_logic:2.0 util_vector_logic_6 ]
  set_property -dict [ list \
   CONFIG.C_OPERATION {not} \
   CONFIG.C_SIZE {1} \
   CONFIG.LOGO_FILE {data/sym_notgate.png} \
 ] $util_vector_logic_6

  # Create instance: util_vector_logic_9, and set properties
  set util_vector_logic_9 [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_vector_logic:2.0 util_vector_logic_9 ]
  set_property -dict [ list \
   CONFIG.C_OPERATION {or} \
   CONFIG.C_SIZE {1} \
   CONFIG.LOGO_FILE {data/sym_orgate.png} \
 ] $util_vector_logic_9

  # Create instance: util_vector_logic_10, and set properties
  set util_vector_logic_10 [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_vector_logic:2.0 util_vector_logic_10 ]
  set_property -dict [ list \
   CONFIG.C_OPERATION {and} \
   CONFIG.C_SIZE {1} \
   CONFIG.LOGO_FILE {data/sym_andgate.png} \
 ] $util_vector_logic_10

  # Create instance: util_vector_logic_11, and set properties
  set util_vector_logic_11 [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_vector_logic:2.0 util_vector_logic_11 ]
  set_property -dict [ list \
   CONFIG.C_OPERATION {or} \
   CONFIG.C_SIZE {1} \
   CONFIG.LOGO_FILE {data/sym_orgate.png} \
 ] $util_vector_logic_11

  # Create instance: util_vector_logic_12, and set properties
  set util_vector_logic_12 [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_vector_logic:2.0 util_vector_logic_12 ]
  set_property -dict [ list \
   CONFIG.C_OPERATION {or} \
   CONFIG.C_SIZE {1} \
   CONFIG.LOGO_FILE {data/sym_orgate.png} \
 ] $util_vector_logic_12

  # Create instance: util_vector_logic_13, and set properties
  set util_vector_logic_13 [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_vector_logic:2.0 util_vector_logic_13 ]
  set_property -dict [ list \
   CONFIG.C_OPERATION {and} \
   CONFIG.C_SIZE {1} \
   CONFIG.LOGO_FILE {data/sym_andgate.png} \
 ] $util_vector_logic_13

  # Create instance: util_vector_logic_15, and set properties
  set util_vector_logic_15 [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_vector_logic:2.0 util_vector_logic_15 ]
  set_property -dict [ list \
   CONFIG.C_OPERATION {not} \
   CONFIG.C_SIZE {1} \
   CONFIG.LOGO_FILE {data/sym_notgate.png} \
 ] $util_vector_logic_15

  # Create instance: xlconstant_0, and set properties
  set xlconstant_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_0 ]

  # Create instance: xlconstant_1, and set properties
  set xlconstant_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_1 ]

  # Create instance: xlconstant_2, and set properties
  set xlconstant_2 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_2 ]

  # Create interface connections
  connect_bd_intf_net -intf_net S00_AXI_0_1 [get_bd_intf_ports S00_AXI_0] [get_bd_intf_pins smartconnect_1/S00_AXI]
connect_bd_intf_net -intf_net [get_bd_intf_nets S00_AXI_0_1] [get_bd_intf_ports S00_AXI_0] [get_bd_intf_pins ila_1/SLOT_0_AXI]
  connect_bd_intf_net -intf_net cmac_usplus_0_axis_rx [get_bd_intf_pins cmac_usplus_1/axis_rx] [get_bd_intf_pins udp_core_eval_1/rx_axis_s]
  connect_bd_intf_net -intf_net cmac_usplus_0_gt_serial_port [get_bd_intf_ports gt_serial_port_1] [get_bd_intf_pins cmac_usplus_1/gt_serial_port]
  connect_bd_intf_net -intf_net cmac_usplus_1_axis_rx [get_bd_intf_pins cmac_usplus_0/axis_rx] [get_bd_intf_pins udp_core_eval_0/rx_axis_s]
  connect_bd_intf_net -intf_net cmac_usplus_1_gt_serial_port [get_bd_intf_ports gt_serial_port_0] [get_bd_intf_pins cmac_usplus_0/gt_serial_port]
  connect_bd_intf_net -intf_net embedded_test_ip_wra_0_gen_axi4s_m [get_bd_intf_pins embedded_test_ip_wra_0/gen_axi4s_m] [get_bd_intf_pins udp_core_eval_0/udp_axis_s]
  connect_bd_intf_net -intf_net embedded_test_ip_wra_1_gen_axi4s_m [get_bd_intf_pins embedded_test_ip_wra_1/gen_axi4s_m] [get_bd_intf_pins udp_core_eval_1/udp_axis_s]
  connect_bd_intf_net -intf_net gt_ref_clk_0_1 [get_bd_intf_ports gt_ref_clk_0] [get_bd_intf_pins cmac_usplus_0/gt_ref_clk]
  connect_bd_intf_net -intf_net gt_ref_clk_1_1 [get_bd_intf_ports gt_ref_clk_1] [get_bd_intf_pins cmac_usplus_1/gt_ref_clk]
  connect_bd_intf_net -intf_net smartconnect_0_M00_AXI [get_bd_intf_pins smartconnect_0/M00_AXI] [get_bd_intf_pins udp_core_eval_0/axi4lite]
  connect_bd_intf_net -intf_net smartconnect_0_M01_AXI [get_bd_intf_pins smartconnect_0/M01_AXI] [get_bd_intf_pins udp_core_eval_1/axi4lite]
  connect_bd_intf_net -intf_net smartconnect_0_M02_AXI [get_bd_intf_pins embedded_test_ip_wra_0/axi4lite] [get_bd_intf_pins smartconnect_0/M02_AXI]
  connect_bd_intf_net -intf_net smartconnect_0_M03_AXI [get_bd_intf_pins embedded_test_ip_wra_1/axi4lite] [get_bd_intf_pins smartconnect_0/M03_AXI]
  connect_bd_intf_net -intf_net smartconnect_1_M00_AXI [get_bd_intf_pins rtl_kernel_wizard_0_0/interface_aximm] [get_bd_intf_pins smartconnect_1/M00_AXI]
  connect_bd_intf_net -intf_net smartconnect_1_M01_AXI [get_bd_intf_pins smartconnect_0/S00_AXI] [get_bd_intf_pins smartconnect_1/M01_AXI]
  connect_bd_intf_net -intf_net udp_core_eval_0_tx_axis_m [get_bd_intf_pins cmac_usplus_0/axis_tx] [get_bd_intf_pins udp_core_eval_0/tx_axis_m]
  connect_bd_intf_net -intf_net udp_core_eval_0_udp_axis_m [get_bd_intf_pins embedded_test_ip_wra_0/chk_axi4s_s] [get_bd_intf_pins udp_core_eval_0/udp_axis_m]
  connect_bd_intf_net -intf_net udp_core_eval_1_tx_axis_m [get_bd_intf_pins cmac_usplus_1/axis_tx] [get_bd_intf_pins udp_core_eval_1/tx_axis_m]
  connect_bd_intf_net -intf_net udp_core_eval_1_udp_axis_m [get_bd_intf_pins embedded_test_ip_wra_1/chk_axi4s_s] [get_bd_intf_pins udp_core_eval_1/udp_axis_m]

  # Create port connections
  connect_bd_net -net ACLK_EN_0_1 [get_bd_ports ACLK_EN_0] [get_bd_pins rtl_kernel_wizard_0_0/ACLK_EN]
  connect_bd_net -net ARESET_0_1 [get_bd_ports ARESET_0] [get_bd_pins rtl_kernel_wizard_0_0/ARESET]
  connect_bd_net -net Net [get_bd_pins cmac_usplus_0/stat_rx_aligned] [get_bd_pins dsp_send_0/stat_rx_aligned] [get_bd_pins ila_0/probe0] [get_bd_pins util_vector_logic_0/Op1]
  connect_bd_net -net Net1 [get_bd_pins embedded_test_ip_wra_0/chk_axi4s_s_rst] [get_bd_pins embedded_test_ip_wra_0/gen_axi4s_m_rst] [get_bd_pins serial_pipe_0/serial_out] [get_bd_pins udp_core_eval_0/rx_axis_s_rst] [get_bd_pins udp_core_eval_0/tx_axis_m_rst]
  connect_bd_net -net Net2 [get_bd_pins serial_pipe_0/en] [get_bd_pins serial_pipe_0/rst_s_n] [get_bd_pins xlconstant_0/dout]
  connect_bd_net -net ap_done_0_1 [get_bd_ports ap_done_0] [get_bd_pins rtl_kernel_wizard_0_0/ap_done]
  connect_bd_net -net ap_idle_0_1 [get_bd_ports ap_idle_0] [get_bd_pins rtl_kernel_wizard_0_0/ap_idle]
  connect_bd_net -net ap_ready_0_1 [get_bd_ports ap_ready_0] [get_bd_pins rtl_kernel_wizard_0_0/ap_ready]
  connect_bd_net -net axi4lite_aclk_0_1 [get_bd_ports aclk_0] [get_bd_pins cmac_usplus_0/drp_clk] [get_bd_pins cmac_usplus_0/init_clk] [get_bd_pins cmac_usplus_1/drp_clk] [get_bd_pins cmac_usplus_1/init_clk] [get_bd_pins embedded_test_ip_wra_0/axi4lite_aclk] [get_bd_pins embedded_test_ip_wra_1/axi4lite_aclk] [get_bd_pins ila_0/clk] [get_bd_pins ila_1/clk] [get_bd_pins proc_sys_reset_0/slowest_sync_clk] [get_bd_pins proc_sys_reset_1/slowest_sync_clk] [get_bd_pins rtl_kernel_wizard_0_0/ACLK] [get_bd_pins smartconnect_0/aclk] [get_bd_pins smartconnect_1/aclk] [get_bd_pins udp_core_eval_0/axi4lite_aclk] [get_bd_pins udp_core_eval_1/axi4lite_aclk]
  connect_bd_net -net axi4lite_aresetn_0_1 [get_bd_ports locked] [get_bd_pins embedded_test_ip_wra_0/axi4lite_aresetn] [get_bd_pins embedded_test_ip_wra_1/axi4lite_aresetn] [get_bd_pins ila_0/probe6] [get_bd_pins smartconnect_0/aresetn] [get_bd_pins smartconnect_1/aresetn] [get_bd_pins udp_core_eval_0/axi4lite_aresetn] [get_bd_pins udp_core_eval_1/axi4lite_aresetn] [get_bd_pins util_vector_logic_4/Op1]
  connect_bd_net -net cmac_usplus_0_stat_rx_local_fault [get_bd_pins cmac_usplus_1/stat_rx_local_fault] [get_bd_pins ila_0/probe10]
  connect_bd_net -net cmac_usplus_0_stat_rx_remote_fault [get_bd_pins cmac_usplus_1/stat_rx_remote_fault] [get_bd_pins ila_0/probe11]
  connect_bd_net -net cmac_usplus_0_stat_rx_status [get_bd_pins cmac_usplus_1/stat_rx_status] [get_bd_pins ila_0/probe12]
  connect_bd_net -net cmac_usplus_0_usr_tx_reset [get_bd_pins cmac_usplus_1/usr_tx_reset] [get_bd_pins dsp_send_1/usr_tx_xr] [get_bd_pins ila_0/probe9]
  connect_bd_net -net cmac_usplus_1_gt_txusrclk2 [get_bd_pins cmac_usplus_1/gt_txusrclk2] [get_bd_pins cmac_usplus_1/rx_clk] [get_bd_pins dsp_send_1/clk] [get_bd_pins embedded_test_ip_wra_1/chk_axi4s_s_clk] [get_bd_pins embedded_test_ip_wra_1/gen_axi4s_m_clk] [get_bd_pins serial_pipe_1/clk] [get_bd_pins serial_pipe_2/clk] [get_bd_pins udp_core_eval_1/rx_axis_s_clk] [get_bd_pins udp_core_eval_1/rx_core_clk] [get_bd_pins udp_core_eval_1/tx_axis_m_clk] [get_bd_pins udp_core_eval_1/tx_core_clk]
  connect_bd_net -net cmac_usplus_1_stat_rx_aligned [get_bd_pins cmac_usplus_1/stat_rx_aligned] [get_bd_pins dsp_send_1/stat_rx_aligned] [get_bd_pins ila_0/probe7] [get_bd_pins util_vector_logic_2/Op1] [get_bd_pins util_vector_logic_9/Op1] [get_bd_pins util_vector_logic_9/Op2]
  connect_bd_net -net cmac_usplus_1_stat_rx_local_fault [get_bd_pins cmac_usplus_0/stat_rx_local_fault] [get_bd_pins ila_0/probe3]
  connect_bd_net -net cmac_usplus_1_stat_rx_remote_fault [get_bd_pins cmac_usplus_0/stat_rx_remote_fault] [get_bd_pins ila_0/probe4]
  connect_bd_net -net cmac_usplus_1_stat_rx_status [get_bd_pins cmac_usplus_0/stat_rx_status] [get_bd_pins ila_0/probe5]
  connect_bd_net -net cmac_usplus_1_usr_rx_reset [get_bd_pins cmac_usplus_1/usr_rx_reset] [get_bd_pins dsp_send_1/usr_rx_xr] [get_bd_pins ila_0/probe8]
  connect_bd_net -net cmac_usplus_1_usr_rx_reset1 [get_bd_pins cmac_usplus_0/usr_rx_reset] [get_bd_pins dsp_send_0/usr_rx_xr] [get_bd_pins ila_0/probe1]
  connect_bd_net -net cmac_usplus_1_usr_tx_reset [get_bd_pins cmac_usplus_0/usr_tx_reset] [get_bd_pins dsp_send_0/usr_tx_xr] [get_bd_pins ila_0/probe2]
  connect_bd_net -net cmac_usplus_2_gt_txusrclk2 [get_bd_pins cmac_usplus_0/gt_txusrclk2] [get_bd_pins cmac_usplus_0/rx_clk] [get_bd_pins dsp_send_0/clk] [get_bd_pins embedded_test_ip_wra_0/chk_axi4s_s_clk] [get_bd_pins embedded_test_ip_wra_0/gen_axi4s_m_clk] [get_bd_pins serial_pipe_0/clk] [get_bd_pins udp_core_eval_0/rx_axis_s_clk] [get_bd_pins udp_core_eval_0/rx_core_clk] [get_bd_pins udp_core_eval_0/tx_axis_m_clk] [get_bd_pins udp_core_eval_0/tx_core_clk]
  connect_bd_net -net dsp_send_0_core_xeset [get_bd_pins dsp_send_0/core_xeset] [get_bd_pins util_vector_logic_6/Op1]
  connect_bd_net -net dsp_send_0_ctl_rx_enable [get_bd_pins cmac_usplus_1/ctl_rx_enable] [get_bd_pins dsp_send_1/ctl_rx_exable]
  connect_bd_net -net dsp_send_0_ctl_tx_enable [get_bd_pins cmac_usplus_1/ctl_tx_enable] [get_bd_pins dsp_send_1/ctl_tx_exable]
  connect_bd_net -net dsp_send_0_ctl_tx_send_rfi [get_bd_pins cmac_usplus_1/ctl_tx_send_rfi] [get_bd_pins dsp_send_1/ctl_tx_send_rfi]
  connect_bd_net -net dsp_send_0_state [get_bd_pins dsp_send_0/state] [get_bd_pins ila_0/probe13]
  connect_bd_net -net dsp_send_1_core_xeset [get_bd_pins dsp_send_1/core_xeset] [get_bd_pins util_vector_logic_5/Op1]
  connect_bd_net -net dsp_send_1_state [get_bd_pins dsp_send_1/state] [get_bd_pins ila_0/probe14]
  connect_bd_net -net dsp_send_2_ctl_rx_exable [get_bd_pins cmac_usplus_0/ctl_rx_enable] [get_bd_pins dsp_send_0/ctl_rx_exable]
  connect_bd_net -net dsp_send_2_ctl_tx_exable [get_bd_pins cmac_usplus_0/ctl_tx_enable] [get_bd_pins dsp_send_0/ctl_tx_exable]
  connect_bd_net -net dsp_send_2_ctl_tx_send_rfi [get_bd_pins cmac_usplus_0/ctl_tx_send_rfi] [get_bd_pins dsp_send_0/ctl_tx_send_rfi]
  connect_bd_net -net proc_sys_reset_0_peripheral_reset [get_bd_pins proc_sys_reset_0/peripheral_reset] [get_bd_pins util_vector_logic_12/Op2]
  connect_bd_net -net proc_sys_reset_1_peripheral_reset [get_bd_pins proc_sys_reset_1/peripheral_reset] [get_bd_pins util_vector_logic_11/Op2]
  connect_bd_net -net rtl_kernel_wizard_0_0_ap_start [get_bd_ports ap_start_0] [get_bd_pins rtl_kernel_wizard_0_0/ap_start]
  connect_bd_net -net rtl_kernel_wizard_0_0_axi00_ptr0 [get_bd_ports axi00_ptr0_0] [get_bd_pins rtl_kernel_wizard_0_0/axi00_ptr0]
  connect_bd_net -net rtl_kernel_wizard_0_0_interrupt [get_bd_ports interrupt_0] [get_bd_pins rtl_kernel_wizard_0_0/interrupt]
  connect_bd_net -net rtl_kernel_wizard_0_0_scalar00 [get_bd_ports scalar00_0] [get_bd_pins rtl_kernel_wizard_0_0/scalar00]
  connect_bd_net -net serial_pipe_1_serial_out [get_bd_pins embedded_test_ip_wra_1/chk_axi4s_s_rst] [get_bd_pins embedded_test_ip_wra_1/gen_axi4s_m_rst] [get_bd_pins serial_pipe_1/serial_out] [get_bd_pins udp_core_eval_1/rx_axis_s_rst] [get_bd_pins udp_core_eval_1/tx_axis_m_rst]
  connect_bd_net -net serial_pipe_2_serial_out [get_bd_pins serial_pipe_2/serial_out] [get_bd_pins util_vector_logic_15/Op1]
  connect_bd_net -net util_vector_logic_0_Res [get_bd_pins serial_pipe_0/serial_in] [get_bd_pins util_vector_logic_0/Res]
  connect_bd_net -net util_vector_logic_10_Res [get_bd_pins serial_pipe_2/serial_in] [get_bd_pins util_vector_logic_10/Res] [get_bd_pins util_vector_logic_13/Op2]
  connect_bd_net -net util_vector_logic_11_Res [get_bd_pins cmac_usplus_1/sys_reset] [get_bd_pins ila_0/probe15] [get_bd_pins util_vector_logic_11/Res]
  connect_bd_net -net util_vector_logic_12_Res [get_bd_pins cmac_usplus_0/sys_reset] [get_bd_pins ila_0/probe16] [get_bd_pins util_vector_logic_12/Res]
  connect_bd_net -net util_vector_logic_15_Res [get_bd_pins util_vector_logic_13/Op1] [get_bd_pins util_vector_logic_15/Res]
  connect_bd_net -net util_vector_logic_2_Res [get_bd_pins serial_pipe_1/serial_in] [get_bd_pins util_vector_logic_10/Op1] [get_bd_pins util_vector_logic_2/Res]
  connect_bd_net -net util_vector_logic_4_Res [get_bd_pins dsp_send_0/xst] [get_bd_pins dsp_send_1/xst] [get_bd_pins util_vector_logic_11/Op1] [get_bd_pins util_vector_logic_12/Op1] [get_bd_pins util_vector_logic_4/Res]
  connect_bd_net -net util_vector_logic_5_Res [get_bd_pins proc_sys_reset_1/ext_reset_in] [get_bd_pins util_vector_logic_5/Res]
  connect_bd_net -net util_vector_logic_6_Res [get_bd_pins proc_sys_reset_0/ext_reset_in] [get_bd_pins util_vector_logic_6/Res]
  connect_bd_net -net util_vector_logic_9_Res [get_bd_pins util_vector_logic_10/Op2] [get_bd_pins util_vector_logic_9/Res]
  connect_bd_net -net xlconstant_1_dout [get_bd_pins serial_pipe_1/en] [get_bd_pins serial_pipe_1/rst_s_n] [get_bd_pins xlconstant_1/dout]
  connect_bd_net -net xlconstant_2_dout [get_bd_pins serial_pipe_2/en] [get_bd_pins serial_pipe_2/rst_s_n] [get_bd_pins xlconstant_2/dout]

  # Create address segments
  assign_bd_address -offset 0x00006000 -range 0x00002000 -target_address_space [get_bd_addr_spaces S00_AXI_0] [get_bd_addr_segs embedded_test_ip_wra_0/axi4lite/reg0] -force
  assign_bd_address -offset 0x00008000 -range 0x00002000 -target_address_space [get_bd_addr_spaces S00_AXI_0] [get_bd_addr_segs embedded_test_ip_wra_1/axi4lite/reg0] -force
  assign_bd_address -offset 0x00000000 -range 0x00002000 -target_address_space [get_bd_addr_spaces S00_AXI_0] [get_bd_addr_segs rtl_kernel_wizard_0_0/interface_aximm/reg0] -force
  assign_bd_address -offset 0x00002000 -range 0x00002000 -target_address_space [get_bd_addr_spaces S00_AXI_0] [get_bd_addr_segs udp_core_eval_0/axi4lite/reg0] -force
  assign_bd_address -offset 0x00004000 -range 0x00002000 -target_address_space [get_bd_addr_spaces S00_AXI_0] [get_bd_addr_segs udp_core_eval_1/axi4lite/reg0] -force


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


