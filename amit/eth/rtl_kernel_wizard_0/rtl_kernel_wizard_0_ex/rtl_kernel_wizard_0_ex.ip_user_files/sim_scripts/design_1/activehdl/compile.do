vlib work
vlib activehdl

vlib activehdl/xilinx_vip
vlib activehdl/xpm
vlib activehdl/xil_defaultlib
vlib activehdl/gtwizard_ultrascale_v1_7_9
vlib activehdl/cmac_usplus_v3_1_2
vlib activehdl/lib_cdc_v1_0_2
vlib activehdl/proc_sys_reset_v5_0_13
vlib activehdl/util_vector_logic_v2_0_1
vlib activehdl/xlconstant_v1_1_7
vlib activehdl/smartconnect_v1_0
vlib activehdl/axi_infrastructure_v1_1_0
vlib activehdl/axi_register_slice_v2_1_22
vlib activehdl/axi_vip_v1_1_8

vmap xilinx_vip activehdl/xilinx_vip
vmap xpm activehdl/xpm
vmap xil_defaultlib activehdl/xil_defaultlib
vmap gtwizard_ultrascale_v1_7_9 activehdl/gtwizard_ultrascale_v1_7_9
vmap cmac_usplus_v3_1_2 activehdl/cmac_usplus_v3_1_2
vmap lib_cdc_v1_0_2 activehdl/lib_cdc_v1_0_2
vmap proc_sys_reset_v5_0_13 activehdl/proc_sys_reset_v5_0_13
vmap util_vector_logic_v2_0_1 activehdl/util_vector_logic_v2_0_1
vmap xlconstant_v1_1_7 activehdl/xlconstant_v1_1_7
vmap smartconnect_v1_0 activehdl/smartconnect_v1_0
vmap axi_infrastructure_v1_1_0 activehdl/axi_infrastructure_v1_1_0
vmap axi_register_slice_v2_1_22 activehdl/axi_register_slice_v2_1_22
vmap axi_vip_v1_1_8 activehdl/axi_vip_v1_1_8

vlog -work xilinx_vip  -sv2k12 "+incdir+/opt/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"/opt/Xilinx/Vivado/2020.2/data/xilinx_vip/hdl/axi4stream_vip_axi4streampc.sv" \
"/opt/Xilinx/Vivado/2020.2/data/xilinx_vip/hdl/axi_vip_axi4pc.sv" \
"/opt/Xilinx/Vivado/2020.2/data/xilinx_vip/hdl/xil_common_vip_pkg.sv" \
"/opt/Xilinx/Vivado/2020.2/data/xilinx_vip/hdl/axi4stream_vip_pkg.sv" \
"/opt/Xilinx/Vivado/2020.2/data/xilinx_vip/hdl/axi_vip_pkg.sv" \
"/opt/Xilinx/Vivado/2020.2/data/xilinx_vip/hdl/axi4stream_vip_if.sv" \
"/opt/Xilinx/Vivado/2020.2/data/xilinx_vip/hdl/axi_vip_if.sv" \
"/opt/Xilinx/Vivado/2020.2/data/xilinx_vip/hdl/clk_vip_if.sv" \
"/opt/Xilinx/Vivado/2020.2/data/xilinx_vip/hdl/rst_vip_if.sv" \

vlog -work xpm  -sv2k12 "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/d0f7" "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/25b7/hdl/verilog" "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/896c/hdl/verilog" "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/1b7e/hdl/verilog" "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/122e/hdl/verilog" "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/b205/hdl/verilog" "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/c968/hdl/verilog" "+incdir+/opt/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"/opt/Xilinx/Vivado/2020.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"/opt/Xilinx/Vivado/2020.2/data/ip/xpm/xpm_fifo/hdl/xpm_fifo.sv" \
"/opt/Xilinx/Vivado/2020.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -93 \
"/opt/Xilinx/Vivado/2020.2/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/d0f7" "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/25b7/hdl/verilog" "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/896c/hdl/verilog" "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/1b7e/hdl/verilog" "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/122e/hdl/verilog" "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/b205/hdl/verilog" "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/c968/hdl/verilog" "+incdir+/opt/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../bd/design_1/ip/design_1_clk_wiz_0_0/design_1_clk_wiz_0_0_clk_wiz.v" \
"../../../bd/design_1/ip/design_1_clk_wiz_0_0/design_1_clk_wiz_0_0.v" \

