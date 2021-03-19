#open_bd_design {/.aux_mnt/fpgdeva/casperlibs/workspace/rtl_u280/Hardware/binary_container_1.build/link/vivado/vpl/prj/prj.srcs/my_rm/bd/bd/pfm_dynamic.bd}
#connect_bd_intf_net [get_bd_intf_ports c1_sys] [get_bd_intf_pins rtl_kernel_2_1/sys_clk0]
#--from_step vpl.generate_target

#set_property PACKAGE_PIN BJ43 [get_ports c0_sys_clk_p]
#set_property PACKAGE_PIN BJ44 [get_ports c0_sys_clk_n]
#create_clock -period 6.4 [get_ports io_clk_gtyquad_refclk0_00_clk_p] 
#create_clock -period 6.4 [get_ports io_clk_gtyquad_refclk0_01_clk_p] 

#link_design -name netlist_1
#set_property PACKAGE_PIN BJ43 [get_ports c0_sys_clk_p]
#set_property PACKAGE_PIN BJ44 [get_ports c0_sys_clk_n]
#set_property PACKAGE_PIN BH6 [get_ports c1_sys_clk_p]
#set_property PACKAGE_PIN BJ6 [get_ports c1_sys_clk_n]

create_clock -period 6.4 [get_ports io_clk_gtyquad_refclk0_00_clk_p] 
create_clock -period 6.4 [get_ports io_clk_gtyquad_refclk0_01_clk_p] 

#save_constraints
#close_design
