//Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2020.2 (lin64) Build 3064766 Wed Nov 18 09:12:47 MST 2020
//Date        : Thu Mar 18 09:35:52 2021
//Host        : fpgdev running 64-bit Ubuntu 16.04.7 LTS
//Command     : generate_target design_1.bd
//Design      : design_1
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "design_1,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=design_1,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=32,numReposBlks=32,numNonXlnxBlks=4,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=6,numPkgbdBlks=0,bdsource=USER,da_board_cnt=2,da_clkrst_cnt=1,synth_mode=OOC_per_IP}" *) (* HW_HANDOFF = "design_1.hwdef" *) 
module design_1
   (ACLK_EN_0,
    ARESET_0,
    S00_AXI_0_araddr,
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
    ap_done_0,
    ap_idle_0,
    ap_ready_0,
    ap_start_0,
    axi00_ptr0_0,
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
    interrupt_0,
    locked,
    scalar00_0);
  input ACLK_EN_0;
  input ARESET_0;
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
  input ap_done_0;
  input ap_idle_0;
  input ap_ready_0;
  output ap_start_0;
  output [63:0]axi00_ptr0_0;
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
  (* X_INTERFACE_INFO = "xilinx.com:signal:interrupt:1.0 INTR.INTERRUPT_0 INTERRUPT" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME INTR.INTERRUPT_0, PortWidth 1, SENSITIVITY LEVEL_HIGH" *) output interrupt_0;
  input locked;
  output [31:0]scalar00_0;

  wire ACLK_EN_0_1;
  wire ARESET_0_1;
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
  wire ap_done_0_1;
  wire ap_idle_0_1;
  wire ap_ready_0_1;
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
  wire [511:0]embedded_test_ip_wra_0_gen_axi4s_m_TDATA;
  wire [7:0]embedded_test_ip_wra_0_gen_axi4s_m_TID;
  wire [63:0]embedded_test_ip_wra_0_gen_axi4s_m_TKEEP;
  wire embedded_test_ip_wra_0_gen_axi4s_m_TLAST;
  wire embedded_test_ip_wra_0_gen_axi4s_m_TREADY;
  wire [31:0]embedded_test_ip_wra_0_gen_axi4s_m_TUSER;
  wire embedded_test_ip_wra_0_gen_axi4s_m_TVALID;
  wire [511:0]embedded_test_ip_wra_1_gen_axi4s_m_TDATA;
  wire [7:0]embedded_test_ip_wra_1_gen_axi4s_m_TID;
  wire [63:0]embedded_test_ip_wra_1_gen_axi4s_m_TKEEP;
  wire embedded_test_ip_wra_1_gen_axi4s_m_TLAST;
  wire embedded_test_ip_wra_1_gen_axi4s_m_TREADY;
  wire [31:0]embedded_test_ip_wra_1_gen_axi4s_m_TUSER;
  wire embedded_test_ip_wra_1_gen_axi4s_m_TVALID;
  wire gt_ref_clk_0_1_CLK_N;
  wire gt_ref_clk_0_1_CLK_P;
  wire gt_ref_clk_1_1_CLK_N;
  wire gt_ref_clk_1_1_CLK_P;
  wire [0:0]proc_sys_reset_0_peripheral_reset;
  wire [0:0]proc_sys_reset_1_peripheral_reset;
  wire rtl_kernel_wizard_0_0_ap_start;
  wire [63:0]rtl_kernel_wizard_0_0_axi00_ptr0;
  wire rtl_kernel_wizard_0_0_interrupt;
  wire [31:0]rtl_kernel_wizard_0_0_scalar00;
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
  wire [31:0]smartconnect_0_M02_AXI_ARADDR;
  wire smartconnect_0_M02_AXI_ARREADY;
  wire smartconnect_0_M02_AXI_ARVALID;
  wire [31:0]smartconnect_0_M02_AXI_AWADDR;
  wire smartconnect_0_M02_AXI_AWREADY;
  wire smartconnect_0_M02_AXI_AWVALID;
  wire smartconnect_0_M02_AXI_BREADY;
  wire [1:0]smartconnect_0_M02_AXI_BRESP;
  wire smartconnect_0_M02_AXI_BVALID;
  wire [31:0]smartconnect_0_M02_AXI_RDATA;
  wire smartconnect_0_M02_AXI_RREADY;
  wire [1:0]smartconnect_0_M02_AXI_RRESP;
  wire smartconnect_0_M02_AXI_RVALID;
  wire [31:0]smartconnect_0_M02_AXI_WDATA;
  wire smartconnect_0_M02_AXI_WREADY;
  wire [3:0]smartconnect_0_M02_AXI_WSTRB;
  wire smartconnect_0_M02_AXI_WVALID;
  wire [31:0]smartconnect_0_M03_AXI_ARADDR;
  wire smartconnect_0_M03_AXI_ARREADY;
  wire smartconnect_0_M03_AXI_ARVALID;
  wire [31:0]smartconnect_0_M03_AXI_AWADDR;
  wire smartconnect_0_M03_AXI_AWREADY;
  wire smartconnect_0_M03_AXI_AWVALID;
  wire smartconnect_0_M03_AXI_BREADY;
  wire [1:0]smartconnect_0_M03_AXI_BRESP;
  wire smartconnect_0_M03_AXI_BVALID;
  wire [31:0]smartconnect_0_M03_AXI_RDATA;
  wire smartconnect_0_M03_AXI_RREADY;
  wire [1:0]smartconnect_0_M03_AXI_RRESP;
  wire smartconnect_0_M03_AXI_RVALID;
  wire [31:0]smartconnect_0_M03_AXI_WDATA;
  wire smartconnect_0_M03_AXI_WREADY;
  wire [3:0]smartconnect_0_M03_AXI_WSTRB;
  wire smartconnect_0_M03_AXI_WVALID;
  wire [11:0]smartconnect_1_M00_AXI_ARADDR;
  wire smartconnect_1_M00_AXI_ARREADY;
  wire smartconnect_1_M00_AXI_ARVALID;
  wire [11:0]smartconnect_1_M00_AXI_AWADDR;
  wire smartconnect_1_M00_AXI_AWREADY;
  wire smartconnect_1_M00_AXI_AWVALID;
  wire smartconnect_1_M00_AXI_BREADY;
  wire [1:0]smartconnect_1_M00_AXI_BRESP;
  wire smartconnect_1_M00_AXI_BVALID;
  wire [31:0]smartconnect_1_M00_AXI_RDATA;
  wire smartconnect_1_M00_AXI_RREADY;
  wire [1:0]smartconnect_1_M00_AXI_RRESP;
  wire smartconnect_1_M00_AXI_RVALID;
  wire [31:0]smartconnect_1_M00_AXI_WDATA;
  wire smartconnect_1_M00_AXI_WREADY;
  wire [3:0]smartconnect_1_M00_AXI_WSTRB;
  wire smartconnect_1_M00_AXI_WVALID;
  wire [31:0]smartconnect_1_M01_AXI_ARADDR;
  wire [1:0]smartconnect_1_M01_AXI_ARBURST;
  wire [3:0]smartconnect_1_M01_AXI_ARCACHE;
  wire [0:0]smartconnect_1_M01_AXI_ARID;
  wire [7:0]smartconnect_1_M01_AXI_ARLEN;
  wire [0:0]smartconnect_1_M01_AXI_ARLOCK;
  wire [2:0]smartconnect_1_M01_AXI_ARPROT;
  wire [3:0]smartconnect_1_M01_AXI_ARQOS;
  wire smartconnect_1_M01_AXI_ARREADY;
  wire [2:0]smartconnect_1_M01_AXI_ARSIZE;
  wire [113:0]smartconnect_1_M01_AXI_ARUSER;
  wire smartconnect_1_M01_AXI_ARVALID;
  wire [31:0]smartconnect_1_M01_AXI_AWADDR;
  wire [1:0]smartconnect_1_M01_AXI_AWBURST;
  wire [3:0]smartconnect_1_M01_AXI_AWCACHE;
  wire [0:0]smartconnect_1_M01_AXI_AWID;
  wire [7:0]smartconnect_1_M01_AXI_AWLEN;
  wire [0:0]smartconnect_1_M01_AXI_AWLOCK;
  wire [2:0]smartconnect_1_M01_AXI_AWPROT;
  wire [3:0]smartconnect_1_M01_AXI_AWQOS;
  wire smartconnect_1_M01_AXI_AWREADY;
  wire [2:0]smartconnect_1_M01_AXI_AWSIZE;
  wire [113:0]smartconnect_1_M01_AXI_AWUSER;
  wire smartconnect_1_M01_AXI_AWVALID;
  wire [0:0]smartconnect_1_M01_AXI_BID;
  wire smartconnect_1_M01_AXI_BREADY;
  wire [1:0]smartconnect_1_M01_AXI_BRESP;
  wire smartconnect_1_M01_AXI_BVALID;
  wire [31:0]smartconnect_1_M01_AXI_RDATA;
  wire [0:0]smartconnect_1_M01_AXI_RID;
  wire smartconnect_1_M01_AXI_RLAST;
  wire smartconnect_1_M01_AXI_RREADY;
  wire [1:0]smartconnect_1_M01_AXI_RRESP;
  wire [13:0]smartconnect_1_M01_AXI_RUSER;
  wire smartconnect_1_M01_AXI_RVALID;
  wire [31:0]smartconnect_1_M01_AXI_WDATA;
  wire smartconnect_1_M01_AXI_WLAST;
  wire smartconnect_1_M01_AXI_WREADY;
  wire [3:0]smartconnect_1_M01_AXI_WSTRB;
  wire [13:0]smartconnect_1_M01_AXI_WUSER;
  wire smartconnect_1_M01_AXI_WVALID;
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

  assign ACLK_EN_0_1 = ACLK_EN_0;
  assign ARESET_0_1 = ARESET_0;
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
  assign ap_done_0_1 = ap_done_0;
  assign ap_idle_0_1 = ap_idle_0;
  assign ap_ready_0_1 = ap_ready_0;
  assign ap_start_0 = rtl_kernel_wizard_0_0_ap_start;
  assign axi00_ptr0_0[63:0] = rtl_kernel_wizard_0_0_axi00_ptr0;
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
  assign interrupt_0 = rtl_kernel_wizard_0_0_interrupt;
  assign scalar00_0[31:0] = rtl_kernel_wizard_0_0_scalar00;
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
  design_1_embedded_test_ip_wra_0_0 embedded_test_ip_wra_0
       (.axi4lite_aclk(axi4lite_aclk_0_1),
        .axi4lite_araddr(smartconnect_0_M02_AXI_ARADDR),
        .axi4lite_aresetn(axi4lite_aresetn_0_1),
        .axi4lite_arready(smartconnect_0_M02_AXI_ARREADY),
        .axi4lite_arvalid(smartconnect_0_M02_AXI_ARVALID),
        .axi4lite_awaddr(smartconnect_0_M02_AXI_AWADDR),
        .axi4lite_awready(smartconnect_0_M02_AXI_AWREADY),
        .axi4lite_awvalid(smartconnect_0_M02_AXI_AWVALID),
        .axi4lite_bready(smartconnect_0_M02_AXI_BREADY),
        .axi4lite_bresp(smartconnect_0_M02_AXI_BRESP),
        .axi4lite_bvalid(smartconnect_0_M02_AXI_BVALID),
        .axi4lite_rdata(smartconnect_0_M02_AXI_RDATA),
        .axi4lite_rready(smartconnect_0_M02_AXI_RREADY),
        .axi4lite_rresp(smartconnect_0_M02_AXI_RRESP),
        .axi4lite_rvalid(smartconnect_0_M02_AXI_RVALID),
        .axi4lite_wdata(smartconnect_0_M02_AXI_WDATA),
        .axi4lite_wready(smartconnect_0_M02_AXI_WREADY),
        .axi4lite_wstrb(smartconnect_0_M02_AXI_WSTRB),
        .axi4lite_wvalid(smartconnect_0_M02_AXI_WVALID),
        .chk_axi4s_s_clk(cmac_usplus_2_gt_txusrclk2),
        .chk_axi4s_s_rst(Net1),
        .chk_axi4s_s_tdata(udp_core_eval_0_udp_axis_m_TDATA),
        .chk_axi4s_s_tid(udp_core_eval_0_udp_axis_m_TID),
        .chk_axi4s_s_tkeep(udp_core_eval_0_udp_axis_m_TKEEP),
        .chk_axi4s_s_tlast(udp_core_eval_0_udp_axis_m_TLAST),
        .chk_axi4s_s_tready(udp_core_eval_0_udp_axis_m_TREADY),
        .chk_axi4s_s_tuser(udp_core_eval_0_udp_axis_m_TUSER),
        .chk_axi4s_s_tvalid(udp_core_eval_0_udp_axis_m_TVALID),
        .gen_axi4s_m_clk(cmac_usplus_2_gt_txusrclk2),
        .gen_axi4s_m_rst(Net1),
        .gen_axi4s_m_tdata(embedded_test_ip_wra_0_gen_axi4s_m_TDATA),
        .gen_axi4s_m_tid(embedded_test_ip_wra_0_gen_axi4s_m_TID),
        .gen_axi4s_m_tkeep(embedded_test_ip_wra_0_gen_axi4s_m_TKEEP),
        .gen_axi4s_m_tlast(embedded_test_ip_wra_0_gen_axi4s_m_TLAST),
        .gen_axi4s_m_tready(embedded_test_ip_wra_0_gen_axi4s_m_TREADY),
        .gen_axi4s_m_tuser(embedded_test_ip_wra_0_gen_axi4s_m_TUSER),
        .gen_axi4s_m_tvalid(embedded_test_ip_wra_0_gen_axi4s_m_TVALID));
  design_1_embedded_test_ip_wra_1_0 embedded_test_ip_wra_1
       (.axi4lite_aclk(axi4lite_aclk_0_1),
        .axi4lite_araddr(smartconnect_0_M03_AXI_ARADDR),
        .axi4lite_aresetn(axi4lite_aresetn_0_1),
        .axi4lite_arready(smartconnect_0_M03_AXI_ARREADY),
        .axi4lite_arvalid(smartconnect_0_M03_AXI_ARVALID),
        .axi4lite_awaddr(smartconnect_0_M03_AXI_AWADDR),
        .axi4lite_awready(smartconnect_0_M03_AXI_AWREADY),
        .axi4lite_awvalid(smartconnect_0_M03_AXI_AWVALID),
        .axi4lite_bready(smartconnect_0_M03_AXI_BREADY),
        .axi4lite_bresp(smartconnect_0_M03_AXI_BRESP),
        .axi4lite_bvalid(smartconnect_0_M03_AXI_BVALID),
        .axi4lite_rdata(smartconnect_0_M03_AXI_RDATA),
        .axi4lite_rready(smartconnect_0_M03_AXI_RREADY),
        .axi4lite_rresp(smartconnect_0_M03_AXI_RRESP),
        .axi4lite_rvalid(smartconnect_0_M03_AXI_RVALID),
        .axi4lite_wdata(smartconnect_0_M03_AXI_WDATA),
        .axi4lite_wready(smartconnect_0_M03_AXI_WREADY),
        .axi4lite_wstrb(smartconnect_0_M03_AXI_WSTRB),
        .axi4lite_wvalid(smartconnect_0_M03_AXI_WVALID),
        .chk_axi4s_s_clk(cmac_usplus_1_gt_txusrclk2),
        .chk_axi4s_s_rst(serial_pipe_1_serial_out),
        .chk_axi4s_s_tdata(udp_core_eval_1_udp_axis_m_TDATA),
        .chk_axi4s_s_tid(udp_core_eval_1_udp_axis_m_TID),
        .chk_axi4s_s_tkeep(udp_core_eval_1_udp_axis_m_TKEEP),
        .chk_axi4s_s_tlast(udp_core_eval_1_udp_axis_m_TLAST),
        .chk_axi4s_s_tready(udp_core_eval_1_udp_axis_m_TREADY),
        .chk_axi4s_s_tuser(udp_core_eval_1_udp_axis_m_TUSER),
        .chk_axi4s_s_tvalid(udp_core_eval_1_udp_axis_m_TVALID),
        .gen_axi4s_m_clk(cmac_usplus_1_gt_txusrclk2),
        .gen_axi4s_m_rst(serial_pipe_1_serial_out),
        .gen_axi4s_m_tdata(embedded_test_ip_wra_1_gen_axi4s_m_TDATA),
        .gen_axi4s_m_tid(embedded_test_ip_wra_1_gen_axi4s_m_TID),
        .gen_axi4s_m_tkeep(embedded_test_ip_wra_1_gen_axi4s_m_TKEEP),
        .gen_axi4s_m_tlast(embedded_test_ip_wra_1_gen_axi4s_m_TLAST),
        .gen_axi4s_m_tready(embedded_test_ip_wra_1_gen_axi4s_m_TREADY),
        .gen_axi4s_m_tuser(embedded_test_ip_wra_1_gen_axi4s_m_TUSER),
        .gen_axi4s_m_tvalid(embedded_test_ip_wra_1_gen_axi4s_m_TVALID));
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
  design_1_rtl_kernel_wizard_0_0_0 rtl_kernel_wizard_0_0
       (.ACLK(axi4lite_aclk_0_1),
        .ACLK_EN(ACLK_EN_0_1),
        .ARADDR(smartconnect_1_M00_AXI_ARADDR),
        .ARESET(ARESET_0_1),
        .ARREADY(smartconnect_1_M00_AXI_ARREADY),
        .ARVALID(smartconnect_1_M00_AXI_ARVALID),
        .AWADDR(smartconnect_1_M00_AXI_AWADDR),
        .AWREADY(smartconnect_1_M00_AXI_AWREADY),
        .AWVALID(smartconnect_1_M00_AXI_AWVALID),
        .BREADY(smartconnect_1_M00_AXI_BREADY),
        .BRESP(smartconnect_1_M00_AXI_BRESP),
        .BVALID(smartconnect_1_M00_AXI_BVALID),
        .RDATA(smartconnect_1_M00_AXI_RDATA),
        .RREADY(smartconnect_1_M00_AXI_RREADY),
        .RRESP(smartconnect_1_M00_AXI_RRESP),
        .RVALID(smartconnect_1_M00_AXI_RVALID),
        .WDATA(smartconnect_1_M00_AXI_WDATA),
        .WREADY(smartconnect_1_M00_AXI_WREADY),
        .WSTRB(smartconnect_1_M00_AXI_WSTRB),
        .WVALID(smartconnect_1_M00_AXI_WVALID),
        .ap_done(ap_done_0_1),
        .ap_idle(ap_idle_0_1),
        .ap_ready(ap_ready_0_1),
        .ap_start(rtl_kernel_wizard_0_0_ap_start),
        .axi00_ptr0(rtl_kernel_wizard_0_0_axi00_ptr0),
        .interrupt(rtl_kernel_wizard_0_0_interrupt),
        .scalar00(rtl_kernel_wizard_0_0_scalar00));
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
        .M02_AXI_araddr(smartconnect_0_M02_AXI_ARADDR),
        .M02_AXI_arready(smartconnect_0_M02_AXI_ARREADY),
        .M02_AXI_arvalid(smartconnect_0_M02_AXI_ARVALID),
        .M02_AXI_awaddr(smartconnect_0_M02_AXI_AWADDR),
        .M02_AXI_awready(smartconnect_0_M02_AXI_AWREADY),
        .M02_AXI_awvalid(smartconnect_0_M02_AXI_AWVALID),
        .M02_AXI_bready(smartconnect_0_M02_AXI_BREADY),
        .M02_AXI_bresp(smartconnect_0_M02_AXI_BRESP),
        .M02_AXI_bvalid(smartconnect_0_M02_AXI_BVALID),
        .M02_AXI_rdata(smartconnect_0_M02_AXI_RDATA),
        .M02_AXI_rready(smartconnect_0_M02_AXI_RREADY),
        .M02_AXI_rresp(smartconnect_0_M02_AXI_RRESP),
        .M02_AXI_rvalid(smartconnect_0_M02_AXI_RVALID),
        .M02_AXI_wdata(smartconnect_0_M02_AXI_WDATA),
        .M02_AXI_wready(smartconnect_0_M02_AXI_WREADY),
        .M02_AXI_wstrb(smartconnect_0_M02_AXI_WSTRB),
        .M02_AXI_wvalid(smartconnect_0_M02_AXI_WVALID),
        .M03_AXI_araddr(smartconnect_0_M03_AXI_ARADDR),
        .M03_AXI_arready(smartconnect_0_M03_AXI_ARREADY),
        .M03_AXI_arvalid(smartconnect_0_M03_AXI_ARVALID),
        .M03_AXI_awaddr(smartconnect_0_M03_AXI_AWADDR),
        .M03_AXI_awready(smartconnect_0_M03_AXI_AWREADY),
        .M03_AXI_awvalid(smartconnect_0_M03_AXI_AWVALID),
        .M03_AXI_bready(smartconnect_0_M03_AXI_BREADY),
        .M03_AXI_bresp(smartconnect_0_M03_AXI_BRESP),
        .M03_AXI_bvalid(smartconnect_0_M03_AXI_BVALID),
        .M03_AXI_rdata(smartconnect_0_M03_AXI_RDATA),
        .M03_AXI_rready(smartconnect_0_M03_AXI_RREADY),
        .M03_AXI_rresp(smartconnect_0_M03_AXI_RRESP),
        .M03_AXI_rvalid(smartconnect_0_M03_AXI_RVALID),
        .M03_AXI_wdata(smartconnect_0_M03_AXI_WDATA),
        .M03_AXI_wready(smartconnect_0_M03_AXI_WREADY),
        .M03_AXI_wstrb(smartconnect_0_M03_AXI_WSTRB),
        .M03_AXI_wvalid(smartconnect_0_M03_AXI_WVALID),
        .S00_AXI_araddr(smartconnect_1_M01_AXI_ARADDR),
        .S00_AXI_arburst(smartconnect_1_M01_AXI_ARBURST),
        .S00_AXI_arcache(smartconnect_1_M01_AXI_ARCACHE),
        .S00_AXI_arid(smartconnect_1_M01_AXI_ARID),
        .S00_AXI_arlen(smartconnect_1_M01_AXI_ARLEN),
        .S00_AXI_arlock(smartconnect_1_M01_AXI_ARLOCK),
        .S00_AXI_arprot(smartconnect_1_M01_AXI_ARPROT),
        .S00_AXI_arqos(smartconnect_1_M01_AXI_ARQOS),
        .S00_AXI_arready(smartconnect_1_M01_AXI_ARREADY),
        .S00_AXI_arsize(smartconnect_1_M01_AXI_ARSIZE),
        .S00_AXI_aruser(smartconnect_1_M01_AXI_ARUSER),
        .S00_AXI_arvalid(smartconnect_1_M01_AXI_ARVALID),
        .S00_AXI_awaddr(smartconnect_1_M01_AXI_AWADDR),
        .S00_AXI_awburst(smartconnect_1_M01_AXI_AWBURST),
        .S00_AXI_awcache(smartconnect_1_M01_AXI_AWCACHE),
        .S00_AXI_awid(smartconnect_1_M01_AXI_AWID),
        .S00_AXI_awlen(smartconnect_1_M01_AXI_AWLEN),
        .S00_AXI_awlock(smartconnect_1_M01_AXI_AWLOCK),
        .S00_AXI_awprot(smartconnect_1_M01_AXI_AWPROT),
        .S00_AXI_awqos(smartconnect_1_M01_AXI_AWQOS),
        .S00_AXI_awready(smartconnect_1_M01_AXI_AWREADY),
        .S00_AXI_awsize(smartconnect_1_M01_AXI_AWSIZE),
        .S00_AXI_awuser(smartconnect_1_M01_AXI_AWUSER),
        .S00_AXI_awvalid(smartconnect_1_M01_AXI_AWVALID),
        .S00_AXI_bid(smartconnect_1_M01_AXI_BID),
        .S00_AXI_bready(smartconnect_1_M01_AXI_BREADY),
        .S00_AXI_bresp(smartconnect_1_M01_AXI_BRESP),
        .S00_AXI_bvalid(smartconnect_1_M01_AXI_BVALID),
        .S00_AXI_rdata(smartconnect_1_M01_AXI_RDATA),
        .S00_AXI_rid(smartconnect_1_M01_AXI_RID),
        .S00_AXI_rlast(smartconnect_1_M01_AXI_RLAST),
        .S00_AXI_rready(smartconnect_1_M01_AXI_RREADY),
        .S00_AXI_rresp(smartconnect_1_M01_AXI_RRESP),
        .S00_AXI_ruser(smartconnect_1_M01_AXI_RUSER),
        .S00_AXI_rvalid(smartconnect_1_M01_AXI_RVALID),
        .S00_AXI_wdata(smartconnect_1_M01_AXI_WDATA),
        .S00_AXI_wlast(smartconnect_1_M01_AXI_WLAST),
        .S00_AXI_wready(smartconnect_1_M01_AXI_WREADY),
        .S00_AXI_wstrb(smartconnect_1_M01_AXI_WSTRB),
        .S00_AXI_wuser(smartconnect_1_M01_AXI_WUSER),
        .S00_AXI_wvalid(smartconnect_1_M01_AXI_WVALID),
        .aclk(axi4lite_aclk_0_1),
        .aresetn(axi4lite_aresetn_0_1));
  design_1_smartconnect_1_1 smartconnect_1
       (.M00_AXI_araddr(smartconnect_1_M00_AXI_ARADDR),
        .M00_AXI_arready(smartconnect_1_M00_AXI_ARREADY),
        .M00_AXI_arvalid(smartconnect_1_M00_AXI_ARVALID),
        .M00_AXI_awaddr(smartconnect_1_M00_AXI_AWADDR),
        .M00_AXI_awready(smartconnect_1_M00_AXI_AWREADY),
        .M00_AXI_awvalid(smartconnect_1_M00_AXI_AWVALID),
        .M00_AXI_bready(smartconnect_1_M00_AXI_BREADY),
        .M00_AXI_bresp(smartconnect_1_M00_AXI_BRESP),
        .M00_AXI_bvalid(smartconnect_1_M00_AXI_BVALID),
        .M00_AXI_rdata(smartconnect_1_M00_AXI_RDATA),
        .M00_AXI_rready(smartconnect_1_M00_AXI_RREADY),
        .M00_AXI_rresp(smartconnect_1_M00_AXI_RRESP),
        .M00_AXI_rvalid(smartconnect_1_M00_AXI_RVALID),
        .M00_AXI_wdata(smartconnect_1_M00_AXI_WDATA),
        .M00_AXI_wready(smartconnect_1_M00_AXI_WREADY),
        .M00_AXI_wstrb(smartconnect_1_M00_AXI_WSTRB),
        .M00_AXI_wvalid(smartconnect_1_M00_AXI_WVALID),
        .M01_AXI_araddr(smartconnect_1_M01_AXI_ARADDR),
        .M01_AXI_arburst(smartconnect_1_M01_AXI_ARBURST),
        .M01_AXI_arcache(smartconnect_1_M01_AXI_ARCACHE),
        .M01_AXI_arid(smartconnect_1_M01_AXI_ARID),
        .M01_AXI_arlen(smartconnect_1_M01_AXI_ARLEN),
        .M01_AXI_arlock(smartconnect_1_M01_AXI_ARLOCK),
        .M01_AXI_arprot(smartconnect_1_M01_AXI_ARPROT),
        .M01_AXI_arqos(smartconnect_1_M01_AXI_ARQOS),
        .M01_AXI_arready(smartconnect_1_M01_AXI_ARREADY),
        .M01_AXI_arsize(smartconnect_1_M01_AXI_ARSIZE),
        .M01_AXI_aruser(smartconnect_1_M01_AXI_ARUSER),
        .M01_AXI_arvalid(smartconnect_1_M01_AXI_ARVALID),
        .M01_AXI_awaddr(smartconnect_1_M01_AXI_AWADDR),
        .M01_AXI_awburst(smartconnect_1_M01_AXI_AWBURST),
        .M01_AXI_awcache(smartconnect_1_M01_AXI_AWCACHE),
        .M01_AXI_awid(smartconnect_1_M01_AXI_AWID),
        .M01_AXI_awlen(smartconnect_1_M01_AXI_AWLEN),
        .M01_AXI_awlock(smartconnect_1_M01_AXI_AWLOCK),
        .M01_AXI_awprot(smartconnect_1_M01_AXI_AWPROT),
        .M01_AXI_awqos(smartconnect_1_M01_AXI_AWQOS),
        .M01_AXI_awready(smartconnect_1_M01_AXI_AWREADY),
        .M01_AXI_awsize(smartconnect_1_M01_AXI_AWSIZE),
        .M01_AXI_awuser(smartconnect_1_M01_AXI_AWUSER),
        .M01_AXI_awvalid(smartconnect_1_M01_AXI_AWVALID),
        .M01_AXI_bid(smartconnect_1_M01_AXI_BID),
        .M01_AXI_bready(smartconnect_1_M01_AXI_BREADY),
        .M01_AXI_bresp(smartconnect_1_M01_AXI_BRESP),
        .M01_AXI_bvalid(smartconnect_1_M01_AXI_BVALID),
        .M01_AXI_rdata(smartconnect_1_M01_AXI_RDATA),
        .M01_AXI_rid(smartconnect_1_M01_AXI_RID),
        .M01_AXI_rlast(smartconnect_1_M01_AXI_RLAST),
        .M01_AXI_rready(smartconnect_1_M01_AXI_RREADY),
        .M01_AXI_rresp(smartconnect_1_M01_AXI_RRESP),
        .M01_AXI_ruser(smartconnect_1_M01_AXI_RUSER),
        .M01_AXI_rvalid(smartconnect_1_M01_AXI_RVALID),
        .M01_AXI_wdata(smartconnect_1_M01_AXI_WDATA),
        .M01_AXI_wlast(smartconnect_1_M01_AXI_WLAST),
        .M01_AXI_wready(smartconnect_1_M01_AXI_WREADY),
        .M01_AXI_wstrb(smartconnect_1_M01_AXI_WSTRB),
        .M01_AXI_wuser(smartconnect_1_M01_AXI_WUSER),
        .M01_AXI_wvalid(smartconnect_1_M01_AXI_WVALID),
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
        .udp_axis_s_tdata(embedded_test_ip_wra_0_gen_axi4s_m_TDATA),
        .udp_axis_s_tid(embedded_test_ip_wra_0_gen_axi4s_m_TID),
        .udp_axis_s_tkeep(embedded_test_ip_wra_0_gen_axi4s_m_TKEEP),
        .udp_axis_s_tlast(embedded_test_ip_wra_0_gen_axi4s_m_TLAST),
        .udp_axis_s_tready(embedded_test_ip_wra_0_gen_axi4s_m_TREADY),
        .udp_axis_s_tuser(embedded_test_ip_wra_0_gen_axi4s_m_TUSER),
        .udp_axis_s_tvalid(embedded_test_ip_wra_0_gen_axi4s_m_TVALID));
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
        .udp_axis_s_tdata(embedded_test_ip_wra_1_gen_axi4s_m_TDATA),
        .udp_axis_s_tid(embedded_test_ip_wra_1_gen_axi4s_m_TID),
        .udp_axis_s_tkeep(embedded_test_ip_wra_1_gen_axi4s_m_TKEEP),
        .udp_axis_s_tlast(embedded_test_ip_wra_1_gen_axi4s_m_TLAST),
        .udp_axis_s_tready(embedded_test_ip_wra_1_gen_axi4s_m_TREADY),
        .udp_axis_s_tuser(embedded_test_ip_wra_1_gen_axi4s_m_TUSER),
        .udp_axis_s_tvalid(embedded_test_ip_wra_1_gen_axi4s_m_TVALID));
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
  design_1_util_vector_logic_4_1 util_vector_logic_5
       (.Op1(dsp_send_1_core_xeset),
        .Res(util_vector_logic_5_Res));
  design_1_util_vector_logic_5_0 util_vector_logic_6
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