vlog -work gtwizard_ultrascale_v1_7_9  -v2k5 "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/d0f7" "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/25b7/hdl/verilog" "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/896c/hdl/verilog" "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/1b7e/hdl/verilog" "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/122e/hdl/verilog" "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/b205/hdl/verilog" "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/c968/hdl/verilog" "+incdir+/opt/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/d12e/hdl/gtwizard_ultrascale_v1_7_bit_sync.v" \
"../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/d12e/hdl/gtwizard_ultrascale_v1_7_gte4_drp_arb.v" \
"../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/d12e/hdl/gtwizard_ultrascale_v1_7_gthe4_delay_powergood.v" \
"../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/d12e/hdl/gtwizard_ultrascale_v1_7_gtye4_delay_powergood.v" \
"../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/d12e/hdl/gtwizard_ultrascale_v1_7_gthe3_cpll_cal.v" \
"../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/d12e/hdl/gtwizard_ultrascale_v1_7_gthe3_cal_freqcnt.v" \
"../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/d12e/hdl/gtwizard_ultrascale_v1_7_gthe4_cpll_cal.v" \
"../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/d12e/hdl/gtwizard_ultrascale_v1_7_gthe4_cpll_cal_rx.v" \
"../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/d12e/hdl/gtwizard_ultrascale_v1_7_gthe4_cpll_cal_tx.v" \
"../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/d12e/hdl/gtwizard_ultrascale_v1_7_gthe4_cal_freqcnt.v" \
"../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/d12e/hdl/gtwizard_ultrascale_v1_7_gtye4_cpll_cal.v" \
"../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/d12e/hdl/gtwizard_ultrascale_v1_7_gtye4_cpll_cal_rx.v" \
"../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/d12e/hdl/gtwizard_ultrascale_v1_7_gtye4_cpll_cal_tx.v" \
"../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/d12e/hdl/gtwizard_ultrascale_v1_7_gtye4_cal_freqcnt.v" \
"../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/d12e/hdl/gtwizard_ultrascale_v1_7_gtwiz_buffbypass_rx.v" \
"../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/d12e/hdl/gtwizard_ultrascale_v1_7_gtwiz_buffbypass_tx.v" \
"../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/d12e/hdl/gtwizard_ultrascale_v1_7_gtwiz_reset.v" \
"../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/d12e/hdl/gtwizard_ultrascale_v1_7_gtwiz_userclk_rx.v" \
"../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/d12e/hdl/gtwizard_ultrascale_v1_7_gtwiz_userclk_tx.v" \
"../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/d12e/hdl/gtwizard_ultrascale_v1_7_gtwiz_userdata_rx.v" \
"../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/d12e/hdl/gtwizard_ultrascale_v1_7_gtwiz_userdata_tx.v" \
"../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/d12e/hdl/gtwizard_ultrascale_v1_7_reset_sync.v" \
"../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/d12e/hdl/gtwizard_ultrascale_v1_7_reset_inv_sync.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/d0f7" "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/25b7/hdl/verilog" "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/896c/hdl/verilog" "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/1b7e/hdl/verilog" "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/122e/hdl/verilog" "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/b205/hdl/verilog" "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/c968/hdl/verilog" "+incdir+/opt/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../bd/design_1/ip/design_1_cmac_usplus_0_0/ip_0/sim/gtwizard_ultrascale_v1_7_gtye4_channel.v" \
"../../../bd/design_1/ip/design_1_cmac_usplus_0_0/ip_0/sim/design_1_cmac_usplus_0_0_gt_gtye4_channel_wrapper.v" \
"../../../bd/design_1/ip/design_1_cmac_usplus_0_0/ip_0/sim/gtwizard_ultrascale_v1_7_gtye4_common.v" \
"../../../bd/design_1/ip/design_1_cmac_usplus_0_0/ip_0/sim/design_1_cmac_usplus_0_0_gt_gtye4_common_wrapper.v" \
"../../../bd/design_1/ip/design_1_cmac_usplus_0_0/ip_0/sim/design_1_cmac_usplus_0_0_gt_gtwizard_gtye4.v" \
"../../../bd/design_1/ip/design_1_cmac_usplus_0_0/ip_0/sim/design_1_cmac_usplus_0_0_gt_gtwizard_top.v" \
"../../../bd/design_1/ip/design_1_cmac_usplus_0_0/ip_0/sim/design_1_cmac_usplus_0_0_gt.v" \
"../../../bd/design_1/ip/design_1_cmac_usplus_0_0/cmac_usplus_v3_1_2/design_1_cmac_usplus_0_0_wrapper.v" \
"../../../bd/design_1/ip/design_1_cmac_usplus_0_0/cmac_usplus_v3_1_2/design_1_cmac_usplus_0_0_ultrascale_tx_userclk.v" \
"../../../bd/design_1/ip/design_1_cmac_usplus_0_0/cmac_usplus_v3_1_2/design_1_cmac_usplus_0_0_ultrascale_rx_userclk.v" \

