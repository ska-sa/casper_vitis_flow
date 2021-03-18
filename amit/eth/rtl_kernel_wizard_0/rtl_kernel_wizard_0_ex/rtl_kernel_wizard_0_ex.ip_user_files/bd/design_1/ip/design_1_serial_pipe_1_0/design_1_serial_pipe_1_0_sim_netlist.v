// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.2 (lin64) Build 3064766 Wed Nov 18 09:12:47 MST 2020
// Date        : Tue Mar 16 17:56:06 2021
// Host        : fpgdev running 64-bit Ubuntu 16.04.7 LTS
// Command     : write_verilog -force -mode funcsim
//               /.aux_mnt/fpgdeva/casperlibs/vitis/workspace/rtl_u280_kernel/vivado_rtl_kernel/rtl_kernel_wizard_0_ex/rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ip/design_1_serial_pipe_1_0/design_1_serial_pipe_1_0_sim_netlist.v
// Design      : design_1_serial_pipe_1_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xcu280-fsvh2892-2L-e
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "design_1_serial_pipe_1_0,serial_pipe,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* IP_DEFINITION_SOURCE = "module_ref" *) 
(* X_CORE_INFO = "serial_pipe,Vivado 2020.2" *) 
(* NotValidForBitStream *)
module design_1_serial_pipe_1_0
   (clk,
    rst_s_n,
    en,
    serial_in,
    serial_out);
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 clk CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME clk, FREQ_HZ 322265625, FREQ_TOLERANCE_HZ 0, PHASE 0.000, CLK_DOMAIN design_1_cmac_usplus_1_0_gt_txusrclk2, INSERT_VIP 0" *) input clk;
  input rst_s_n;
  input en;
  input serial_in;
  output serial_out;

  wire clk;
  wire en;
  wire rst_s_n;
  wire serial_in;
  wire serial_out;

  design_1_serial_pipe_1_0_serial_pipe inst
       (.clk(clk),
        .en(en),
        .rst_s_n(rst_s_n),
        .serial_in(serial_in),
        .serial_out(serial_out));
endmodule

(* ORIG_REF_NAME = "serial_pipe" *) 
module design_1_serial_pipe_1_0_serial_pipe
   (serial_out,
    clk,
    rst_s_n,
    en,
    serial_in);
  output serial_out;
  input clk;
  input rst_s_n;
  input en;
  input serial_in;

  wire clk;
  wire en;
  wire rst_s_n;
  wire serial_in;
  wire serial_out;
  wire \sr_eq1.serial_out_i_1_n_0 ;

  LUT4 #(
    .INIT(16'hA808)) 
    \sr_eq1.serial_out_i_1 
       (.I0(rst_s_n),
        .I1(serial_out),
        .I2(en),
        .I3(serial_in),
        .O(\sr_eq1.serial_out_i_1_n_0 ));
  FDRE \sr_eq1.serial_out_reg 
       (.C(clk),
        .CE(1'b1),
        .D(\sr_eq1.serial_out_i_1_n_0 ),
        .Q(serial_out),
        .R(1'b0));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
