// This is a generated file. Use and modify at your own risk.
//////////////////////////////////////////////////////////////////////////////// 
// default_nettype of none prevents implicit wire declaration.
`default_nettype none
`timescale 1 ns / 1 ps
// Top level of the kernel. Do not modify module name, parameters or ports.
module rtl_kernel_wizard_1 #(
  parameter integer C_S_AXI_CONTROL_ADDR_WIDTH = 12 ,
  parameter integer C_S_AXI_CONTROL_DATA_WIDTH = 32 ,
  parameter integer C_MAC0_M_TDATA_WIDTH       = 512,
  parameter integer C_MAC0_S_TDATA_WIDTH       = 512,
  parameter integer C_MAC1_M_TDATA_WIDTH       = 512,
  parameter integer C_MAC1_S_TDATA_WIDTH       = 512
)
(
  // System Signals
  input  wire                                    ap_clk               ,
  input  wire                                    ap_rst_n             ,
  
   input wire gt_ref_clk_n,
  input wire gt_ref_clk_p,
  input wire gt1_ref_clk_n,
  input wire gt1_ref_clk_p,
  input wire [3:0] qsfp28_rx_n,
  input wire [3:0] qsfp28_rx_p,
  output wire [3:0] qsfp28_tx_n,
  output wire [3:0] qsfp28_tx_p,
  input wire [3:0]  qsfp28_1_rx_n,
  input wire [3:0]  qsfp28_1_rx_p,
  output wire [3:0] qsfp28_1_tx_n,
  output wire [3:0] qsfp28_1_tx_p,
  //  Note: A minimum subset of AXI4 memory mapped signals are declared.  AXI
  // signals omitted from these interfaces are automatically inferred with the
  // optimal values for Xilinx accleration platforms.  This allows Xilinx AXI4 Interconnects
  // within the system to be optimized by removing logic for AXI4 protocol
  // features that are not necessary. When adapting AXI4 masters within the RTL
  // kernel that have signals not declared below, it is suitable to add the
  // signals to the declarations below to connect them to the AXI4 Master.
  // 
  // List of ommited signals - effect
  // -------------------------------
  // ID - Transaction ID are used for multithreading and out of order
  // transactions.  This increases complexity. This saves logic and increases Fmax
  // in the system when ommited.
  // SIZE - Default value is log2(data width in bytes). Needed for subsize bursts.
  // This saves logic and increases Fmax in the system when ommited.
  // BURST - Default value (0b01) is incremental.  Wrap and fixed bursts are not
  // recommended. This saves logic and increases Fmax in the system when ommited.
  // LOCK - Not supported in AXI4
  // CACHE - Default value (0b0011) allows modifiable transactions. No benefit to
  // changing this.
  // PROT - Has no effect in current acceleration platforms.
  // QOS - Has no effect in current acceleration platforms.
  // REGION - Has no effect in current acceleration platforms.
  // USER - Has no effect in current acceleration platforms.
  // RESP - Not useful in most acceleration platforms.
  // 
  // AXI4-Stream (master) interface mac0_m
  output wire                                    mac0_m_tvalid        ,
  input  wire                                    mac0_m_tready        ,
  output wire [C_MAC0_M_TDATA_WIDTH-1:0]         mac0_m_tdata         ,
  output wire [C_MAC0_M_TDATA_WIDTH/8-1:0]       mac0_m_tkeep         ,
  output wire                                    mac0_m_tlast         ,
  // AXI4-Stream (slave) interface mac0_s
  input  wire                                    mac0_s_tvalid        ,
  output wire                                    mac0_s_tready        ,
  input  wire [C_MAC0_S_TDATA_WIDTH-1:0]         mac0_s_tdata         ,
  input  wire [C_MAC0_S_TDATA_WIDTH/8-1:0]       mac0_s_tkeep         ,
  input  wire                                    mac0_s_tlast         ,
  // AXI4-Stream (master) interface mac1_m
  output wire                                    mac1_m_tvalid        ,
  input  wire                                    mac1_m_tready        ,
  output wire [C_MAC1_M_TDATA_WIDTH-1:0]         mac1_m_tdata         ,
  output wire [C_MAC1_M_TDATA_WIDTH/8-1:0]       mac1_m_tkeep         ,
  output wire                                    mac1_m_tlast         ,
  // AXI4-Stream (slave) interface mac1_s
  input  wire                                    mac1_s_tvalid        ,
  output wire                                    mac1_s_tready        ,
  input  wire [C_MAC1_S_TDATA_WIDTH-1:0]         mac1_s_tdata         ,
  input  wire [C_MAC1_S_TDATA_WIDTH/8-1:0]       mac1_s_tkeep         ,
  input  wire                                    mac1_s_tlast         ,
  // AXI4-Lite slave interface
  input  wire                                    s_axi_control_awvalid,
  output wire                                    s_axi_control_awready,
  input  wire [C_S_AXI_CONTROL_ADDR_WIDTH-1:0]   s_axi_control_awaddr ,
  input  wire                                    s_axi_control_wvalid ,
  output wire                                    s_axi_control_wready ,
  input  wire [C_S_AXI_CONTROL_DATA_WIDTH-1:0]   s_axi_control_wdata  ,
  input  wire [C_S_AXI_CONTROL_DATA_WIDTH/8-1:0] s_axi_control_wstrb  ,
  input  wire                                    s_axi_control_arvalid,
  output wire                                    s_axi_control_arready,
  input  wire [C_S_AXI_CONTROL_ADDR_WIDTH-1:0]   s_axi_control_araddr ,
  output wire                                    s_axi_control_rvalid ,
  input  wire                                    s_axi_control_rready ,
  output wire [C_S_AXI_CONTROL_DATA_WIDTH-1:0]   s_axi_control_rdata  ,
  output wire [2-1:0]                            s_axi_control_rresp  ,
  output wire                                    s_axi_control_bvalid ,
  input  wire                                    s_axi_control_bready ,
  output wire [2-1:0]                            s_axi_control_bresp  
);