vlog -work cmac_usplus_v3_1_2  -sv2k12 "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/d0f7" "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/25b7/hdl/verilog" "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/896c/hdl/verilog" "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/1b7e/hdl/verilog" "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/122e/hdl/verilog" "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/b205/hdl/verilog" "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/c968/hdl/verilog" "+incdir+/opt/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/1193/hdl/cmac_usplus_v3_1_rfs.sv" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/d0f7" "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/25b7/hdl/verilog" "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/896c/hdl/verilog" "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/1b7e/hdl/verilog" "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/122e/hdl/verilog" "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/b205/hdl/verilog" "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/c968/hdl/verilog" "+incdir+/opt/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../bd/design_1/ip/design_1_cmac_usplus_0_0/design_1_cmac_usplus_0_0/example_design/design_1_cmac_usplus_0_0_axis2lbus_segmented_top.v" \
"../../../bd/design_1/ip/design_1_cmac_usplus_0_0/design_1_cmac_usplus_0_0/example_design/design_1_cmac_usplus_0_0_lbus2axis_segmented_top.v" \
"../../../bd/design_1/ip/design_1_cmac_usplus_0_0/design_1_cmac_usplus_0_0.v" \
"../../../bd/design_1/ip/design_1_cmac_usplus_1_0/ip_0/sim/design_1_cmac_usplus_1_0_gt_gtye4_channel_wrapper.v" \
"../../../bd/design_1/ip/design_1_cmac_usplus_1_0/ip_0/sim/design_1_cmac_usplus_1_0_gt_gtye4_common_wrapper.v" \
"../../../bd/design_1/ip/design_1_cmac_usplus_1_0/ip_0/sim/design_1_cmac_usplus_1_0_gt_gtwizard_gtye4.v" \
"../../../bd/design_1/ip/design_1_cmac_usplus_1_0/ip_0/sim/design_1_cmac_usplus_1_0_gt_gtwizard_top.v" \
"../../../bd/design_1/ip/design_1_cmac_usplus_1_0/ip_0/sim/design_1_cmac_usplus_1_0_gt.v" \
"../../../bd/design_1/ip/design_1_cmac_usplus_1_0/cmac_usplus_v3_1_2/design_1_cmac_usplus_1_0_wrapper.v" \
"../../../bd/design_1/ip/design_1_cmac_usplus_1_0/cmac_usplus_v3_1_2/design_1_cmac_usplus_1_0_ultrascale_tx_userclk.v" \
"../../../bd/design_1/ip/design_1_cmac_usplus_1_0/cmac_usplus_v3_1_2/design_1_cmac_usplus_1_0_ultrascale_rx_userclk.v" \
"../../../bd/design_1/ip/design_1_cmac_usplus_1_0/design_1_cmac_usplus_1_0/example_design/design_1_cmac_usplus_1_0_axis2lbus_segmented_top.v" \
"../../../bd/design_1/ip/design_1_cmac_usplus_1_0/design_1_cmac_usplus_1_0/example_design/design_1_cmac_usplus_1_0_lbus2axis_segmented_top.v" \
"../../../bd/design_1/ip/design_1_cmac_usplus_1_0/design_1_cmac_usplus_1_0.v" \
"../../../bd/design_1/ip/design_1_dsp_send_0_0/sim/design_1_dsp_send_0_0.v" \
"../../../bd/design_1/ip/design_1_dsp_send_1_0/sim/design_1_dsp_send_1_0.v" \
"../../../bd/design_1/ip/design_1_embedded_test_ip_wra_0_0/design_1_embedded_test_ip_wra_0_0_sim_netlist.v" \
"../../../bd/design_1/ip/design_1_embedded_test_ip_wra_1_0/design_1_embedded_test_ip_wra_1_0_sim_netlist.v" \
"../../../bd/design_1/ip/design_1_ila_0_0/sim/design_1_ila_0_0.v" \
"../../../bd/design_1/ip/design_1_ila_1_0/sim/design_1_ila_1_0.v" \

vcom -work lib_cdc_v1_0_2 -93 \
"../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/ef1e/hdl/lib_cdc_v1_0_rfs.vhd" \

