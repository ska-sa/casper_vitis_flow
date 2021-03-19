# open_bd_design {/.aux_mnt/fpgdeva/casperlibs/vitis/workspace/rtl_u280_hw_link/Hardware/binary_container_1.build/link/vivado/vpl/prj/prj.srcs/my_rm/bd/bd/pfm_dynamic.bd}
# connect_bd_intf_net [get_bd_intf_ports c1_sys] [get_bd_intf_pins rtl_kernel_wizard_1_1/sys_clk0] --from_step vpl.generate_target
# connect_bd_net [get_bd_ports kernel_locked] [get_bd_pins rtl_kernel_wizard_1_1/ap_locked]

# -group [get_clocks -of_objects [get_pins pfm_top_i/dynamic_region/rtl_kernel_wizard_1_1/inst_design_1/clk_wiz_0/inst/mmcme4_adv_inst/CLKOUT0]] \

set_clock_groups -asynchronous -group [get_clocks -of_objects [get_pins pfm_top_i/static_region/base_clocking/clkwiz_kernel/inst/CLK_CORE_DRP_I/clk_inst/mmcme4_adv_inst/CLKOUT0]] \
-group [get_clocks -of_objects [get_pins pfm_top_i/static_region/base_clocking/clkwiz_sysclks/inst/plle4_adv_inst/CLKOUT0]] \
-group [get_clocks -of_objects [get_pins {pfm_top_i/dynamic_region/rtl_kernel_wizard_1_1/inst_design_1/cmac_usplus_0/inst/design_1_cmac_usplus_0_0_gt_i/inst/gen_gtwizard_gtye4_top.design_1_cmac_usplus_0_0_gt_gtwizard_gtye4_inst/gen_gtwizard_gtye4.gen_channel_container[10].gen_enabled_channel.gtye4_channel_wrapper_inst/channel_inst/gtye4_channel_gen.gen_gtye4_channel_inst[0].GTYE4_CHANNEL_PRIM_INST/TXOUTCLKPCS}]] \
-group [get_clocks -of_objects [get_pins {pfm_top_i/dynamic_region/rtl_kernel_wizard_1_1/inst_design_1/cmac_usplus_0/inst/design_1_cmac_usplus_0_0_gt_i/inst/gen_gtwizard_gtye4_top.design_1_cmac_usplus_0_0_gt_gtwizard_gtye4_inst/gen_gtwizard_gtye4.gen_channel_container[10].gen_enabled_channel.gtye4_channel_wrapper_inst/channel_inst/gtye4_channel_gen.gen_gtye4_channel_inst[1].GTYE4_CHANNEL_PRIM_INST/TXOUTCLKPCS}]] \
-group [get_clocks -of_objects [get_pins {pfm_top_i/dynamic_region/rtl_kernel_wizard_1_1/inst_design_1/cmac_usplus_0/inst/design_1_cmac_usplus_0_0_gt_i/inst/gen_gtwizard_gtye4_top.design_1_cmac_usplus_0_0_gt_gtwizard_gtye4_inst/gen_gtwizard_gtye4.gen_channel_container[10].gen_enabled_channel.gtye4_channel_wrapper_inst/channel_inst/gtye4_channel_gen.gen_gtye4_channel_inst[2].GTYE4_CHANNEL_PRIM_INST/TXOUTCLKPCS}]] \
-group [get_clocks -of_objects [get_pins {pfm_top_i/dynamic_region/rtl_kernel_wizard_1_1/inst_design_1/cmac_usplus_0/inst/design_1_cmac_usplus_0_0_gt_i/inst/gen_gtwizard_gtye4_top.design_1_cmac_usplus_0_0_gt_gtwizard_gtye4_inst/gen_gtwizard_gtye4.gen_channel_container[10].gen_enabled_channel.gtye4_channel_wrapper_inst/channel_inst/gtye4_channel_gen.gen_gtye4_channel_inst[3].GTYE4_CHANNEL_PRIM_INST/TXOUTCLKPCS}]] \
-group [get_clocks -of_objects [get_pins {pfm_top_i/dynamic_region/rtl_kernel_wizard_1_1/inst_design_1/cmac_usplus_0/inst/design_1_cmac_usplus_0_0_gt_i/inst/gen_gtwizard_gtye4_top.design_1_cmac_usplus_0_0_gt_gtwizard_gtye4_inst/gen_gtwizard_gtye4.gen_channel_container[10].gen_enabled_channel.gtye4_channel_wrapper_inst/channel_inst/gtye4_channel_gen.gen_gtye4_channel_inst[0].GTYE4_CHANNEL_PRIM_INST/TXOUTCLK}]] \
-group [get_clocks -of_objects [get_pins {pfm_top_i/dynamic_region/rtl_kernel_wizard_1_1/inst_design_1/cmac_usplus_0/inst/design_1_cmac_usplus_0_0_gt_i/inst/gen_gtwizard_gtye4_top.design_1_cmac_usplus_0_0_gt_gtwizard_gtye4_inst/gen_gtwizard_gtye4.gen_channel_container[10].gen_enabled_channel.gtye4_channel_wrapper_inst/channel_inst/gtye4_channel_gen.gen_gtye4_channel_inst[0].GTYE4_CHANNEL_PRIM_INST/RXOUTCLK}]]

