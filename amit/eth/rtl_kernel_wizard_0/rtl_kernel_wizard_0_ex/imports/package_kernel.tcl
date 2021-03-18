# This is a generated file. Use and modify at your own risk.
################################################################################

set kernel_name    "rtl_kernel_wizard_0"
set kernel_vendor  "mpifr"
set kernel_library "kernel"

##############################################################################

proc edit_core {core} {
  set bif      [::ipx::get_bus_interfaces -of $core  "A"] 
  set bifparam [::ipx::add_bus_parameter -quiet "MAX_BURST_LENGTH" $bif]
  set_property value        64           $bifparam
  set_property value_source constant     $bifparam
  set bifparam [::ipx::add_bus_parameter -quiet "NUM_READ_OUTSTANDING" $bif]
  set_property value        32           $bifparam
  set_property value_source constant     $bifparam
  set bifparam [::ipx::add_bus_parameter -quiet "NUM_WRITE_OUTSTANDING" $bif]
  set_property value        32           $bifparam
  set_property value_source constant     $bifparam

  ::ipx::associate_bus_interfaces -busif "A" -clock "ap_clk" $core
  ::ipx::associate_bus_interfaces -busif "s_axi_control" -clock "ap_clk" $core

  # Specify the freq_hz parameter 
  set clkbif      [::ipx::get_bus_interfaces -of $core "ap_clk"]
  set clkbifparam [::ipx::add_bus_parameter -quiet "FREQ_HZ" $clkbif]
  # Set desired frequency                   
  set_property value 100000000 $clkbifparam
  # set value_resolve_type 'user' if the frequency can vary. 
  set_property value_resolve_type user $clkbifparam
  # set value_resolve_type 'immediate' if the frequency cannot change. 
  # set_property value_resolve_type immediate $clkbifparam
  set mem_map    [::ipx::add_memory_map -quiet "s_axi_control" $core]
  set addr_block [::ipx::add_address_block -quiet "reg0" $mem_map]
  set_property range 40960 $addr_block

  set reg      [::ipx::add_register "CTRL" $addr_block]
  set_property description    "Control signals"    $reg
  set_property address_offset 0x000 $reg
  set_property size           32    $reg
  set field [ipx::add_field AP_START $reg]
    set_property ACCESS {read-write} $field
    set_property BIT_OFFSET {0} $field
    set_property BIT_WIDTH {1} $field
    set_property DESCRIPTION {Control signal Register for 'ap_start'.} $field
    set_property MODIFIED_WRITE_VALUE {modify} $field
  set field [ipx::add_field AP_DONE $reg]
    set_property ACCESS {read-only} $field
    set_property BIT_OFFSET {1} $field
    set_property BIT_WIDTH {1} $field
    set_property DESCRIPTION {Control signal Register for 'ap_done'.} $field
    set_property READ_ACTION {modify} $field
  set field [ipx::add_field AP_IDLE $reg]
    set_property ACCESS {read-only} $field
    set_property BIT_OFFSET {2} $field
    set_property BIT_WIDTH {1} $field
    set_property DESCRIPTION {Control signal Register for 'ap_idle'.} $field
    set_property READ_ACTION {modify} $field
  set field [ipx::add_field AP_READY $reg]
    set_property ACCESS {read-only} $field
    set_property BIT_OFFSET {3} $field
    set_property BIT_WIDTH {1} $field
    set_property DESCRIPTION {Control signal Register for 'ap_ready'.} $field
    set_property READ_ACTION {modify} $field
  set field [ipx::add_field RESERVED_1 $reg]
    set_property ACCESS {read-only} $field
    set_property BIT_OFFSET {4} $field
    set_property BIT_WIDTH {3} $field
    set_property DESCRIPTION {Reserved.  0s on read.} $field
    set_property READ_ACTION {modify} $field
  set field [ipx::add_field AUTO_RESTART $reg]
    set_property ACCESS {read-write} $field
    set_property BIT_OFFSET {7} $field
    set_property BIT_WIDTH {1} $field
    set_property DESCRIPTION {Control signal Register for 'auto_restart'.} $field
    set_property MODIFIED_WRITE_VALUE {modify} $field
  set field [ipx::add_field RESERVED_2 $reg]
    set_property ACCESS {read-only} $field
    set_property BIT_OFFSET {8} $field
    set_property BIT_WIDTH {24} $field
    set_property DESCRIPTION {Reserved.  0s on read.} $field
    set_property READ_ACTION {modify} $field

  set reg      [::ipx::add_register "GIER" $addr_block]
  set_property description    "Global Interrupt Enable Register"    $reg
  set_property address_offset 0x004 $reg
  set_property size           32    $reg

  set reg      [::ipx::add_register "IP_IER" $addr_block]
  set_property description    "IP Interrupt Enable Register"    $reg
  set_property address_offset 0x008 $reg
  set_property size           32    $reg

  set reg      [::ipx::add_register "IP_ISR" $addr_block]
  set_property description    "IP Interrupt Status Register"    $reg
  set_property address_offset 0x00C $reg
  set_property size           32    $reg

  set reg      [::ipx::add_register -quiet "scalar00" $addr_block]
  set_property address_offset 0x010 $reg
  set_property size           [expr {4*8}]   $reg

  set reg      [::ipx::add_register -quiet "axi00_ptr0" $addr_block]
  set_property address_offset 0x018 $reg
  set_property size           [expr {8*8}]   $reg
  set regparam [::ipx::add_register_parameter -quiet {ASSOCIATED_BUSIF} $reg] 
  set_property value A $regparam 

  set reg      [::ipx::add_register "mac0_src_mac_addr_lower" $addr_block]
  set_property description    "UDP Data Registers"    $reg
  set_property address_offset 0x2000 $reg
  set_property size           32    $reg

  set reg      [::ipx::add_register "mac0_src_mac_addr_upper" $addr_block]
  set_property description    "UDP Data Registers"    $reg
  set_property address_offset 0x2004 $reg
  set_property size           32    $reg

  set reg      [::ipx::add_register "mac0_dst_mac_addr_lower" $addr_block]
  set_property description    "UDP Data Registers"    $reg
  set_property address_offset 0x200C $reg
  set_property size           32    $reg

  set reg      [::ipx::add_register "mac0_dst_mac_addr_upper" $addr_block]
  set_property description    "UDP Data Registers"    $reg
  set_property address_offset 0x2010 $reg
  set_property size           32    $reg

  set reg      [::ipx::add_register "mac0_ethertype" $addr_block]
  set_property description    "UDP Data Registers"    $reg
  set_property address_offset 0x2014 $reg
  set_property size           32    $reg

  set reg      [::ipx::add_register "mac0_ipv4_header_0" $addr_block]
  set_property description    "UDP Data Registers"    $reg
  set_property address_offset 0x2018 $reg
  set_property size           32    $reg

  set reg      [::ipx::add_register "mac0_ipv4_header_1" $addr_block]
  set_property description    "UDP Data Registers"    $reg
  set_property address_offset 0x201C $reg
  set_property size           32    $reg

  set reg      [::ipx::add_register "mac0_ipv4_header_2" $addr_block]
  set_property description    "UDP Data Registers"    $reg
  set_property address_offset 0x2020 $reg
  set_property size           32    $reg

  set reg      [::ipx::add_register "mac0_dst_ip_addr" $addr_block]
  set_property description    "UDP Data Registers"    $reg
  set_property address_offset 0x2024 $reg
  set_property size           32    $reg

  set reg      [::ipx::add_register "mac0_src_ip_addr" $addr_block]
  set_property description    "UDP Data Registers"    $reg
  set_property address_offset 0x2028 $reg
  set_property size           32    $reg

  set reg      [::ipx::add_register "mac0_udp_ports" $addr_block]
  set_property description    "UDP Data Registers"    $reg
  set_property address_offset 0x202C $reg
  set_property size           32    $reg

  set reg      [::ipx::add_register "mac0_udp_length" $addr_block]
  set_property description    "UDP Data Registers"    $reg
  set_property address_offset 0x2030 $reg
  set_property size           32    $reg

  set reg      [::ipx::add_register "mac0_filter_control" $addr_block]
  set_property description    "UDP Data Registers"    $reg
  set_property address_offset 0x2038 $reg
  set_property size           32    $reg

  set reg      [::ipx::add_register "mac0_ifg" $addr_block]
  set_property description    "UDP Data Registers"    $reg
  set_property address_offset 0x2040 $reg
  set_property size           32    $reg

  set reg      [::ipx::add_register "mac0_control" $addr_block]
  set_property description    "UDP Data Registers"    $reg
  set_property address_offset 0x2048 $reg
  set_property size           32    $reg

  set reg      [::ipx::add_register "mac0_udp_count" $addr_block]
  set_property description    "UDP Data Registers"    $reg
  set_property address_offset 0x204C $reg
  set_property size           32    $reg

  set reg      [::ipx::add_register "mac0_ping_count" $addr_block]
  set_property description    "UDP Data Registers"    $reg
  set_property address_offset 0x2050 $reg
  set_property size           32    $reg

  set reg      [::ipx::add_register "mac0_arp_count" $addr_block]
  set_property description    "UDP Data Registers"    $reg
  set_property address_offset 0x2054 $reg
  set_property size           32    $reg

  set reg      [::ipx::add_register "mac0_uns_etype_count" $addr_block]
  set_property description    "UDP Data Registers"    $reg
  set_property address_offset 0x2058 $reg
  set_property size           32    $reg

  set reg      [::ipx::add_register "mac0_uns_pro_count" $addr_block]
  set_property description    "UDP Data Registers"    $reg
  set_property address_offset 0x205C $reg
  set_property size           32    $reg

  set reg      [::ipx::add_register "mac0_dropped_mac_count" $addr_block]
  set_property description    "UDP Data Registers"    $reg
  set_property address_offset 0x2060 $reg
  set_property size           32    $reg

  set reg      [::ipx::add_register "mac0_dropped_ip_count" $addr_block]
  set_property description    "UDP Data Registers"    $reg
  set_property address_offset 0x2064 $reg
  set_property size           32    $reg

  set reg      [::ipx::add_register "mac0_dropped_port_count" $addr_block]
  set_property description    "UDP Data Registers"    $reg
  set_property address_offset 0x2068 $reg
  set_property size           32    $reg

  set reg      [::ipx::add_register "mac0_ip_id" $addr_block]
  set_property description    "UDP Data Registers"    $reg
  set_property address_offset 0x206C $reg
  set_property size           32    $reg

  set reg      [::ipx::add_register "mac0_udp_core_id" $addr_block]
  set_property description    "UDP Data Registers"    $reg
  set_property address_offset 0x2074 $reg
  set_property size           32    $reg

  set reg      [::ipx::add_register "mac1_src_mac_addr_lower" $addr_block]
  set_property description    "UDP Data Registers"    $reg
  set_property address_offset 0x4000 $reg
  set_property size           32    $reg

  set reg      [::ipx::add_register "mac1_src_mac_addr_upper" $addr_block]
  set_property description    "UDP Data Registers"    $reg
  set_property address_offset 0x4004 $reg
  set_property size           32    $reg

  set reg      [::ipx::add_register "mac1_dst_mac_addr_lower" $addr_block]
  set_property description    "UDP Data Registers"    $reg
  set_property address_offset 0x400C $reg
  set_property size           32    $reg

  set reg      [::ipx::add_register "mac1_dst_mac_addr_upper" $addr_block]
  set_property description    "UDP Data Registers"    $reg
  set_property address_offset 0x4010 $reg
  set_property size           32    $reg

  set reg      [::ipx::add_register "mac1_ethertype" $addr_block]
  set_property description    "UDP Data Registers"    $reg
  set_property address_offset 0x4014 $reg
  set_property size           32    $reg

  set reg      [::ipx::add_register "mac1_ipv4_header_0" $addr_block]
  set_property description    "UDP Data Registers"    $reg
  set_property address_offset 0x4018 $reg
  set_property size           32    $reg

  set reg      [::ipx::add_register "mac1_ipv4_header_1" $addr_block]
  set_property description    "UDP Data Registers"    $reg
  set_property address_offset 0x401C $reg
  set_property size           32    $reg

  set reg      [::ipx::add_register "mac1_ipv4_header_2" $addr_block]
  set_property description    "UDP Data Registers"    $reg
  set_property address_offset 0x4020 $reg
  set_property size           32    $reg

  set reg      [::ipx::add_register "mac1_dst_ip_addr" $addr_block]
  set_property description    "UDP Data Registers"    $reg
  set_property address_offset 0x4024 $reg
  set_property size           32    $reg

  set reg      [::ipx::add_register "mac1_src_ip_addr" $addr_block]
  set_property description    "UDP Data Registers"    $reg
  set_property address_offset 0x4028 $reg
  set_property size           32    $reg

  set reg      [::ipx::add_register "mac1_udp_ports" $addr_block]
  set_property description    "UDP Data Registers"    $reg
  set_property address_offset 0x402C $reg
  set_property size           32    $reg

  set reg      [::ipx::add_register "mac1_udp_length" $addr_block]
  set_property description    "UDP Data Registers"    $reg
  set_property address_offset 0x4030 $reg
  set_property size           32    $reg

  set reg      [::ipx::add_register "mac1_filter_control" $addr_block]
  set_property description    "UDP Data Registers"    $reg
  set_property address_offset 0x4038 $reg
  set_property size           32    $reg

  set reg      [::ipx::add_register "mac1_ifg" $addr_block]
  set_property description    "UDP Data Registers"    $reg
  set_property address_offset 0x4040 $reg
  set_property size           32    $reg

  set reg      [::ipx::add_register "mac1_control" $addr_block]
  set_property description    "UDP Data Registers"    $reg
  set_property address_offset 0x4048 $reg
  set_property size           32    $reg

  set reg      [::ipx::add_register "mac1_udp_count" $addr_block]
  set_property description    "UDP Data Registers"    $reg
  set_property address_offset 0x404C $reg
  set_property size           32    $reg

  set reg      [::ipx::add_register "mac1_ping_count" $addr_block]
  set_property description    "UDP Data Registers"    $reg
  set_property address_offset 0x4050 $reg
  set_property size           32    $reg

  set reg      [::ipx::add_register "mac1_arp_count" $addr_block]
  set_property description    "UDP Data Registers"    $reg
  set_property address_offset 0x4054 $reg
  set_property size           32    $reg

  set reg      [::ipx::add_register "mac1_uns_etype_count" $addr_block]
  set_property description    "UDP Data Registers"    $reg
  set_property address_offset 0x4058 $reg
  set_property size           32    $reg

  set reg      [::ipx::add_register "mac1_uns_pro_count" $addr_block]
  set_property description    "UDP Data Registers"    $reg
  set_property address_offset 0x405C $reg
  set_property size           32    $reg

  set reg      [::ipx::add_register "mac1_dropped_mac_count" $addr_block]
  set_property description    "UDP Data Registers"    $reg
  set_property address_offset 0x4060 $reg
  set_property size           32    $reg

  set reg      [::ipx::add_register "mac1_dropped_ip_count" $addr_block]
  set_property description    "UDP Data Registers"    $reg
  set_property address_offset 0x4064 $reg
  set_property size           32    $reg

  set reg      [::ipx::add_register "mac1_dropped_port_count" $addr_block]
  set_property description    "UDP Data Registers"    $reg
  set_property address_offset 0x4068 $reg
  set_property size           32    $reg

  set reg      [::ipx::add_register "mac1_ip_id" $addr_block]
  set_property description    "UDP Data Registers"    $reg
  set_property address_offset 0x406C $reg
  set_property size           32    $reg

  set reg      [::ipx::add_register "mac1_udp_core_id" $addr_block]
  set_property description    "UDP Data Registers"    $reg
  set_property address_offset 0x4074 $reg
  set_property size           32    $reg
  
  
  
  
  set_property slave_memory_map_ref "s_axi_control" [::ipx::get_bus_interfaces -of $core "s_axi_control"]
  
  

  set_property xpm_libraries {XPM_CDC XPM_MEMORY XPM_FIFO} $core
  set_property sdx_kernel true $core
  set_property sdx_kernel_type rtl $core
}

