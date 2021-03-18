// This is a generated file. Use and modify at your own risk.
//////////////////////////////////////////////////////////////////////////////// 
// default_nettype of none prevents implicit wire declaration.
`default_nettype none
`timescale 1 ns / 1 ps
// Top level of the kernel. Do not modify module name, parameters or ports.
module rtl_kernel_wizard_0 #(
  parameter integer C_S_AXI_CONTROL_ADDR_WIDTH = 12 ,
  parameter integer C_S_AXI_CONTROL_DATA_WIDTH = 32 ,
  parameter integer C_A_ADDR_WIDTH             = 64 ,
  parameter integer C_A_DATA_WIDTH             = 512
)
(
  // System Signals
  input  wire                                    ap_clk               ,
  input  wire                                    ap_locked               ,
  
//  input wire sys_clk0_p,
//  input wire sys_clk0_n,
  
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
  // AXI4 master interface A
  output wire                                    A_awvalid            ,
  input  wire                                    A_awready            ,
  output wire [C_A_ADDR_WIDTH-1:0]               A_awaddr             ,
  output wire [8-1:0]                            A_awlen              ,
  output wire                                    A_wvalid             ,
  input  wire                                    A_wready             ,
  output wire [C_A_DATA_WIDTH-1:0]               A_wdata              ,
  output wire [C_A_DATA_WIDTH/8-1:0]             A_wstrb              ,
  output wire                                    A_wlast              ,
  input  wire                                    A_bvalid             ,
  output wire                                    A_bready             ,
  output wire                                    A_arvalid            ,
  input  wire                                    A_arready            ,
  output wire [C_A_ADDR_WIDTH-1:0]               A_araddr             ,
  output wire [8-1:0]                            A_arlen              ,
  input  wire                                    A_rvalid             ,
  output wire                                    A_rready             ,
  input  wire [C_A_DATA_WIDTH-1:0]               A_rdata              ,
  input  wire                                    A_rlast              ,
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
  output wire [2-1:0]                            s_axi_control_bresp  ,
  output wire                                    interrupt            
);

///////////////////////////////////////////////////////////////////////////////
// Local Parameters
///////////////////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////////////////////
// Wires and Variables
///////////////////////////////////////////////////////////////////////////////
wire                                ap_start                      ;
wire                                ap_idle                       ;
wire                                ap_done                       ;
wire                                ap_ready                      ;
wire [32-1:0]                       scalar00                      ;
wire [64-1:0]                       axi00_ptr0                    ;

///////////////////////////////////////////////////////////////////////////////
// Begin control interface RTL.  Modifying not recommended.
///////////////////////////////////////////////////////////////////////////////


// AXI4-Lite slave interface
//rtl_kernel_wizard_0_control_s_axi #(
//  .C_S_AXI_ADDR_WIDTH ( C_S_AXI_CONTROL_ADDR_WIDTH ),
//  .C_S_AXI_DATA_WIDTH ( C_S_AXI_CONTROL_DATA_WIDTH )
//)
//inst_control_s_axi (
//  .ACLK       ( ap_clk                ),
//  .ARESET     ( 1'b0                  ),
//  .ACLK_EN    ( 1'b1                  ),
//  .AWVALID    ( s_axi_control_awvalid ),
//  .AWREADY    ( s_axi_control_awready ),
//  .AWADDR     ( s_axi_control_awaddr  ),
//  .WVALID     ( s_axi_control_wvalid  ),
//  .WREADY     ( s_axi_control_wready  ),
//  .WDATA      ( s_axi_control_wdata   ),
//  .WSTRB      ( s_axi_control_wstrb   ),
//  .ARVALID    ( s_axi_control_arvalid ),
//  .ARREADY    ( s_axi_control_arready ),
//  .ARADDR     ( s_axi_control_araddr  ),
//  .RVALID     ( s_axi_control_rvalid  ),
//  .RREADY     ( s_axi_control_rready  ),
//  .RDATA      ( s_axi_control_rdata   ),
//  .RRESP      ( s_axi_control_rresp   ),
//  .BVALID     ( s_axi_control_bvalid  ),
//  .BREADY     ( s_axi_control_bready  ),
//  .BRESP      ( s_axi_control_bresp   ),
//  .interrupt  ( interrupt             ),
//  .ap_start   ( ap_start              ),
//  .ap_done    ( ap_done               ),
//  .ap_ready   ( ap_ready              ),
//  .ap_idle    ( ap_idle               ),
//  .scalar00   ( scalar00              ),
//  .axi00_ptr0 ( axi00_ptr0            )
//);

///////////////////////////////////////////////////////////////////////////////
// Add kernel logic here.  Modify/remove example code as necessary.
///////////////////////////////////////////////////////////////////////////////

// Example RTL block.  Remove to insert custom logic.
rtl_kernel_wizard_0_example #(
  .C_A_ADDR_WIDTH ( C_A_ADDR_WIDTH ),
  .C_A_DATA_WIDTH ( C_A_DATA_WIDTH )
)
inst_example (
  .ap_clk     ( ap_clk     ),
  .ap_rst_n   ( 1'b1       ),
  .A_awvalid  ( A_awvalid  ),
  .A_awready  ( A_awready  ),
  .A_awaddr   ( A_awaddr   ),
  .A_awlen    ( A_awlen    ),
  .A_wvalid   ( A_wvalid   ),
  .A_wready   ( A_wready   ),
  .A_wdata    ( A_wdata    ),
  .A_wstrb    ( A_wstrb    ),
  .A_wlast    ( A_wlast    ),
  .A_bvalid   ( A_bvalid   ),
  .A_bready   ( A_bready   ),
  .A_arvalid  ( A_arvalid  ),
  .A_arready  ( A_arready  ),
  .A_araddr   ( A_araddr   ),
  .A_arlen    ( A_arlen    ),
  .A_rvalid   ( A_rvalid   ),
  .A_rready   ( A_rready   ),
  .A_rdata    ( A_rdata    ),
  .A_rlast    ( A_rlast    ),
  .ap_start   ( ap_start   ),
  .ap_done    ( ap_done    ),
  .ap_idle    ( ap_idle    ),
  .ap_ready   ( ap_ready   ),
  .scalar00   ( scalar00   ),
  .axi00_ptr0 ( axi00_ptr0 )
);

design_1#(

)
inst_design_1 (
   .ACLK_EN_0 (1'b1),
   .ARESET_0 (1'b0),
   .locked (ap_locked),
    .ap_done_0(ap_done),
    .ap_idle_0(ap_idle),
    .ap_ready_0(ap_ready),
    .ap_start_0(ap_start),
    .axi00_ptr0_0(axi00_ptr0),
    .interrupt_0(interrupt),
    .scalar00_0(scalar00),
   .aclk_0                    ( ap_clk                  ),
 //  .sys_clk0_clk_p                    ( sys_clk0_p                  ),
 //  .sys_clk0_clk_n                  ( sys_clk0_n                  ),
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