vcom -work proc_sys_reset_v5_0_13 -93 \
"../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/8842/hdl/proc_sys_reset_v5_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../bd/design_1/ip/design_1_proc_sys_reset_0_0/sim/design_1_proc_sys_reset_0_0.vhd" \
"../../../bd/design_1/ip/design_1_proc_sys_reset_1_0/sim/design_1_proc_sys_reset_1_0.vhd" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/d0f7" "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/25b7/hdl/verilog" "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/896c/hdl/verilog" "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/1b7e/hdl/verilog" "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/122e/hdl/verilog" "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/b205/hdl/verilog" "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/c968/hdl/verilog" "+incdir+/opt/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../bd/design_1/ip/design_1_serial_pipe_0_0/sim/design_1_serial_pipe_0_0.v" \
"../../../bd/design_1/ip/design_1_serial_pipe_1_0/sim/design_1_serial_pipe_1_0.v" \
"../../../bd/design_1/ip/design_1_serial_pipe_2_0/sim/design_1_serial_pipe_2_0.v" \
"../../../bd/design_1/ip/design_1_udp_core_eval_0_0/design_1_udp_core_eval_0_0_sim_netlist.v" \
"../../../bd/design_1/ip/design_1_udp_core_eval_1_0/design_1_udp_core_eval_1_0_sim_netlist.v" \

vlog -work util_vector_logic_v2_0_1  -v2k5 "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/d0f7" "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/25b7/hdl/verilog" "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/896c/hdl/verilog" "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/1b7e/hdl/verilog" "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/122e/hdl/verilog" "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/b205/hdl/verilog" "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/c968/hdl/verilog" "+incdir+/opt/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/3f90/hdl/util_vector_logic_v2_0_vl_rfs.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/d0f7" "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/25b7/hdl/verilog" "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/896c/hdl/verilog" "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/1b7e/hdl/verilog" "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/122e/hdl/verilog" "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/b205/hdl/verilog" "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/c968/hdl/verilog" "+incdir+/opt/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../bd/design_1/ip/design_1_util_vector_logic_0_0/sim/design_1_util_vector_logic_0_0.v" \
"../../../bd/design_1/ip/design_1_util_vector_logic_2_0/sim/design_1_util_vector_logic_2_0.v" \
"../../../bd/design_1/ip/design_1_util_vector_logic_4_0/sim/design_1_util_vector_logic_4_0.v" \
"../../../bd/design_1/ip/design_1_util_vector_logic_9_0/sim/design_1_util_vector_logic_9_0.v" \
"../../../bd/design_1/ip/design_1_util_vector_logic_10_0/sim/design_1_util_vector_logic_10_0.v" \
"../../../bd/design_1/ip/design_1_util_vector_logic_11_0/sim/design_1_util_vector_logic_11_0.v" \
"../../../bd/design_1/ip/design_1_util_vector_logic_12_0/sim/design_1_util_vector_logic_12_0.v" \
"../../../bd/design_1/ip/design_1_util_vector_logic_13_0/sim/design_1_util_vector_logic_13_0.v" \
"../../../bd/design_1/ip/design_1_util_vector_logic_15_0/sim/design_1_util_vector_logic_15_0.v" \

vlog -work xlconstant_v1_1_7  -v2k5 "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/d0f7" "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/25b7/hdl/verilog" "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/896c/hdl/verilog" "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/1b7e/hdl/verilog" "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/122e/hdl/verilog" "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/b205/hdl/verilog" "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/c968/hdl/verilog" "+incdir+/opt/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/fcfc/hdl/xlconstant_v1_1_vl_rfs.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/d0f7" "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/25b7/hdl/verilog" "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/896c/hdl/verilog" "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/1b7e/hdl/verilog" "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/122e/hdl/verilog" "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/b205/hdl/verilog" "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/c968/hdl/verilog" "+incdir+/opt/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../bd/design_1/ip/design_1_xlconstant_0_0/sim/design_1_xlconstant_0_0.v" \
"../../../bd/design_1/ip/design_1_xlconstant_1_0/sim/design_1_xlconstant_1_0.v" \
"../../../bd/design_1/ip/design_1_xlconstant_2_0/sim/design_1_xlconstant_2_0.v" \
"../../../bd/design_1/ip/design_1_smartconnect_0_0/bd_0/sim/bd_48ac.v" \
"../../../bd/design_1/ip/design_1_smartconnect_0_0/bd_0/ip/ip_0/sim/bd_48ac_one_0.v" \

vcom -work xil_defaultlib -93 \
"../../../bd/design_1/ip/design_1_smartconnect_0_0/bd_0/ip/ip_1/sim/bd_48ac_psr_aclk_0.vhd" \

