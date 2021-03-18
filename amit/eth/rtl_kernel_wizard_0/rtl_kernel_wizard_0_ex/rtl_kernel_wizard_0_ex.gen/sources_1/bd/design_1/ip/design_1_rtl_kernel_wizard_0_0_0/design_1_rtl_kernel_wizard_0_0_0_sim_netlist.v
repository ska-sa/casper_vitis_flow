// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.2 (lin64) Build 3064766 Wed Nov 18 09:12:47 MST 2020
// Date        : Tue Mar 16 18:21:50 2021
// Host        : fpgdev running 64-bit Ubuntu 16.04.7 LTS
// Command     : write_verilog -force -mode funcsim
//               /.aux_mnt/fpgdeva/casperlibs/vitis/workspace/rtl_u280_kernel/vivado_rtl_kernel/rtl_kernel_wizard_0_ex/rtl_kernel_wizard_0_ex.gen/sources_1/bd/design_1/ip/design_1_rtl_kernel_wizard_0_0_0/design_1_rtl_kernel_wizard_0_0_0_sim_netlist.v
// Design      : design_1_rtl_kernel_wizard_0_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xcu280-fsvh2892-2L-e
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "design_1_rtl_kernel_wizard_0_0_0,rtl_kernel_wizard_0_control_s_axi,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* IP_DEFINITION_SOURCE = "module_ref" *) 
(* X_CORE_INFO = "rtl_kernel_wizard_0_control_s_axi,Vivado 2020.2" *) 
(* NotValidForBitStream *)
module design_1_rtl_kernel_wizard_0_0_0
   (ACLK,
    ARESET,
    ACLK_EN,
    AWADDR,
    AWVALID,
    AWREADY,
    WDATA,
    WSTRB,
    WVALID,
    WREADY,
    BRESP,
    BVALID,
    BREADY,
    ARADDR,
    ARVALID,
    ARREADY,
    RDATA,
    RRESP,
    RVALID,
    RREADY,
    interrupt,
    scalar00,
    axi00_ptr0,
    ap_start,
    ap_done,
    ap_ready,
    ap_idle);
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 ACLK CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME ACLK, ASSOCIATED_BUSIF interface_aximm, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.000, CLK_DOMAIN design_1_aclk_0, INSERT_VIP 0" *) input ACLK;
  input ARESET;
  input ACLK_EN;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 interface_aximm AWADDR" *) input [11:0]AWADDR;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 interface_aximm AWVALID" *) input AWVALID;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 interface_aximm AWREADY" *) output AWREADY;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 interface_aximm WDATA" *) input [31:0]WDATA;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 interface_aximm WSTRB" *) input [3:0]WSTRB;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 interface_aximm WVALID" *) input WVALID;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 interface_aximm WREADY" *) output WREADY;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 interface_aximm BRESP" *) output [1:0]BRESP;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 interface_aximm BVALID" *) output BVALID;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 interface_aximm BREADY" *) input BREADY;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 interface_aximm ARADDR" *) input [11:0]ARADDR;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 interface_aximm ARVALID" *) input ARVALID;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 interface_aximm ARREADY" *) output ARREADY;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 interface_aximm RDATA" *) output [31:0]RDATA;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 interface_aximm RRESP" *) output [1:0]RRESP;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 interface_aximm RVALID" *) output RVALID;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 interface_aximm RREADY" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME interface_aximm, DATA_WIDTH 32, PROTOCOL AXI4LITE, FREQ_HZ 100000000, ID_WIDTH 0, ADDR_WIDTH 12, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 0, HAS_LOCK 0, HAS_PROT 0, HAS_CACHE 0, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 0, NUM_READ_OUTSTANDING 1, NUM_WRITE_OUTSTANDING 1, MAX_BURST_LENGTH 1, PHASE 0.000, CLK_DOMAIN design_1_aclk_0, NUM_READ_THREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0" *) input RREADY;
  (* X_INTERFACE_INFO = "xilinx.com:signal:interrupt:1.0 interrupt INTERRUPT" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME interrupt, SENSITIVITY LEVEL_HIGH, PortWidth 1" *) output interrupt;
  output [31:0]scalar00;
  output [63:0]axi00_ptr0;
  output ap_start;
  input ap_done;
  input ap_ready;
  input ap_idle;

  wire \<const0> ;
  wire ACLK;
  wire ACLK_EN;
  wire [11:0]ARADDR;
  wire ARESET;
  wire ARREADY;
  wire ARVALID;
  wire [11:0]AWADDR;
  wire AWREADY;
  wire AWVALID;
  wire BREADY;
  wire BVALID;
  wire [31:0]RDATA;
  wire RREADY;
  wire RVALID;
  wire [31:0]WDATA;
  wire WREADY;
  wire [3:0]WSTRB;
  wire WVALID;
  wire ap_done;
  wire ap_idle;
  wire ap_ready;
  wire ap_start;
  wire [63:0]axi00_ptr0;
  wire interrupt;
  wire [31:0]scalar00;

  assign BRESP[1] = \<const0> ;
  assign BRESP[0] = \<const0> ;
  assign RRESP[1] = \<const0> ;
  assign RRESP[0] = \<const0> ;
  GND GND
       (.G(\<const0> ));
  design_1_rtl_kernel_wizard_0_0_0_rtl_kernel_wizard_0_control_s_axi inst
       (.ACLK(ACLK),
        .ACLK_EN(ACLK_EN),
        .ARADDR(ARADDR[5:0]),
        .ARESET(ARESET),
        .ARREADY(ARREADY),
        .ARVALID(ARVALID),
        .AWADDR(AWADDR[5:0]),
        .AWREADY(AWREADY),
        .AWVALID(AWVALID),
        .BREADY(BREADY),
        .BVALID(BVALID),
        .RDATA(RDATA),
        .RREADY(RREADY),
        .RVALID(RVALID),
        .WDATA(WDATA),
        .WREADY(WREADY),
        .WSTRB(WSTRB),
        .WVALID(WVALID),
        .ap_done(ap_done),
        .ap_idle(ap_idle),
        .ap_ready(ap_ready),
        .ap_start(ap_start),
        .axi00_ptr0(axi00_ptr0),
        .interrupt(interrupt),
        .scalar00(scalar00));
endmodule

(* ORIG_REF_NAME = "rtl_kernel_wizard_0_control_s_axi" *) 
module design_1_rtl_kernel_wizard_0_0_0_rtl_kernel_wizard_0_control_s_axi
   (BVALID,
    WREADY,
    AWREADY,
    RVALID,
    ARREADY,
    ap_start,
    scalar00,
    axi00_ptr0,
    RDATA,
    interrupt,
    ARESET,
    ACLK_EN,
    ACLK,
    AWADDR,
    ap_ready,
    WDATA,
    ap_done,
    ap_idle,
    ARVALID,
    RREADY,
    BREADY,
    WVALID,
    WSTRB,
    ARADDR,
    AWVALID);
  output BVALID;
  output WREADY;
  output AWREADY;
  output RVALID;
  output ARREADY;
  output ap_start;
  output [31:0]scalar00;
  output [63:0]axi00_ptr0;
  output [31:0]RDATA;
  output interrupt;
  input ARESET;
  input ACLK_EN;
  input ACLK;
  input [5:0]AWADDR;
  input ap_ready;
  input [31:0]WDATA;
  input ap_done;
  input ap_idle;
  input ARVALID;
  input RREADY;
  input BREADY;
  input WVALID;
  input [3:0]WSTRB;
  input [5:0]ARADDR;
  input AWVALID;

  wire ACLK;
  wire ACLK_EN;
  wire [5:0]ARADDR;
  wire ARESET;
  wire ARREADY;
  wire ARVALID;
  wire [5:0]AWADDR;
  wire AWREADY;
  wire AWVALID;
  wire BREADY;
  wire BVALID;
  wire \FSM_onehot_rstate[1]_i_1_n_0 ;
  wire \FSM_onehot_rstate[2]_i_1_n_0 ;
  wire \FSM_onehot_wstate[1]_i_1_n_0 ;
  wire \FSM_onehot_wstate[2]_i_1_n_0 ;
  wire \FSM_onehot_wstate[3]_i_1_n_0 ;
  wire [31:0]RDATA;
  wire RREADY;
  wire RVALID;
  wire [31:0]WDATA;
  wire WREADY;
  wire [3:0]WSTRB;
  wire WVALID;
  wire ap_done;
  wire ap_idle;
  wire ap_ready;
  wire ap_start;
  wire [63:0]axi00_ptr0;
  wire [7:1]data0;
  wire int_ap_done_i_1_n_0;
  wire int_ap_start3_out;
  wire int_ap_start_i_1_n_0;
  wire int_auto_restart_i_1_n_0;
  wire int_auto_restart_i_2_n_0;
  wire int_axi00_ptr0;
  wire \int_axi00_ptr0[63]_i_1_n_0 ;
  wire [31:0]int_axi00_ptr0_reg0;
  wire [31:0]int_axi00_ptr0_reg01_out;
  wire int_gie_i_1_n_0;
  wire int_gie_i_2_n_0;
  wire int_gie_reg_n_0;
  wire int_ier9_out;
  wire \int_ier_reg_n_0_[0] ;
  wire int_isr6_out;
  wire \int_isr[0]_i_1_n_0 ;
  wire \int_isr[1]_i_1_n_0 ;
  wire \int_isr_reg_n_0_[0] ;
  wire int_scalar00;
  wire [31:0]int_scalar000;
  wire \int_scalar00[31]_i_3_n_0 ;
  wire interrupt;
  wire [31:0]p_0_in;
  wire p_0_in_0;
  wire p_1_in;
  wire rdata;
  wire \rdata[0]_i_2_n_0 ;
  wire \rdata[0]_i_3_n_0 ;
  wire \rdata[0]_i_4_n_0 ;
  wire \rdata[1]_i_2_n_0 ;
  wire \rdata[1]_i_3_n_0 ;
  wire \rdata[1]_i_4_n_0 ;
  wire \rdata[2]_i_2_n_0 ;
  wire \rdata[31]_i_3_n_0 ;
  wire \rdata[31]_i_4_n_0 ;
  wire \rdata[31]_i_5_n_0 ;
  wire \rdata[3]_i_2_n_0 ;
  wire \rdata[7]_i_2_n_0 ;
  wire [31:0]scalar00;
  wire waddr;
  wire \waddr_reg_n_0_[0] ;
  wire \waddr_reg_n_0_[1] ;
  wire \waddr_reg_n_0_[2] ;
  wire \waddr_reg_n_0_[3] ;
  wire \waddr_reg_n_0_[4] ;
  wire \waddr_reg_n_0_[5] ;

  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'h8FDD)) 
    \FSM_onehot_rstate[1]_i_1 
       (.I0(RVALID),
        .I1(RREADY),
        .I2(ARVALID),
        .I3(ARREADY),
        .O(\FSM_onehot_rstate[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'h8F88)) 
    \FSM_onehot_rstate[2]_i_1 
       (.I0(ARREADY),
        .I1(ARVALID),
        .I2(RREADY),
        .I3(RVALID),
        .O(\FSM_onehot_rstate[2]_i_1_n_0 ));
  (* FSM_ENCODED_STATES = "RDIDLE:010,RDDATA:100,iSTATE:001" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_rstate_reg[1] 
       (.C(ACLK),
        .CE(ACLK_EN),
        .D(\FSM_onehot_rstate[1]_i_1_n_0 ),
        .Q(ARREADY),
        .R(ARESET));
  (* FSM_ENCODED_STATES = "RDIDLE:010,RDDATA:100,iSTATE:001" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_rstate_reg[2] 
       (.C(ACLK),
        .CE(ACLK_EN),
        .D(\FSM_onehot_rstate[2]_i_1_n_0 ),
        .Q(RVALID),
        .R(ARESET));
  LUT5 #(
    .INIT(32'hC0FFD1D1)) 
    \FSM_onehot_wstate[1]_i_1 
       (.I0(WREADY),
        .I1(BVALID),
        .I2(BREADY),
        .I3(AWVALID),
        .I4(AWREADY),
        .O(\FSM_onehot_wstate[1]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h8F88)) 
    \FSM_onehot_wstate[2]_i_1 
       (.I0(AWREADY),
        .I1(AWVALID),
        .I2(WVALID),
        .I3(WREADY),
        .O(\FSM_onehot_wstate[2]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hF444)) 
    \FSM_onehot_wstate[3]_i_1 
       (.I0(BREADY),
        .I1(BVALID),
        .I2(WVALID),
        .I3(WREADY),
        .O(\FSM_onehot_wstate[3]_i_1_n_0 ));
  (* FSM_ENCODED_STATES = "WRDATA:0100,WRRESP:1000,WRIDLE:0010,iSTATE:0001" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_wstate_reg[1] 
       (.C(ACLK),
        .CE(ACLK_EN),
        .D(\FSM_onehot_wstate[1]_i_1_n_0 ),
        .Q(AWREADY),
        .R(ARESET));
  (* FSM_ENCODED_STATES = "WRDATA:0100,WRRESP:1000,WRIDLE:0010,iSTATE:0001" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_wstate_reg[2] 
       (.C(ACLK),
        .CE(ACLK_EN),
        .D(\FSM_onehot_wstate[2]_i_1_n_0 ),
        .Q(WREADY),
        .R(ARESET));
  (* FSM_ENCODED_STATES = "WRDATA:0100,WRRESP:1000,WRIDLE:0010,iSTATE:0001" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_wstate_reg[3] 
       (.C(ACLK),
        .CE(ACLK_EN),
        .D(\FSM_onehot_wstate[3]_i_1_n_0 ),
        .Q(BVALID),
        .R(ARESET));
  LUT6 #(
    .INIT(64'hBFFFFFFFAAAA0000)) 
    int_ap_done_i_1
       (.I0(ap_done),
        .I1(\rdata[0]_i_3_n_0 ),
        .I2(ARREADY),
        .I3(ARVALID),
        .I4(ACLK_EN),
        .I5(data0[1]),
        .O(int_ap_done_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    int_ap_done_reg
       (.C(ACLK),
        .CE(1'b1),
        .D(int_ap_done_i_1_n_0),
        .Q(data0[1]),
        .R(ARESET));
  FDRE int_ap_idle_reg
       (.C(ACLK),
        .CE(ACLK_EN),
        .D(ap_idle),
        .Q(data0[2]),
        .R(ARESET));
  FDRE int_ap_ready_reg
       (.C(ACLK),
        .CE(ACLK_EN),
        .D(ap_ready),
        .Q(data0[3]),
        .R(ARESET));
  LUT5 #(
    .INIT(32'hFFBFFF80)) 
    int_ap_start_i_1
       (.I0(data0[7]),
        .I1(ACLK_EN),
        .I2(ap_ready),
        .I3(int_ap_start3_out),
        .I4(ap_start),
        .O(int_ap_start_i_1_n_0));
  LUT6 #(
    .INIT(64'h0000002000000000)) 
    int_ap_start_i_2
       (.I0(WSTRB[0]),
        .I1(\waddr_reg_n_0_[4] ),
        .I2(WDATA[0]),
        .I3(\waddr_reg_n_0_[3] ),
        .I4(\waddr_reg_n_0_[2] ),
        .I5(\int_scalar00[31]_i_3_n_0 ),
        .O(int_ap_start3_out));
  FDRE #(
    .INIT(1'b0)) 
    int_ap_start_reg
       (.C(ACLK),
        .CE(1'b1),
        .D(int_ap_start_i_1_n_0),
        .Q(ap_start),
        .R(ARESET));
  LUT6 #(
    .INIT(64'hFFEFFFFF00200000)) 
    int_auto_restart_i_1
       (.I0(WDATA[7]),
        .I1(\waddr_reg_n_0_[3] ),
        .I2(WSTRB[0]),
        .I3(\waddr_reg_n_0_[4] ),
        .I4(int_auto_restart_i_2_n_0),
        .I5(data0[7]),
        .O(int_auto_restart_i_1_n_0));
  LUT2 #(
    .INIT(4'h2)) 
    int_auto_restart_i_2
       (.I0(\int_scalar00[31]_i_3_n_0 ),
        .I1(\waddr_reg_n_0_[2] ),
        .O(int_auto_restart_i_2_n_0));
  FDRE #(
    .INIT(1'b0)) 
    int_auto_restart_reg
       (.C(ACLK),
        .CE(1'b1),
        .D(int_auto_restart_i_1_n_0),
        .Q(data0[7]),
        .R(ARESET));
  (* SOFT_HLUTNM = "soft_lutpair34" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_axi00_ptr0[0]_i_1 
       (.I0(WDATA[0]),
        .I1(WSTRB[0]),
        .I2(axi00_ptr0[0]),
        .O(int_axi00_ptr0_reg01_out[0]));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_axi00_ptr0[10]_i_1 
       (.I0(WDATA[10]),
        .I1(WSTRB[1]),
        .I2(axi00_ptr0[10]),
        .O(int_axi00_ptr0_reg01_out[10]));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_axi00_ptr0[11]_i_1 
       (.I0(WDATA[11]),
        .I1(WSTRB[1]),
        .I2(axi00_ptr0[11]),
        .O(int_axi00_ptr0_reg01_out[11]));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_axi00_ptr0[12]_i_1 
       (.I0(WDATA[12]),
        .I1(WSTRB[1]),
        .I2(axi00_ptr0[12]),
        .O(int_axi00_ptr0_reg01_out[12]));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_axi00_ptr0[13]_i_1 
       (.I0(WDATA[13]),
        .I1(WSTRB[1]),
        .I2(axi00_ptr0[13]),
        .O(int_axi00_ptr0_reg01_out[13]));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_axi00_ptr0[14]_i_1 
       (.I0(WDATA[14]),
        .I1(WSTRB[1]),
        .I2(axi00_ptr0[14]),
        .O(int_axi00_ptr0_reg01_out[14]));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_axi00_ptr0[15]_i_1 
       (.I0(WDATA[15]),
        .I1(WSTRB[1]),
        .I2(axi00_ptr0[15]),
        .O(int_axi00_ptr0_reg01_out[15]));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_axi00_ptr0[16]_i_1 
       (.I0(WDATA[16]),
        .I1(WSTRB[2]),
        .I2(axi00_ptr0[16]),
        .O(int_axi00_ptr0_reg01_out[16]));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_axi00_ptr0[17]_i_1 
       (.I0(WDATA[17]),
        .I1(WSTRB[2]),
        .I2(axi00_ptr0[17]),
        .O(int_axi00_ptr0_reg01_out[17]));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_axi00_ptr0[18]_i_1 
       (.I0(WDATA[18]),
        .I1(WSTRB[2]),
        .I2(axi00_ptr0[18]),
        .O(int_axi00_ptr0_reg01_out[18]));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_axi00_ptr0[19]_i_1 
       (.I0(WDATA[19]),
        .I1(WSTRB[2]),
        .I2(axi00_ptr0[19]),
        .O(int_axi00_ptr0_reg01_out[19]));
  (* SOFT_HLUTNM = "soft_lutpair33" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_axi00_ptr0[1]_i_1 
       (.I0(WDATA[1]),
        .I1(WSTRB[0]),
        .I2(axi00_ptr0[1]),
        .O(int_axi00_ptr0_reg01_out[1]));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_axi00_ptr0[20]_i_1 
       (.I0(WDATA[20]),
        .I1(WSTRB[2]),
        .I2(axi00_ptr0[20]),
        .O(int_axi00_ptr0_reg01_out[20]));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_axi00_ptr0[21]_i_1 
       (.I0(WDATA[21]),
        .I1(WSTRB[2]),
        .I2(axi00_ptr0[21]),
        .O(int_axi00_ptr0_reg01_out[21]));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_axi00_ptr0[22]_i_1 
       (.I0(WDATA[22]),
        .I1(WSTRB[2]),
        .I2(axi00_ptr0[22]),
        .O(int_axi00_ptr0_reg01_out[22]));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_axi00_ptr0[23]_i_1 
       (.I0(WDATA[23]),
        .I1(WSTRB[2]),
        .I2(axi00_ptr0[23]),
        .O(int_axi00_ptr0_reg01_out[23]));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_axi00_ptr0[24]_i_1 
       (.I0(WDATA[24]),
        .I1(WSTRB[3]),
        .I2(axi00_ptr0[24]),
        .O(int_axi00_ptr0_reg01_out[24]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_axi00_ptr0[25]_i_1 
       (.I0(WDATA[25]),
        .I1(WSTRB[3]),
        .I2(axi00_ptr0[25]),
        .O(int_axi00_ptr0_reg01_out[25]));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_axi00_ptr0[26]_i_1 
       (.I0(WDATA[26]),
        .I1(WSTRB[3]),
        .I2(axi00_ptr0[26]),
        .O(int_axi00_ptr0_reg01_out[26]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_axi00_ptr0[27]_i_1 
       (.I0(WDATA[27]),
        .I1(WSTRB[3]),
        .I2(axi00_ptr0[27]),
        .O(int_axi00_ptr0_reg01_out[27]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_axi00_ptr0[28]_i_1 
       (.I0(WDATA[28]),
        .I1(WSTRB[3]),
        .I2(axi00_ptr0[28]),
        .O(int_axi00_ptr0_reg01_out[28]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_axi00_ptr0[29]_i_1 
       (.I0(WDATA[29]),
        .I1(WSTRB[3]),
        .I2(axi00_ptr0[29]),
        .O(int_axi00_ptr0_reg01_out[29]));
  (* SOFT_HLUTNM = "soft_lutpair32" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_axi00_ptr0[2]_i_1 
       (.I0(WDATA[2]),
        .I1(WSTRB[0]),
        .I2(axi00_ptr0[2]),
        .O(int_axi00_ptr0_reg01_out[2]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_axi00_ptr0[30]_i_1 
       (.I0(WDATA[30]),
        .I1(WSTRB[3]),
        .I2(axi00_ptr0[30]),
        .O(int_axi00_ptr0_reg01_out[30]));
  LUT4 #(
    .INIT(16'h0800)) 
    \int_axi00_ptr0[31]_i_1 
       (.I0(\waddr_reg_n_0_[4] ),
        .I1(\waddr_reg_n_0_[3] ),
        .I2(\waddr_reg_n_0_[2] ),
        .I3(\int_scalar00[31]_i_3_n_0 ),
        .O(int_axi00_ptr0));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_axi00_ptr0[31]_i_2 
       (.I0(WDATA[31]),
        .I1(WSTRB[3]),
        .I2(axi00_ptr0[31]),
        .O(int_axi00_ptr0_reg01_out[31]));
  (* SOFT_HLUTNM = "soft_lutpair50" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_axi00_ptr0[32]_i_1 
       (.I0(WDATA[0]),
        .I1(WSTRB[0]),
        .I2(axi00_ptr0[32]),
        .O(int_axi00_ptr0_reg0[0]));
  (* SOFT_HLUTNM = "soft_lutpair50" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_axi00_ptr0[33]_i_1 
       (.I0(WDATA[1]),
        .I1(WSTRB[0]),
        .I2(axi00_ptr0[33]),
        .O(int_axi00_ptr0_reg0[1]));
  (* SOFT_HLUTNM = "soft_lutpair49" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_axi00_ptr0[34]_i_1 
       (.I0(WDATA[2]),
        .I1(WSTRB[0]),
        .I2(axi00_ptr0[34]),
        .O(int_axi00_ptr0_reg0[2]));
  (* SOFT_HLUTNM = "soft_lutpair49" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_axi00_ptr0[35]_i_1 
       (.I0(WDATA[3]),
        .I1(WSTRB[0]),
        .I2(axi00_ptr0[35]),
        .O(int_axi00_ptr0_reg0[3]));
  (* SOFT_HLUTNM = "soft_lutpair48" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_axi00_ptr0[36]_i_1 
       (.I0(WDATA[4]),
        .I1(WSTRB[0]),
        .I2(axi00_ptr0[36]),
        .O(int_axi00_ptr0_reg0[4]));
  (* SOFT_HLUTNM = "soft_lutpair48" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_axi00_ptr0[37]_i_1 
       (.I0(WDATA[5]),
        .I1(WSTRB[0]),
        .I2(axi00_ptr0[37]),
        .O(int_axi00_ptr0_reg0[5]));
  (* SOFT_HLUTNM = "soft_lutpair47" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_axi00_ptr0[38]_i_1 
       (.I0(WDATA[6]),
        .I1(WSTRB[0]),
        .I2(axi00_ptr0[38]),
        .O(int_axi00_ptr0_reg0[6]));
  (* SOFT_HLUTNM = "soft_lutpair47" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_axi00_ptr0[39]_i_1 
       (.I0(WDATA[7]),
        .I1(WSTRB[0]),
        .I2(axi00_ptr0[39]),
        .O(int_axi00_ptr0_reg0[7]));
  (* SOFT_HLUTNM = "soft_lutpair31" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_axi00_ptr0[3]_i_1 
       (.I0(WDATA[3]),
        .I1(WSTRB[0]),
        .I2(axi00_ptr0[3]),
        .O(int_axi00_ptr0_reg01_out[3]));
  (* SOFT_HLUTNM = "soft_lutpair46" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_axi00_ptr0[40]_i_1 
       (.I0(WDATA[8]),
        .I1(WSTRB[1]),
        .I2(axi00_ptr0[40]),
        .O(int_axi00_ptr0_reg0[8]));
  (* SOFT_HLUTNM = "soft_lutpair46" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_axi00_ptr0[41]_i_1 
       (.I0(WDATA[9]),
        .I1(WSTRB[1]),
        .I2(axi00_ptr0[41]),
        .O(int_axi00_ptr0_reg0[9]));
  (* SOFT_HLUTNM = "soft_lutpair45" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_axi00_ptr0[42]_i_1 
       (.I0(WDATA[10]),
        .I1(WSTRB[1]),
        .I2(axi00_ptr0[42]),
        .O(int_axi00_ptr0_reg0[10]));
  (* SOFT_HLUTNM = "soft_lutpair45" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_axi00_ptr0[43]_i_1 
       (.I0(WDATA[11]),
        .I1(WSTRB[1]),
        .I2(axi00_ptr0[43]),
        .O(int_axi00_ptr0_reg0[11]));
  (* SOFT_HLUTNM = "soft_lutpair44" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_axi00_ptr0[44]_i_1 
       (.I0(WDATA[12]),
        .I1(WSTRB[1]),
        .I2(axi00_ptr0[44]),
        .O(int_axi00_ptr0_reg0[12]));
  (* SOFT_HLUTNM = "soft_lutpair44" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_axi00_ptr0[45]_i_1 
       (.I0(WDATA[13]),
        .I1(WSTRB[1]),
        .I2(axi00_ptr0[45]),
        .O(int_axi00_ptr0_reg0[13]));
  (* SOFT_HLUTNM = "soft_lutpair43" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_axi00_ptr0[46]_i_1 
       (.I0(WDATA[14]),
        .I1(WSTRB[1]),
        .I2(axi00_ptr0[46]),
        .O(int_axi00_ptr0_reg0[14]));
  (* SOFT_HLUTNM = "soft_lutpair43" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_axi00_ptr0[47]_i_1 
       (.I0(WDATA[15]),
        .I1(WSTRB[1]),
        .I2(axi00_ptr0[47]),
        .O(int_axi00_ptr0_reg0[15]));
  (* SOFT_HLUTNM = "soft_lutpair42" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_axi00_ptr0[48]_i_1 
       (.I0(WDATA[16]),
        .I1(WSTRB[2]),
        .I2(axi00_ptr0[48]),
        .O(int_axi00_ptr0_reg0[16]));
  (* SOFT_HLUTNM = "soft_lutpair42" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_axi00_ptr0[49]_i_1 
       (.I0(WDATA[17]),
        .I1(WSTRB[2]),
        .I2(axi00_ptr0[49]),
        .O(int_axi00_ptr0_reg0[17]));
  (* SOFT_HLUTNM = "soft_lutpair30" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_axi00_ptr0[4]_i_1 
       (.I0(WDATA[4]),
        .I1(WSTRB[0]),
        .I2(axi00_ptr0[4]),
        .O(int_axi00_ptr0_reg01_out[4]));
  (* SOFT_HLUTNM = "soft_lutpair41" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_axi00_ptr0[50]_i_1 
       (.I0(WDATA[18]),
        .I1(WSTRB[2]),
        .I2(axi00_ptr0[50]),
        .O(int_axi00_ptr0_reg0[18]));
  (* SOFT_HLUTNM = "soft_lutpair41" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_axi00_ptr0[51]_i_1 
       (.I0(WDATA[19]),
        .I1(WSTRB[2]),
        .I2(axi00_ptr0[51]),
        .O(int_axi00_ptr0_reg0[19]));
  (* SOFT_HLUTNM = "soft_lutpair40" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_axi00_ptr0[52]_i_1 
       (.I0(WDATA[20]),
        .I1(WSTRB[2]),
        .I2(axi00_ptr0[52]),
        .O(int_axi00_ptr0_reg0[20]));
  (* SOFT_HLUTNM = "soft_lutpair40" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_axi00_ptr0[53]_i_1 
       (.I0(WDATA[21]),
        .I1(WSTRB[2]),
        .I2(axi00_ptr0[53]),
        .O(int_axi00_ptr0_reg0[21]));
  (* SOFT_HLUTNM = "soft_lutpair39" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_axi00_ptr0[54]_i_1 
       (.I0(WDATA[22]),
        .I1(WSTRB[2]),
        .I2(axi00_ptr0[54]),
        .O(int_axi00_ptr0_reg0[22]));
  (* SOFT_HLUTNM = "soft_lutpair39" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_axi00_ptr0[55]_i_1 
       (.I0(WDATA[23]),
        .I1(WSTRB[2]),
        .I2(axi00_ptr0[55]),
        .O(int_axi00_ptr0_reg0[23]));
  (* SOFT_HLUTNM = "soft_lutpair38" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_axi00_ptr0[56]_i_1 
       (.I0(WDATA[24]),
        .I1(WSTRB[3]),
        .I2(axi00_ptr0[56]),
        .O(int_axi00_ptr0_reg0[24]));
  (* SOFT_HLUTNM = "soft_lutpair38" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_axi00_ptr0[57]_i_1 
       (.I0(WDATA[25]),
        .I1(WSTRB[3]),
        .I2(axi00_ptr0[57]),
        .O(int_axi00_ptr0_reg0[25]));
  (* SOFT_HLUTNM = "soft_lutpair37" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_axi00_ptr0[58]_i_1 
       (.I0(WDATA[26]),
        .I1(WSTRB[3]),
        .I2(axi00_ptr0[58]),
        .O(int_axi00_ptr0_reg0[26]));
  (* SOFT_HLUTNM = "soft_lutpair37" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_axi00_ptr0[59]_i_1 
       (.I0(WDATA[27]),
        .I1(WSTRB[3]),
        .I2(axi00_ptr0[59]),
        .O(int_axi00_ptr0_reg0[27]));
  (* SOFT_HLUTNM = "soft_lutpair29" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_axi00_ptr0[5]_i_1 
       (.I0(WDATA[5]),
        .I1(WSTRB[0]),
        .I2(axi00_ptr0[5]),
        .O(int_axi00_ptr0_reg01_out[5]));
  (* SOFT_HLUTNM = "soft_lutpair36" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_axi00_ptr0[60]_i_1 
       (.I0(WDATA[28]),
        .I1(WSTRB[3]),
        .I2(axi00_ptr0[60]),
        .O(int_axi00_ptr0_reg0[28]));
  (* SOFT_HLUTNM = "soft_lutpair36" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_axi00_ptr0[61]_i_1 
       (.I0(WDATA[29]),
        .I1(WSTRB[3]),
        .I2(axi00_ptr0[61]),
        .O(int_axi00_ptr0_reg0[29]));
  (* SOFT_HLUTNM = "soft_lutpair35" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_axi00_ptr0[62]_i_1 
       (.I0(WDATA[30]),
        .I1(WSTRB[3]),
        .I2(axi00_ptr0[62]),
        .O(int_axi00_ptr0_reg0[30]));
  LUT4 #(
    .INIT(16'h8000)) 
    \int_axi00_ptr0[63]_i_1 
       (.I0(\waddr_reg_n_0_[2] ),
        .I1(\waddr_reg_n_0_[3] ),
        .I2(\waddr_reg_n_0_[4] ),
        .I3(\int_scalar00[31]_i_3_n_0 ),
        .O(\int_axi00_ptr0[63]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair35" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_axi00_ptr0[63]_i_2 
       (.I0(WDATA[31]),
        .I1(WSTRB[3]),
        .I2(axi00_ptr0[63]),
        .O(int_axi00_ptr0_reg0[31]));
  (* SOFT_HLUTNM = "soft_lutpair28" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_axi00_ptr0[6]_i_1 
       (.I0(WDATA[6]),
        .I1(WSTRB[0]),
        .I2(axi00_ptr0[6]),
        .O(int_axi00_ptr0_reg01_out[6]));
  (* SOFT_HLUTNM = "soft_lutpair27" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_axi00_ptr0[7]_i_1 
       (.I0(WDATA[7]),
        .I1(WSTRB[0]),
        .I2(axi00_ptr0[7]),
        .O(int_axi00_ptr0_reg01_out[7]));
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_axi00_ptr0[8]_i_1 
       (.I0(WDATA[8]),
        .I1(WSTRB[1]),
        .I2(axi00_ptr0[8]),
        .O(int_axi00_ptr0_reg01_out[8]));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_axi00_ptr0[9]_i_1 
       (.I0(WDATA[9]),
        .I1(WSTRB[1]),
        .I2(axi00_ptr0[9]),
        .O(int_axi00_ptr0_reg01_out[9]));
  FDRE #(
    .INIT(1'b0)) 
    \int_axi00_ptr0_reg[0] 
       (.C(ACLK),
        .CE(int_axi00_ptr0),
        .D(int_axi00_ptr0_reg01_out[0]),
        .Q(axi00_ptr0[0]),
        .R(ARESET));
  FDRE #(
    .INIT(1'b0)) 
    \int_axi00_ptr0_reg[10] 
       (.C(ACLK),
        .CE(int_axi00_ptr0),
        .D(int_axi00_ptr0_reg01_out[10]),
        .Q(axi00_ptr0[10]),
        .R(ARESET));
  FDRE #(
    .INIT(1'b0)) 
    \int_axi00_ptr0_reg[11] 
       (.C(ACLK),
        .CE(int_axi00_ptr0),
        .D(int_axi00_ptr0_reg01_out[11]),
        .Q(axi00_ptr0[11]),
        .R(ARESET));
  FDRE #(
    .INIT(1'b0)) 
    \int_axi00_ptr0_reg[12] 
       (.C(ACLK),
        .CE(int_axi00_ptr0),
        .D(int_axi00_ptr0_reg01_out[12]),
        .Q(axi00_ptr0[12]),
        .R(ARESET));
  FDRE #(
    .INIT(1'b0)) 
    \int_axi00_ptr0_reg[13] 
       (.C(ACLK),
        .CE(int_axi00_ptr0),
        .D(int_axi00_ptr0_reg01_out[13]),
        .Q(axi00_ptr0[13]),
        .R(ARESET));
  FDRE #(
    .INIT(1'b0)) 
    \int_axi00_ptr0_reg[14] 
       (.C(ACLK),
        .CE(int_axi00_ptr0),
        .D(int_axi00_ptr0_reg01_out[14]),
        .Q(axi00_ptr0[14]),
        .R(ARESET));
  FDRE #(
    .INIT(1'b0)) 
    \int_axi00_ptr0_reg[15] 
       (.C(ACLK),
        .CE(int_axi00_ptr0),
        .D(int_axi00_ptr0_reg01_out[15]),
        .Q(axi00_ptr0[15]),
        .R(ARESET));
  FDRE #(
    .INIT(1'b0)) 
    \int_axi00_ptr0_reg[16] 
       (.C(ACLK),
        .CE(int_axi00_ptr0),
        .D(int_axi00_ptr0_reg01_out[16]),
        .Q(axi00_ptr0[16]),
        .R(ARESET));
  FDRE #(
    .INIT(1'b0)) 
    \int_axi00_ptr0_reg[17] 
       (.C(ACLK),
        .CE(int_axi00_ptr0),
        .D(int_axi00_ptr0_reg01_out[17]),
        .Q(axi00_ptr0[17]),
        .R(ARESET));
  FDRE #(
    .INIT(1'b0)) 
    \int_axi00_ptr0_reg[18] 
       (.C(ACLK),
        .CE(int_axi00_ptr0),
        .D(int_axi00_ptr0_reg01_out[18]),
        .Q(axi00_ptr0[18]),
        .R(ARESET));
  FDRE #(
    .INIT(1'b0)) 
    \int_axi00_ptr0_reg[19] 
       (.C(ACLK),
        .CE(int_axi00_ptr0),
        .D(int_axi00_ptr0_reg01_out[19]),
        .Q(axi00_ptr0[19]),
        .R(ARESET));
  FDRE #(
    .INIT(1'b0)) 
    \int_axi00_ptr0_reg[1] 
       (.C(ACLK),
        .CE(int_axi00_ptr0),
        .D(int_axi00_ptr0_reg01_out[1]),
        .Q(axi00_ptr0[1]),
        .R(ARESET));
  FDRE #(
    .INIT(1'b0)) 
    \int_axi00_ptr0_reg[20] 
       (.C(ACLK),
        .CE(int_axi00_ptr0),
        .D(int_axi00_ptr0_reg01_out[20]),
        .Q(axi00_ptr0[20]),
        .R(ARESET));
  FDRE #(
    .INIT(1'b0)) 
    \int_axi00_ptr0_reg[21] 
       (.C(ACLK),
        .CE(int_axi00_ptr0),
        .D(int_axi00_ptr0_reg01_out[21]),
        .Q(axi00_ptr0[21]),
        .R(ARESET));
  FDRE #(
    .INIT(1'b0)) 
    \int_axi00_ptr0_reg[22] 
       (.C(ACLK),
        .CE(int_axi00_ptr0),
        .D(int_axi00_ptr0_reg01_out[22]),
        .Q(axi00_ptr0[22]),
        .R(ARESET));
  FDRE #(
    .INIT(1'b0)) 
    \int_axi00_ptr0_reg[23] 
       (.C(ACLK),
        .CE(int_axi00_ptr0),
        .D(int_axi00_ptr0_reg01_out[23]),
        .Q(axi00_ptr0[23]),
        .R(ARESET));
  FDRE #(
    .INIT(1'b0)) 
    \int_axi00_ptr0_reg[24] 
       (.C(ACLK),
        .CE(int_axi00_ptr0),
        .D(int_axi00_ptr0_reg01_out[24]),
        .Q(axi00_ptr0[24]),
        .R(ARESET));
  FDRE #(
    .INIT(1'b0)) 
    \int_axi00_ptr0_reg[25] 
       (.C(ACLK),
        .CE(int_axi00_ptr0),
        .D(int_axi00_ptr0_reg01_out[25]),
        .Q(axi00_ptr0[25]),
        .R(ARESET));
  FDRE #(
    .INIT(1'b0)) 
    \int_axi00_ptr0_reg[26] 
       (.C(ACLK),
        .CE(int_axi00_ptr0),
        .D(int_axi00_ptr0_reg01_out[26]),
        .Q(axi00_ptr0[26]),
        .R(ARESET));
  FDRE #(
    .INIT(1'b0)) 
    \int_axi00_ptr0_reg[27] 
       (.C(ACLK),
        .CE(int_axi00_ptr0),
        .D(int_axi00_ptr0_reg01_out[27]),
        .Q(axi00_ptr0[27]),
        .R(ARESET));
  FDRE #(
    .INIT(1'b0)) 
    \int_axi00_ptr0_reg[28] 
       (.C(ACLK),
        .CE(int_axi00_ptr0),
        .D(int_axi00_ptr0_reg01_out[28]),
        .Q(axi00_ptr0[28]),
        .R(ARESET));
  FDRE #(
    .INIT(1'b0)) 
    \int_axi00_ptr0_reg[29] 
       (.C(ACLK),
        .CE(int_axi00_ptr0),
        .D(int_axi00_ptr0_reg01_out[29]),
        .Q(axi00_ptr0[29]),
        .R(ARESET));
  FDRE #(
    .INIT(1'b0)) 
    \int_axi00_ptr0_reg[2] 
       (.C(ACLK),
        .CE(int_axi00_ptr0),
        .D(int_axi00_ptr0_reg01_out[2]),
        .Q(axi00_ptr0[2]),
        .R(ARESET));
  FDRE #(
    .INIT(1'b0)) 
    \int_axi00_ptr0_reg[30] 
       (.C(ACLK),
        .CE(int_axi00_ptr0),
        .D(int_axi00_ptr0_reg01_out[30]),
        .Q(axi00_ptr0[30]),
        .R(ARESET));
  FDRE #(
    .INIT(1'b0)) 
    \int_axi00_ptr0_reg[31] 
       (.C(ACLK),
        .CE(int_axi00_ptr0),
        .D(int_axi00_ptr0_reg01_out[31]),
        .Q(axi00_ptr0[31]),
        .R(ARESET));
  FDRE #(
    .INIT(1'b0)) 
    \int_axi00_ptr0_reg[32] 
       (.C(ACLK),
        .CE(\int_axi00_ptr0[63]_i_1_n_0 ),
        .D(int_axi00_ptr0_reg0[0]),
        .Q(axi00_ptr0[32]),
        .R(ARESET));
  FDRE #(
    .INIT(1'b0)) 
    \int_axi00_ptr0_reg[33] 
       (.C(ACLK),
        .CE(\int_axi00_ptr0[63]_i_1_n_0 ),
        .D(int_axi00_ptr0_reg0[1]),
        .Q(axi00_ptr0[33]),
        .R(ARESET));
  FDRE #(
    .INIT(1'b0)) 
    \int_axi00_ptr0_reg[34] 
       (.C(ACLK),
        .CE(\int_axi00_ptr0[63]_i_1_n_0 ),
        .D(int_axi00_ptr0_reg0[2]),
        .Q(axi00_ptr0[34]),
        .R(ARESET));
  FDRE #(
    .INIT(1'b0)) 
    \int_axi00_ptr0_reg[35] 
       (.C(ACLK),
        .CE(\int_axi00_ptr0[63]_i_1_n_0 ),
        .D(int_axi00_ptr0_reg0[3]),
        .Q(axi00_ptr0[35]),
        .R(ARESET));
  FDRE #(
    .INIT(1'b0)) 
    \int_axi00_ptr0_reg[36] 
       (.C(ACLK),
        .CE(\int_axi00_ptr0[63]_i_1_n_0 ),
        .D(int_axi00_ptr0_reg0[4]),
        .Q(axi00_ptr0[36]),
        .R(ARESET));
  FDRE #(
    .INIT(1'b0)) 
    \int_axi00_ptr0_reg[37] 
       (.C(ACLK),
        .CE(\int_axi00_ptr0[63]_i_1_n_0 ),
        .D(int_axi00_ptr0_reg0[5]),
        .Q(axi00_ptr0[37]),
        .R(ARESET));
  FDRE #(
    .INIT(1'b0)) 
    \int_axi00_ptr0_reg[38] 
       (.C(ACLK),
        .CE(\int_axi00_ptr0[63]_i_1_n_0 ),
        .D(int_axi00_ptr0_reg0[6]),
        .Q(axi00_ptr0[38]),
        .R(ARESET));
  FDRE #(
    .INIT(1'b0)) 
    \int_axi00_ptr0_reg[39] 
       (.C(ACLK),
        .CE(\int_axi00_ptr0[63]_i_1_n_0 ),
        .D(int_axi00_ptr0_reg0[7]),
        .Q(axi00_ptr0[39]),
        .R(ARESET));
  FDRE #(
    .INIT(1'b0)) 
    \int_axi00_ptr0_reg[3] 
       (.C(ACLK),
        .CE(int_axi00_ptr0),
        .D(int_axi00_ptr0_reg01_out[3]),
        .Q(axi00_ptr0[3]),
        .R(ARESET));
  FDRE #(
    .INIT(1'b0)) 
    \int_axi00_ptr0_reg[40] 
       (.C(ACLK),
        .CE(\int_axi00_ptr0[63]_i_1_n_0 ),
        .D(int_axi00_ptr0_reg0[8]),
        .Q(axi00_ptr0[40]),
        .R(ARESET));
  FDRE #(
    .INIT(1'b0)) 
    \int_axi00_ptr0_reg[41] 
       (.C(ACLK),
        .CE(\int_axi00_ptr0[63]_i_1_n_0 ),
        .D(int_axi00_ptr0_reg0[9]),
        .Q(axi00_ptr0[41]),
        .R(ARESET));
  FDRE #(
    .INIT(1'b0)) 
    \int_axi00_ptr0_reg[42] 
       (.C(ACLK),
        .CE(\int_axi00_ptr0[63]_i_1_n_0 ),
        .D(int_axi00_ptr0_reg0[10]),
        .Q(axi00_ptr0[42]),
        .R(ARESET));
  FDRE #(
    .INIT(1'b0)) 
    \int_axi00_ptr0_reg[43] 
       (.C(ACLK),
        .CE(\int_axi00_ptr0[63]_i_1_n_0 ),
        .D(int_axi00_ptr0_reg0[11]),
        .Q(axi00_ptr0[43]),
        .R(ARESET));
  FDRE #(
    .INIT(1'b0)) 
    \int_axi00_ptr0_reg[44] 
       (.C(ACLK),
        .CE(\int_axi00_ptr0[63]_i_1_n_0 ),
        .D(int_axi00_ptr0_reg0[12]),
        .Q(axi00_ptr0[44]),
        .R(ARESET));
  FDRE #(
    .INIT(1'b0)) 
    \int_axi00_ptr0_reg[45] 
       (.C(ACLK),
        .CE(\int_axi00_ptr0[63]_i_1_n_0 ),
        .D(int_axi00_ptr0_reg0[13]),
        .Q(axi00_ptr0[45]),
        .R(ARESET));
  FDRE #(
    .INIT(1'b0)) 
    \int_axi00_ptr0_reg[46] 
       (.C(ACLK),
        .CE(\int_axi00_ptr0[63]_i_1_n_0 ),
        .D(int_axi00_ptr0_reg0[14]),
        .Q(axi00_ptr0[46]),
        .R(ARESET));
  FDRE #(
    .INIT(1'b0)) 
    \int_axi00_ptr0_reg[47] 
       (.C(ACLK),
        .CE(\int_axi00_ptr0[63]_i_1_n_0 ),
        .D(int_axi00_ptr0_reg0[15]),
        .Q(axi00_ptr0[47]),
        .R(ARESET));
  FDRE #(
    .INIT(1'b0)) 
    \int_axi00_ptr0_reg[48] 
       (.C(ACLK),
        .CE(\int_axi00_ptr0[63]_i_1_n_0 ),
        .D(int_axi00_ptr0_reg0[16]),
        .Q(axi00_ptr0[48]),
        .R(ARESET));
  FDRE #(
    .INIT(1'b0)) 
    \int_axi00_ptr0_reg[49] 
       (.C(ACLK),
        .CE(\int_axi00_ptr0[63]_i_1_n_0 ),
        .D(int_axi00_ptr0_reg0[17]),
        .Q(axi00_ptr0[49]),
        .R(ARESET));
  FDRE #(
    .INIT(1'b0)) 
    \int_axi00_ptr0_reg[4] 
       (.C(ACLK),
        .CE(int_axi00_ptr0),
        .D(int_axi00_ptr0_reg01_out[4]),
        .Q(axi00_ptr0[4]),
        .R(ARESET));
  FDRE #(
    .INIT(1'b0)) 
    \int_axi00_ptr0_reg[50] 
       (.C(ACLK),
        .CE(\int_axi00_ptr0[63]_i_1_n_0 ),
        .D(int_axi00_ptr0_reg0[18]),
        .Q(axi00_ptr0[50]),
        .R(ARESET));
  FDRE #(
    .INIT(1'b0)) 
    \int_axi00_ptr0_reg[51] 
       (.C(ACLK),
        .CE(\int_axi00_ptr0[63]_i_1_n_0 ),
        .D(int_axi00_ptr0_reg0[19]),
        .Q(axi00_ptr0[51]),
        .R(ARESET));
  FDRE #(
    .INIT(1'b0)) 
    \int_axi00_ptr0_reg[52] 
       (.C(ACLK),
        .CE(\int_axi00_ptr0[63]_i_1_n_0 ),
        .D(int_axi00_ptr0_reg0[20]),
        .Q(axi00_ptr0[52]),
        .R(ARESET));
  FDRE #(
    .INIT(1'b0)) 
    \int_axi00_ptr0_reg[53] 
       (.C(ACLK),
        .CE(\int_axi00_ptr0[63]_i_1_n_0 ),
        .D(int_axi00_ptr0_reg0[21]),
        .Q(axi00_ptr0[53]),
        .R(ARESET));
  FDRE #(
    .INIT(1'b0)) 
    \int_axi00_ptr0_reg[54] 
       (.C(ACLK),
        .CE(\int_axi00_ptr0[63]_i_1_n_0 ),
        .D(int_axi00_ptr0_reg0[22]),
        .Q(axi00_ptr0[54]),
        .R(ARESET));
  FDRE #(
    .INIT(1'b0)) 
    \int_axi00_ptr0_reg[55] 
       (.C(ACLK),
        .CE(\int_axi00_ptr0[63]_i_1_n_0 ),
        .D(int_axi00_ptr0_reg0[23]),
        .Q(axi00_ptr0[55]),
        .R(ARESET));
  FDRE #(
    .INIT(1'b0)) 
    \int_axi00_ptr0_reg[56] 
       (.C(ACLK),
        .CE(\int_axi00_ptr0[63]_i_1_n_0 ),
        .D(int_axi00_ptr0_reg0[24]),
        .Q(axi00_ptr0[56]),
        .R(ARESET));
  FDRE #(
    .INIT(1'b0)) 
    \int_axi00_ptr0_reg[57] 
       (.C(ACLK),
        .CE(\int_axi00_ptr0[63]_i_1_n_0 ),
        .D(int_axi00_ptr0_reg0[25]),
        .Q(axi00_ptr0[57]),
        .R(ARESET));
  FDRE #(
    .INIT(1'b0)) 
    \int_axi00_ptr0_reg[58] 
       (.C(ACLK),
        .CE(\int_axi00_ptr0[63]_i_1_n_0 ),
        .D(int_axi00_ptr0_reg0[26]),
        .Q(axi00_ptr0[58]),
        .R(ARESET));
  FDRE #(
    .INIT(1'b0)) 
    \int_axi00_ptr0_reg[59] 
       (.C(ACLK),
        .CE(\int_axi00_ptr0[63]_i_1_n_0 ),
        .D(int_axi00_ptr0_reg0[27]),
        .Q(axi00_ptr0[59]),
        .R(ARESET));
  FDRE #(
    .INIT(1'b0)) 
    \int_axi00_ptr0_reg[5] 
       (.C(ACLK),
        .CE(int_axi00_ptr0),
        .D(int_axi00_ptr0_reg01_out[5]),
        .Q(axi00_ptr0[5]),
        .R(ARESET));
  FDRE #(
    .INIT(1'b0)) 
    \int_axi00_ptr0_reg[60] 
       (.C(ACLK),
        .CE(\int_axi00_ptr0[63]_i_1_n_0 ),
        .D(int_axi00_ptr0_reg0[28]),
        .Q(axi00_ptr0[60]),
        .R(ARESET));
  FDRE #(
    .INIT(1'b0)) 
    \int_axi00_ptr0_reg[61] 
       (.C(ACLK),
        .CE(\int_axi00_ptr0[63]_i_1_n_0 ),
        .D(int_axi00_ptr0_reg0[29]),
        .Q(axi00_ptr0[61]),
        .R(ARESET));
  FDRE #(
    .INIT(1'b0)) 
    \int_axi00_ptr0_reg[62] 
       (.C(ACLK),
        .CE(\int_axi00_ptr0[63]_i_1_n_0 ),
        .D(int_axi00_ptr0_reg0[30]),
        .Q(axi00_ptr0[62]),
        .R(ARESET));
  FDRE #(
    .INIT(1'b0)) 
    \int_axi00_ptr0_reg[63] 
       (.C(ACLK),
        .CE(\int_axi00_ptr0[63]_i_1_n_0 ),
        .D(int_axi00_ptr0_reg0[31]),
        .Q(axi00_ptr0[63]),
        .R(ARESET));
  FDRE #(
    .INIT(1'b0)) 
    \int_axi00_ptr0_reg[6] 
       (.C(ACLK),
        .CE(int_axi00_ptr0),
        .D(int_axi00_ptr0_reg01_out[6]),
        .Q(axi00_ptr0[6]),
        .R(ARESET));
  FDRE #(
    .INIT(1'b0)) 
    \int_axi00_ptr0_reg[7] 
       (.C(ACLK),
        .CE(int_axi00_ptr0),
        .D(int_axi00_ptr0_reg01_out[7]),
        .Q(axi00_ptr0[7]),
        .R(ARESET));
  FDRE #(
    .INIT(1'b0)) 
    \int_axi00_ptr0_reg[8] 
       (.C(ACLK),
        .CE(int_axi00_ptr0),
        .D(int_axi00_ptr0_reg01_out[8]),
        .Q(axi00_ptr0[8]),
        .R(ARESET));
  FDRE #(
    .INIT(1'b0)) 
    \int_axi00_ptr0_reg[9] 
       (.C(ACLK),
        .CE(int_axi00_ptr0),
        .D(int_axi00_ptr0_reg01_out[9]),
        .Q(axi00_ptr0[9]),
        .R(ARESET));
  LUT6 #(
    .INIT(64'hFFBFFFFF00800000)) 
    int_gie_i_1
       (.I0(WDATA[0]),
        .I1(int_gie_i_2_n_0),
        .I2(\waddr_reg_n_0_[2] ),
        .I3(\waddr_reg_n_0_[3] ),
        .I4(\int_scalar00[31]_i_3_n_0 ),
        .I5(int_gie_reg_n_0),
        .O(int_gie_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT2 #(
    .INIT(4'h2)) 
    int_gie_i_2
       (.I0(WSTRB[0]),
        .I1(\waddr_reg_n_0_[4] ),
        .O(int_gie_i_2_n_0));
  FDRE #(
    .INIT(1'b0)) 
    int_gie_reg
       (.C(ACLK),
        .CE(1'b1),
        .D(int_gie_i_1_n_0),
        .Q(int_gie_reg_n_0),
        .R(ARESET));
  LUT5 #(
    .INIT(32'h00080000)) 
    \int_ier[1]_i_1 
       (.I0(\waddr_reg_n_0_[3] ),
        .I1(WSTRB[0]),
        .I2(\waddr_reg_n_0_[4] ),
        .I3(\waddr_reg_n_0_[2] ),
        .I4(\int_scalar00[31]_i_3_n_0 ),
        .O(int_ier9_out));
  FDRE #(
    .INIT(1'b0)) 
    \int_ier_reg[0] 
       (.C(ACLK),
        .CE(int_ier9_out),
        .D(WDATA[0]),
        .Q(\int_ier_reg_n_0_[0] ),
        .R(ARESET));
  FDRE #(
    .INIT(1'b0)) 
    \int_ier_reg[1] 
       (.C(ACLK),
        .CE(int_ier9_out),
        .D(WDATA[1]),
        .Q(p_0_in_0),
        .R(ARESET));
  LUT6 #(
    .INIT(64'hF7777777F8888888)) 
    \int_isr[0]_i_1 
       (.I0(WDATA[0]),
        .I1(int_isr6_out),
        .I2(\int_ier_reg_n_0_[0] ),
        .I3(ap_done),
        .I4(ACLK_EN),
        .I5(\int_isr_reg_n_0_[0] ),
        .O(\int_isr[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h20000000)) 
    \int_isr[0]_i_2 
       (.I0(WSTRB[0]),
        .I1(\waddr_reg_n_0_[4] ),
        .I2(\waddr_reg_n_0_[2] ),
        .I3(\waddr_reg_n_0_[3] ),
        .I4(\int_scalar00[31]_i_3_n_0 ),
        .O(int_isr6_out));
  LUT6 #(
    .INIT(64'hF7777777F8888888)) 
    \int_isr[1]_i_1 
       (.I0(WDATA[1]),
        .I1(int_isr6_out),
        .I2(p_0_in_0),
        .I3(ap_ready),
        .I4(ACLK_EN),
        .I5(p_1_in),
        .O(\int_isr[1]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \int_isr_reg[0] 
       (.C(ACLK),
        .CE(1'b1),
        .D(\int_isr[0]_i_1_n_0 ),
        .Q(\int_isr_reg_n_0_[0] ),
        .R(ARESET));
  FDRE #(
    .INIT(1'b0)) 
    \int_isr_reg[1] 
       (.C(ACLK),
        .CE(1'b1),
        .D(\int_isr[1]_i_1_n_0 ),
        .Q(p_1_in),
        .R(ARESET));
  (* SOFT_HLUTNM = "soft_lutpair34" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_scalar00[0]_i_1 
       (.I0(WDATA[0]),
        .I1(WSTRB[0]),
        .I2(scalar00[0]),
        .O(int_scalar000[0]));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_scalar00[10]_i_1 
       (.I0(WDATA[10]),
        .I1(WSTRB[1]),
        .I2(scalar00[10]),
        .O(int_scalar000[10]));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_scalar00[11]_i_1 
       (.I0(WDATA[11]),
        .I1(WSTRB[1]),
        .I2(scalar00[11]),
        .O(int_scalar000[11]));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_scalar00[12]_i_1 
       (.I0(WDATA[12]),
        .I1(WSTRB[1]),
        .I2(scalar00[12]),
        .O(int_scalar000[12]));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_scalar00[13]_i_1 
       (.I0(WDATA[13]),
        .I1(WSTRB[1]),
        .I2(scalar00[13]),
        .O(int_scalar000[13]));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_scalar00[14]_i_1 
       (.I0(WDATA[14]),
        .I1(WSTRB[1]),
        .I2(scalar00[14]),
        .O(int_scalar000[14]));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_scalar00[15]_i_1 
       (.I0(WDATA[15]),
        .I1(WSTRB[1]),
        .I2(scalar00[15]),
        .O(int_scalar000[15]));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_scalar00[16]_i_1 
       (.I0(WDATA[16]),
        .I1(WSTRB[2]),
        .I2(scalar00[16]),
        .O(int_scalar000[16]));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_scalar00[17]_i_1 
       (.I0(WDATA[17]),
        .I1(WSTRB[2]),
        .I2(scalar00[17]),
        .O(int_scalar000[17]));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_scalar00[18]_i_1 
       (.I0(WDATA[18]),
        .I1(WSTRB[2]),
        .I2(scalar00[18]),
        .O(int_scalar000[18]));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_scalar00[19]_i_1 
       (.I0(WDATA[19]),
        .I1(WSTRB[2]),
        .I2(scalar00[19]),
        .O(int_scalar000[19]));
  (* SOFT_HLUTNM = "soft_lutpair33" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_scalar00[1]_i_1 
       (.I0(WDATA[1]),
        .I1(WSTRB[0]),
        .I2(scalar00[1]),
        .O(int_scalar000[1]));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_scalar00[20]_i_1 
       (.I0(WDATA[20]),
        .I1(WSTRB[2]),
        .I2(scalar00[20]),
        .O(int_scalar000[20]));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_scalar00[21]_i_1 
       (.I0(WDATA[21]),
        .I1(WSTRB[2]),
        .I2(scalar00[21]),
        .O(int_scalar000[21]));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_scalar00[22]_i_1 
       (.I0(WDATA[22]),
        .I1(WSTRB[2]),
        .I2(scalar00[22]),
        .O(int_scalar000[22]));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_scalar00[23]_i_1 
       (.I0(WDATA[23]),
        .I1(WSTRB[2]),
        .I2(scalar00[23]),
        .O(int_scalar000[23]));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_scalar00[24]_i_1 
       (.I0(WDATA[24]),
        .I1(WSTRB[3]),
        .I2(scalar00[24]),
        .O(int_scalar000[24]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_scalar00[25]_i_1 
       (.I0(WDATA[25]),
        .I1(WSTRB[3]),
        .I2(scalar00[25]),
        .O(int_scalar000[25]));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_scalar00[26]_i_1 
       (.I0(WDATA[26]),
        .I1(WSTRB[3]),
        .I2(scalar00[26]),
        .O(int_scalar000[26]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_scalar00[27]_i_1 
       (.I0(WDATA[27]),
        .I1(WSTRB[3]),
        .I2(scalar00[27]),
        .O(int_scalar000[27]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_scalar00[28]_i_1 
       (.I0(WDATA[28]),
        .I1(WSTRB[3]),
        .I2(scalar00[28]),
        .O(int_scalar000[28]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_scalar00[29]_i_1 
       (.I0(WDATA[29]),
        .I1(WSTRB[3]),
        .I2(scalar00[29]),
        .O(int_scalar000[29]));
  (* SOFT_HLUTNM = "soft_lutpair32" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_scalar00[2]_i_1 
       (.I0(WDATA[2]),
        .I1(WSTRB[0]),
        .I2(scalar00[2]),
        .O(int_scalar000[2]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_scalar00[30]_i_1 
       (.I0(WDATA[30]),
        .I1(WSTRB[3]),
        .I2(scalar00[30]),
        .O(int_scalar000[30]));
  LUT4 #(
    .INIT(16'h0400)) 
    \int_scalar00[31]_i_1 
       (.I0(\waddr_reg_n_0_[3] ),
        .I1(\waddr_reg_n_0_[4] ),
        .I2(\waddr_reg_n_0_[2] ),
        .I3(\int_scalar00[31]_i_3_n_0 ),
        .O(int_scalar00));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_scalar00[31]_i_2 
       (.I0(WDATA[31]),
        .I1(WSTRB[3]),
        .I2(scalar00[31]),
        .O(int_scalar000[31]));
  LUT6 #(
    .INIT(64'h0010000000000000)) 
    \int_scalar00[31]_i_3 
       (.I0(\waddr_reg_n_0_[0] ),
        .I1(\waddr_reg_n_0_[1] ),
        .I2(ACLK_EN),
        .I3(\waddr_reg_n_0_[5] ),
        .I4(WVALID),
        .I5(WREADY),
        .O(\int_scalar00[31]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair31" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_scalar00[3]_i_1 
       (.I0(WDATA[3]),
        .I1(WSTRB[0]),
        .I2(scalar00[3]),
        .O(int_scalar000[3]));
  (* SOFT_HLUTNM = "soft_lutpair30" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_scalar00[4]_i_1 
       (.I0(WDATA[4]),
        .I1(WSTRB[0]),
        .I2(scalar00[4]),
        .O(int_scalar000[4]));
  (* SOFT_HLUTNM = "soft_lutpair29" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_scalar00[5]_i_1 
       (.I0(WDATA[5]),
        .I1(WSTRB[0]),
        .I2(scalar00[5]),
        .O(int_scalar000[5]));
  (* SOFT_HLUTNM = "soft_lutpair28" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_scalar00[6]_i_1 
       (.I0(WDATA[6]),
        .I1(WSTRB[0]),
        .I2(scalar00[6]),
        .O(int_scalar000[6]));
  (* SOFT_HLUTNM = "soft_lutpair27" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_scalar00[7]_i_1 
       (.I0(WDATA[7]),
        .I1(WSTRB[0]),
        .I2(scalar00[7]),
        .O(int_scalar000[7]));
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_scalar00[8]_i_1 
       (.I0(WDATA[8]),
        .I1(WSTRB[1]),
        .I2(scalar00[8]),
        .O(int_scalar000[8]));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \int_scalar00[9]_i_1 
       (.I0(WDATA[9]),
        .I1(WSTRB[1]),
        .I2(scalar00[9]),
        .O(int_scalar000[9]));
  FDRE #(
    .INIT(1'b0)) 
    \int_scalar00_reg[0] 
       (.C(ACLK),
        .CE(int_scalar00),
        .D(int_scalar000[0]),
        .Q(scalar00[0]),
        .R(ARESET));
  FDRE #(
    .INIT(1'b0)) 
    \int_scalar00_reg[10] 
       (.C(ACLK),
        .CE(int_scalar00),
        .D(int_scalar000[10]),
        .Q(scalar00[10]),
        .R(ARESET));
  FDRE #(
    .INIT(1'b0)) 
    \int_scalar00_reg[11] 
       (.C(ACLK),
        .CE(int_scalar00),
        .D(int_scalar000[11]),
        .Q(scalar00[11]),
        .R(ARESET));
  FDRE #(
    .INIT(1'b0)) 
    \int_scalar00_reg[12] 
       (.C(ACLK),
        .CE(int_scalar00),
        .D(int_scalar000[12]),
        .Q(scalar00[12]),
        .R(ARESET));
  FDRE #(
    .INIT(1'b0)) 
    \int_scalar00_reg[13] 
       (.C(ACLK),
        .CE(int_scalar00),
        .D(int_scalar000[13]),
        .Q(scalar00[13]),
        .R(ARESET));
  FDRE #(
    .INIT(1'b0)) 
    \int_scalar00_reg[14] 
       (.C(ACLK),
        .CE(int_scalar00),
        .D(int_scalar000[14]),
        .Q(scalar00[14]),
        .R(ARESET));
  FDRE #(
    .INIT(1'b0)) 
    \int_scalar00_reg[15] 
       (.C(ACLK),
        .CE(int_scalar00),
        .D(int_scalar000[15]),
        .Q(scalar00[15]),
        .R(ARESET));
  FDRE #(
    .INIT(1'b0)) 
    \int_scalar00_reg[16] 
       (.C(ACLK),
        .CE(int_scalar00),
        .D(int_scalar000[16]),
        .Q(scalar00[16]),
        .R(ARESET));
  FDRE #(
    .INIT(1'b0)) 
    \int_scalar00_reg[17] 
       (.C(ACLK),
        .CE(int_scalar00),
        .D(int_scalar000[17]),
        .Q(scalar00[17]),
        .R(ARESET));
  FDRE #(
    .INIT(1'b0)) 
    \int_scalar00_reg[18] 
       (.C(ACLK),
        .CE(int_scalar00),
        .D(int_scalar000[18]),
        .Q(scalar00[18]),
        .R(ARESET));
  FDRE #(
    .INIT(1'b0)) 
    \int_scalar00_reg[19] 
       (.C(ACLK),
        .CE(int_scalar00),
        .D(int_scalar000[19]),
        .Q(scalar00[19]),
        .R(ARESET));
  FDRE #(
    .INIT(1'b0)) 
    \int_scalar00_reg[1] 
       (.C(ACLK),
        .CE(int_scalar00),
        .D(int_scalar000[1]),
        .Q(scalar00[1]),
        .R(ARESET));
  FDRE #(
    .INIT(1'b0)) 
    \int_scalar00_reg[20] 
       (.C(ACLK),
        .CE(int_scalar00),
        .D(int_scalar000[20]),
        .Q(scalar00[20]),
        .R(ARESET));
  FDRE #(
    .INIT(1'b0)) 
    \int_scalar00_reg[21] 
       (.C(ACLK),
        .CE(int_scalar00),
        .D(int_scalar000[21]),
        .Q(scalar00[21]),
        .R(ARESET));
  FDRE #(
    .INIT(1'b0)) 
    \int_scalar00_reg[22] 
       (.C(ACLK),
        .CE(int_scalar00),
        .D(int_scalar000[22]),
        .Q(scalar00[22]),
        .R(ARESET));
  FDRE #(
    .INIT(1'b0)) 
    \int_scalar00_reg[23] 
       (.C(ACLK),
        .CE(int_scalar00),
        .D(int_scalar000[23]),
        .Q(scalar00[23]),
        .R(ARESET));
  FDRE #(
    .INIT(1'b0)) 
    \int_scalar00_reg[24] 
       (.C(ACLK),
        .CE(int_scalar00),
        .D(int_scalar000[24]),
        .Q(scalar00[24]),
        .R(ARESET));
  FDRE #(
    .INIT(1'b0)) 
    \int_scalar00_reg[25] 
       (.C(ACLK),
        .CE(int_scalar00),
        .D(int_scalar000[25]),
        .Q(scalar00[25]),
        .R(ARESET));
  FDRE #(
    .INIT(1'b0)) 
    \int_scalar00_reg[26] 
       (.C(ACLK),
        .CE(int_scalar00),
        .D(int_scalar000[26]),
        .Q(scalar00[26]),
        .R(ARESET));
  FDRE #(
    .INIT(1'b0)) 
    \int_scalar00_reg[27] 
       (.C(ACLK),
        .CE(int_scalar00),
        .D(int_scalar000[27]),
        .Q(scalar00[27]),
        .R(ARESET));
  FDRE #(
    .INIT(1'b0)) 
    \int_scalar00_reg[28] 
       (.C(ACLK),
        .CE(int_scalar00),
        .D(int_scalar000[28]),
        .Q(scalar00[28]),
        .R(ARESET));
  FDRE #(
    .INIT(1'b0)) 
    \int_scalar00_reg[29] 
       (.C(ACLK),
        .CE(int_scalar00),
        .D(int_scalar000[29]),
        .Q(scalar00[29]),
        .R(ARESET));
  FDRE #(
    .INIT(1'b0)) 
    \int_scalar00_reg[2] 
       (.C(ACLK),
        .CE(int_scalar00),
        .D(int_scalar000[2]),
        .Q(scalar00[2]),
        .R(ARESET));
  FDRE #(
    .INIT(1'b0)) 
    \int_scalar00_reg[30] 
       (.C(ACLK),
        .CE(int_scalar00),
        .D(int_scalar000[30]),
        .Q(scalar00[30]),
        .R(ARESET));
  FDRE #(
    .INIT(1'b0)) 
    \int_scalar00_reg[31] 
       (.C(ACLK),
        .CE(int_scalar00),
        .D(int_scalar000[31]),
        .Q(scalar00[31]),
        .R(ARESET));
  FDRE #(
    .INIT(1'b0)) 
    \int_scalar00_reg[3] 
       (.C(ACLK),
        .CE(int_scalar00),
        .D(int_scalar000[3]),
        .Q(scalar00[3]),
        .R(ARESET));
  FDRE #(
    .INIT(1'b0)) 
    \int_scalar00_reg[4] 
       (.C(ACLK),
        .CE(int_scalar00),
        .D(int_scalar000[4]),
        .Q(scalar00[4]),
        .R(ARESET));
  FDRE #(
    .INIT(1'b0)) 
    \int_scalar00_reg[5] 
       (.C(ACLK),
        .CE(int_scalar00),
        .D(int_scalar000[5]),
        .Q(scalar00[5]),
        .R(ARESET));
  FDRE #(
    .INIT(1'b0)) 
    \int_scalar00_reg[6] 
       (.C(ACLK),
        .CE(int_scalar00),
        .D(int_scalar000[6]),
        .Q(scalar00[6]),
        .R(ARESET));
  FDRE #(
    .INIT(1'b0)) 
    \int_scalar00_reg[7] 
       (.C(ACLK),
        .CE(int_scalar00),
        .D(int_scalar000[7]),
        .Q(scalar00[7]),
        .R(ARESET));
  FDRE #(
    .INIT(1'b0)) 
    \int_scalar00_reg[8] 
       (.C(ACLK),
        .CE(int_scalar00),
        .D(int_scalar000[8]),
        .Q(scalar00[8]),
        .R(ARESET));
  FDRE #(
    .INIT(1'b0)) 
    \int_scalar00_reg[9] 
       (.C(ACLK),
        .CE(int_scalar00),
        .D(int_scalar000[9]),
        .Q(scalar00[9]),
        .R(ARESET));
  LUT3 #(
    .INIT(8'hE0)) 
    interrupt_INST_0
       (.I0(\int_isr_reg_n_0_[0] ),
        .I1(p_1_in),
        .I2(int_gie_reg_n_0),
        .O(interrupt));
  LUT4 #(
    .INIT(16'hFFEA)) 
    \rdata[0]_i_1 
       (.I0(\rdata[0]_i_2_n_0 ),
        .I1(\rdata[0]_i_3_n_0 ),
        .I2(ap_start),
        .I3(\rdata[0]_i_4_n_0 ),
        .O(p_0_in[0]));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \rdata[0]_i_2 
       (.I0(\rdata[31]_i_3_n_0 ),
        .I1(scalar00[0]),
        .I2(\rdata[31]_i_4_n_0 ),
        .I3(axi00_ptr0[0]),
        .I4(axi00_ptr0[32]),
        .I5(\rdata[31]_i_5_n_0 ),
        .O(\rdata[0]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000000001)) 
    \rdata[0]_i_3 
       (.I0(ARADDR[2]),
        .I1(ARADDR[5]),
        .I2(ARADDR[0]),
        .I3(ARADDR[1]),
        .I4(ARADDR[4]),
        .I5(ARADDR[3]),
        .O(\rdata[0]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hEEC0000022C00000)) 
    \rdata[0]_i_4 
       (.I0(\int_ier_reg_n_0_[0] ),
        .I1(ARADDR[2]),
        .I2(int_gie_reg_n_0),
        .I3(ARADDR[3]),
        .I4(\rdata[1]_i_4_n_0 ),
        .I5(\int_isr_reg_n_0_[0] ),
        .O(\rdata[0]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \rdata[10]_i_1 
       (.I0(\rdata[31]_i_3_n_0 ),
        .I1(scalar00[10]),
        .I2(\rdata[31]_i_4_n_0 ),
        .I3(axi00_ptr0[10]),
        .I4(axi00_ptr0[42]),
        .I5(\rdata[31]_i_5_n_0 ),
        .O(p_0_in[10]));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \rdata[11]_i_1 
       (.I0(\rdata[31]_i_3_n_0 ),
        .I1(scalar00[11]),
        .I2(\rdata[31]_i_4_n_0 ),
        .I3(axi00_ptr0[11]),
        .I4(axi00_ptr0[43]),
        .I5(\rdata[31]_i_5_n_0 ),
        .O(p_0_in[11]));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \rdata[12]_i_1 
       (.I0(\rdata[31]_i_3_n_0 ),
        .I1(scalar00[12]),
        .I2(\rdata[31]_i_4_n_0 ),
        .I3(axi00_ptr0[12]),
        .I4(axi00_ptr0[44]),
        .I5(\rdata[31]_i_5_n_0 ),
        .O(p_0_in[12]));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \rdata[13]_i_1 
       (.I0(\rdata[31]_i_3_n_0 ),
        .I1(scalar00[13]),
        .I2(\rdata[31]_i_4_n_0 ),
        .I3(axi00_ptr0[13]),
        .I4(axi00_ptr0[45]),
        .I5(\rdata[31]_i_5_n_0 ),
        .O(p_0_in[13]));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \rdata[14]_i_1 
       (.I0(\rdata[31]_i_3_n_0 ),
        .I1(scalar00[14]),
        .I2(\rdata[31]_i_4_n_0 ),
        .I3(axi00_ptr0[14]),
        .I4(axi00_ptr0[46]),
        .I5(\rdata[31]_i_5_n_0 ),
        .O(p_0_in[14]));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \rdata[15]_i_1 
       (.I0(\rdata[31]_i_3_n_0 ),
        .I1(scalar00[15]),
        .I2(\rdata[31]_i_4_n_0 ),
        .I3(axi00_ptr0[15]),
        .I4(axi00_ptr0[47]),
        .I5(\rdata[31]_i_5_n_0 ),
        .O(p_0_in[15]));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \rdata[16]_i_1 
       (.I0(\rdata[31]_i_3_n_0 ),
        .I1(scalar00[16]),
        .I2(\rdata[31]_i_4_n_0 ),
        .I3(axi00_ptr0[16]),
        .I4(axi00_ptr0[48]),
        .I5(\rdata[31]_i_5_n_0 ),
        .O(p_0_in[16]));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \rdata[17]_i_1 
       (.I0(\rdata[31]_i_3_n_0 ),
        .I1(scalar00[17]),
        .I2(\rdata[31]_i_4_n_0 ),
        .I3(axi00_ptr0[17]),
        .I4(axi00_ptr0[49]),
        .I5(\rdata[31]_i_5_n_0 ),
        .O(p_0_in[17]));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \rdata[18]_i_1 
       (.I0(\rdata[31]_i_3_n_0 ),
        .I1(scalar00[18]),
        .I2(\rdata[31]_i_4_n_0 ),
        .I3(axi00_ptr0[18]),
        .I4(axi00_ptr0[50]),
        .I5(\rdata[31]_i_5_n_0 ),
        .O(p_0_in[18]));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \rdata[19]_i_1 
       (.I0(\rdata[31]_i_3_n_0 ),
        .I1(scalar00[19]),
        .I2(\rdata[31]_i_4_n_0 ),
        .I3(axi00_ptr0[19]),
        .I4(axi00_ptr0[51]),
        .I5(\rdata[31]_i_5_n_0 ),
        .O(p_0_in[19]));
  LUT4 #(
    .INIT(16'hFFEA)) 
    \rdata[1]_i_1 
       (.I0(\rdata[1]_i_2_n_0 ),
        .I1(\rdata[31]_i_5_n_0 ),
        .I2(axi00_ptr0[33]),
        .I3(\rdata[1]_i_3_n_0 ),
        .O(p_0_in[1]));
  LUT5 #(
    .INIT(32'hC0800080)) 
    \rdata[1]_i_2 
       (.I0(p_0_in_0),
        .I1(\rdata[1]_i_4_n_0 ),
        .I2(ARADDR[3]),
        .I3(ARADDR[2]),
        .I4(p_1_in),
        .O(\rdata[1]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \rdata[1]_i_3 
       (.I0(\rdata[0]_i_3_n_0 ),
        .I1(data0[1]),
        .I2(\rdata[31]_i_3_n_0 ),
        .I3(scalar00[1]),
        .I4(axi00_ptr0[1]),
        .I5(\rdata[31]_i_4_n_0 ),
        .O(\rdata[1]_i_3_n_0 ));
  LUT4 #(
    .INIT(16'h0001)) 
    \rdata[1]_i_4 
       (.I0(ARADDR[5]),
        .I1(ARADDR[0]),
        .I2(ARADDR[1]),
        .I3(ARADDR[4]),
        .O(\rdata[1]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \rdata[20]_i_1 
       (.I0(\rdata[31]_i_3_n_0 ),
        .I1(scalar00[20]),
        .I2(\rdata[31]_i_4_n_0 ),
        .I3(axi00_ptr0[20]),
        .I4(axi00_ptr0[52]),
        .I5(\rdata[31]_i_5_n_0 ),
        .O(p_0_in[20]));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \rdata[21]_i_1 
       (.I0(\rdata[31]_i_3_n_0 ),
        .I1(scalar00[21]),
        .I2(\rdata[31]_i_4_n_0 ),
        .I3(axi00_ptr0[21]),
        .I4(axi00_ptr0[53]),
        .I5(\rdata[31]_i_5_n_0 ),
        .O(p_0_in[21]));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \rdata[22]_i_1 
       (.I0(\rdata[31]_i_3_n_0 ),
        .I1(scalar00[22]),
        .I2(\rdata[31]_i_4_n_0 ),
        .I3(axi00_ptr0[22]),
        .I4(axi00_ptr0[54]),
        .I5(\rdata[31]_i_5_n_0 ),
        .O(p_0_in[22]));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \rdata[23]_i_1 
       (.I0(\rdata[31]_i_3_n_0 ),
        .I1(scalar00[23]),
        .I2(\rdata[31]_i_4_n_0 ),
        .I3(axi00_ptr0[23]),
        .I4(axi00_ptr0[55]),
        .I5(\rdata[31]_i_5_n_0 ),
        .O(p_0_in[23]));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \rdata[24]_i_1 
       (.I0(\rdata[31]_i_3_n_0 ),
        .I1(scalar00[24]),
        .I2(\rdata[31]_i_4_n_0 ),
        .I3(axi00_ptr0[24]),
        .I4(axi00_ptr0[56]),
        .I5(\rdata[31]_i_5_n_0 ),
        .O(p_0_in[24]));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \rdata[25]_i_1 
       (.I0(\rdata[31]_i_3_n_0 ),
        .I1(scalar00[25]),
        .I2(\rdata[31]_i_4_n_0 ),
        .I3(axi00_ptr0[25]),
        .I4(axi00_ptr0[57]),
        .I5(\rdata[31]_i_5_n_0 ),
        .O(p_0_in[25]));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \rdata[26]_i_1 
       (.I0(\rdata[31]_i_3_n_0 ),
        .I1(scalar00[26]),
        .I2(\rdata[31]_i_4_n_0 ),
        .I3(axi00_ptr0[26]),
        .I4(axi00_ptr0[58]),
        .I5(\rdata[31]_i_5_n_0 ),
        .O(p_0_in[26]));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \rdata[27]_i_1 
       (.I0(\rdata[31]_i_3_n_0 ),
        .I1(scalar00[27]),
        .I2(\rdata[31]_i_4_n_0 ),
        .I3(axi00_ptr0[27]),
        .I4(axi00_ptr0[59]),
        .I5(\rdata[31]_i_5_n_0 ),
        .O(p_0_in[27]));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \rdata[28]_i_1 
       (.I0(\rdata[31]_i_3_n_0 ),
        .I1(scalar00[28]),
        .I2(\rdata[31]_i_4_n_0 ),
        .I3(axi00_ptr0[28]),
        .I4(axi00_ptr0[60]),
        .I5(\rdata[31]_i_5_n_0 ),
        .O(p_0_in[28]));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \rdata[29]_i_1 
       (.I0(\rdata[31]_i_3_n_0 ),
        .I1(scalar00[29]),
        .I2(\rdata[31]_i_4_n_0 ),
        .I3(axi00_ptr0[29]),
        .I4(axi00_ptr0[61]),
        .I5(\rdata[31]_i_5_n_0 ),
        .O(p_0_in[29]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT3 #(
    .INIT(8'hF8)) 
    \rdata[2]_i_1 
       (.I0(axi00_ptr0[34]),
        .I1(\rdata[31]_i_5_n_0 ),
        .I2(\rdata[2]_i_2_n_0 ),
        .O(p_0_in[2]));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \rdata[2]_i_2 
       (.I0(\rdata[0]_i_3_n_0 ),
        .I1(data0[2]),
        .I2(\rdata[31]_i_3_n_0 ),
        .I3(scalar00[2]),
        .I4(axi00_ptr0[2]),
        .I5(\rdata[31]_i_4_n_0 ),
        .O(\rdata[2]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \rdata[30]_i_1 
       (.I0(\rdata[31]_i_3_n_0 ),
        .I1(scalar00[30]),
        .I2(\rdata[31]_i_4_n_0 ),
        .I3(axi00_ptr0[30]),
        .I4(axi00_ptr0[62]),
        .I5(\rdata[31]_i_5_n_0 ),
        .O(p_0_in[30]));
  LUT3 #(
    .INIT(8'h80)) 
    \rdata[31]_i_1 
       (.I0(ARREADY),
        .I1(ARVALID),
        .I2(ACLK_EN),
        .O(rdata));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \rdata[31]_i_2 
       (.I0(\rdata[31]_i_3_n_0 ),
        .I1(scalar00[31]),
        .I2(\rdata[31]_i_4_n_0 ),
        .I3(axi00_ptr0[31]),
        .I4(axi00_ptr0[63]),
        .I5(\rdata[31]_i_5_n_0 ),
        .O(p_0_in[31]));
  LUT6 #(
    .INIT(64'h0000000000010000)) 
    \rdata[31]_i_3 
       (.I0(ARADDR[2]),
        .I1(ARADDR[5]),
        .I2(ARADDR[0]),
        .I3(ARADDR[1]),
        .I4(ARADDR[4]),
        .I5(ARADDR[3]),
        .O(\rdata[31]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h0001000000000000)) 
    \rdata[31]_i_4 
       (.I0(ARADDR[2]),
        .I1(ARADDR[5]),
        .I2(ARADDR[0]),
        .I3(ARADDR[1]),
        .I4(ARADDR[4]),
        .I5(ARADDR[3]),
        .O(\rdata[31]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000000080)) 
    \rdata[31]_i_5 
       (.I0(ARADDR[3]),
        .I1(ARADDR[2]),
        .I2(ARADDR[4]),
        .I3(ARADDR[1]),
        .I4(ARADDR[0]),
        .I5(ARADDR[5]),
        .O(\rdata[31]_i_5_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT3 #(
    .INIT(8'hF8)) 
    \rdata[3]_i_1 
       (.I0(axi00_ptr0[35]),
        .I1(\rdata[31]_i_5_n_0 ),
        .I2(\rdata[3]_i_2_n_0 ),
        .O(p_0_in[3]));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \rdata[3]_i_2 
       (.I0(\rdata[0]_i_3_n_0 ),
        .I1(data0[3]),
        .I2(\rdata[31]_i_3_n_0 ),
        .I3(scalar00[3]),
        .I4(axi00_ptr0[3]),
        .I5(\rdata[31]_i_4_n_0 ),
        .O(\rdata[3]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \rdata[4]_i_1 
       (.I0(\rdata[31]_i_3_n_0 ),
        .I1(scalar00[4]),
        .I2(\rdata[31]_i_4_n_0 ),
        .I3(axi00_ptr0[4]),
        .I4(axi00_ptr0[36]),
        .I5(\rdata[31]_i_5_n_0 ),
        .O(p_0_in[4]));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \rdata[5]_i_1 
       (.I0(\rdata[31]_i_3_n_0 ),
        .I1(scalar00[5]),
        .I2(\rdata[31]_i_4_n_0 ),
        .I3(axi00_ptr0[5]),
        .I4(axi00_ptr0[37]),
        .I5(\rdata[31]_i_5_n_0 ),
        .O(p_0_in[5]));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \rdata[6]_i_1 
       (.I0(\rdata[31]_i_3_n_0 ),
        .I1(scalar00[6]),
        .I2(\rdata[31]_i_4_n_0 ),
        .I3(axi00_ptr0[6]),
        .I4(axi00_ptr0[38]),
        .I5(\rdata[31]_i_5_n_0 ),
        .O(p_0_in[6]));
  LUT3 #(
    .INIT(8'hF8)) 
    \rdata[7]_i_1 
       (.I0(axi00_ptr0[39]),
        .I1(\rdata[31]_i_5_n_0 ),
        .I2(\rdata[7]_i_2_n_0 ),
        .O(p_0_in[7]));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \rdata[7]_i_2 
       (.I0(\rdata[0]_i_3_n_0 ),
        .I1(data0[7]),
        .I2(\rdata[31]_i_3_n_0 ),
        .I3(scalar00[7]),
        .I4(axi00_ptr0[7]),
        .I5(\rdata[31]_i_4_n_0 ),
        .O(\rdata[7]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \rdata[8]_i_1 
       (.I0(\rdata[31]_i_3_n_0 ),
        .I1(scalar00[8]),
        .I2(\rdata[31]_i_4_n_0 ),
        .I3(axi00_ptr0[8]),
        .I4(axi00_ptr0[40]),
        .I5(\rdata[31]_i_5_n_0 ),
        .O(p_0_in[8]));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \rdata[9]_i_1 
       (.I0(\rdata[31]_i_3_n_0 ),
        .I1(scalar00[9]),
        .I2(\rdata[31]_i_4_n_0 ),
        .I3(axi00_ptr0[9]),
        .I4(axi00_ptr0[41]),
        .I5(\rdata[31]_i_5_n_0 ),
        .O(p_0_in[9]));
  FDRE \rdata_reg[0] 
       (.C(ACLK),
        .CE(rdata),
        .D(p_0_in[0]),
        .Q(RDATA[0]),
        .R(1'b0));
  FDRE \rdata_reg[10] 
       (.C(ACLK),
        .CE(rdata),
        .D(p_0_in[10]),
        .Q(RDATA[10]),
        .R(1'b0));
  FDRE \rdata_reg[11] 
       (.C(ACLK),
        .CE(rdata),
        .D(p_0_in[11]),
        .Q(RDATA[11]),
        .R(1'b0));
  FDRE \rdata_reg[12] 
       (.C(ACLK),
        .CE(rdata),
        .D(p_0_in[12]),
        .Q(RDATA[12]),
        .R(1'b0));
  FDRE \rdata_reg[13] 
       (.C(ACLK),
        .CE(rdata),
        .D(p_0_in[13]),
        .Q(RDATA[13]),
        .R(1'b0));
  FDRE \rdata_reg[14] 
       (.C(ACLK),
        .CE(rdata),
        .D(p_0_in[14]),
        .Q(RDATA[14]),
        .R(1'b0));
  FDRE \rdata_reg[15] 
       (.C(ACLK),
        .CE(rdata),
        .D(p_0_in[15]),
        .Q(RDATA[15]),
        .R(1'b0));
  FDRE \rdata_reg[16] 
       (.C(ACLK),
        .CE(rdata),
        .D(p_0_in[16]),
        .Q(RDATA[16]),
        .R(1'b0));
  FDRE \rdata_reg[17] 
       (.C(ACLK),
        .CE(rdata),
        .D(p_0_in[17]),
        .Q(RDATA[17]),
        .R(1'b0));
  FDRE \rdata_reg[18] 
       (.C(ACLK),
        .CE(rdata),
        .D(p_0_in[18]),
        .Q(RDATA[18]),
        .R(1'b0));
  FDRE \rdata_reg[19] 
       (.C(ACLK),
        .CE(rdata),
        .D(p_0_in[19]),
        .Q(RDATA[19]),
        .R(1'b0));
  FDRE \rdata_reg[1] 
       (.C(ACLK),
        .CE(rdata),
        .D(p_0_in[1]),
        .Q(RDATA[1]),
        .R(1'b0));
  FDRE \rdata_reg[20] 
       (.C(ACLK),
        .CE(rdata),
        .D(p_0_in[20]),
        .Q(RDATA[20]),
        .R(1'b0));
  FDRE \rdata_reg[21] 
       (.C(ACLK),
        .CE(rdata),
        .D(p_0_in[21]),
        .Q(RDATA[21]),
        .R(1'b0));
  FDRE \rdata_reg[22] 
       (.C(ACLK),
        .CE(rdata),
        .D(p_0_in[22]),
        .Q(RDATA[22]),
        .R(1'b0));
  FDRE \rdata_reg[23] 
       (.C(ACLK),
        .CE(rdata),
        .D(p_0_in[23]),
        .Q(RDATA[23]),
        .R(1'b0));
  FDRE \rdata_reg[24] 
       (.C(ACLK),
        .CE(rdata),
        .D(p_0_in[24]),
        .Q(RDATA[24]),
        .R(1'b0));
  FDRE \rdata_reg[25] 
       (.C(ACLK),
        .CE(rdata),
        .D(p_0_in[25]),
        .Q(RDATA[25]),
        .R(1'b0));
  FDRE \rdata_reg[26] 
       (.C(ACLK),
        .CE(rdata),
        .D(p_0_in[26]),
        .Q(RDATA[26]),
        .R(1'b0));
  FDRE \rdata_reg[27] 
       (.C(ACLK),
        .CE(rdata),
        .D(p_0_in[27]),
        .Q(RDATA[27]),
        .R(1'b0));
  FDRE \rdata_reg[28] 
       (.C(ACLK),
        .CE(rdata),
        .D(p_0_in[28]),
        .Q(RDATA[28]),
        .R(1'b0));
  FDRE \rdata_reg[29] 
       (.C(ACLK),
        .CE(rdata),
        .D(p_0_in[29]),
        .Q(RDATA[29]),
        .R(1'b0));
  FDRE \rdata_reg[2] 
       (.C(ACLK),
        .CE(rdata),
        .D(p_0_in[2]),
        .Q(RDATA[2]),
        .R(1'b0));
  FDRE \rdata_reg[30] 
       (.C(ACLK),
        .CE(rdata),
        .D(p_0_in[30]),
        .Q(RDATA[30]),
        .R(1'b0));
  FDRE \rdata_reg[31] 
       (.C(ACLK),
        .CE(rdata),
        .D(p_0_in[31]),
        .Q(RDATA[31]),
        .R(1'b0));
  FDRE \rdata_reg[3] 
       (.C(ACLK),
        .CE(rdata),
        .D(p_0_in[3]),
        .Q(RDATA[3]),
        .R(1'b0));
  FDRE \rdata_reg[4] 
       (.C(ACLK),
        .CE(rdata),
        .D(p_0_in[4]),
        .Q(RDATA[4]),
        .R(1'b0));
  FDRE \rdata_reg[5] 
       (.C(ACLK),
        .CE(rdata),
        .D(p_0_in[5]),
        .Q(RDATA[5]),
        .R(1'b0));
  FDRE \rdata_reg[6] 
       (.C(ACLK),
        .CE(rdata),
        .D(p_0_in[6]),
        .Q(RDATA[6]),
        .R(1'b0));
  FDRE \rdata_reg[7] 
       (.C(ACLK),
        .CE(rdata),
        .D(p_0_in[7]),
        .Q(RDATA[7]),
        .R(1'b0));
  FDRE \rdata_reg[8] 
       (.C(ACLK),
        .CE(rdata),
        .D(p_0_in[8]),
        .Q(RDATA[8]),
        .R(1'b0));
  FDRE \rdata_reg[9] 
       (.C(ACLK),
        .CE(rdata),
        .D(p_0_in[9]),
        .Q(RDATA[9]),
        .R(1'b0));
  LUT3 #(
    .INIT(8'h80)) 
    \waddr[5]_i_1 
       (.I0(ACLK_EN),
        .I1(AWREADY),
        .I2(AWVALID),
        .O(waddr));
  FDRE \waddr_reg[0] 
       (.C(ACLK),
        .CE(waddr),
        .D(AWADDR[0]),
        .Q(\waddr_reg_n_0_[0] ),
        .R(1'b0));
  FDRE \waddr_reg[1] 
       (.C(ACLK),
        .CE(waddr),
        .D(AWADDR[1]),
        .Q(\waddr_reg_n_0_[1] ),
        .R(1'b0));
  FDRE \waddr_reg[2] 
       (.C(ACLK),
        .CE(waddr),
        .D(AWADDR[2]),
        .Q(\waddr_reg_n_0_[2] ),
        .R(1'b0));
  FDRE \waddr_reg[3] 
       (.C(ACLK),
        .CE(waddr),
        .D(AWADDR[3]),
        .Q(\waddr_reg_n_0_[3] ),
        .R(1'b0));
  FDRE \waddr_reg[4] 
       (.C(ACLK),
        .CE(waddr),
        .D(AWADDR[4]),
        .Q(\waddr_reg_n_0_[4] ),
        .R(1'b0));
  FDRE \waddr_reg[5] 
       (.C(ACLK),
        .CE(waddr),
        .D(AWADDR[5]),
        .Q(\waddr_reg_n_0_[5] ),
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
