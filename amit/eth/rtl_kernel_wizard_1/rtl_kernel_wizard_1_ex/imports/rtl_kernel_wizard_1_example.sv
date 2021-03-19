// This is a generated file. Use and modify at your own risk.
//////////////////////////////////////////////////////////////////////////////// 
// default_nettype of none prevents implicit wire declaration.
`default_nettype none
module rtl_kernel_wizard_1_example #(
  parameter integer C_MAC0_M_TDATA_WIDTH = 512,
  parameter integer C_MAC0_S_TDATA_WIDTH = 512,
  parameter integer C_MAC1_M_TDATA_WIDTH = 512,
  parameter integer C_MAC1_S_TDATA_WIDTH = 512
)
(
  // System Signals
  input  wire                              ap_clk       ,
  input  wire                              ap_rst_n     ,
  // Pipe (AXI4-Stream host) interface mac0_m
  output wire                              mac0_m_tvalid,
  input  wire                              mac0_m_tready,
  output wire [C_MAC0_M_TDATA_WIDTH-1:0]   mac0_m_tdata ,
  output wire [C_MAC0_M_TDATA_WIDTH/8-1:0] mac0_m_tkeep ,
  output wire                              mac0_m_tlast ,
  // Pipe (AXI4-Stream host) interface mac0_s
  input  wire                              mac0_s_tvalid,
  output wire                              mac0_s_tready,
  input  wire [C_MAC0_S_TDATA_WIDTH-1:0]   mac0_s_tdata ,
  input  wire [C_MAC0_S_TDATA_WIDTH/8-1:0] mac0_s_tkeep ,
  input  wire                              mac0_s_tlast ,
  // Pipe (AXI4-Stream host) interface mac1_m
  output wire                              mac1_m_tvalid,
  input  wire                              mac1_m_tready,
  output wire [C_MAC1_M_TDATA_WIDTH-1:0]   mac1_m_tdata ,
  output wire [C_MAC1_M_TDATA_WIDTH/8-1:0] mac1_m_tkeep ,
  output wire                              mac1_m_tlast ,
  // Pipe (AXI4-Stream host) interface mac1_s
  input  wire                              mac1_s_tvalid,
  output wire                              mac1_s_tready,
  input  wire [C_MAC1_S_TDATA_WIDTH-1:0]   mac1_s_tdata ,
  input  wire [C_MAC1_S_TDATA_WIDTH/8-1:0] mac1_s_tkeep ,
  input  wire                              mac1_s_tlast 
);


timeunit 1ps;
timeprecision 1ps;

///////////////////////////////////////////////////////////////////////////////
// Local Parameters
///////////////////////////////////////////////////////////////////////////////
// Large enough for interesting traffic.
localparam integer  LP_DEFAULT_LENGTH_IN_BYTES = 16384;
localparam integer  LP_NUM_EXAMPLES    = 2;

///////////////////////////////////////////////////////////////////////////////
// Wires and Variables
///////////////////////////////////////////////////////////////////////////////
(* KEEP = "yes" *)
logic                                areset                         = 1'b0;
logic [32-1:0]                       ctrl_xfer_size_in_bytes        = LP_DEFAULT_LENGTH_IN_BYTES;
logic [32-1:0]                       ctrl_constant                  = 32'd1;

///////////////////////////////////////////////////////////////////////////////
// Begin RTL
///////////////////////////////////////////////////////////////////////////////

// Register and invert reset signal.
always @(posedge ap_clk) begin
  areset <= ~ap_rst_n;
end



endmodule : rtl_kernel_wizard_1_example
`default_nettype wire