vlog -work smartconnect_v1_0  -sv2k12 "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/d0f7" "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/25b7/hdl/verilog" "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/896c/hdl/verilog" "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/1b7e/hdl/verilog" "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/122e/hdl/verilog" "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/b205/hdl/verilog" "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/c968/hdl/verilog" "+incdir+/opt/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/25b7/hdl/sc_util_v1_0_vl_rfs.sv" \
"../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/c012/hdl/sc_switchboard_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/d0f7" "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/25b7/hdl/verilog" "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/896c/hdl/verilog" "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/1b7e/hdl/verilog" "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/122e/hdl/verilog" "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/b205/hdl/verilog" "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/c968/hdl/verilog" "+incdir+/opt/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../bd/design_1/ip/design_1_smartconnect_0_0/bd_0/ip/ip_2/sim/bd_48ac_arsw_0.sv" \
"../../../bd/design_1/ip/design_1_smartconnect_0_0/bd_0/ip/ip_3/sim/bd_48ac_rsw_0.sv" \
"../../../bd/design_1/ip/design_1_smartconnect_0_0/bd_0/ip/ip_4/sim/bd_48ac_awsw_0.sv" \
"../../../bd/design_1/ip/design_1_smartconnect_0_0/bd_0/ip/ip_5/sim/bd_48ac_wsw_0.sv" \
"../../../bd/design_1/ip/design_1_smartconnect_0_0/bd_0/ip/ip_6/sim/bd_48ac_bsw_0.sv" \

vlog -work smartconnect_v1_0  -sv2k12 "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/d0f7" "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/25b7/hdl/verilog" "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/896c/hdl/verilog" "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/1b7e/hdl/verilog" "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/122e/hdl/verilog" "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/b205/hdl/verilog" "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/c968/hdl/verilog" "+incdir+/opt/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/ea34/hdl/sc_mmu_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/d0f7" "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/25b7/hdl/verilog" "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/896c/hdl/verilog" "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/1b7e/hdl/verilog" "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/122e/hdl/verilog" "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/b205/hdl/verilog" "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/c968/hdl/verilog" "+incdir+/opt/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../bd/design_1/ip/design_1_smartconnect_0_0/bd_0/ip/ip_7/sim/bd_48ac_s00mmu_0.sv" \

vlog -work smartconnect_v1_0  -sv2k12 "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/d0f7" "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/25b7/hdl/verilog" "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/896c/hdl/verilog" "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/1b7e/hdl/verilog" "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/122e/hdl/verilog" "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/b205/hdl/verilog" "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/c968/hdl/verilog" "+incdir+/opt/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/4fd2/hdl/sc_transaction_regulator_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/d0f7" "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/25b7/hdl/verilog" "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/896c/hdl/verilog" "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/1b7e/hdl/verilog" "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/122e/hdl/verilog" "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/b205/hdl/verilog" "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/c968/hdl/verilog" "+incdir+/opt/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../bd/design_1/ip/design_1_smartconnect_0_0/bd_0/ip/ip_8/sim/bd_48ac_s00tr_0.sv" \

vlog -work smartconnect_v1_0  -sv2k12 "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/d0f7" "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/25b7/hdl/verilog" "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/896c/hdl/verilog" "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/1b7e/hdl/verilog" "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/122e/hdl/verilog" "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/b205/hdl/verilog" "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/c968/hdl/verilog" "+incdir+/opt/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/8047/hdl/sc_si_converter_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/d0f7" "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/25b7/hdl/verilog" "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/896c/hdl/verilog" "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/1b7e/hdl/verilog" "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/122e/hdl/verilog" "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/b205/hdl/verilog" "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/c968/hdl/verilog" "+incdir+/opt/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../bd/design_1/ip/design_1_smartconnect_0_0/bd_0/ip/ip_9/sim/bd_48ac_s00sic_0.sv" \

vlog -work smartconnect_v1_0  -sv2k12 "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/d0f7" "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/25b7/hdl/verilog" "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/896c/hdl/verilog" "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/1b7e/hdl/verilog" "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/122e/hdl/verilog" "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/b205/hdl/verilog" "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/c968/hdl/verilog" "+incdir+/opt/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/b89e/hdl/sc_axi2sc_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/d0f7" "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/25b7/hdl/verilog" "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/896c/hdl/verilog" "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/1b7e/hdl/verilog" "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/122e/hdl/verilog" "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/b205/hdl/verilog" "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/c968/hdl/verilog" "+incdir+/opt/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../bd/design_1/ip/design_1_smartconnect_0_0/bd_0/ip/ip_10/sim/bd_48ac_s00a2s_0.sv" \

