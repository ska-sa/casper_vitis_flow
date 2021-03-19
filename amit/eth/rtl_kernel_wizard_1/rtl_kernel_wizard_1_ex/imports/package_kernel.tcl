# This is a generated file. Use and modify at your own risk.
################################################################################

set kernel_name    "rtl_kernel_wizard_1"
set kernel_vendor  "mpifr"
set kernel_library "kernel"

##############################################################################

proc edit_core {core} {

  ipx::associate_bus_interfaces -clock ap_clk -reset ap_rst_n $core

  ::ipx::associate_bus_interfaces -busif "mac0_m" -clock "ap_clk" $core
  set axis_bif      [::ipx::get_bus_interfaces -of $core  "mac0_m"] 
  set bifparam [::ipx::add_bus_parameter -quiet "TDATA_NUM_BYTES" $axis_bif]
  set_property value        64   $bifparam
  set_property value_source constant     $bifparam
  set bifparam [::ipx::add_bus_parameter -quiet "TUSER_WIDTH" $axis_bif]
  set_property value        0   $bifparam
  set_property value_source constant     $bifparam
  set bifparam [::ipx::add_bus_parameter -quiet "TID_WIDTH" $axis_bif]
  set_property value        0   $bifparam
  set_property value_source constant     $bifparam
  set bifparam [::ipx::add_bus_parameter -quiet "TDEST_WIDTH" $axis_bif]
  set_property value        0   $bifparam
  set_property value_source constant     $bifparam
  set bifparam [::ipx::add_bus_parameter -quiet "HAS_TREADY" $axis_bif]
  set_property value        1   $bifparam
  set_property value_source constant     $bifparam
  set bifparam [::ipx::add_bus_parameter -quiet "HAS_TSTRB" $axis_bif]
  set_property value        0   $bifparam
  set_property value_source constant     $bifparam
  set bifparam [::ipx::add_bus_parameter -quiet "HAS_TKEEP" $axis_bif]
  set_property value        1   $bifparam
  set_property value_source constant     $bifparam
  set bifparam [::ipx::add_bus_parameter -quiet "HAS_TLAST" $axis_bif]
  set_property value        1   $bifparam
  set_property value_source constant     $bifparam
  ::ipx::associate_bus_interfaces -busif "mac0_s" -clock "ap_clk" $core
  set axis_bif      [::ipx::get_bus_interfaces -of $core  "mac0_s"] 
  set bifparam [::ipx::add_bus_parameter -quiet "TDATA_NUM_BYTES" $axis_bif]
  set_property value        64   $bifparam
  set_property value_source constant     $bifparam
  set bifparam [::ipx::add_bus_parameter -quiet "TUSER_WIDTH" $axis_bif]
  set_property value        0   $bifparam
  set_property value_source constant     $bifparam
  set bifparam [::ipx::add_bus_parameter -quiet "TID_WIDTH" $axis_bif]
  set_property value        0   $bifparam
  set_property value_source constant     $bifparam
  set bifparam [::ipx::add_bus_parameter -quiet "TDEST_WIDTH" $axis_bif]
  set_property value        0   $bifparam
  set_property value_source constant     $bifparam
  set bifparam [::ipx::add_bus_parameter -quiet "HAS_TREADY" $axis_bif]
  set_property value        1   $bifparam
  set_property value_source constant     $bifparam
  set bifparam [::ipx::add_bus_parameter -quiet "HAS_TSTRB" $axis_bif]
  set_property value        0   $bifparam
  set_property value_source constant     $bifparam
  set bifparam [::ipx::add_bus_parameter -quiet "HAS_TKEEP" $axis_bif]
  set_property value        1   $bifparam
  set_property value_source constant     $bifparam
  set bifparam [::ipx::add_bus_parameter -quiet "HAS_TLAST" $axis_bif]
  set_property value        1   $bifparam
  set_property value_source constant     $bifparam
  ::ipx::associate_bus_interfaces -busif "mac1_m" -clock "ap_clk" $core
  set axis_bif      [::ipx::get_bus_interfaces -of $core  "mac1_m"] 
  set bifparam [::ipx::add_bus_parameter -quiet "TDATA_NUM_BYTES" $axis_bif]
  set_property value        64   $bifparam
  set_property value_source constant     $bifparam
  set bifparam [::ipx::add_bus_parameter -quiet "TUSER_WIDTH" $axis_bif]
  set_property value        0   $bifparam
  set_property value_source constant     $bifparam
  set bifparam [::ipx::add_bus_parameter -quiet "TID_WIDTH" $axis_bif]
  set_property value        0   $bifparam
  set_property value_source constant     $bifparam
  set bifparam [::ipx::add_bus_parameter -quiet "TDEST_WIDTH" $axis_bif]
  set_property value        0   $bifparam
  set_property value_source constant     $bifparam
  set bifparam [::ipx::add_bus_parameter -quiet "HAS_TREADY" $axis_bif]
  set_property value        1   $bifparam
  set_property value_source constant     $bifparam
  set bifparam [::ipx::add_bus_parameter -quiet "HAS_TSTRB" $axis_bif]
  set_property value        0   $bifparam
  set_property value_source constant     $bifparam
  set bifparam [::ipx::add_bus_parameter -quiet "HAS_TKEEP" $axis_bif]
  set_property value        1   $bifparam
  set_property value_source constant     $bifparam
  set bifparam [::ipx::add_bus_parameter -quiet "HAS_TLAST" $axis_bif]
  set_property value        1   $bifparam
  set_property value_source constant     $bifparam
  ::ipx::associate_bus_interfaces -busif "mac1_s" -clock "ap_clk" $core
  set axis_bif      [::ipx::get_bus_interfaces -of $core  "mac1_s"] 
  set bifparam [::ipx::add_bus_parameter -quiet "TDATA_NUM_BYTES" $axis_bif]
  set_property value        64   $bifparam
  set_property value_source constant     $bifparam
  set bifparam [::ipx::add_bus_parameter -quiet "TUSER_WIDTH" $axis_bif]
  set_property value        0   $bifparam
  set_property value_source constant     $bifparam
  set bifparam [::ipx::add_bus_parameter -quiet "TID_WIDTH" $axis_bif]
  set_property value        0   $bifparam
  set_property value_source constant     $bifparam
  set bifparam [::ipx::add_bus_parameter -quiet "TDEST_WIDTH" $axis_bif]
  set_property value        0   $bifparam
  set_property value_source constant     $bifparam
  set bifparam [::ipx::add_bus_parameter -quiet "HAS_TREADY" $axis_bif]
  set_property value        1   $bifparam
  set_property value_source constant     $bifparam
  set bifparam [::ipx::add_bus_parameter -quiet "HAS_TSTRB" $axis_bif]
  set_property value        0   $bifparam
  set_property value_source constant     $bifparam
  set bifparam [::ipx::add_bus_parameter -quiet "HAS_TKEEP" $axis_bif]
  set_property value        1   $bifparam
  set_property value_source constant     $bifparam
  set bifparam [::ipx::add_bus_parameter -quiet "HAS_TLAST" $axis_bif]
  set_property value        1   $bifparam
  set_property value_source constant     $bifparam
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
  set_property range 16384 $addr_block

  set reg      [::ipx::add_register "NO_CTRL" $addr_block]
  set_property description    "No control signals (reserved)"    $reg
  set_property address_offset 0x000 $reg
  set_property size           32    $reg
  set_property slave_memory_map_ref "s_axi_control" [::ipx::get_bus_interfaces -of $core "s_axi_control"]

  set_property xpm_libraries {XPM_CDC XPM_MEMORY XPM_FIFO} $core
  set_property sdx_kernel true $core
  set_property sdx_kernel_type rtl $core
}

##############################################################################

proc package_project {path_to_packaged kernel_vendor kernel_library kernel_name} {
  set core [::ipx::package_project -root_dir $path_to_packaged -vendor $kernel_vendor -library $kernel_library -taxonomy "/KernelIP" -import_files -set_current false ]
  foreach user_parameter [list C_S_AXI_CONTROL_ADDR_WIDTH C_S_AXI_CONTROL_DATA_WIDTH C_MAC0_M_TDATA_WIDTH C_MAC0_S_TDATA_WIDTH C_MAC1_M_TDATA_WIDTH C_MAC1_S_TDATA_WIDTH] {
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


##############################################################################
