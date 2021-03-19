//Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2020.2 (lin64) Build 3064766 Wed Nov 18 09:12:47 MST 2020
//Date        : Fri Mar 19 09:56:48 2021
//Host        : fpgdev running 64-bit Ubuntu 16.04.7 LTS
//Command     : generate_target design_1.bd
//Design      : design_1
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "design_1,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=design_1,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=28,numReposBlks=28,numNonXlnxBlks=2,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=5,numPkgbdBlks=0,bdsource=USER,synth_mode=OOC_per_IP}" *) (* HW_HANDOFF = "design_1.hwdef" *) 
module design_1
   (S00_AXI_0_araddr,
    S00_AXI_0_arprot,
    S00_AXI_0_arready,
    S00_AXI_0_arvalid,
    S00_AXI_0_awaddr,
    S00_AXI_0_awprot,
    S00_AXI_0_awready,
    S00_AXI_0_awvalid,
    S00_AXI_0_bready,
    S00_AXI_0_bresp,
    S00_AXI_0_bvalid,
    S00_AXI_0_rdata,
    S00_AXI_0_rready,
    S00_AXI_0_rresp,
    S00_AXI_0_rvalid,
    S00_AXI_0_wdata,
    S00_AXI_0_wready,
    S00_AXI_0_wstrb,
    S00_AXI_0_wvalid,
    aclk_0,
    gt_ref_clk_0_clk_n,
    gt_ref_clk_0_clk_p,
    gt_ref_clk_1_clk_n,
    gt_ref_clk_1_clk_p,
    gt_serial_port_0_grx_n,
    gt_serial_port_0_grx_p,
    gt_serial_port_0_gtx_n,
    gt_serial_port_0_gtx_p,
    gt_serial_port_1_grx_n,
    gt_serial_port_1_grx_p,
    gt_serial_port_1_gtx_n,
    gt_serial_port_1_gtx_p,
    locked,
    udp_axis_m_0_tdata,
    udp_axis_m_0_tid,
    udp_axis_m_0_tkeep,
    udp_axis_m_0_tlast,
    udp_axis_m_0_tready,
    udp_axis_m_0_tuser,
    udp_axis_m_0_tvalid,
    udp_axis_m_1_tdata,
    udp_axis_m_1_tid,
    udp_axis_m_1_tkeep,
    udp_axis_m_1_tlast,
    udp_axis_m_1_tready,
    udp_axis_m_1_tuser,
    udp_axis_m_1_tvalid,
    udp_axis_s_0_tdata,
    udp_axis_s_0_tid,
    udp_axis_s_0_tkeep,
    udp_axis_s_0_tlast,
    udp_axis_s_0_tready,
    udp_axis_s_0_tuser,
    udp_axis_s_0_tvalid,
    udp_axis_s_1_tdata,
    udp_axis_s_1_tid,
    udp_axis_s_1_tkeep,
    udp_axis_s_1_tlast,
    udp_axis_s_1_tready,
    udp_axis_s_1_tuser,
    udp_axis_s_1_tvalid);
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI_0 ARADDR" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S00_AXI_0, ADDR_WIDTH 32, ARUSER_WIDTH 0, AWUSER_WIDTH 0, BUSER_WIDTH 0, CLK_DOMAIN design_1_aclk_0, DATA_WIDTH 32, FREQ_HZ 100000000, HAS_BRESP 1, HAS_BURST 1, HAS_CACHE 1, HAS_LOCK 1, HAS_PROT 1, HAS_QOS 1, HAS_REGION 0, HAS_RRESP 1, HAS_WSTRB 1, ID_WIDTH 0, INSERT_VIP 0, MAX_BURST_LENGTH 1, NUM_READ_OUTSTANDING 2, NUM_READ_THREADS 1, NUM_WRITE_OUTSTANDING 2, NUM_WRITE_THREADS 1, PHASE 0.000, PROTOCOL AXI4LITE, READ_WRITE_MODE READ_WRITE, RUSER_BITS_PER_BYTE 0, RUSER_WIDTH 0, SUPPORTS_NARROW_BURST 0, WUSER_BITS_PER_BYTE 0, WUSER_WIDTH 0" *) input [31:0]S00_AXI_0_araddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI_0 ARPROT" *) input [2:0]S00_AXI_0_arprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI_0 ARREADY" *) output S00_AXI_0_arready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI_0 ARVALID" *) input S00_AXI_0_arvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI_0 AWADDR" *) input [31:0]S00_AXI_0_awaddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI_0 AWPROT" *) input [2:0]S00_AXI_0_awprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI_0 AWREADY" *) output S00_AXI_0_awready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI_0 AWVALID" *) input S00_AXI_0_awvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI_0 BREADY" *) input S00_AXI_0_bready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI_0 BRESP" *) output [1:0]S00_AXI_0_bresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI_0 BVALID" *) output S00_AXI_0_bvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI_0 RDATA" *) output [31:0]S00_AXI_0_rdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI_0 RREADY" *) input S00_AXI_0_rready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI_0 RRESP" *) output [1:0]S00_AXI_0_rresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI_0 RVALID" *) output S00_AXI_0_rvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI_0 WDATA" *) input [31:0]S00_AXI_0_wdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI_0 WREADY" *) output S00_AXI_0_wready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI_0 WSTRB" *) input [3:0]S00_AXI_0_wstrb;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI_0 WVALID" *) input S00_AXI_0_wvalid;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.ACLK_0 CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.ACLK_0, ASSOCIATED_BUSIF S00_AXI_0, ASSOCIATED_RESET locked, CLK_DOMAIN design_1_aclk_0, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.000" *) input aclk_0;
  (* X_INTERFACE_INFO = "xilinx.com:interface:diff_clock:1.0 gt_ref_clk_0 CLK_N" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME gt_ref_clk_0, CAN_DEBUG false, FREQ_HZ 156250000" *) input gt_ref_clk_0_clk_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:diff_clock:1.0 gt_ref_clk_0 CLK_P" *) input gt_ref_clk_0_clk_p;
  (* X_INTERFACE_INFO = "xilinx.com:interface:diff_clock:1.0 gt_ref_clk_1 CLK_N" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME gt_ref_clk_1, CAN_DEBUG false, FREQ_HZ 156250000" *) input gt_ref_clk_1_clk_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:diff_clock:1.0 gt_ref_clk_1 CLK_P" *) input gt_ref_clk_1_clk_p;
  (* X_INTERFACE_INFO = "xilinx.com:interface:gt:1.0 gt_serial_port_0 GRX_N" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME gt_serial_port_0, CAN_DEBUG false" *) input [3:0]gt_serial_port_0_grx_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:gt:1.0 gt_serial_port_0 GRX_P" *) input [3:0]gt_serial_port_0_grx_p;
  (* X_INTERFACE_INFO = "xilinx.com:interface:gt:1.0 gt_serial_port_0 GTX_N" *) output [3:0]gt_serial_port_0_gtx_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:gt:1.0 gt_serial_port_0 GTX_P" *) output [3:0]gt_serial_port_0_gtx_p;
  (* X_INTERFACE_INFO = "xilinx.com:interface:gt:1.0 gt_serial_port_1 GRX_N" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME gt_serial_port_1, CAN_DEBUG false" *) input [3:0]gt_serial_port_1_grx_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:gt:1.0 gt_serial_port_1 GRX_P" *) input [3:0]gt_serial_port_1_grx_p;
  (* X_INTERFACE_INFO = "xilinx.com:interface:gt:1.0 gt_serial_port_1 GTX_N" *) output [3:0]gt_serial_port_1_gtx_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:gt:1.0 gt_serial_port_1 GTX_P" *) output [3:0]gt_serial_port_1_gtx_p;
  input locked;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 udp_axis_m_0 TDATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME udp_axis_m_0, FREQ_HZ 322265625, HAS_TKEEP 1, HAS_TLAST 1, HAS_TREADY 1, HAS_TSTRB 0, INSERT_VIP 0, LAYERED_METADATA undef, PHASE 0.000, TDATA_NUM_BYTES 64, TDEST_WIDTH 0, TID_WIDTH 8, TUSER_WIDTH 32" *) output [511:0]udp_axis_m_0_tdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 udp_axis_m_0 TID" *) output [7:0]udp_axis_m_0_tid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 udp_axis_m_0 TKEEP" *) output [63:0]udp_axis_m_0_tkeep;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 udp_axis_m_0 TLAST" *) output udp_axis_m_0_tlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 udp_axis_m_0 TREADY" *) input udp_axis_m_0_tready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 udp_axis_m_0 TUSER" *) output [31:0]udp_axis_m_0_tuser;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 udp_axis_m_0 TVALID" *) output udp_axis_m_0_tvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 udp_axis_m_1 TDATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME udp_axis_m_1, FREQ_HZ 322265625, HAS_TKEEP 1, HAS_TLAST 1, HAS_TREADY 1, HAS_TSTRB 0, INSERT_VIP 0, LAYERED_METADATA undef, PHASE 0.000, TDATA_NUM_BYTES 64, TDEST_WIDTH 0, TID_WIDTH 8, TUSER_WIDTH 32" *) output [511:0]udp_axis_m_1_tdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 udp_axis_m_1 TID" *) output [7:0]udp_axis_m_1_tid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 udp_axis_m_1 TKEEP" *) output [63:0]udp_axis_m_1_tkeep;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 udp_axis_m_1 TLAST" *) output udp_axis_m_1_tlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 udp_axis_m_1 TREADY" *) input udp_axis_m_1_tready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 udp_axis_m_1 TUSER" *) output [31:0]udp_axis_m_1_tuser;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 udp_axis_m_1 TVALID" *) output udp_axis_m_1_tvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 udp_axis_s_0 TDATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME udp_axis_s_0, FREQ_HZ 322265625, HAS_TKEEP 1, HAS_TLAST 1, HAS_TREADY 1, HAS_TSTRB 0, INSERT_VIP 0, LAYERED_METADATA undef, PHASE 0.000, TDATA_NUM_BYTES 64, TDEST_WIDTH 0, TID_WIDTH 8, TUSER_WIDTH 32" *) input [511:0]udp_axis_s_0_tdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 udp_axis_s_0 TID" *) input [7:0]udp_axis_s_0_tid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 udp_axis_s_0 TKEEP" *) input [63:0]udp_axis_s_0_tkeep;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 udp_axis_s_0 TLAST" *) input udp_axis_s_0_tlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 udp_axis_s_0 TREADY" *) output udp_axis_s_0_tready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 udp_axis_s_0 TUSER" *) input [31:0]udp_axis_s_0_tuser;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 udp_axis_s_0 TVALID" *) input udp_axis_s_0_tvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 udp_axis_s_1 TDATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME udp_axis_s_1, FREQ_HZ 322265625, HAS_TKEEP 1, HAS_TLAST 1, HAS_TREADY 1, HAS_TSTRB 0, INSERT_VIP 0, LAYERED_METADATA undef, PHASE 0.000, TDATA_NUM_BYTES 64, TDEST_WIDTH 0, TID_WIDTH 8, TUSER_WIDTH 32" *) input [511:0]udp_axis_s_1_tdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 udp_axis_s_1 TID" *) input [7:0]udp_axis_s_1_tid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 udp_axis_s_1 TKEEP" *) input [63:0]udp_axis_s_1_tkeep;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 udp_axis_s_1 TLAST" *) input udp_axis_s_1_tlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 udp_axis_s_1 TREADY" *) output udp_axis_s_1_tready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 udp_axis_s_1 TUSER" *) input [31:0]udp_axis_s_1_tuser;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 udp_axis_s_1 TVALID" *) input udp_axis_s_1_tvalid;

  wire Net;
  wire Net1;
  wire [0:0]Net2;
  wire [31:0]S00_AXI_0_1_ARADDR;
  wire [2:0]S00_AXI_0_1_ARPROT;
  wire S00_AXI_0_1_ARREADY;
  wire S00_AXI_0_1_ARVALID;
  wire [31:0]S00_AXI_0_1_AWADDR;
  wire [2:0]S00_AXI_0_1_AWPROT;
  wire S00_AXI_0_1_AWREADY;
  wire S00_AXI_0_1_AWVALID;
  wire S00_AXI_0_1_BREADY;
  wire [1:0]S00_AXI_0_1_BRESP;
  wire S00_AXI_0_1_BVALID;
  wire [31:0]S00_AXI_0_1_RDATA;
  wire S00_AXI_0_1_RREADY;
  wire [1:0]S00_AXI_0_1_RRESP;
  wire S00_AXI_0_1_RVALID;
  wire [31:0]S00_AXI_0_1_WDATA;
  wire S00_AXI_0_1_WREADY;
  wire [3:0]S00_AXI_0_1_WSTRB;
  wire S00_AXI_0_1_WVALID;
  wire axi4lite_aclk_0_1;
  wire axi4lite_aresetn_0_1;
  wire [511:0]cmac_usplus_0_axis_rx_TDATA;
  wire [63:0]cmac_usplus_0_axis_rx_TKEEP;
  wire cmac_usplus_0_axis_rx_TLAST;
  wire cmac_usplus_0_axis_rx_TUSER;
  wire cmac_usplus_0_axis_rx_TVALID;
  wire [3:0]cmac_usplus_0_gt_serial_port_GRX_N;
  wire [3:0]cmac_usplus_0_gt_serial_port_GRX_P;
  wire [3:0]cmac_usplus_0_gt_serial_port_GTX_N;
  wire [3:0]cmac_usplus_0_gt_serial_port_GTX_P;
  wire cmac_usplus_0_stat_rx_local_fault;
  wire cmac_usplus_0_stat_rx_remote_fault;
  wire cmac_usplus_0_stat_rx_status;
  wire cmac_usplus_0_usr_tx_reset;
  wire [511:0]cmac_usplus_1_axis_rx_TDATA;
  wire [63:0]cmac_usplus_1_axis_rx_TKEEP;
  wire cmac_usplus_1_axis_rx_TLAST;
  wire cmac_usplus_1_axis_rx_TUSER;
  wire cmac_usplus_1_axis_rx_TVALID;
  wire [3:0]cmac_usplus_1_gt_serial_port_GRX_N;
  wire [3:0]cmac_usplus_1_gt_serial_port_GRX_P;
  wire [3:0]cmac_usplus_1_gt_serial_port_GTX_N;
  wire [3:0]cmac_usplus_1_gt_serial_port_GTX_P;
  wire cmac_usplus_1_gt_txusrclk2;
  wire cmac_usplus_1_stat_rx_aligned;
  wire cmac_usplus_1_stat_rx_local_fault;
  wire cmac_usplus_1_stat_rx_remote_fault;
  wire cmac_usplus_1_stat_rx_status;
  wire cmac_usplus_1_usr_rx_reset;
  wire cmac_usplus_1_usr_rx_reset1;
  wire cmac_usplus_1_usr_tx_reset;
  wire cmac_usplus_2_gt_txusrclk2;
  wire dsp_send_0_core_xeset;
  wire dsp_send_0_ctl_rx_enable;
  wire dsp_send_0_ctl_tx_enable;
  wire dsp_send_0_ctl_tx_send_rfi;
  wire [3:0]dsp_send_0_state;
  wire dsp_send_1_core_xeset;
  wire [3:0]dsp_send_1_state;
  wire dsp_send_2_ctl_rx_exable;
  wire dsp_send_2_ctl_tx_exable;
  wire dsp_send_2_ctl_tx_send_rfi;
  wire gt_ref_clk_0_1_CLK_N;
  wire gt_ref_clk_0_1_CLK_P;
  wire gt_ref_clk_1_1_CLK_N;
  wire gt_ref_clk_1_1_CLK_P;
  wire [0:0]proc_sys_reset_0_peripheral_reset;
  wire [0:0]proc_sys_reset_1_peripheral_reset;
  wire serial_pipe_1_serial_out;
  wire serial_pipe_2_serial_out;
  wire [31:0]smartconnect_0_M00_AXI_ARADDR;
  wire smartconnect_0_M00_AXI_ARREADY;
  wire smartconnect_0_M00_AXI_ARVALID;
  wire [31:0]smartconnect_0_M00_AXI_AWADDR;
  wire smartconnect_0_M00_AXI_AWREADY;
  wire smartconnect_0_M00_AXI_AWVALID;
  wire smartconnect_0_M00_AXI_BREADY;
  wire [1:0]smartconnect_0_M00_AXI_BRESP;
  wire smartconnect_0_M00_AXI_BVALID;
  wire [31:0]smartconnect_0_M00_AXI_RDATA;
  wire smartconnect_0_M00_AXI_RREADY;
  wire [1:0]smartconnect_0_M00_AXI_RRESP;
  wire smartconnect_0_M00_AXI_RVALID;
  wire [31:0]smartconnect_0_M00_AXI_WDATA;
  wire smartconnect_0_M00_AXI_WREADY;
  wire [3:0]smartconnect_0_M00_AXI_WSTRB;
  wire smartconnect_0_M00_AXI_WVALID;
  wire [31:0]smartconnect_0_M01_AXI_ARADDR;
  wire smartconnect_0_M01_AXI_ARREADY;
  wire smartconnect_0_M01_AXI_ARVALID;
  wire [31:0]smartconnect_0_M01_AXI_AWADDR;
  wire smartconnect_0_M01_AXI_AWREADY;
  wire smartconnect_0_M01_AXI_AWVALID;
  wire smartconnect_0_M01_AXI_BREADY;
  wire [1:0]smartconnect_0_M01_AXI_BRESP;
  wire smartconnect_0_M01_AXI_BVALID;
  wire [31:0]smartconnect_0_M01_AXI_RDATA;
  wire smartconnect_0_M01_AXI_RREADY;
  wire [1:0]smartconnect_0_M01_AXI_RRESP;
  wire smartconnect_0_M01_AXI_RVALID;
  wire [31:0]smartconnect_0_M01_AXI_WDATA;
  wire smartconnect_0_M01_AXI_WREADY;
  wire [3:0]smartconnect_0_M01_AXI_WSTRB;
  wire smartconnect_0_M01_AXI_WVALID;
  wire [511:0]udp_axis_s_0_1_TDATA;
  wire [7:0]udp_axis_s_0_1_TID;
  wire [63:0]udp_axis_s_0_1_TKEEP;
  wire udp_axis_s_0_1_TLAST;
  wire udp_axis_s_0_1_TREADY;
  wire [31:0]udp_axis_s_0_1_TUSER;
  wire udp_axis_s_0_1_TVALID;
  wire [511:0]udp_axis_s_1_1_TDATA;
  wire [7:0]udp_axis_s_1_1_TID;
  wire [63:0]udp_axis_s_1_1_TKEEP;
  wire udp_axis_s_1_1_TLAST;
  wire udp_axis_s_1_1_TREADY;
  wire [31:0]udp_axis_s_1_1_TUSER;
  wire udp_axis_s_1_1_TVALID;
  wire [511:0]udp_core_eval_0_tx_axis_m_TDATA;
  wire [63:0]udp_core_eval_0_tx_axis_m_TKEEP;
  wire udp_core_eval_0_tx_axis_m_TLAST;
  wire udp_core_eval_0_tx_axis_m_TREADY;
  wire [31:0]udp_core_eval_0_tx_axis_m_TUSER;
  wire udp_core_eval_0_tx_axis_m_TVALID;
  wire [511:0]udp_core_eval_0_udp_axis_m_TDATA;
  wire [7:0]udp_core_eval_0_udp_axis_m_TID;
  wire [63:0]udp_core_eval_0_udp_axis_m_TKEEP;
  wire udp_core_eval_0_udp_axis_m_TLAST;
  wire udp_core_eval_0_udp_axis_m_TREADY;
  wire [31:0]udp_core_eval_0_udp_axis_m_TUSER;
  wire udp_core_eval_0_udp_axis_m_TVALID;
  wire [511:0]udp_core_eval_1_tx_axis_m_TDATA;
  wire [63:0]udp_core_eval_1_tx_axis_m_TKEEP;
  wire udp_core_eval_1_tx_axis_m_TLAST;
  wire udp_core_eval_1_tx_axis_m_TREADY;
  wire [31:0]udp_core_eval_1_tx_axis_m_TUSER;
  wire udp_core_eval_1_tx_axis_m_TVALID;
  wire [511:0]udp_core_eval_1_udp_axis_m_TDATA;
  wire [7:0]udp_core_eval_1_udp_axis_m_TID;
  wire [63:0]udp_core_eval_1_udp_axis_m_TKEEP;
  wire udp_core_eval_1_udp_axis_m_TLAST;
  wire udp_core_eval_1_udp_axis_m_TREADY;
  wire [31:0]udp_core_eval_1_udp_axis_m_TUSER;
  wire udp_core_eval_1_udp_axis_m_TVALID;
  wire [0:0]util_vector_logic_0_Res;
  wire [0:0]util_vector_logic_10_Res;
  wire [0:0]util_vector_logic_11_Res;
  wire [0:0]util_vector_logic_12_Res;
  wire [0:0]util_vector_logic_15_Res;
  wire [0:0]util_vector_logic_2_Res;
  wire [0:0]util_vector_logic_4_Res;
  wire [0:0]util_vector_logic_5_Res;
  wire [0:0]util_vector_logic_6_Res;
  wire [0:0]util_vector_logic_9_Res;
  wire [0:0]xlconstant_1_dout;
  wire [0:0]xlconstant_2_dout;

  assign S00_AXI_0_1_ARADDR = S00_AXI_0_araddr[31:0];
  assign S00_AXI_0_1_ARPROT = S00_AXI_0_arprot[2:0];
  assign S00_AXI_0_1_ARVALID = S00_AXI_0_arvalid;
  assign S00_AXI_0_1_AWADDR = S00_AXI_0_awaddr[31:0];
  assign S00_AXI_0_1_AWPROT = S00_AXI_0_awprot[2:0];
  assign S00_AXI_0_1_AWVALID = S00_AXI_0_awvalid;
  assign S00_AXI_0_1_BREADY = S00_AXI_0_bready;
  assign S00_AXI_0_1_RREADY = S00_AXI_0_rready;
  assign S00_AXI_0_1_WDATA = S00_AXI_0_wdata[31:0];
  assign S00_AXI_0_1_WSTRB = S00_AXI_0_wstrb[3:0];
  assign S00_AXI_0_1_WVALID = S00_AXI_0_wvalid;
  assign S00_AXI_0_arready = S00_AXI_0_1_ARREADY;
  assign S00_AXI_0_awready = S00_AXI_0_1_AWREADY;
  assign S00_AXI_0_bresp[1:0] = S00_AXI_0_1_BRESP;
  assign S00_AXI_0_bvalid = S00_AXI_0_1_BVALID;
  assign S00_AXI_0_rdata[31:0] = S00_AXI_0_1_RDATA;
  assign S00_AXI_0_rresp[1:0] = S00_AXI_0_1_RRESP;
  assign S00_AXI_0_rvalid = S00_AXI_0_1_RVALID;
  assign S00_AXI_0_wready = S00_AXI_0_1_WREADY;
  assign axi4lite_aclk_0_1 = aclk_0;
  assign axi4lite_aresetn_0_1 = locked;
  assign cmac_usplus_0_gt_serial_port_GRX_N = gt_serial_port_1_grx_n[3:0];
  assign cmac_usplus_0_gt_serial_port_GRX_P = gt_serial_port_1_grx_p[3:0];
  assign cmac_usplus_1_gt_serial_port_GRX_N = gt_serial_port_0_grx_n[3:0];
  assign cmac_usplus_1_gt_serial_port_GRX_P = gt_serial_port_0_grx_p[3:0];
  assign gt_ref_clk_0_1_CLK_N = gt_ref_clk_0_clk_n;
  assign gt_ref_clk_0_1_CLK_P = gt_ref_clk_0_clk_p;
  assign gt_ref_clk_1_1_CLK_N = gt_ref_clk_1_clk_n;
  assign gt_ref_clk_1_1_CLK_P = gt_ref_clk_1_clk_p;
  assign gt_serial_port_0_gtx_n[3:0] = cmac_usplus_1_gt_serial_port_GTX_N;
  assign gt_serial_port_0_gtx_p[3:0] = cmac_usplus_1_gt_serial_port_GTX_P;
  assign gt_serial_port_1_gtx_n[3:0] = cmac_usplus_0_gt_serial_port_GTX_N;
  assign gt_serial_port_1_gtx_p[3:0] = cmac_usplus_0_gt_serial_port_GTX_P;
  assign udp_axis_m_0_tdata[511:0] = udp_core_eval_0_udp_axis_m_TDATA;
  assign udp_axis_m_0_tid[7:0] = udp_core_eval_0_udp_axis_m_TID;
  assign udp_axis_m_0_tkeep[63:0] = udp_core_eval_0_udp_axis_m_TKEEP;
  assign udp_axis_m_0_tlast = udp_core_eval_0_udp_axis_m_TLAST;
  assign udp_axis_m_0_tuser[31:0] = udp_core_eval_0_udp_axis_m_TUSER;
  assign udp_axis_m_0_tvalid = udp_core_eval_0_udp_axis_m_TVALID;
  assign udp_axis_m_1_tdata[511:0] = udp_core_eval_1_udp_axis_m_TDATA;
  assign udp_axis_m_1_tid[7:0] = udp_core_eval_1_udp_axis_m_TID;
  assign udp_axis_m_1_tkeep[63:0] = udp_core_eval_1_udp_axis_m_TKEEP;
  assign udp_axis_m_1_tlast = udp_core_eval_1_udp_axis_m_TLAST;
  assign udp_axis_m_1_tuser[31:0] = udp_core_eval_1_udp_axis_m_TUSER;
  assign udp_axis_m_1_tvalid = udp_core_eval_1_udp_axis_m_TVALID;
  assign udp_axis_s_0_1_TDATA = udp_axis_s_0_tdata[511:0];
  assign udp_axis_s_0_1_TID = udp_axis_s_0_tid[7:0];
  assign udp_axis_s_0_1_TKEEP = udp_axis_s_0_tkeep[63:0];
  assign udp_axis_s_0_1_TLAST = udp_axis_s_0_tlast;
  assign udp_axis_s_0_1_TUSER = udp_axis_s_0_tuser[31:0];
  assign udp_axis_s_0_1_TVALID = udp_axis_s_0_tvalid;
  assign udp_axis_s_0_tready = udp_axis_s_0_1_TREADY;
  assign udp_axis_s_1_1_TDATA = udp_axis_s_1_tdata[511:0];
  assign udp_axis_s_1_1_TID = udp_axis_s_1_tid[7:0];
  assign udp_axis_s_1_1_TKEEP = udp_axis_s_1_tkeep[63:0];
  assign udp_axis_s_1_1_TLAST = udp_axis_s_1_tlast;
  assign udp_axis_s_1_1_TUSER = udp_axis_s_1_tuser[31:0];
  assign udp_axis_s_1_1_TVALID = udp_axis_s_1_tvalid;
  assign udp_axis_s_1_tready = udp_axis_s_1_1_TREADY;
  assign udp_core_eval_0_udp_axis_m_TREADY = udp_axis_m_0_tready;
  assign udp_core_eval_1_udp_axis_m_TREADY = udp_axis_m_1_tready;
  design_1_cmac_usplus_0_0 cmac_usplus_0
       (.core_drp_reset(1'b0),
        .core_rx_reset(1'b0),
        .core_tx_reset(1'b0),
        .ctl_rx_enable(dsp_send_2_ctl_rx_exable),
        .ctl_rx_force_resync(1'b0),
        .ctl_rx_test_pattern(1'b0),
        .ctl_tx_enable(dsp_send_2_ctl_tx_exable),
        .ctl_tx_send_idle(1'b0),
        .ctl_tx_send_lfi(1'b0),
        .ctl_tx_send_rfi(dsp_send_2_ctl_tx_send_rfi),
        .ctl_tx_test_pattern(1'b0),
        .drp_addr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .drp_clk(axi4lite_aclk_0_1),
        .drp_di({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .drp_en(1'b0),
        .drp_we(1'b0),
        .gt_loopback_in({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .gt_ref_clk_n(gt_ref_clk_0_1_CLK_N),
        .gt_ref_clk_p(gt_ref_clk_0_1_CLK_P),
        .gt_rxn_in(cmac_usplus_1_gt_serial_port_GRX_N),
        .gt_rxp_in(cmac_usplus_1_gt_serial_port_GRX_P),
        .gt_txn_out(cmac_usplus_1_gt_serial_port_GTX_N),
        .gt_txp_out(cmac_usplus_1_gt_serial_port_GTX_P),
        .gt_txusrclk2(cmac_usplus_2_gt_txusrclk2),
        .gtwiz_reset_rx_datapath(1'b0),
        .gtwiz_reset_tx_datapath(1'b0),
        .init_clk(axi4lite_aclk_0_1),
        .rx_axis_tdata(cmac_usplus_1_axis_rx_TDATA),
        .rx_axis_tkeep(cmac_usplus_1_axis_rx_TKEEP),
        .rx_axis_tlast(cmac_usplus_1_axis_rx_TLAST),
        .rx_axis_tuser(cmac_usplus_1_axis_rx_TUSER),
        .rx_axis_tvalid(cmac_usplus_1_axis_rx_TVALID),
        .rx_clk(cmac_usplus_2_gt_txusrclk2),
        .stat_rx_aligned(Net),
        .stat_rx_local_fault(cmac_usplus_1_stat_rx_local_fault),
        .stat_rx_remote_fault(cmac_usplus_1_stat_rx_remote_fault),
        .stat_rx_status(cmac_usplus_1_stat_rx_status),
        .sys_reset(util_vector_logic_12_Res),
        .tx_axis_tdata(udp_core_eval_0_tx_axis_m_TDATA),
        .tx_axis_tkeep(udp_core_eval_0_tx_axis_m_TKEEP),
        .tx_axis_tlast(udp_core_eval_0_tx_axis_m_TLAST),
        .tx_axis_tready(udp_core_eval_0_tx_axis_m_TREADY),
        .tx_axis_tuser(udp_core_eval_0_tx_axis_m_TUSER[0]),
        .tx_axis_tvalid(udp_core_eval_0_tx_axis_m_TVALID),
        .tx_preamblein({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .usr_rx_reset(cmac_usplus_1_usr_rx_reset1),
        .usr_tx_reset(cmac_usplus_1_usr_tx_reset));
  design_1_cmac_usplus_1_0 cmac_usplus_1
       (.core_drp_reset(1'b0),
        .core_rx_reset(1'b0),
        .core_tx_reset(1'b0),
        .ctl_rx_enable(dsp_send_0_ctl_rx_enable),
        .ctl_rx_force_resync(1'b0),
        .ctl_rx_test_pattern(1'b0),
        .ctl_tx_enable(dsp_send_0_ctl_tx_enable),
        .ctl_tx_send_idle(1'b0),
        .ctl_tx_send_lfi(1'b0),
        .ctl_tx_send_rfi(dsp_send_0_ctl_tx_send_rfi),
        .ctl_tx_test_pattern(1'b0),
        .drp_addr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .drp_clk(axi4lite_aclk_0_1),
        .drp_di({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .drp_en(1'b0),
        .drp_we(1'b0),
        .gt_loopback_in({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .gt_ref_clk_n(gt_ref_clk_1_1_CLK_N),
        .gt_ref_clk_p(gt_ref_clk_1_1_CLK_P),
        .gt_rxn_in(cmac_usplus_0_gt_serial_port_GRX_N),
        .gt_rxp_in(cmac_usplus_0_gt_serial_port_GRX_P),
        .gt_txn_out(cmac_usplus_0_gt_serial_port_GTX_N),
        .gt_txp_out(cmac_usplus_0_gt_serial_port_GTX_P),
        .gt_txusrclk2(cmac_usplus_1_gt_txusrclk2),
        .gtwiz_reset_rx_datapath(1'b0),
        .gtwiz_reset_tx_datapath(1'b0),
        .init_clk(axi4lite_aclk_0_1),
        .rx_axis_tdata(cmac_usplus_0_axis_rx_TDATA),
        .rx_axis_tkeep(cmac_usplus_0_axis_rx_TKEEP),
        .rx_axis_tlast(cmac_usplus_0_axis_rx_TLAST),
        .rx_axis_tuser(cmac_usplus_0_axis_rx_TUSER),
        .rx_axis_tvalid(cmac_usplus_0_axis_rx_TVALID),
        .rx_clk(cmac_usplus_1_gt_txusrclk2),
        .stat_rx_aligned(cmac_usplus_1_stat_rx_aligned),
        .stat_rx_local_fault(cmac_usplus_0_stat_rx_local_fault),
        .stat_rx_remote_fault(cmac_usplus_0_stat_rx_remote_fault),
        .stat_rx_status(cmac_usplus_0_stat_rx_status),
        .sys_reset(util_vector_logic_11_Res),
        .tx_axis_tdata(udp_core_eval_1_tx_axis_m_TDATA),
        .tx_axis_tkeep(udp_core_eval_1_tx_axis_m_TKEEP),
        .tx_axis_tlast(udp_core_eval_1_tx_axis_m_TLAST),
        .tx_axis_tready(udp_core_eval_1_tx_axis_m_TREADY),
        .tx_axis_tuser(udp_core_eval_1_tx_axis_m_TUSER[0]),
        .tx_axis_tvalid(udp_core_eval_1_tx_axis_m_TVALID),
        .tx_preamblein({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .usr_rx_reset(cmac_usplus_1_usr_rx_reset),
        .usr_tx_reset(cmac_usplus_0_usr_tx_reset));
  design_1_dsp_send_0_0 dsp_send_0
       (.clk(cmac_usplus_2_gt_txusrclk2),
        .core_xeset(dsp_send_0_core_xeset),
        .ctl_rx_exable(dsp_send_2_ctl_rx_exable),
        .ctl_tx_exable(dsp_send_2_ctl_tx_exable),
        .ctl_tx_send_rfi(dsp_send_2_ctl_tx_send_rfi),
        .stat_rx_aligned(Net),
        .state(dsp_send_0_state),
        .usr_rx_xr(cmac_usplus_1_usr_rx_reset1),
        .usr_tx_xr(cmac_usplus_1_usr_tx_reset),
        .xst(util_vector_logic_4_Res));
  design_1_dsp_send_1_0 dsp_send_1
       (.clk(cmac_usplus_1_gt_txusrclk2),
        .core_xeset(dsp_send_1_core_xeset),
        .ctl_rx_exable(dsp_send_0_ctl_rx_enable),
        .ctl_tx_exable(dsp_send_0_ctl_tx_enable),
        .ctl_tx_send_rfi(dsp_send_0_ctl_tx_send_rfi),
        .stat_rx_aligned(cmac_usplus_1_stat_rx_aligned),
        .state(dsp_send_1_state),
        .usr_rx_xr(cmac_usplus_1_usr_rx_reset),
        .usr_tx_xr(cmac_usplus_0_usr_tx_reset),
        .xst(util_vector_logic_4_Res));
  design_1_ila_0_0 ila_0
       (.clk(axi4lite_aclk_0_1),
        .probe0(Net),
        .probe1(cmac_usplus_1_usr_rx_reset1),
        .probe10(cmac_usplus_0_stat_rx_local_fault),
        .probe11(cmac_usplus_0_stat_rx_remote_fault),
        .probe12(cmac_usplus_0_stat_rx_status),
        .probe13(dsp_send_0_state),
        .probe14(dsp_send_1_state),
        .probe15(util_vector_logic_11_Res),
        .probe16(util_vector_logic_12_Res),
        .probe2(cmac_usplus_1_usr_tx_reset),
        .probe3(cmac_usplus_1_stat_rx_local_fault),
        .probe4(cmac_usplus_1_stat_rx_remote_fault),
        .probe5(cmac_usplus_1_stat_rx_status),
        .probe6(axi4lite_aresetn_0_1),
        .probe7(cmac_usplus_1_stat_rx_aligned),
        .probe8(cmac_usplus_1_usr_rx_reset),
        .probe9(cmac_usplus_0_usr_tx_reset));
  design_1_ila_1_0 ila_1
       (.clk(axi4lite_aclk_0_1),
        .probe0(S00_AXI_0_1_WREADY),
        .probe1(S00_AXI_0_1_AWADDR),
        .probe10(S00_AXI_0_1_RDATA),
        .probe11(S00_AXI_0_1_AWVALID),
        .probe12(S00_AXI_0_1_AWREADY),
        .probe13(S00_AXI_0_1_RRESP),
        .probe14(S00_AXI_0_1_WDATA),
        .probe15(S00_AXI_0_1_WSTRB),
        .probe16(S00_AXI_0_1_RVALID),
        .probe17(S00_AXI_0_1_ARPROT),
        .probe18(S00_AXI_0_1_AWPROT),
        .probe2(S00_AXI_0_1_BRESP),
        .probe3(S00_AXI_0_1_BVALID),
        .probe4(S00_AXI_0_1_BREADY),
        .probe5(S00_AXI_0_1_ARADDR),
        .probe6(S00_AXI_0_1_RREADY),
        .probe7(S00_AXI_0_1_WVALID),
        .probe8(S00_AXI_0_1_ARVALID),
        .probe9(S00_AXI_0_1_ARREADY));
  design_1_proc_sys_reset_0_0 proc_sys_reset_0
       (.aux_reset_in(1'b1),
        .dcm_locked(1'b1),
        .ext_reset_in(util_vector_logic_6_Res),
        .mb_debug_sys_rst(1'b0),
        .peripheral_reset(proc_sys_reset_0_peripheral_reset),
        .slowest_sync_clk(axi4lite_aclk_0_1));
  design_1_proc_sys_reset_1_0 proc_sys_reset_1
       (.aux_reset_in(1'b1),
        .dcm_locked(1'b1),
        .ext_reset_in(util_vector_logic_5_Res),
        .mb_debug_sys_rst(1'b0),
        .peripheral_reset(proc_sys_reset_1_peripheral_reset),
        .slowest_sync_clk(axi4lite_aclk_0_1));
  design_1_serial_pipe_0_0 serial_pipe_0
       (.clk(cmac_usplus_2_gt_txusrclk2),
        .en(Net2),
        .rst_s_n(Net2),
        .serial_in(util_vector_logic_0_Res),
        .serial_out(Net1));
  design_1_serial_pipe_1_0 serial_pipe_1
       (.clk(cmac_usplus_1_gt_txusrclk2),
        .en(xlconstant_1_dout),
        .rst_s_n(xlconstant_1_dout),
        .serial_in(util_vector_logic_2_Res),
        .serial_out(serial_pipe_1_serial_out));
  design_1_serial_pipe_2_0 serial_pipe_2
       (.clk(cmac_usplus_1_gt_txusrclk2),
        .en(xlconstant_2_dout),
        .rst_s_n(xlconstant_2_dout),
        .serial_in(util_vector_logic_10_Res),
        .serial_out(serial_pipe_2_serial_out));
  design_1_smartconnect_0_0 smartconnect_0
       (.M00_AXI_araddr(smartconnect_0_M00_AXI_ARADDR),
        .M00_AXI_arready(smartconnect_0_M00_AXI_ARREADY),
        .M00_AXI_arvalid(smartconnect_0_M00_AXI_ARVALID),
        .M00_AXI_awaddr(smartconnect_0_M00_AXI_AWADDR),
        .M00_AXI_awready(smartconnect_0_M00_AXI_AWREADY),
        .M00_AXI_awvalid(smartconnect_0_M00_AXI_AWVALID),
        .M00_AXI_bready(smartconnect_0_M00_AXI_BREADY),
        .M00_AXI_bresp(smartconnect_0_M00_AXI_BRESP),
        .M00_AXI_bvalid(smartconnect_0_M00_AXI_BVALID),
        .M00_AXI_rdata(smartconnect_0_M00_AXI_RDATA),
        .M00_AXI_rready(smartconnect_0_M00_AXI_RREADY),
        .M00_AXI_rresp(smartconnect_0_M00_AXI_RRESP),
        .M00_AXI_rvalid(smartconnect_0_M00_AXI_RVALID),
        .M00_AXI_wdata(smartconnect_0_M00_AXI_WDATA),
        .M00_AXI_wready(smartconnect_0_M00_AXI_WREADY),
        .M00_AXI_wstrb(smartconnect_0_M00_AXI_WSTRB),
        .M00_AXI_wvalid(smartconnect_0_M00_AXI_WVALID),
        .M01_AXI_araddr(smartconnect_0_M01_AXI_ARADDR),
        .M01_AXI_arready(smartconnect_0_M01_AXI_ARREADY),
        .M01_AXI_arvalid(smartconnect_0_M01_AXI_ARVALID),
        .M01_AXI_awaddr(smartconnect_0_M01_AXI_AWADDR),
        .M01_AXI_awready(smartconnect_0_M01_AXI_AWREADY),
        .M01_AXI_awvalid(smartconnect_0_M01_AXI_AWVALID),
        .M01_AXI_bready(smartconnect_0_M01_AXI_BREADY),
        .M01_AXI_bresp(smartconnect_0_M01_AXI_BRESP),
        .M01_AXI_bvalid(smartconnect_0_M01_AXI_BVALID),
        .M01_AXI_rdata(smartconnect_0_M01_AXI_RDATA),
        .M01_AXI_rready(smartconnect_0_M01_AXI_RREADY),
        .M01_AXI_rresp(smartconnect_0_M01_AXI_RRESP),
        .M01_AXI_rvalid(smartconnect_0_M01_AXI_RVALID),
        .M01_AXI_wdata(smartconnect_0_M01_AXI_WDATA),
        .M01_AXI_wready(smartconnect_0_M01_AXI_WREADY),
        .M01_AXI_wstrb(smartconnect_0_M01_AXI_WSTRB),
        .M01_AXI_wvalid(smartconnect_0_M01_AXI_WVALID),
        .S00_AXI_araddr(S00_AXI_0_1_ARADDR),
        .S00_AXI_arprot(S00_AXI_0_1_ARPROT),
        .S00_AXI_arready(S00_AXI_0_1_ARREADY),
        .S00_AXI_arvalid(S00_AXI_0_1_ARVALID),
        .S00_AXI_awaddr(S00_AXI_0_1_AWADDR),
        .S00_AXI_awprot(S00_AXI_0_1_AWPROT),
        .S00_AXI_awready(S00_AXI_0_1_AWREADY),
        .S00_AXI_awvalid(S00_AXI_0_1_AWVALID),
        .S00_AXI_bready(S00_AXI_0_1_BREADY),
        .S00_AXI_bresp(S00_AXI_0_1_BRESP),
        .S00_AXI_bvalid(S00_AXI_0_1_BVALID),
        .S00_AXI_rdata(S00_AXI_0_1_RDATA),
        .S00_AXI_rready(S00_AXI_0_1_RREADY),
        .S00_AXI_rresp(S00_AXI_0_1_RRESP),
        .S00_AXI_rvalid(S00_AXI_0_1_RVALID),
        .S00_AXI_wdata(S00_AXI_0_1_WDATA),
        .S00_AXI_wready(S00_AXI_0_1_WREADY),
        .S00_AXI_wstrb(S00_AXI_0_1_WSTRB),
        .S00_AXI_wvalid(S00_AXI_0_1_WVALID),
        .aclk(axi4lite_aclk_0_1),
        .aresetn(axi4lite_aresetn_0_1));
  design_1_udp_core_eval_0_0 udp_core_eval_0
       (.axi4lite_aclk(axi4lite_aclk_0_1),
        .axi4lite_araddr(smartconnect_0_M00_AXI_ARADDR),
        .axi4lite_aresetn(axi4lite_aresetn_0_1),
        .axi4lite_arready(smartconnect_0_M00_AXI_ARREADY),
        .axi4lite_arvalid(smartconnect_0_M00_AXI_ARVALID),
        .axi4lite_awaddr(smartconnect_0_M00_AXI_AWADDR),
        .axi4lite_awready(smartconnect_0_M00_AXI_AWREADY),
        .axi4lite_awvalid(smartconnect_0_M00_AXI_AWVALID),
        .axi4lite_bready(smartconnect_0_M00_AXI_BREADY),
        .axi4lite_bresp(smartconnect_0_M00_AXI_BRESP),
        .axi4lite_bvalid(smartconnect_0_M00_AXI_BVALID),
        .axi4lite_rdata(smartconnect_0_M00_AXI_RDATA),
        .axi4lite_rready(smartconnect_0_M00_AXI_RREADY),
        .axi4lite_rresp(smartconnect_0_M00_AXI_RRESP),
        .axi4lite_rvalid(smartconnect_0_M00_AXI_RVALID),
        .axi4lite_wdata(smartconnect_0_M00_AXI_WDATA),
        .axi4lite_wready(smartconnect_0_M00_AXI_WREADY),
        .axi4lite_wstrb(smartconnect_0_M00_AXI_WSTRB),
        .axi4lite_wvalid(smartconnect_0_M00_AXI_WVALID),
        .rx_axis_s_clk(cmac_usplus_2_gt_txusrclk2),
        .rx_axis_s_rst(Net1),
        .rx_axis_s_tdata(cmac_usplus_1_axis_rx_TDATA),
        .rx_axis_s_tid({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .rx_axis_s_tkeep(cmac_usplus_1_axis_rx_TKEEP),
        .rx_axis_s_tlast(cmac_usplus_1_axis_rx_TLAST),
        .rx_axis_s_tuser({cmac_usplus_1_axis_rx_TUSER,cmac_usplus_1_axis_rx_TUSER,cmac_usplus_1_axis_rx_TUSER,cmac_usplus_1_axis_rx_TUSER,cmac_usplus_1_axis_rx_TUSER,cmac_usplus_1_axis_rx_TUSER,cmac_usplus_1_axis_rx_TUSER,cmac_usplus_1_axis_rx_TUSER,cmac_usplus_1_axis_rx_TUSER,cmac_usplus_1_axis_rx_TUSER,cmac_usplus_1_axis_rx_TUSER,cmac_usplus_1_axis_rx_TUSER,cmac_usplus_1_axis_rx_TUSER,cmac_usplus_1_axis_rx_TUSER,cmac_usplus_1_axis_rx_TUSER,cmac_usplus_1_axis_rx_TUSER,cmac_usplus_1_axis_rx_TUSER,cmac_usplus_1_axis_rx_TUSER,cmac_usplus_1_axis_rx_TUSER,cmac_usplus_1_axis_rx_TUSER,cmac_usplus_1_axis_rx_TUSER,cmac_usplus_1_axis_rx_TUSER,cmac_usplus_1_axis_rx_TUSER,cmac_usplus_1_axis_rx_TUSER,cmac_usplus_1_axis_rx_TUSER,cmac_usplus_1_axis_rx_TUSER,cmac_usplus_1_axis_rx_TUSER,cmac_usplus_1_axis_rx_TUSER,cmac_usplus_1_axis_rx_TUSER,cmac_usplus_1_axis_rx_TUSER,cmac_usplus_1_axis_rx_TUSER,cmac_usplus_1_axis_rx_TUSER}),
        .rx_axis_s_tvalid(cmac_usplus_1_axis_rx_TVALID),
        .rx_core_clk(cmac_usplus_2_gt_txusrclk2),
        .tx_axis_m_clk(cmac_usplus_2_gt_txusrclk2),
        .tx_axis_m_rst(Net1),
        .tx_axis_m_tdata(udp_core_eval_0_tx_axis_m_TDATA),
        .tx_axis_m_tkeep(udp_core_eval_0_tx_axis_m_TKEEP),
        .tx_axis_m_tlast(udp_core_eval_0_tx_axis_m_TLAST),
        .tx_axis_m_tready(udp_core_eval_0_tx_axis_m_TREADY),
        .tx_axis_m_tuser(udp_core_eval_0_tx_axis_m_TUSER),
        .tx_axis_m_tvalid(udp_core_eval_0_tx_axis_m_TVALID),
        .tx_core_clk(cmac_usplus_2_gt_txusrclk2),
        .udp_axis_m_tdata(udp_core_eval_0_udp_axis_m_TDATA),
        .udp_axis_m_tid(udp_core_eval_0_udp_axis_m_TID),
        .udp_axis_m_tkeep(udp_core_eval_0_udp_axis_m_TKEEP),
        .udp_axis_m_tlast(udp_core_eval_0_udp_axis_m_TLAST),
        .udp_axis_m_tready(udp_core_eval_0_udp_axis_m_TREADY),
        .udp_axis_m_tuser(udp_core_eval_0_udp_axis_m_TUSER),
        .udp_axis_m_tvalid(udp_core_eval_0_udp_axis_m_TVALID),
        .udp_axis_s_tdata(udp_axis_s_0_1_TDATA),
        .udp_axis_s_tid(udp_axis_s_0_1_TID),
        .udp_axis_s_tkeep(udp_axis_s_0_1_TKEEP),
        .udp_axis_s_tlast(udp_axis_s_0_1_TLAST),
        .udp_axis_s_tready(udp_axis_s_0_1_TREADY),
        .udp_axis_s_tuser(udp_axis_s_0_1_TUSER),
        .udp_axis_s_tvalid(udp_axis_s_0_1_TVALID));
  design_1_udp_core_eval_1_0 udp_core_eval_1
       (.axi4lite_aclk(axi4lite_aclk_0_1),
        .axi4lite_araddr(smartconnect_0_M01_AXI_ARADDR),
        .axi4lite_aresetn(axi4lite_aresetn_0_1),
        .axi4lite_arready(smartconnect_0_M01_AXI_ARREADY),
        .axi4lite_arvalid(smartconnect_0_M01_AXI_ARVALID),
        .axi4lite_awaddr(smartconnect_0_M01_AXI_AWADDR),
        .axi4lite_awready(smartconnect_0_M01_AXI_AWREADY),
        .axi4lite_awvalid(smartconnect_0_M01_AXI_AWVALID),
        .axi4lite_bready(smartconnect_0_M01_AXI_BREADY),
        .axi4lite_bresp(smartconnect_0_M01_AXI_BRESP),
        .axi4lite_bvalid(smartconnect_0_M01_AXI_BVALID),
        .axi4lite_rdata(smartconnect_0_M01_AXI_RDATA),
        .axi4lite_rready(smartconnect_0_M01_AXI_RREADY),
        .axi4lite_rresp(smartconnect_0_M01_AXI_RRESP),
        .axi4lite_rvalid(smartconnect_0_M01_AXI_RVALID),
        .axi4lite_wdata(smartconnect_0_M01_AXI_WDATA),
        .axi4lite_wready(smartconnect_0_M01_AXI_WREADY),
        .axi4lite_wstrb(smartconnect_0_M01_AXI_WSTRB),
        .axi4lite_wvalid(smartconnect_0_M01_AXI_WVALID),
        .rx_axis_s_clk(cmac_usplus_1_gt_txusrclk2),
        .rx_axis_s_rst(serial_pipe_1_serial_out),
        .rx_axis_s_tdata(cmac_usplus_0_axis_rx_TDATA),
        .rx_axis_s_tid({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .rx_axis_s_tkeep(cmac_usplus_0_axis_rx_TKEEP),
        .rx_axis_s_tlast(cmac_usplus_0_axis_rx_TLAST),
        .rx_axis_s_tuser({cmac_usplus_0_axis_rx_TUSER,cmac_usplus_0_axis_rx_TUSER,cmac_usplus_0_axis_rx_TUSER,cmac_usplus_0_axis_rx_TUSER,cmac_usplus_0_axis_rx_TUSER,cmac_usplus_0_axis_rx_TUSER,cmac_usplus_0_axis_rx_TUSER,cmac_usplus_0_axis_rx_TUSER,cmac_usplus_0_axis_rx_TUSER,cmac_usplus_0_axis_rx_TUSER,cmac_usplus_0_axis_rx_TUSER,cmac_usplus_0_axis_rx_TUSER,cmac_usplus_0_axis_rx_TUSER,cmac_usplus_0_axis_rx_TUSER,cmac_usplus_0_axis_rx_TUSER,cmac_usplus_0_axis_rx_TUSER,cmac_usplus_0_axis_rx_TUSER,cmac_usplus_0_axis_rx_TUSER,cmac_usplus_0_axis_rx_TUSER,cmac_usplus_0_axis_rx_TUSER,cmac_usplus_0_axis_rx_TUSER,cmac_usplus_0_axis_rx_TUSER,cmac_usplus_0_axis_rx_TUSER,cmac_usplus_0_axis_rx_TUSER,cmac_usplus_0_axis_rx_TUSER,cmac_usplus_0_axis_rx_TUSER,cmac_usplus_0_axis_rx_TUSER,cmac_usplus_0_axis_rx_TUSER,cmac_usplus_0_axis_rx_TUSER,cmac_usplus_0_axis_rx_TUSER,cmac_usplus_0_axis_rx_TUSER,cmac_usplus_0_axis_rx_TUSER}),
        .rx_axis_s_tvalid(cmac_usplus_0_axis_rx_TVALID),
        .rx_core_clk(cmac_usplus_1_gt_txusrclk2),
        .tx_axis_m_clk(cmac_usplus_1_gt_txusrclk2),
        .tx_axis_m_rst(serial_pipe_1_serial_out),
        .tx_axis_m_tdata(udp_core_eval_1_tx_axis_m_TDATA),
        .tx_axis_m_tkeep(udp_core_eval_1_tx_axis_m_TKEEP),
        .tx_axis_m_tlast(udp_core_eval_1_tx_axis_m_TLAST),
        .tx_axis_m_tready(udp_core_eval_1_tx_axis_m_TREADY),
        .tx_axis_m_tuser(udp_core_eval_1_tx_axis_m_TUSER),
        .tx_axis_m_tvalid(udp_core_eval_1_tx_axis_m_TVALID),
        .tx_core_clk(cmac_usplus_1_gt_txusrclk2),
        .udp_axis_m_tdata(udp_core_eval_1_udp_axis_m_TDATA),
        .udp_axis_m_tid(udp_core_eval_1_udp_axis_m_TID),
        .udp_axis_m_tkeep(udp_core_eval_1_udp_axis_m_TKEEP),
        .udp_axis_m_tlast(udp_core_eval_1_udp_axis_m_TLAST),
        .udp_axis_m_tready(udp_core_eval_1_udp_axis_m_TREADY),
        .udp_axis_m_tuser(udp_core_eval_1_udp_axis_m_TUSER),
        .udp_axis_m_tvalid(udp_core_eval_1_udp_axis_m_TVALID),
        .udp_axis_s_tdata(udp_axis_s_1_1_TDATA),
        .udp_axis_s_tid(udp_axis_s_1_1_TID),
        .udp_axis_s_tkeep(udp_axis_s_1_1_TKEEP),
        .udp_axis_s_tlast(udp_axis_s_1_1_TLAST),
        .udp_axis_s_tready(udp_axis_s_1_1_TREADY),
        .udp_axis_s_tuser(udp_axis_s_1_1_TUSER),
        .udp_axis_s_tvalid(udp_axis_s_1_1_TVALID));
  design_1_util_vector_logic_0_0 util_vector_logic_0
       (.Op1(Net),
        .Res(util_vector_logic_0_Res));
  design_1_util_vector_logic_10_0 util_vector_logic_10
       (.Op1(util_vector_logic_2_Res),
        .Op2(util_vector_logic_9_Res),
        .Res(util_vector_logic_10_Res));
  design_1_util_vector_logic_11_0 util_vector_logic_11
       (.Op1(util_vector_logic_4_Res),
        .Op2(proc_sys_reset_1_peripheral_reset),
        .Res(util_vector_logic_11_Res));
  design_1_util_vector_logic_12_0 util_vector_logic_12
       (.Op1(util_vector_logic_4_Res),
        .Op2(proc_sys_reset_0_peripheral_reset),
        .Res(util_vector_logic_12_Res));
  design_1_util_vector_logic_13_0 util_vector_logic_13
       (.Op1(util_vector_logic_15_Res),
        .Op2(util_vector_logic_10_Res));
  design_1_util_vector_logic_15_0 util_vector_logic_15
       (.Op1(serial_pipe_2_serial_out),
        .Res(util_vector_logic_15_Res));
  design_1_util_vector_logic_2_0 util_vector_logic_2
       (.Op1(cmac_usplus_1_stat_rx_aligned),
        .Res(util_vector_logic_2_Res));
  design_1_util_vector_logic_4_0 util_vector_logic_4
       (.Op1(axi4lite_aresetn_0_1),
        .Res(util_vector_logic_4_Res));
  design_1_util_vector_logic_5_0 util_vector_logic_5
       (.Op1(dsp_send_1_core_xeset),
        .Res(util_vector_logic_5_Res));
  design_1_util_vector_logic_6_0 util_vector_logic_6
       (.Op1(dsp_send_0_core_xeset),
        .Res(util_vector_logic_6_Res));
  design_1_util_vector_logic_9_0 util_vector_logic_9
       (.Op1(cmac_usplus_1_stat_rx_aligned),
        .Op2(cmac_usplus_1_stat_rx_aligned),
        .Res(util_vector_logic_9_Res));
  design_1_xlconstant_0_0 xlconstant_0
       (.dout(Net2));
  design_1_xlconstant_1_0 xlconstant_1
       (.dout(xlconstant_1_dout));
  design_1_xlconstant_2_0 xlconstant_2
       (.dout(xlconstant_2_dout));
endmodule