vlog -work smartconnect_v1_0  -sv2k12 "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/d0f7" "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/25b7/hdl/verilog" "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/896c/hdl/verilog" "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/1b7e/hdl/verilog" "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/122e/hdl/verilog" "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/b205/hdl/verilog" "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/c968/hdl/verilog" "+incdir+/opt/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/896c/hdl/sc_node_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/d0f7" "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/25b7/hdl/verilog" "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/896c/hdl/verilog" "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/1b7e/hdl/verilog" "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/122e/hdl/verilog" "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/b205/hdl/verilog" "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/c968/hdl/verilog" "+incdir+/opt/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../bd/design_1/ip/design_1_smartconnect_0_0/bd_0/ip/ip_11/sim/bd_48ac_sarn_0.sv" \
"../../../bd/design_1/ip/design_1_smartconnect_0_0/bd_0/ip/ip_12/sim/bd_48ac_srn_0.sv" \
"../../../bd/design_1/ip/design_1_smartconnect_0_0/bd_0/ip/ip_13/sim/bd_48ac_sawn_0.sv" \
"../../../bd/design_1/ip/design_1_smartconnect_0_0/bd_0/ip/ip_14/sim/bd_48ac_swn_0.sv" \
"../../../bd/design_1/ip/design_1_smartconnect_0_0/bd_0/ip/ip_15/sim/bd_48ac_sbn_0.sv" \

vlog -work smartconnect_v1_0  -sv2k12 "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/d0f7" "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/25b7/hdl/verilog" "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/896c/hdl/verilog" "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/1b7e/hdl/verilog" "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/122e/hdl/verilog" "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/b205/hdl/verilog" "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/c968/hdl/verilog" "+incdir+/opt/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/7005/hdl/sc_sc2axi_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/d0f7" "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/25b7/hdl/verilog" "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/896c/hdl/verilog" "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/1b7e/hdl/verilog" "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/122e/hdl/verilog" "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/b205/hdl/verilog" "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/c968/hdl/verilog" "+incdir+/opt/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../bd/design_1/ip/design_1_smartconnect_0_0/bd_0/ip/ip_16/sim/bd_48ac_m00s2a_0.sv" \
"../../../bd/design_1/ip/design_1_smartconnect_0_0/bd_0/ip/ip_17/sim/bd_48ac_m00arn_0.sv" \
"../../../bd/design_1/ip/design_1_smartconnect_0_0/bd_0/ip/ip_18/sim/bd_48ac_m00rn_0.sv" \
"../../../bd/design_1/ip/design_1_smartconnect_0_0/bd_0/ip/ip_19/sim/bd_48ac_m00awn_0.sv" \
"../../../bd/design_1/ip/design_1_smartconnect_0_0/bd_0/ip/ip_20/sim/bd_48ac_m00wn_0.sv" \
"../../../bd/design_1/ip/design_1_smartconnect_0_0/bd_0/ip/ip_21/sim/bd_48ac_m00bn_0.sv" \

vlog -work smartconnect_v1_0  -sv2k12 "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/d0f7" "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/25b7/hdl/verilog" "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/896c/hdl/verilog" "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/1b7e/hdl/verilog" "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/122e/hdl/verilog" "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/b205/hdl/verilog" "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/c968/hdl/verilog" "+incdir+/opt/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/7bd7/hdl/sc_exit_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/d0f7" "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/25b7/hdl/verilog" "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/896c/hdl/verilog" "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/1b7e/hdl/verilog" "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/122e/hdl/verilog" "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/b205/hdl/verilog" "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/c968/hdl/verilog" "+incdir+/opt/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../bd/design_1/ip/design_1_smartconnect_0_0/bd_0/ip/ip_22/sim/bd_48ac_m00e_0.sv" \
"../../../bd/design_1/ip/design_1_smartconnect_0_0/bd_0/ip/ip_23/sim/bd_48ac_m01s2a_0.sv" \
"../../../bd/design_1/ip/design_1_smartconnect_0_0/bd_0/ip/ip_24/sim/bd_48ac_m01arn_0.sv" \
"../../../bd/design_1/ip/design_1_smartconnect_0_0/bd_0/ip/ip_25/sim/bd_48ac_m01rn_0.sv" \
"../../../bd/design_1/ip/design_1_smartconnect_0_0/bd_0/ip/ip_26/sim/bd_48ac_m01awn_0.sv" \
"../../../bd/design_1/ip/design_1_smartconnect_0_0/bd_0/ip/ip_27/sim/bd_48ac_m01wn_0.sv" \
"../../../bd/design_1/ip/design_1_smartconnect_0_0/bd_0/ip/ip_28/sim/bd_48ac_m01bn_0.sv" \
"../../../bd/design_1/ip/design_1_smartconnect_0_0/bd_0/ip/ip_29/sim/bd_48ac_m01e_0.sv" \
"../../../bd/design_1/ip/design_1_smartconnect_0_0/bd_0/ip/ip_30/sim/bd_48ac_m02s2a_0.sv" \
"../../../bd/design_1/ip/design_1_smartconnect_0_0/bd_0/ip/ip_31/sim/bd_48ac_m02arn_0.sv" \
"../../../bd/design_1/ip/design_1_smartconnect_0_0/bd_0/ip/ip_32/sim/bd_48ac_m02rn_0.sv" \
"../../../bd/design_1/ip/design_1_smartconnect_0_0/bd_0/ip/ip_33/sim/bd_48ac_m02awn_0.sv" \
"../../../bd/design_1/ip/design_1_smartconnect_0_0/bd_0/ip/ip_34/sim/bd_48ac_m02wn_0.sv" \
"../../../bd/design_1/ip/design_1_smartconnect_0_0/bd_0/ip/ip_35/sim/bd_48ac_m02bn_0.sv" \
"../../../bd/design_1/ip/design_1_smartconnect_0_0/bd_0/ip/ip_36/sim/bd_48ac_m02e_0.sv" \
"../../../bd/design_1/ip/design_1_smartconnect_0_0/bd_0/ip/ip_37/sim/bd_48ac_m03s2a_0.sv" \
"../../../bd/design_1/ip/design_1_smartconnect_0_0/bd_0/ip/ip_38/sim/bd_48ac_m03arn_0.sv" \
"../../../bd/design_1/ip/design_1_smartconnect_0_0/bd_0/ip/ip_39/sim/bd_48ac_m03rn_0.sv" \
"../../../bd/design_1/ip/design_1_smartconnect_0_0/bd_0/ip/ip_40/sim/bd_48ac_m03awn_0.sv" \
"../../../bd/design_1/ip/design_1_smartconnect_0_0/bd_0/ip/ip_41/sim/bd_48ac_m03wn_0.sv" \
"../../../bd/design_1/ip/design_1_smartconnect_0_0/bd_0/ip/ip_42/sim/bd_48ac_m03bn_0.sv" \
"../../../bd/design_1/ip/design_1_smartconnect_0_0/bd_0/ip/ip_43/sim/bd_48ac_m03e_0.sv" \