///////////////////////////////////////////////////////////////////////////////
// Local Parameters
///////////////////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////////////////////
// Wires and Variables
///////////////////////////////////////////////////////////////////////////////
(* DONT_TOUCH = "yes" *)
reg                                 areset                         = 1'b0;

// Register and invert reset signal.
always @(posedge ap_clk) begin
  areset <= ~ap_rst_n;
end

///////////////////////////////////////////////////////////////////////////////
// Begin control interface RTL.  Modifying not recommended.
///////////////////////////////////////////////////////////////////////////////


// AXI4-Lite slave interface
/*rtl_kernel_wizard_1_control_s_axi #(
  .C_S_AXI_ADDR_WIDTH ( C_S_AXI_CONTROL_ADDR_WIDTH ),
  .C_S_AXI_DATA_WIDTH ( C_S_AXI_CONTROL_DATA_WIDTH )
)
inst_control_s_axi (
  .ACLK    ( ap_clk                ),
  .ARESET  ( areset                ),
  .ACLK_EN ( 1'b1                  ),
  .AWVALID ( s_axi_control_awvalid ),
  .AWREADY ( s_axi_control_awready ),
  .AWADDR  ( s_axi_control_awaddr  ),
  .WVALID  ( s_axi_control_wvalid  ),
  .WREADY  ( s_axi_control_wready  ),
  .WDATA   ( s_axi_control_wdata   ),
  .WSTRB   ( s_axi_control_wstrb   ),
  .ARVALID ( s_axi_control_arvalid ),
  .ARREADY ( s_axi_control_arready ),
  .ARADDR  ( s_axi_control_araddr  ),
  .RVALID  ( s_axi_control_rvalid  ),
  .RREADY  ( s_axi_control_rready  ),
  .RDATA   ( s_axi_control_rdata   ),
  .RRESP   ( s_axi_control_rresp   ),
  .BVALID  ( s_axi_control_bvalid  ),
  .BREADY  ( s_axi_control_bready  ),
  .BRESP   ( s_axi_control_bresp   )
);
*/
///////////////////////////////////////////////////////////////////////////////
// Add kernel logic here.  Modify/remove example code as necessary.
///////////////////////////////////////////////////////////////////////////////