##############################################################################

proc package_project {path_to_packaged kernel_vendor kernel_library kernel_name} {
  set core [::ipx::package_project -root_dir $path_to_packaged -vendor $kernel_vendor -library $kernel_library -taxonomy "/KernelIP" -import_files -set_current false ]
  foreach user_parameter [list C_S_AXI_CONTROL_ADDR_WIDTH C_S_AXI_CONTROL_DATA_WIDTH C_A_ADDR_WIDTH C_A_DATA_WIDTH] {
    ::ipx::remove_user_parameter $user_parameter $core
  }
  ::ipx::create_xgui_files $core
  set_property supported_families { } $core
  set_property auto_family_support_level level_2 $core
  set_property used_in {out_of_context implementation synthesis} [::ipx::get_files -type xdc -of_objects [::ipx::get_file_groups "xilinx_anylanguagesynthesis" -of_objects $core] *_ooc.xdc]
  edit_core $core
  ::ipx::update_checksums $core
  ::ipx::check_integrity -kernel $core
  ::ipx::check_integrity -xrt $core
  ::ipx::save_core $core
  ::ipx::unload_core $core
  unset core
}

##############################################################################

proc package_project_dcp {path_to_dcp path_to_packaged kernel_vendor kernel_library kernel_name} {
  set core [::ipx::package_checkpoint -dcp_file $path_to_dcp -root_dir $path_to_packaged -vendor $kernel_vendor -library $kernel_library -name $kernel_name -taxonomy "/KernelIP" -force]
  edit_core $core
  ::ipx::update_checksums $core
  ::ipx::check_integrity -kernel $core
  ::ipx::check_integrity -xrt $core
  ::ipx::save_core $core
  ::ipx::unload_core $core
  unset core
}

