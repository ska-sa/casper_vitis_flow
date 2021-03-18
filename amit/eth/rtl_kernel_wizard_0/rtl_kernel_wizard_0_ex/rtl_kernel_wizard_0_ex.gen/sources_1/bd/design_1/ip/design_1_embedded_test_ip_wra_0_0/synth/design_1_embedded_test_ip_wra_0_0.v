// (c) Copyright 1995-2021 Xilinx, Inc. All rights reserved.
// 
// This file contains confidential and proprietary information
// of Xilinx, Inc. and is protected under U.S. and
// international copyright and other intellectual property
// laws.
// 
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// Xilinx, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) Xilinx shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or Xilinx had been advised of the
// possibility of the same.
// 
// CRITICAL APPLICATIONS
// Xilinx products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of Xilinx products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
// 
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
// 
// DO NOT MODIFY THIS FILE.


// IP VLNV: stfc_tech:user:embedded_test_ip_wrapper:1.0
// IP Revision: 5

// Forward declaration of the netlist blackbox
(* black_box = "1" *)
module embedded_test_ip_wrapper (
  axi4lite_aclk,
  axi4lite_aresetn,
  axi4lite_arready,
  axi4lite_arvalid,
  axi4lite_awready,
  axi4lite_awvalid,
  axi4lite_bready,
  axi4lite_bvalid,
  axi4lite_rready,
  axi4lite_rvalid,
  axi4lite_wready,
  axi4lite_wvalid,
  chk_axi4s_s_clk,
  chk_axi4s_s_rst,
  chk_axi4s_s_tlast,
  chk_axi4s_s_tready,
  chk_axi4s_s_tvalid,
  gen_axi4s_m_clk,
  gen_axi4s_m_rst,
  gen_axi4s_m_tlast,
  gen_axi4s_m_tready,
  gen_axi4s_m_tvalid,
  axi4lite_araddr,
  axi4lite_awaddr,
  axi4lite_bresp,
  axi4lite_rdata,
  axi4lite_rresp,
  axi4lite_wdata,
  axi4lite_wstrb,
  chk_axi4s_s_tdata,
  chk_axi4s_s_tid,
  chk_axi4s_s_tkeep,
  chk_axi4s_s_tuser,
  gen_axi4s_m_tdata,
  gen_axi4s_m_tid,
  gen_axi4s_m_tkeep,
  gen_axi4s_m_tuser
);
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME axi4lite_aclk, ASSOCIATED_BUSIF axi4lite, ASSOCIATED_RESET axi4lite_aresetn, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.000, CLK_DOMAIN design_1_aclk_0, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 axi4lite_aclk CLK" *)
input wire axi4lite_aclk;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME axi4lite_aresetn, POLARITY ACTIVE_LOW, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 axi4lite_aresetn RST" *)
input wire axi4lite_aresetn;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 axi4lite ARREADY" *)
output wire axi4lite_arready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 axi4lite ARVALID" *)
input wire axi4lite_arvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 axi4lite AWREADY" *)
output wire axi4lite_awready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 axi4lite AWVALID" *)
input wire axi4lite_awvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 axi4lite BREADY" *)
input wire axi4lite_bready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 axi4lite BVALID" *)
output wire axi4lite_bvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 axi4lite RREADY" *)
input wire axi4lite_rready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 axi4lite RVALID" *)
output wire axi4lite_rvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 axi4lite WREADY" *)
output wire axi4lite_wready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 axi4lite WVALID" *)
input wire axi4lite_wvalid;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME chk_axi4s_s_clk, ASSOCIATED_BUSIF chk_axi4s_s, ASSOCIATED_RESET chk_axi4s_s_rst, FREQ_HZ 322265625, FREQ_TOLERANCE_HZ 0, PHASE 0.000, CLK_DOMAIN design_1_cmac_usplus_0_0_gt_txusrclk2, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 chk_axi4s_s_clk CLK" *)
input wire chk_axi4s_s_clk;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME chk_axi4s_s_rst, POLARITY ACTIVE_HIGH, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 chk_axi4s_s_rst RST" *)
input wire chk_axi4s_s_rst;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 chk_axi4s_s TLAST" *)
input wire chk_axi4s_s_tlast;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 chk_axi4s_s TREADY" *)
output wire chk_axi4s_s_tready;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 chk_axi4s_s TVALID" *)
input wire chk_axi4s_s_tvalid;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME gen_axi4s_m_clk, ASSOCIATED_BUSIF gen_axi4s_m, ASSOCIATED_RESET gen_axi4s_m_rst, FREQ_HZ 322265625, FREQ_TOLERANCE_HZ 0, PHASE 0.000, CLK_DOMAIN design_1_cmac_usplus_0_0_gt_txusrclk2, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 gen_axi4s_m_clk CLK" *)
input wire gen_axi4s_m_clk;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME gen_axi4s_m_rst, POLARITY ACTIVE_HIGH, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 gen_axi4s_m_rst RST" *)
input wire gen_axi4s_m_rst;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 gen_axi4s_m TLAST" *)
output wire gen_axi4s_m_tlast;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 gen_axi4s_m TREADY" *)
input wire gen_axi4s_m_tready;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 gen_axi4s_m TVALID" *)
output wire gen_axi4s_m_tvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 axi4lite ARADDR" *)
input wire [31 : 0] axi4lite_araddr;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 axi4lite AWADDR" *)
input wire [31 : 0] axi4lite_awaddr;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 axi4lite BRESP" *)
output wire [1 : 0] axi4lite_bresp;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 axi4lite RDATA" *)
output wire [31 : 0] axi4lite_rdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 axi4lite RRESP" *)
output wire [1 : 0] axi4lite_rresp;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 axi4lite WDATA" *)
input wire [31 : 0] axi4lite_wdata;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME axi4lite, DATA_WIDTH 32, PROTOCOL AXI4LITE, FREQ_HZ 100000000, ID_WIDTH 0, ADDR_WIDTH 32, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 0, HAS_LOCK 0, HAS_PROT 0, HAS_CACHE 0, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 0, NUM_READ_OUTSTANDING 1, NUM_WRITE_OUTSTANDING 1, MAX_BURST_LENGTH 1, PHASE 0.000, CLK_DOMAIN design_1_aclk_0, NUM_READ_THREADS 1, NUM_WRITE_THREADS \
1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 axi4lite WSTRB" *)
input wire [3 : 0] axi4lite_wstrb;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 chk_axi4s_s TDATA" *)
input wire [511 : 0] chk_axi4s_s_tdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 chk_axi4s_s TID" *)
input wire [7 : 0] chk_axi4s_s_tid;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 chk_axi4s_s TKEEP" *)
input wire [63 : 0] chk_axi4s_s_tkeep;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME chk_axi4s_s, TDATA_NUM_BYTES 64, TDEST_WIDTH 0, TID_WIDTH 8, TUSER_WIDTH 32, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 1, HAS_TLAST 1, FREQ_HZ 322265625, PHASE 0.000, CLK_DOMAIN design_1_cmac_usplus_0_0_gt_txusrclk2, LAYERED_METADATA undef, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 chk_axi4s_s TUSER" *)
input wire [31 : 0] chk_axi4s_s_tuser;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 gen_axi4s_m TDATA" *)
output wire [511 : 0] gen_axi4s_m_tdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 gen_axi4s_m TID" *)
output wire [7 : 0] gen_axi4s_m_tid;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 gen_axi4s_m TKEEP" *)
output wire [63 : 0] gen_axi4s_m_tkeep;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME gen_axi4s_m, TDATA_NUM_BYTES 64, TDEST_WIDTH 0, TID_WIDTH 8, TUSER_WIDTH 32, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 1, HAS_TLAST 1, FREQ_HZ 322265625, PHASE 0.000, CLK_DOMAIN design_1_cmac_usplus_0_0_gt_txusrclk2, LAYERED_METADATA undef, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 gen_axi4s_m TUSER" *)
output wire [31 : 0] gen_axi4s_m_tuser;
endmodule
// End of netlist blackbox