# -group [get_clocks -of_objects [get_pins pfm_top_i/dynamic_region/rtl_kernel_wizard_1_1/inst_design_1/clk_wiz_0/inst/mmcme4_adv_inst/CLKOUT0]] \

set_clock_groups -asynchronous -group [get_clocks -of_objects [get_pins pfm_top_i/static_region/base_clocking/clkwiz_kernel/inst/CLK_CORE_DRP_I/clk_inst/mmcme4_adv_inst/CLKOUT0]] \
-group [get_clocks -of_objects [get_pins pfm_top_i/static_region/base_clocking/clkwiz_sysclks/inst/plle4_adv_inst/CLKOUT0]] \
-group [get_clocks -of_objects [get_pins {pfm_top_i/dynamic_region/rtl_kernel_wizard_1_1/inst_design_1/cmac_usplus_1/inst/design_1_cmac_usplus_1_0_gt_i/inst/gen_gtwizard_gtye4_top.design_1_cmac_usplus_1_0_gt_gtwizard_gtye4_inst/gen_gtwizard_gtye4.gen_channel_container[11].gen_enabled_channel.gtye4_channel_wrapper_inst/channel_inst/gtye4_channel_gen.gen_gtye4_channel_inst[0].GTYE4_CHANNEL_PRIM_INST/TXOUTCLKPCS}]] \
-group [get_clocks -of_objects [get_pins {pfm_top_i/dynamic_region/rtl_kernel_wizard_1_1/inst_design_1/cmac_usplus_1/inst/design_1_cmac_usplus_1_0_gt_i/inst/gen_gtwizard_gtye4_top.design_1_cmac_usplus_1_0_gt_gtwizard_gtye4_inst/gen_gtwizard_gtye4.gen_channel_container[11].gen_enabled_channel.gtye4_channel_wrapper_inst/channel_inst/gtye4_channel_gen.gen_gtye4_channel_inst[1].GTYE4_CHANNEL_PRIM_INST/TXOUTCLKPCS}]] \
-group [get_clocks -of_objects [get_pins {pfm_top_i/dynamic_region/rtl_kernel_wizard_1_1/inst_design_1/cmac_usplus_1/inst/design_1_cmac_usplus_1_0_gt_i/inst/gen_gtwizard_gtye4_top.design_1_cmac_usplus_1_0_gt_gtwizard_gtye4_inst/gen_gtwizard_gtye4.gen_channel_container[11].gen_enabled_channel.gtye4_channel_wrapper_inst/channel_inst/gtye4_channel_gen.gen_gtye4_channel_inst[2].GTYE4_CHANNEL_PRIM_INST/TXOUTCLKPCS}]] \
-group [get_clocks -of_objects [get_pins {pfm_top_i/dynamic_region/rtl_kernel_wizard_1_1/inst_design_1/cmac_usplus_1/inst/design_1_cmac_usplus_1_0_gt_i/inst/gen_gtwizard_gtye4_top.design_1_cmac_usplus_1_0_gt_gtwizard_gtye4_inst/gen_gtwizard_gtye4.gen_channel_container[11].gen_enabled_channel.gtye4_channel_wrapper_inst/channel_inst/gtye4_channel_gen.gen_gtye4_channel_inst[3].GTYE4_CHANNEL_PRIM_INST/TXOUTCLKPCS}]] \
-group [get_clocks -of_objects [get_pins {pfm_top_i/dynamic_region/rtl_kernel_wizard_1_1/inst_design_1/cmac_usplus_1/inst/design_1_cmac_usplus_1_0_gt_i/inst/gen_gtwizard_gtye4_top.design_1_cmac_usplus_1_0_gt_gtwizard_gtye4_inst/gen_gtwizard_gtye4.gen_channel_container[11].gen_enabled_channel.gtye4_channel_wrapper_inst/channel_inst/gtye4_channel_gen.gen_gtye4_channel_inst[0].GTYE4_CHANNEL_PRIM_INST/RXOUTCLK}]] \
-group [get_clocks -of_objects [get_pins {pfm_top_i/dynamic_region/rtl_kernel_wizard_1_1/inst_design_1/cmac_usplus_1/inst/design_1_cmac_usplus_1_0_gt_i/inst/gen_gtwizard_gtye4_top.design_1_cmac_usplus_1_0_gt_gtwizard_gtye4_inst/gen_gtwizard_gtye4.gen_channel_container[11].gen_enabled_channel.gtye4_channel_wrapper_inst/channel_inst/gtye4_channel_gen.gen_gtye4_channel_inst[0].GTYE4_CHANNEL_PRIM_INST/TXOUTCLK}]]

