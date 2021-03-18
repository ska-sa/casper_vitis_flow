vlib modelsim_lib/work
vlib modelsim_lib/msim

vlib modelsim_lib/msim/xilinx_vip
vlib modelsim_lib/msim/xpm
vlib modelsim_lib/msim/axi_infrastructure_v1_1_0
vlib modelsim_lib/msim/xil_defaultlib
vlib modelsim_lib/msim/axi_vip_v1_1_8

vmap xilinx_vip modelsim_lib/msim/xilinx_vip
vmap xpm modelsim_lib/msim/xpm
vmap axi_infrastructure_v1_1_0 modelsim_lib/msim/axi_infrastructure_v1_1_0
vmap xil_defaultlib modelsim_lib/msim/xil_defaultlib
vmap axi_vip_v1_1_8 modelsim_lib/msim/axi_vip_v1_1_8

vlog -work xilinx_vip -64 -incr -sv -L axi_vip_v1_1_8 -L xilinx_vip "+incdir+/opt/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"/opt/Xilinx/Vivado/2020.2/data/xilinx_vip/hdl/axi4stream_vip_axi4streampc.sv" \
"/opt/Xilinx/Vivado/2020.2/data/xilinx_vip/hdl/axi_vip_axi4pc.sv" \
"/opt/Xilinx/Vivado/2020.2/data/xilinx_vip/hdl/xil_common_vip_pkg.sv" \
"/opt/Xilinx/Vivado/2020.2/data/xilinx_vip/hdl/axi4stream_vip_pkg.sv" \
"/opt/Xilinx/Vivado/2020.2/data/xilinx_vip/hdl/axi_vip_pkg.sv" \
"/opt/Xilinx/Vivado/2020.2/data/xilinx_vip/hdl/axi4stream_vip_if.sv" \
"/opt/Xilinx/Vivado/2020.2/data/xilinx_vip/hdl/axi_vip_if.sv" \
"/opt/Xilinx/Vivado/2020.2/data/xilinx_vip/hdl/clk_vip_if.sv" \
"/opt/Xilinx/Vivado/2020.2/data/xilinx_vip/hdl/rst_vip_if.sv" \

vlog -work xpm -64 -incr -sv -L axi_vip_v1_1_8 -L xilinx_vip "+incdir+../../../ipstatic/hdl" "+incdir+/opt/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"/opt/Xilinx/Vivado/2020.2/data/ip/xpm/xpm_fifo/hdl/xpm_fifo.sv" \
"/opt/Xilinx/Vivado/2020.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \
"/opt/Xilinx/Vivado/2020.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \

vcom -work xpm -64 -93 \
"/opt/Xilinx/Vivado/2020.2/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work axi_infrastructure_v1_1_0 -64 -incr "+incdir+../../../ipstatic/hdl" "+incdir+/opt/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../ipstatic/hdl/axi_infrastructure_v1_1_vl_rfs.v" \

vlog -work xil_defaultlib -64 -incr -sv -L axi_vip_v1_1_8 -L xilinx_vip "+incdir+../../../ipstatic/hdl" "+incdir+/opt/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../rtl_kernel_wizard_0_ex.gen/sources_1/ip/control_rtl_kernel_wizard_0_vip/sim/control_rtl_kernel_wizard_0_vip_pkg.sv" \

vlog -work axi_vip_v1_1_8 -64 -incr -sv -L axi_vip_v1_1_8 -L xilinx_vip "+incdir+../../../ipstatic/hdl" "+incdir+/opt/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../ipstatic/hdl/axi_vip_v1_1_vl_rfs.sv" \

vlog -work xil_defaultlib -64 -incr -sv -L axi_vip_v1_1_8 -L xilinx_vip "+incdir+../../../ipstatic/hdl" "+incdir+/opt/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../rtl_kernel_wizard_0_ex.gen/sources_1/ip/control_rtl_kernel_wizard_0_vip/sim/control_rtl_kernel_wizard_0_vip.sv" \

vlog -work xil_defaultlib \
"glbl.v"