(* X_CORE_INFO = "embedded_test_ip_wrapper,Vivado 2020.2" *)
(* CHECK_LICENSE_TYPE = "design_1_embedded_test_ip_wra_0_0,embedded_test_ip_wrapper,{}" *)
(* IP_DEFINITION_SOURCE = "package_project" *)
(* DowngradeIPIdentifiedWarnings = "yes" *)
module design_1_embedded_test_ip_wra_0_0 (
  axi4lite_aclk,
  axi4lite_aresetn,
  axi4lite_arready,
  axi4lite_arvalid,
  axi4lite_awready,
  axi4lite_awvalid,
  axi4lite_bready,
  axi4lite_bvalid,
  axi4lite_rready,
  axi4lite_rvalid,
  axi4lite_wready,
  axi4lite_wvalid,
  chk_axi4s_s_clk,
  chk_axi4s_s_rst,
  chk_axi4s_s_tlast,
  chk_axi4s_s_tready,
  chk_axi4s_s_tvalid,
  gen_axi4s_m_clk,
  gen_axi4s_m_rst,
  gen_axi4s_m_tlast,
  gen_axi4s_m_tready,
  gen_axi4s_m_tvalid,
  axi4lite_araddr,
  axi4lite_awaddr,
  axi4lite_bresp,
  axi4lite_rdata,
  axi4lite_rresp,
  axi4lite_wdata,
  axi4lite_wstrb,
  chk_axi4s_s_tdata,
  chk_axi4s_s_tid,
  chk_axi4s_s_tkeep,
  chk_axi4s_s_tuser,
  gen_axi4s_m_tdata,
  gen_axi4s_m_tid,
  gen_axi4s_m_tkeep,
  gen_axi4s_m_tuser
);