#set_property PACKAGE_PIN BJ43 [get_ports c0_sys_clk_p]
#set_property PACKAGE_PIN BJ44 [get_ports c0_sys_clk_n]
#set_property PACKAGE_PIN BH6 [get_ports c1_sys_clk_p]
#set_property PACKAGE_PIN BJ6 [get_ports c1_sys_clk_n]


#create_pblock pblock_rtl_kernel_wizard_1_1
#resize_pblock pblock_rtl_kernel_wizard_1_1 -add {SLICE_X0Y480:SLICE_X195Y719 CMACE4_X0Y5:CMACE4_X0Y7 DSP48E2_X0Y186:DSP48E2_X27Y281 GTYE4_CHANNEL_X0Y32:GTYE4_CHANNEL_X0Y47 GTYE4_COMMON_X0Y8:GTYE4_COMMON_X0Y11 HPIOB_DCI_SNGL_X0Y32:HPIOB_DCI_SNGL_X0Y47 HPIO_RCLK_PRBS_X0Y8:HPIO_RCLK_PRBS_X0Y11 ILKNE4_X0Y2:ILKNE4_X0Y3 IOB_X0Y416:IOB_X0Y623 RAMB18_X0Y192:RAMB18_X11Y287 RAMB36_X0Y96:RAMB36_X11Y143 URAM288_X0Y128:URAM288_X4Y191}
#WARNING: [Place 30-343] pblock resize has invalid removal range ILKNE4_X0Y2:ILKNE4_X0Y3

