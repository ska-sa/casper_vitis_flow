vlib work
vlib activehdl

vlib activehdl/xilinx_vip
vlib activehdl/xpm
vlib activehdl/lib_pkg_v1_0_2
vlib activehdl/lib_srl_fifo_v1_0_2
vlib activehdl/fifo_generator_v13_2_5
vlib activehdl/lib_fifo_v1_0_14
vlib activehdl/lib_cdc_v1_0_2
vlib activehdl/axi_datamover_v5_1_23
vlib activehdl/axi_sg_v4_1_13
vlib activehdl/axi_cdma_v4_1_21
vlib activehdl/xil_defaultlib

vmap xilinx_vip activehdl/xilinx_vip
vmap xpm activehdl/xpm
vmap lib_pkg_v1_0_2 activehdl/lib_pkg_v1_0_2
vmap lib_srl_fifo_v1_0_2 activehdl/lib_srl_fifo_v1_0_2
vmap fifo_generator_v13_2_5 activehdl/fifo_generator_v13_2_5
vmap lib_fifo_v1_0_14 activehdl/lib_fifo_v1_0_14
vmap lib_cdc_v1_0_2 activehdl/lib_cdc_v1_0_2
vmap axi_datamover_v5_1_23 activehdl/axi_datamover_v5_1_23
vmap axi_sg_v4_1_13 activehdl/axi_sg_v4_1_13
vmap axi_cdma_v4_1_21 activehdl/axi_cdma_v4_1_21
vmap xil_defaultlib activehdl/xil_defaultlib

vlog -work xilinx_vip  -sv2k12 "+incdir+/opt/Xilinx/Vivado/2020.1/data/xilinx_vip/include" \
"/opt/Xilinx/Vivado/2020.1/data/xilinx_vip/hdl/axi4stream_vip_axi4streampc.sv" \
"/opt/Xilinx/Vivado/2020.1/data/xilinx_vip/hdl/axi_vip_axi4pc.sv" \
"/opt/Xilinx/Vivado/2020.1/data/xilinx_vip/hdl/xil_common_vip_pkg.sv" \
"/opt/Xilinx/Vivado/2020.1/data/xilinx_vip/hdl/axi4stream_vip_pkg.sv" \
"/opt/Xilinx/Vivado/2020.1/data/xilinx_vip/hdl/axi_vip_pkg.sv" \
"/opt/Xilinx/Vivado/2020.1/data/xilinx_vip/hdl/axi4stream_vip_if.sv" \
"/opt/Xilinx/Vivado/2020.1/data/xilinx_vip/hdl/axi_vip_if.sv" \
"/opt/Xilinx/Vivado/2020.1/data/xilinx_vip/hdl/clk_vip_if.sv" \
"/opt/Xilinx/Vivado/2020.1/data/xilinx_vip/hdl/rst_vip_if.sv" \

vlog -work xpm  -sv2k12 "+incdir+/opt/Xilinx/Vivado/2020.1/data/xilinx_vip/include" \
"/opt/Xilinx/Vivado/2020.1/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"/opt/Xilinx/Vivado/2020.1/data/ip/xpm/xpm_fifo/hdl/xpm_fifo.sv" \
"/opt/Xilinx/Vivado/2020.1/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -93 \
"/opt/Xilinx/Vivado/2020.1/data/ip/xpm/xpm_VCOMP.vhd" \

vcom -work lib_pkg_v1_0_2 -93 \
"../../../ipstatic/hdl/lib_pkg_v1_0_rfs.vhd" \

vcom -work lib_srl_fifo_v1_0_2 -93 \
"../../../ipstatic/hdl/lib_srl_fifo_v1_0_rfs.vhd" \

vlog -work fifo_generator_v13_2_5  -v2k5 "+incdir+/opt/Xilinx/Vivado/2020.1/data/xilinx_vip/include" \
"../../../ipstatic/simulation/fifo_generator_vlog_beh.v" \

vcom -work fifo_generator_v13_2_5 -93 \
"../../../ipstatic/hdl/fifo_generator_v13_2_rfs.vhd" \

vlog -work fifo_generator_v13_2_5  -v2k5 "+incdir+/opt/Xilinx/Vivado/2020.1/data/xilinx_vip/include" \
"../../../ipstatic/hdl/fifo_generator_v13_2_rfs.v" \

vcom -work lib_fifo_v1_0_14 -93 \
"../../../ipstatic/hdl/lib_fifo_v1_0_rfs.vhd" \

vcom -work lib_cdc_v1_0_2 -93 \
"../../../ipstatic/hdl/lib_cdc_v1_0_rfs.vhd" \

vcom -work axi_datamover_v5_1_23 -93 \
"../../../ipstatic/hdl/axi_datamover_v5_1_vh_rfs.vhd" \

vcom -work axi_sg_v4_1_13 -93 \
"../../../ipstatic/hdl/axi_sg_v4_1_rfs.vhd" \

vcom -work axi_cdma_v4_1_21 -93 \
"../../../ipstatic/hdl/axi_cdma_v4_1_vh_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../../../../../../casper_astro/mlib_devel/100gbe/u50/dsp_packetizer/dsp_packetizer.srcs/ip/axi_cdma_0/sim/axi_cdma_0.vhd" \

vlog -work xil_defaultlib \
"glbl.v"