vlog -work axi_infrastructure_v1_1_0  -v2k5 "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/d0f7" "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/25b7/hdl/verilog" "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/896c/hdl/verilog" "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/1b7e/hdl/verilog" "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/122e/hdl/verilog" "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/b205/hdl/verilog" "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/c968/hdl/verilog" "+incdir+/opt/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/ec67/hdl/axi_infrastructure_v1_1_vl_rfs.v" \

vlog -work axi_register_slice_v2_1_22  -v2k5 "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/d0f7" "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/25b7/hdl/verilog" "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/896c/hdl/verilog" "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/1b7e/hdl/verilog" "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/122e/hdl/verilog" "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/b205/hdl/verilog" "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/c968/hdl/verilog" "+incdir+/opt/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/af2c/hdl/axi_register_slice_v2_1_vl_rfs.v" \

vlog -work axi_vip_v1_1_8  -sv2k12 "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/d0f7" "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/25b7/hdl/verilog" "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/896c/hdl/verilog" "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/1b7e/hdl/verilog" "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/122e/hdl/verilog" "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/b205/hdl/verilog" "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/c968/hdl/verilog" "+incdir+/opt/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/94c3/hdl/axi_vip_v1_1_vl_rfs.sv" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/d0f7" "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/25b7/hdl/verilog" "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/896c/hdl/verilog" "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/1b7e/hdl/verilog" "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/122e/hdl/verilog" "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/b205/hdl/verilog" "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/c968/hdl/verilog" "+incdir+/opt/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../bd/design_1/ip/design_1_smartconnect_0_0/sim/design_1_smartconnect_0_0.v" \
"../../../bd/design_1/sim/design_1.v" \
"../../../bd/design_1/ip/design_1_rtl_kernel_wizard_0_0_0/sim/design_1_rtl_kernel_wizard_0_0_0.v" \
"../../../bd/design_1/ip/design_1_smartconnect_1_1/bd_0/ip/ip_0/sim/bd_483c_one_0.v" \