#add_cells_to_pblock pblock_dynamic_SLR2 [get_cells [list pfm_top_i/dynamic_region/rtl_kernel_wizard_1_1/inst_design_1/cmac_usplus_0]]
#add_cells_to_pblock pblock_dynamic_SLR2 [get_cells [list pfm_top_i/dynamic_region/rtl_kernel_wizard_1_1/inst_design_1/cmac_usplus_1]]
#add_cells_to_pblock pblock_dynamic_SLR2 [get_cells [list pfm_top_i/dynamic_region/rtl_kernel_wizard_1_1/inst_design_1/udp_core_eval_0]]
#add_cells_to_pblock pblock_dynamic_SLR2 [get_cells [list pfm_top_i/dynamic_region/rtl_kernel_wizard_1_1/inst_design_1/udp_core_eval_1]]
#add_cells_to_pblock pblock_dynamic_SLR2 [get_cells [list pfm_top_i/dynamic_region/rtl_kernel_wizard_1_1/inst_design_1/embedded_test_ip_wra_0]]
#add_cells_to_pblock pblock_dynamic_SLR2 [get_cells [list pfm_top_i/dynamic_region/rtl_kernel_wizard_1_1/inst_design_1/embedded_test_ip_wra_1]]
#add_cells_to_pblock pblock_dynamic_SLR2 [get_cells [list pfm_top_i/dynamic_region/rtl_kernel_wizard_1_1/inst_design_1/serial_pipe_0]]
#add_cells_to_pblock pblock_dynamic_SLR2 [get_cells [list pfm_top_i/dynamic_region/rtl_kernel_wizard_1_1/inst_design_1/serial_pipe_1]]
#add_cells_to_pblock pblock_dynamic_SLR2 [get_cells [list pfm_top_i/dynamic_region/rtl_kernel_wizard_1_1/inst_design_1/ila_0]]
#add_cells_to_pblock pblock_dynamic_SLR2 [get_cells [list pfm_top_i/dynamic_region/rtl_kernel_wizard_1_1/inst_design_1/ila_1]]
#add_cells_to_pblock pblock_dynamic_SLR2 [get_cells [list pfm_top_i/dynamic_region/rtl_kernel_wizard_1_1/inst_design_1/util_vector_logic_0]]
#add_cells_to_pblock pblock_dynamic_SLR2 [get_cells [list pfm_top_i/dynamic_region/rtl_kernel_wizard_1_1/inst_design_1/util_vector_logic_1]]
#add_cells_to_pblock pblock_dynamic_SLR2 [get_cells [list pfm_top_i/dynamic_region/rtl_kernel_wizard_1_1/inst_design_1/util_vector_logic_2]]
#add_cells_to_pblock pblock_dynamic_SLR2 [get_cells [list pfm_top_i/dynamic_region/rtl_kernel_wizard_1_1/inst_design_1/util_vector_logic_3]]
#add_cells_to_pblock pblock_dynamic_SLR2 [get_cells [list pfm_top_i/dynamic_region/rtl_kernel_wizard_1_1/inst_design_1/util_vector_logic_4]]


#set_clock_groups -asynchronous -group [get_clocks clk_out1_clk_wiz_0] -group [get_clocks {txoutclk_out[0]}]
#set_property PACKAGE_PIN P42 [get_ports io_clk_qsfp_refclka_00_clk_p]
#set_property PACKAGE_PIN P43 [get_ports io_clk_qsfp_refclka_00_clk_n]
#set_property PACKAGE_PIN G53 [get_ports {io_gt_qsfp_00_grx_p[0]}]
#set_property PACKAGE_PIN F51 [get_ports {io_gt_qsfp_00_grx_p[1]}]
#set_property PACKAGE_PIN E53 [get_ports {io_gt_qsfp_00_grx_p[2]}]
#set_property PACKAGE_PIN D51 [get_ports {io_gt_qsfp_00_grx_p[3]}]
#set_property PACKAGE_PIN G54 [get_ports {io_gt_qsfp_00_grx_n[0]}]
#set_property PACKAGE_PIN F52 [get_ports {io_gt_qsfp_00_grx_n[1]}]
#set_property PACKAGE_PIN E54 [get_ports {io_gt_qsfp_00_grx_n[2]}]
#set_property PACKAGE_PIN D52 [get_ports {io_gt_qsfp_00_grx_n[3]}]
#set_property PACKAGE_PIN G48 [get_ports {io_gt_qsfp_00_gtx_p[0]}]
#set_property PACKAGE_PIN E48 [get_ports {io_gt_qsfp_00_gtx_p[1]}]
#set_property PACKAGE_PIN C48 [get_ports {io_gt_qsfp_00_gtx_p[2]}]
#set_property PACKAGE_PIN A49 [get_ports {io_gt_qsfp_00_gtx_p[3]}]
#set_property PACKAGE_PIN G49 [get_ports {io_gt_qsfp_00_gtx_n[0]}]
#set_property PACKAGE_PIN E49 [get_ports {io_gt_qsfp_00_gtx_n[1]}]
#set_property PACKAGE_PIN C49 [get_ports {io_gt_qsfp_00_gtx_n[2]}]
#set_property PACKAGE_PIN A50 [get_ports {io_gt_qsfp_00_gtx_n[3]}]