design_1#(

)
inst_design_1 (
   .locked (ap_rst_n),
   .aclk_0                    ( ap_clk                  ),
  .S00_AXI_0_awvalid ( s_axi_control_awvalid ),
  .S00_AXI_0_awready ( s_axi_control_awready ),
  .S00_AXI_0_awaddr  ( s_axi_control_awaddr  ),
  .S00_AXI_0_awprot  (3'b000),
  .S00_AXI_0_wvalid  ( s_axi_control_wvalid  ),
  .S00_AXI_0_wready  ( s_axi_control_wready  ),
  .S00_AXI_0_wdata   ( s_axi_control_wdata    ),
  .S00_AXI_0_wstrb   ( s_axi_control_wstrb   ),
  .S00_AXI_0_bvalid  ( s_axi_control_bvalid  ),
  .S00_AXI_0_bready  ( s_axi_control_bready  ),
  .S00_AXI_0_bresp    (s_axi_control_bresp),
  .S00_AXI_0_arvalid ( s_axi_control_arvalid ),
  .S00_AXI_0_arready (  s_axi_control_arready),
  .S00_AXI_0_araddr  ( s_axi_control_araddr  ),
  .S00_AXI_0_arprot  (3'b000),
  .S00_AXI_0_rvalid  ( s_axi_control_rvalid  ),
  .S00_AXI_0_rready  ( s_axi_control_rready  ),
  .S00_AXI_0_rdata   ( s_axi_control_rdata   ),
  .S00_AXI_0_rresp   (s_axi_control_rresp),   
  .udp_axis_m_0_tvalid ( mac0_m_tvalid ),
  .udp_axis_m_0_tready ( mac0_m_tready ),
  .udp_axis_m_0_tdata  ( mac0_m_tdata  ),
  .udp_axis_m_0_tkeep  ( mac0_m_tkeep  ),
  .udp_axis_m_0_tlast  ( mac0_m_tlast  ),
  .udp_axis_s_0_tvalid ( mac0_s_tvalid ),
  .udp_axis_s_0_tready ( mac0_s_tready ),
  .udp_axis_s_0_tdata  ( mac0_s_tdata  ),
  .udp_axis_s_0_tkeep  ( mac0_s_tkeep  ),
  .udp_axis_s_0_tlast  ( mac0_s_tlast  ),
  .udp_axis_m_1_tvalid ( mac1_m_tvalid ),
  .udp_axis_m_1_tready ( mac1_m_tready ),
  .udp_axis_m_1_tdata  ( mac1_m_tdata  ),
  .udp_axis_m_1_tkeep  ( mac1_m_tkeep  ),
  .udp_axis_m_1_tlast  ( mac1_m_tlast  ),
  .udp_axis_s_1_tvalid ( mac1_s_tvalid ),
  .udp_axis_s_1_tready ( mac1_s_tready ),
  .udp_axis_s_1_tdata  ( mac1_s_tdata  ),
  .udp_axis_s_1_tkeep  ( mac1_s_tkeep  ),
  .udp_axis_s_1_tlast  ( mac1_s_tlast  ),
    .gt_ref_clk_0_clk_n (gt_ref_clk_n),
    .gt_ref_clk_0_clk_p (gt_ref_clk_p),
    .gt_ref_clk_1_clk_n (gt1_ref_clk_n),
    .gt_ref_clk_1_clk_p (gt1_ref_clk_p),
    .gt_serial_port_0_grx_n (qsfp28_rx_n),
    .gt_serial_port_0_grx_p (qsfp28_rx_p),
    .gt_serial_port_0_gtx_n (qsfp28_tx_n),
    .gt_serial_port_0_gtx_p (qsfp28_tx_p),
    .gt_serial_port_1_grx_n (qsfp28_1_rx_n),
    .gt_serial_port_1_grx_p (qsfp28_1_rx_p),
    .gt_serial_port_1_gtx_n (qsfp28_1_tx_n),
    .gt_serial_port_1_gtx_p (qsfp28_1_tx_p)
);


endmodule
`default_nettype wire