vcom -work xil_defaultlib -93 \
"../../../bd/design_1/ip/design_1_smartconnect_1_1/bd_0/ip/ip_1/sim/bd_483c_psr_aclk_0.vhd" \

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/d0f7" "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/25b7/hdl/verilog" "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/896c/hdl/verilog" "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/1b7e/hdl/verilog" "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/122e/hdl/verilog" "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/b205/hdl/verilog" "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/c968/hdl/verilog" "+incdir+/opt/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../bd/design_1/ip/design_1_smartconnect_1_1/bd_0/ip/ip_2/sim/bd_483c_arsw_0.sv" \
"../../../bd/design_1/ip/design_1_smartconnect_1_1/bd_0/ip/ip_3/sim/bd_483c_rsw_0.sv" \
"../../../bd/design_1/ip/design_1_smartconnect_1_1/bd_0/ip/ip_4/sim/bd_483c_awsw_0.sv" \
"../../../bd/design_1/ip/design_1_smartconnect_1_1/bd_0/ip/ip_5/sim/bd_483c_wsw_0.sv" \
"../../../bd/design_1/ip/design_1_smartconnect_1_1/bd_0/ip/ip_6/sim/bd_483c_bsw_0.sv" \
"../../../bd/design_1/ip/design_1_smartconnect_1_1/bd_0/ip/ip_7/sim/bd_483c_s00mmu_0.sv" \
"../../../bd/design_1/ip/design_1_smartconnect_1_1/bd_0/ip/ip_8/sim/bd_483c_s00tr_0.sv" \
"../../../bd/design_1/ip/design_1_smartconnect_1_1/bd_0/ip/ip_9/sim/bd_483c_s00sic_0.sv" \
"../../../bd/design_1/ip/design_1_smartconnect_1_1/bd_0/ip/ip_10/sim/bd_483c_s00a2s_0.sv" \
"../../../bd/design_1/ip/design_1_smartconnect_1_1/bd_0/ip/ip_11/sim/bd_483c_sarn_0.sv" \
"../../../bd/design_1/ip/design_1_smartconnect_1_1/bd_0/ip/ip_12/sim/bd_483c_srn_0.sv" \
"../../../bd/design_1/ip/design_1_smartconnect_1_1/bd_0/ip/ip_13/sim/bd_483c_sawn_0.sv" \
"../../../bd/design_1/ip/design_1_smartconnect_1_1/bd_0/ip/ip_14/sim/bd_483c_swn_0.sv" \
"../../../bd/design_1/ip/design_1_smartconnect_1_1/bd_0/ip/ip_15/sim/bd_483c_sbn_0.sv" \
"../../../bd/design_1/ip/design_1_smartconnect_1_1/bd_0/ip/ip_16/sim/bd_483c_m00s2a_0.sv" \
"../../../bd/design_1/ip/design_1_smartconnect_1_1/bd_0/ip/ip_17/sim/bd_483c_m00arn_0.sv" \
"../../../bd/design_1/ip/design_1_smartconnect_1_1/bd_0/ip/ip_18/sim/bd_483c_m00rn_0.sv" \
"../../../bd/design_1/ip/design_1_smartconnect_1_1/bd_0/ip/ip_19/sim/bd_483c_m00awn_0.sv" \
"../../../bd/design_1/ip/design_1_smartconnect_1_1/bd_0/ip/ip_20/sim/bd_483c_m00wn_0.sv" \
"../../../bd/design_1/ip/design_1_smartconnect_1_1/bd_0/ip/ip_21/sim/bd_483c_m00bn_0.sv" \
"../../../bd/design_1/ip/design_1_smartconnect_1_1/bd_0/ip/ip_22/sim/bd_483c_m00e_0.sv" \
"../../../bd/design_1/ip/design_1_smartconnect_1_1/bd_0/ip/ip_23/sim/bd_483c_m01s2a_0.sv" \
"../../../bd/design_1/ip/design_1_smartconnect_1_1/bd_0/ip/ip_24/sim/bd_483c_m01arn_0.sv" \
"../../../bd/design_1/ip/design_1_smartconnect_1_1/bd_0/ip/ip_25/sim/bd_483c_m01rn_0.sv" \
"../../../bd/design_1/ip/design_1_smartconnect_1_1/bd_0/ip/ip_26/sim/bd_483c_m01awn_0.sv" \
"../../../bd/design_1/ip/design_1_smartconnect_1_1/bd_0/ip/ip_27/sim/bd_483c_m01wn_0.sv" \
"../../../bd/design_1/ip/design_1_smartconnect_1_1/bd_0/ip/ip_28/sim/bd_483c_m01bn_0.sv" \
"../../../bd/design_1/ip/design_1_smartconnect_1_1/bd_0/ip/ip_29/sim/bd_483c_m01e_0.sv" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/d0f7" "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/25b7/hdl/verilog" "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/896c/hdl/verilog" "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/1b7e/hdl/verilog" "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/122e/hdl/verilog" "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/b205/hdl/verilog" "+incdir+../../../../rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ipshared/c968/hdl/verilog" "+incdir+/opt/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../bd/design_1/ip/design_1_smartconnect_1_1/bd_0/sim/bd_483c.v" \
"../../../bd/design_1/ip/design_1_smartconnect_1_1/sim/design_1_smartconnect_1_1.v" \

vlog -work xil_defaultlib \
"glbl.v"

