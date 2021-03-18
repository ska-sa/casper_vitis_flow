// This is a generated file. Use and modify at your own risk.
//////////////////////////////////////////////////////////////////////////////// 
// default_nettype of none prevents implicit wire declaration.
`default_nettype none
module rtl_kernel_wizard_0_example #(
  parameter integer C_A_ADDR_WIDTH = 64 ,
  parameter integer C_A_DATA_WIDTH = 512
)
(
  // System Signals
  input  wire                        ap_clk    ,
  input  wire                        ap_rst_n  ,
  // AXI4 master interface A
  output wire                        A_awvalid ,
  input  wire                        A_awready ,
  output wire [C_A_ADDR_WIDTH-1:0]   A_awaddr  ,
  output wire [8-1:0]                A_awlen   ,
  output wire                        A_wvalid  ,
  input  wire                        A_wready  ,
  output wire [C_A_DATA_WIDTH-1:0]   A_wdata   ,
  output wire [C_A_DATA_WIDTH/8-1:0] A_wstrb   ,
  output wire                        A_wlast   ,
  input  wire                        A_bvalid  ,
  output wire                        A_bready  ,
  output wire                        A_arvalid ,
  input  wire                        A_arready ,
  output wire [C_A_ADDR_WIDTH-1:0]   A_araddr  ,
  output wire [8-1:0]                A_arlen   ,
  input  wire                        A_rvalid  ,
  output wire                        A_rready  ,
  input  wire [C_A_DATA_WIDTH-1:0]   A_rdata   ,
  input  wire                        A_rlast   ,
  // Control Signals
  input  wire                        ap_start  ,
  output wire                        ap_idle   ,
  output wire                        ap_done   ,
  output wire                        ap_ready  ,
  input  wire [32-1:0]               scalar00  ,
  input  wire [64-1:0]               axi00_ptr0
);


timeunit 1ps;
timeprecision 1ps;

///////////////////////////////////////////////////////////////////////////////
// Local Parameters
///////////////////////////////////////////////////////////////////////////////
// Large enough for interesting traffic.
localparam integer  LP_DEFAULT_LENGTH_IN_BYTES = 16384;
localparam integer  LP_NUM_EXAMPLES    = 1;

///////////////////////////////////////////////////////////////////////////////
// Wires and Variables
///////////////////////////////////////////////////////////////////////////////
(* KEEP = "yes" *)
logic                                areset                         = 1'b0;
logic                                ap_start_r                     = 1'b0;
logic                                ap_idle_r                      = 1'b1;
logic                                ap_start_pulse                ;
logic [LP_NUM_EXAMPLES-1:0]          ap_done_i                     ;
logic [LP_NUM_EXAMPLES-1:0]          ap_done_r                      = {LP_NUM_EXAMPLES{1'b0}};
logic [32-1:0]                       ctrl_xfer_size_in_bytes        = LP_DEFAULT_LENGTH_IN_BYTES;
logic [32-1:0]                       ctrl_constant                  = 32'd1;

///////////////////////////////////////////////////////////////////////////////
// Begin RTL
///////////////////////////////////////////////////////////////////////////////

// Register and invert reset signal.
always @(posedge ap_clk) begin
  areset <= ~ap_rst_n;
end

// create pulse when ap_start transitions to 1
always @(posedge ap_clk) begin
  begin
    ap_start_r <= ap_start;
  end
end

assign ap_start_pulse = ap_start & ~ap_start_r;

// ap_idle is asserted when done is asserted, it is de-asserted when ap_start_pulse
// is asserted
always @(posedge ap_clk) begin
  if (areset) begin
    ap_idle_r <= 1'b1;
  end
  else begin
    ap_idle_r <= ap_done ? 1'b1 :
      ap_start_pulse ? 1'b0 : ap_idle;
  end
end

assign ap_idle = ap_idle_r;

// Done logic
always @(posedge ap_clk) begin
  if (areset) begin
    ap_done_r <= '0;
  end
  else begin
    ap_done_r <= (ap_done) ? '0 : ap_done_r | ap_done_i;
  end
end

assign ap_done = &ap_done_r;

// Ready Logic (non-pipelined case)
assign ap_ready = ap_done;

// Vadd example
rtl_kernel_wizard_0_example_vadd #(
  .C_M_AXI_ADDR_WIDTH ( C_A_ADDR_WIDTH ),
  .C_M_AXI_DATA_WIDTH ( C_A_DATA_WIDTH ),
  .C_ADDER_BIT_WIDTH  ( 32             ),
  .C_XFER_SIZE_WIDTH  ( 32             )
)
inst_example_vadd_A (
  .aclk                    ( ap_clk                  ),
  .areset                  ( areset                  ),
  .kernel_clk              ( ap_clk                  ),
  .kernel_rst              ( areset                  ),
  .ctrl_addr_offset        ( axi00_ptr0              ),
  .ctrl_xfer_size_in_bytes ( ctrl_xfer_size_in_bytes ),
  .ctrl_constant           ( ctrl_constant           ),
  .ap_start                ( ap_start_pulse          ),
  .ap_done                 ( ap_done_i[0]            ),
  .m_axi_awvalid           ( A_awvalid               ),
  .m_axi_awready           ( A_awready               ),
  .m_axi_awaddr            ( A_awaddr                ),
  .m_axi_awlen             ( A_awlen                 ),
  .m_axi_wvalid            ( A_wvalid                ),
  .m_axi_wready            ( A_wready                ),
  .m_axi_wdata             ( A_wdata                 ),
  .m_axi_wstrb             ( A_wstrb                 ),
  .m_axi_wlast             ( A_wlast                 ),
  .m_axi_bvalid            ( A_bvalid                ),
  .m_axi_bready            ( A_bready                ),
  .m_axi_arvalid           ( A_arvalid               ),
  .m_axi_arready           ( A_arready               ),
  .m_axi_araddr            ( A_araddr                ),
  .m_axi_arlen             ( A_arlen                 ),
  .m_axi_rvalid            ( A_rvalid                ),
  .m_axi_rready            ( A_rready                ),
  .m_axi_rdata             ( A_rdata                 ),
  .m_axi_rlast             ( A_rlast                 )
);


endmodule : rtl_kernel_wizard_0_example
`default_nettype wire