##############################################################################

proc package_project_dcp_and_xdc {path_to_dcp path_to_xdc path_to_packaged kernel_vendor kernel_library kernel_name} {
  set core [::ipx::package_checkpoint -dcp_file $path_to_dcp -root_dir $path_to_packaged -vendor $kernel_vendor -library $kernel_library -name $kernel_name -taxonomy "/KernelIP" -force]
  edit_core $core
  set rel_path_to_xdc [file join "impl" [file tail $path_to_xdc]]
  set abs_path_to_xdc [file join $path_to_packaged $rel_path_to_xdc]
  file mkdir [file dirname $abs_path_to_xdc]
  file copy $path_to_xdc $abs_path_to_xdc
  set xdcfile [::ipx::add_file $rel_path_to_xdc [::ipx::add_file_group "xilinx_implementation" $core]]
  set_property type "xdc" $xdcfile
  set_property used_in [list "implementation"] $xdcfile
  ::ipx::update_checksums $core
  ::ipx::check_integrity -kernel $core
  ::ipx::check_integrity -xrt $core
  ::ipx::save_core $core
  ::ipx::unload_core $core
  unset core
  add_gt $path_to_packaged
}

proc add_gt {path_to_packaged} {
 
 ipx::unload_core $path_to_packaged/component.xml
 ipx::edit_ip_in_project -upgrade true -name tmp_edit_project -directory $path_to_packaged $path_to_packaged/component.xml
  ipx::remove_bus_interface gt_ref_clk_p [ipx::current_core]
ipx::remove_bus_interface gt_ref_clk_n [ipx::current_core]
ipx::remove_bus_interface gt1_ref_clk_p [ipx::current_core]
ipx::remove_bus_interface gt1_ref_clk_n [ipx::current_core]

set_property sdx_kernel true [ipx::current_core]
set_property sdx_kernel_type rtl [ipx::current_core]
ipx::create_xgui_files [ipx::current_core]
ipx::add_bus_interface ap_clk [ipx::current_core]
set_property abstraction_type_vlnv xilinx.com:signal:clock_rtl:1.0 [ipx::get_bus_interfaces ap_clk -of_objects [ipx::current_core]]
set_property bus_type_vlnv xilinx.com:signal:clock:1.0 [ipx::get_bus_interfaces ap_clk -of_objects [ipx::current_core]]

# ipx::add_port_map CLK [ipx::get_bus_interfaces ap_clk -of_objects [ipx::current_core]]
# set_property physical_name ap_clk [ipx::get_port_maps CLK -of_objects [ipx::get_bus_interfaces ap_clk -of_objects [ipx::current_core]]]

ipx::associate_bus_interfaces -busif s_axi_control -clock ap_clk [ipx::current_core]
  ipx::add_bus_interface qsfp [ipx::current_core]
set_property abstraction_type_vlnv xilinx.com:interface:gt_rtl:1.0 [ipx::get_bus_interfaces qsfp -of_objects [ipx::current_core]]
set_property bus_type_vlnv xilinx.com:interface:gt:1.0 [ipx::get_bus_interfaces qsfp -of_objects [ipx::current_core]]
set_property interface_mode master [ipx::get_bus_interfaces qsfp -of_objects [ipx::current_core]]
ipx::add_port_map GRX_P [ipx::get_bus_interfaces qsfp -of_objects [ipx::current_core]]
set_property physical_name qsfp28_rx_p [ipx::get_port_maps GRX_P -of_objects [ipx::get_bus_interfaces qsfp -of_objects [ipx::current_core]]]
ipx::add_port_map GTX_N [ipx::get_bus_interfaces qsfp -of_objects [ipx::current_core]]
set_property physical_name qsfp28_tx_n [ipx::get_port_maps GTX_N -of_objects [ipx::get_bus_interfaces qsfp -of_objects [ipx::current_core]]]
ipx::add_port_map GRX_N [ipx::get_bus_interfaces qsfp -of_objects [ipx::current_core]]
set_property physical_name qsfp28_rx_n [ipx::get_port_maps GRX_N -of_objects [ipx::get_bus_interfaces qsfp -of_objects [ipx::current_core]]]
ipx::add_port_map GTX_P [ipx::get_bus_interfaces qsfp -of_objects [ipx::current_core]]
set_property physical_name qsfp28_tx_p [ipx::get_port_maps GTX_P -of_objects [ipx::get_bus_interfaces qsfp -of_objects [ipx::current_core]]]

  ipx::add_bus_interface qsfp1 [ipx::current_core]
set_property abstraction_type_vlnv xilinx.com:interface:gt_rtl:1.0 [ipx::get_bus_interfaces qsfp1 -of_objects [ipx::current_core]]
set_property bus_type_vlnv xilinx.com:interface:gt:1.0 [ipx::get_bus_interfaces qsfp1 -of_objects [ipx::current_core]]
set_property interface_mode master [ipx::get_bus_interfaces qsfp1 -of_objects [ipx::current_core]]
ipx::add_port_map GRX_P [ipx::get_bus_interfaces qsfp1 -of_objects [ipx::current_core]]
set_property physical_name qsfp28_1_rx_p [ipx::get_port_maps GRX_P -of_objects [ipx::get_bus_interfaces qsfp1 -of_objects [ipx::current_core]]]
ipx::add_port_map GTX_N [ipx::get_bus_interfaces qsfp1 -of_objects [ipx::current_core]]
set_property physical_name qsfp28_1_tx_n [ipx::get_port_maps GTX_N -of_objects [ipx::get_bus_interfaces qsfp1 -of_objects [ipx::current_core]]]
ipx::add_port_map GRX_N [ipx::get_bus_interfaces qsfp1 -of_objects [ipx::current_core]]
set_property physical_name qsfp28_1_rx_n [ipx::get_port_maps GRX_N -of_objects [ipx::get_bus_interfaces qsfp1 -of_objects [ipx::current_core]]]
ipx::add_port_map GTX_P [ipx::get_bus_interfaces qsfp1 -of_objects [ipx::current_core]]
set_property physical_name qsfp28_1_tx_p [ipx::get_port_maps GTX_P -of_objects [ipx::get_bus_interfaces qsfp1 -of_objects [ipx::current_core]]]

ipx::add_bus_interface gt [ipx::current_core]
set_property abstraction_type_vlnv xilinx.com:interface:diff_clock_rtl:1.0 [ipx::get_bus_interfaces gt -of_objects [ipx::current_core]]
set_property bus_type_vlnv xilinx.com:interface:diff_clock:1.0 [ipx::get_bus_interfaces gt -of_objects [ipx::current_core]]
set_property interface_mode slave [ipx::get_bus_interfaces gt -of_objects [ipx::current_core]]
ipx::add_port_map CLK_P [ipx::get_bus_interfaces gt -of_objects [ipx::current_core]]
set_property physical_name gt_ref_clk_p [ipx::get_port_maps CLK_P -of_objects [ipx::get_bus_interfaces gt -of_objects [ipx::current_core]]]
ipx::add_port_map CLK_N [ipx::get_bus_interfaces gt -of_objects [ipx::current_core]]
set_property physical_name gt_ref_clk_n [ipx::get_port_maps CLK_N -of_objects [ipx::get_bus_interfaces gt -of_objects [ipx::current_core]]]

ipx::add_bus_interface gt1 [ipx::current_core]
set_property abstraction_type_vlnv xilinx.com:interface:diff_clock_rtl:1.0 [ipx::get_bus_interfaces gt1 -of_objects [ipx::current_core]]
set_property bus_type_vlnv xilinx.com:interface:diff_clock:1.0 [ipx::get_bus_interfaces gt1 -of_objects [ipx::current_core]]
set_property interface_mode slave [ipx::get_bus_interfaces gt1 -of_objects [ipx::current_core]]
ipx::add_port_map CLK_P [ipx::get_bus_interfaces gt1 -of_objects [ipx::current_core]]
set_property physical_name gt1_ref_clk_p [ipx::get_port_maps CLK_P -of_objects [ipx::get_bus_interfaces gt1 -of_objects [ipx::current_core]]]
ipx::add_port_map CLK_N [ipx::get_bus_interfaces gt1 -of_objects [ipx::current_core]]
set_property physical_name gt1_ref_clk_n [ipx::get_port_maps CLK_N -of_objects [ipx::get_bus_interfaces gt1 -of_objects [ipx::current_core]]]

#ipx::add_bus_interface sys_clk0 [ipx::current_core]
#set_property abstraction_type_vlnv xilinx.com:interface:diff_clock_rtl:1.0 [ipx::get_bus_interfaces sys_clk0 -of_objects [ipx::current_core]]
#set_property bus_type_vlnv xilinx.com:interface:diff_clock:1.0 [ipx::get_bus_interfaces sys_clk0 -of_objects [ipx::current_core]]
#set_property interface_mode slave [ipx::get_bus_interfaces sys_clk0 -of_objects [ipx::current_core]]
#ipx::add_port_map CLK_P [ipx::get_bus_interfaces sys_clk0 -of_objects [ipx::current_core]]
#set_property physical_name sys_clk0_p [ipx::get_port_maps CLK_P -of_objects [ipx::get_bus_interfaces sys_clk0 -of_objects [ipx::current_core]]]
#ipx::add_port_map CLK_N [ipx::get_bus_interfaces sys_clk0 -of_objects [ipx::current_core]]
#set_property physical_name sys_clk0_n [ipx::get_port_maps CLK_N -of_objects [ipx::get_bus_interfaces sys_clk0 -of_objects [ipx::current_core]]]
#ipx::add_bus_parameter FREQ_HZ [ipx::get_bus_interfaces sys_clk0 -of_objects [ipx::current_core]]

  set_property xpm_libraries {XPM_CDC XPM_MEMORY XPM_FIFO} [ipx::current_core]
  set_property core_revision 2 [::ipx::current_core]
  ipx::create_xgui_files [::ipx::current_core]
  ipx::update_checksums [::ipx::current_core]
  ::ipx::check_integrity -kernel [::ipx::current_core]
  ::ipx::check_integrity -xrt [::ipx::current_core]
  ipx::save_core [::ipx::current_core]
  close_project -delete
}

##############################################################################