(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME axi4lite_aclk, ASSOCIATED_BUSIF axi4lite, ASSOCIATED_RESET axi4lite_aresetn, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.000, CLK_DOMAIN design_1_aclk_0, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 axi4lite_aclk CLK" *)
input wire axi4lite_aclk;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME axi4lite_aresetn, POLARITY ACTIVE_LOW, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 axi4lite_aresetn RST" *)
input wire axi4lite_aresetn;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 axi4lite ARREADY" *)
output wire axi4lite_arready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 axi4lite ARVALID" *)
input wire axi4lite_arvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 axi4lite AWREADY" *)
output wire axi4lite_awready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 axi4lite AWVALID" *)
input wire axi4lite_awvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 axi4lite BREADY" *)
input wire axi4lite_bready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 axi4lite BVALID" *)
output wire axi4lite_bvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 axi4lite RREADY" *)
input wire axi4lite_rready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 axi4lite RVALID" *)
output wire axi4lite_rvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 axi4lite WREADY" *)
output wire axi4lite_wready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 axi4lite WVALID" *)
input wire axi4lite_wvalid;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME chk_axi4s_s_clk, ASSOCIATED_BUSIF chk_axi4s_s, ASSOCIATED_RESET chk_axi4s_s_rst, FREQ_HZ 322265625, FREQ_TOLERANCE_HZ 0, PHASE 0.000, CLK_DOMAIN design_1_cmac_usplus_0_0_gt_txusrclk2, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 chk_axi4s_s_clk CLK" *)
input wire chk_axi4s_s_clk;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME chk_axi4s_s_rst, POLARITY ACTIVE_HIGH, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 chk_axi4s_s_rst RST" *)
input wire chk_axi4s_s_rst;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 chk_axi4s_s TLAST" *)
input wire chk_axi4s_s_tlast;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 chk_axi4s_s TREADY" *)
output wire chk_axi4s_s_tready;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 chk_axi4s_s TVALID" *)
input wire chk_axi4s_s_tvalid;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME gen_axi4s_m_clk, ASSOCIATED_BUSIF gen_axi4s_m, ASSOCIATED_RESET gen_axi4s_m_rst, FREQ_HZ 322265625, FREQ_TOLERANCE_HZ 0, PHASE 0.000, CLK_DOMAIN design_1_cmac_usplus_0_0_gt_txusrclk2, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 gen_axi4s_m_clk CLK" *)
input wire gen_axi4s_m_clk;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME gen_axi4s_m_rst, POLARITY ACTIVE_HIGH, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 gen_axi4s_m_rst RST" *)
input wire gen_axi4s_m_rst;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 gen_axi4s_m TLAST" *)
output wire gen_axi4s_m_tlast;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 gen_axi4s_m TREADY" *)
input wire gen_axi4s_m_tready;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 gen_axi4s_m TVALID" *)
output wire gen_axi4s_m_tvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 axi4lite ARADDR" *)
input wire [31 : 0] axi4lite_araddr;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 axi4lite AWADDR" *)
input wire [31 : 0] axi4lite_awaddr;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 axi4lite BRESP" *)
output wire [1 : 0] axi4lite_bresp;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 axi4lite RDATA" *)
output wire [31 : 0] axi4lite_rdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 axi4lite RRESP" *)
output wire [1 : 0] axi4lite_rresp;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 axi4lite WDATA" *)
input wire [31 : 0] axi4lite_wdata;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME axi4lite, DATA_WIDTH 32, PROTOCOL AXI4LITE, FREQ_HZ 100000000, ID_WIDTH 0, ADDR_WIDTH 32, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 0, HAS_LOCK 0, HAS_PROT 0, HAS_CACHE 0, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 0, NUM_READ_OUTSTANDING 1, NUM_WRITE_OUTSTANDING 1, MAX_BURST_LENGTH 1, PHASE 0.000, CLK_DOMAIN design_1_aclk_0, NUM_READ_THREADS 1, NUM_WRITE_THREADS \
1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 axi4lite WSTRB" *)
input wire [3 : 0] axi4lite_wstrb;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 chk_axi4s_s TDATA" *)
input wire [511 : 0] chk_axi4s_s_tdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 chk_axi4s_s TID" *)
input wire [7 : 0] chk_axi4s_s_tid;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 chk_axi4s_s TKEEP" *)
input wire [63 : 0] chk_axi4s_s_tkeep;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME chk_axi4s_s, TDATA_NUM_BYTES 64, TDEST_WIDTH 0, TID_WIDTH 8, TUSER_WIDTH 32, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 1, HAS_TLAST 1, FREQ_HZ 322265625, PHASE 0.000, CLK_DOMAIN design_1_cmac_usplus_0_0_gt_txusrclk2, LAYERED_METADATA undef, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 chk_axi4s_s TUSER" *)
input wire [31 : 0] chk_axi4s_s_tuser;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 gen_axi4s_m TDATA" *)
output wire [511 : 0] gen_axi4s_m_tdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 gen_axi4s_m TID" *)
output wire [7 : 0] gen_axi4s_m_tid;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 gen_axi4s_m TKEEP" *)
output wire [63 : 0] gen_axi4s_m_tkeep;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME gen_axi4s_m, TDATA_NUM_BYTES 64, TDEST_WIDTH 0, TID_WIDTH 8, TUSER_WIDTH 32, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 1, HAS_TLAST 1, FREQ_HZ 322265625, PHASE 0.000, CLK_DOMAIN design_1_cmac_usplus_0_0_gt_txusrclk2, LAYERED_METADATA undef, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 gen_axi4s_m TUSER" *)
output wire [31 : 0] gen_axi4s_m_tuser;

  embedded_test_ip_wrapper inst (
    .axi4lite_aclk(axi4lite_aclk),
    .axi4lite_aresetn(axi4lite_aresetn),
    .axi4lite_arready(axi4lite_arready),
    .axi4lite_arvalid(axi4lite_arvalid),
    .axi4lite_awready(axi4lite_awready),
    .axi4lite_awvalid(axi4lite_awvalid),
    .axi4lite_bready(axi4lite_bready),
    .axi4lite_bvalid(axi4lite_bvalid),
    .axi4lite_rready(axi4lite_rready),
    .axi4lite_rvalid(axi4lite_rvalid),
    .axi4lite_wready(axi4lite_wready),
    .axi4lite_wvalid(axi4lite_wvalid),
    .chk_axi4s_s_clk(chk_axi4s_s_clk),
    .chk_axi4s_s_rst(chk_axi4s_s_rst),
    .chk_axi4s_s_tlast(chk_axi4s_s_tlast),
    .chk_axi4s_s_tready(chk_axi4s_s_tready),
    .chk_axi4s_s_tvalid(chk_axi4s_s_tvalid),
    .gen_axi4s_m_clk(gen_axi4s_m_clk),
    .gen_axi4s_m_rst(gen_axi4s_m_rst),
    .gen_axi4s_m_tlast(gen_axi4s_m_tlast),
    .gen_axi4s_m_tready(gen_axi4s_m_tready),
    .gen_axi4s_m_tvalid(gen_axi4s_m_tvalid),
    .axi4lite_araddr(axi4lite_araddr),
    .axi4lite_awaddr(axi4lite_awaddr),
    .axi4lite_bresp(axi4lite_bresp),
    .axi4lite_rdata(axi4lite_rdata),
    .axi4lite_rresp(axi4lite_rresp),
    .axi4lite_wdata(axi4lite_wdata),
    .axi4lite_wstrb(axi4lite_wstrb),
    .chk_axi4s_s_tdata(chk_axi4s_s_tdata),
    .chk_axi4s_s_tid(chk_axi4s_s_tid),
    .chk_axi4s_s_tkeep(chk_axi4s_s_tkeep),
    .chk_axi4s_s_tuser(chk_axi4s_s_tuser),
    .gen_axi4s_m_tdata(gen_axi4s_m_tdata),
    .gen_axi4s_m_tid(gen_axi4s_m_tid),
    .gen_axi4s_m_tkeep(gen_axi4s_m_tkeep),
    .gen_axi4s_m_tuser(gen_axi4s_m_tuser)
  );
endmodule
