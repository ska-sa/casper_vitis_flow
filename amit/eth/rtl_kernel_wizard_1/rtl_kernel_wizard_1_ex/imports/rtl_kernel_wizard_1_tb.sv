// This is a generated file. Use and modify at your own risk.
////////////////////////////////////////////////////////////////////////////////
// default_nettype of none prevents implicit wire declaration.
`default_nettype none
`timescale 1 ps / 1 ps
import axi_vip_pkg::*;
import axi4stream_vip_pkg::*;
import mac0_m_vip_pkg::*;
import mac0_s_vip_pkg::*;
import mac1_m_vip_pkg::*;
import mac1_s_vip_pkg::*;
import control_rtl_kernel_wizard_1_vip_pkg::*;

module rtl_kernel_wizard_1_tb ();
parameter integer LP_MAX_LENGTH = 8192;
parameter integer LP_MAX_TRANSFER_LENGTH = 16384 / 4;
parameter integer C_S_AXI_CONTROL_ADDR_WIDTH = 12;
parameter integer C_S_AXI_CONTROL_DATA_WIDTH = 32;
parameter integer C_MAC0_M_TDATA_WIDTH = 512;
parameter integer C_MAC0_S_TDATA_WIDTH = 512;
parameter integer C_MAC1_M_TDATA_WIDTH = 512;
parameter integer C_MAC1_S_TDATA_WIDTH = 512;

parameter integer LP_CLK_PERIOD_PS = 4000; // 250 MHz

//System Signals
logic ap_clk = 0;

initial begin: AP_CLK
  forever begin
    ap_clk = #(LP_CLK_PERIOD_PS/2) ~ap_clk;
  end
end
 
//System Signals
logic ap_rst_n = 0;
logic initial_reset  =0;

task automatic ap_rst_n_sequence(input integer unsigned width = 20);
  @(posedge ap_clk);
  #1ps;
  ap_rst_n = 0;
  repeat (width) @(posedge ap_clk);
  #1ps;
  ap_rst_n = 1;
endtask

initial begin: AP_RST
  ap_rst_n_sequence(50);
  initial_reset =1;
end
// AXI4-Stream master (write_only) interface mac0_m
wire [1-1:0] mac0_m_tvalid;
wire [1-1:0] mac0_m_tready;
wire [C_MAC0_M_TDATA_WIDTH-1:0] mac0_m_tdata;
wire [C_MAC0_M_TDATA_WIDTH/8-1:0] mac0_m_tkeep;
wire [1-1:0] mac0_m_tlast;
// AXI4-Stream slave (read_only) interface mac0_s
wire [1-1:0] mac0_s_tvalid;
wire [1-1:0] mac0_s_tready;
wire [C_MAC0_S_TDATA_WIDTH-1:0] mac0_s_tdata;
wire [C_MAC0_S_TDATA_WIDTH/8-1:0] mac0_s_tkeep;
wire [1-1:0] mac0_s_tlast;
// AXI4-Stream master (write_only) interface mac1_m
wire [1-1:0] mac1_m_tvalid;
wire [1-1:0] mac1_m_tready;
wire [C_MAC1_M_TDATA_WIDTH-1:0] mac1_m_tdata;
wire [C_MAC1_M_TDATA_WIDTH/8-1:0] mac1_m_tkeep;
wire [1-1:0] mac1_m_tlast;
// AXI4-Stream slave (read_only) interface mac1_s
wire [1-1:0] mac1_s_tvalid;
wire [1-1:0] mac1_s_tready;
wire [C_MAC1_S_TDATA_WIDTH-1:0] mac1_s_tdata;
wire [C_MAC1_S_TDATA_WIDTH/8-1:0] mac1_s_tkeep;
wire [1-1:0] mac1_s_tlast;
//AXI4LITE control signals
wire [1-1:0] s_axi_control_awvalid;
wire [1-1:0] s_axi_control_awready;
wire [C_S_AXI_CONTROL_ADDR_WIDTH-1:0] s_axi_control_awaddr;
wire [1-1:0] s_axi_control_wvalid;
wire [1-1:0] s_axi_control_wready;
wire [C_S_AXI_CONTROL_DATA_WIDTH-1:0] s_axi_control_wdata;
wire [C_S_AXI_CONTROL_DATA_WIDTH/8-1:0] s_axi_control_wstrb;
wire [1-1:0] s_axi_control_arvalid;
wire [1-1:0] s_axi_control_arready;
wire [C_S_AXI_CONTROL_ADDR_WIDTH-1:0] s_axi_control_araddr;
wire [1-1:0] s_axi_control_rvalid;
wire [1-1:0] s_axi_control_rready;
wire [C_S_AXI_CONTROL_DATA_WIDTH-1:0] s_axi_control_rdata;
wire [2-1:0] s_axi_control_rresp;
wire [1-1:0] s_axi_control_bvalid;
wire [1-1:0] s_axi_control_bready;
wire [2-1:0] s_axi_control_bresp;

// DUT instantiation
rtl_kernel_wizard_1 #(
  .C_S_AXI_CONTROL_ADDR_WIDTH ( C_S_AXI_CONTROL_ADDR_WIDTH ),
  .C_S_AXI_CONTROL_DATA_WIDTH ( C_S_AXI_CONTROL_DATA_WIDTH ),
  .C_MAC0_M_TDATA_WIDTH       ( C_MAC0_M_TDATA_WIDTH       ),
  .C_MAC0_S_TDATA_WIDTH       ( C_MAC0_S_TDATA_WIDTH       ),
  .C_MAC1_M_TDATA_WIDTH       ( C_MAC1_M_TDATA_WIDTH       ),
  .C_MAC1_S_TDATA_WIDTH       ( C_MAC1_S_TDATA_WIDTH       )
)
inst_dut (
  .ap_clk                ( ap_clk                ),
  .ap_rst_n              ( ap_rst_n              ),
  .mac0_m_tvalid         ( mac0_m_tvalid         ),
  .mac0_m_tready         ( mac0_m_tready         ),
  .mac0_m_tdata          ( mac0_m_tdata          ),
  .mac0_m_tkeep          ( mac0_m_tkeep          ),
  .mac0_m_tlast          ( mac0_m_tlast          ),
  .mac0_s_tvalid         ( mac0_s_tvalid         ),
  .mac0_s_tready         ( mac0_s_tready         ),
  .mac0_s_tdata          ( mac0_s_tdata          ),
  .mac0_s_tkeep          ( mac0_s_tkeep          ),
  .mac0_s_tlast          ( mac0_s_tlast          ),
  .mac1_m_tvalid         ( mac1_m_tvalid         ),
  .mac1_m_tready         ( mac1_m_tready         ),
  .mac1_m_tdata          ( mac1_m_tdata          ),
  .mac1_m_tkeep          ( mac1_m_tkeep          ),
  .mac1_m_tlast          ( mac1_m_tlast          ),
  .mac1_s_tvalid         ( mac1_s_tvalid         ),
  .mac1_s_tready         ( mac1_s_tready         ),
  .mac1_s_tdata          ( mac1_s_tdata          ),
  .mac1_s_tkeep          ( mac1_s_tkeep          ),
  .mac1_s_tlast          ( mac1_s_tlast          ),
  .s_axi_control_awvalid ( s_axi_control_awvalid ),
  .s_axi_control_awready ( s_axi_control_awready ),
  .s_axi_control_awaddr  ( s_axi_control_awaddr  ),
  .s_axi_control_wvalid  ( s_axi_control_wvalid  ),
  .s_axi_control_wready  ( s_axi_control_wready  ),
  .s_axi_control_wdata   ( s_axi_control_wdata   ),
  .s_axi_control_wstrb   ( s_axi_control_wstrb   ),
  .s_axi_control_arvalid ( s_axi_control_arvalid ),
  .s_axi_control_arready ( s_axi_control_arready ),
  .s_axi_control_araddr  ( s_axi_control_araddr  ),
  .s_axi_control_rvalid  ( s_axi_control_rvalid  ),
  .s_axi_control_rready  ( s_axi_control_rready  ),
  .s_axi_control_rdata   ( s_axi_control_rdata   ),
  .s_axi_control_rresp   ( s_axi_control_rresp   ),
  .s_axi_control_bvalid  ( s_axi_control_bvalid  ),
  .s_axi_control_bready  ( s_axi_control_bready  ),
  .s_axi_control_bresp   ( s_axi_control_bresp   )
);

// Master Control instantiation
control_rtl_kernel_wizard_1_vip inst_control_rtl_kernel_wizard_1_vip (
  .aclk          ( ap_clk                ),
  .aresetn       ( ap_rst_n              ),
  .m_axi_awvalid ( s_axi_control_awvalid ),
  .m_axi_awready ( s_axi_control_awready ),
  .m_axi_awaddr  ( s_axi_control_awaddr  ),
  .m_axi_wvalid  ( s_axi_control_wvalid  ),
  .m_axi_wready  ( s_axi_control_wready  ),
  .m_axi_wdata   ( s_axi_control_wdata   ),
  .m_axi_wstrb   ( s_axi_control_wstrb   ),
  .m_axi_arvalid ( s_axi_control_arvalid ),
  .m_axi_arready ( s_axi_control_arready ),
  .m_axi_araddr  ( s_axi_control_araddr  ),
  .m_axi_rvalid  ( s_axi_control_rvalid  ),
  .m_axi_rready  ( s_axi_control_rready  ),
  .m_axi_rdata   ( s_axi_control_rdata   ),
  .m_axi_rresp   ( s_axi_control_rresp   ),
  .m_axi_bvalid  ( s_axi_control_bvalid  ),
  .m_axi_bready  ( s_axi_control_bready  ),
  .m_axi_bresp   ( s_axi_control_bresp   )
);

control_rtl_kernel_wizard_1_vip_mst_t  ctrl;
// AXI4-Stream master (write_only) interface mac0_m

// AXI4-Stream VIP instantiation
mac0_m_vip inst_mac0_m_vip (
  .aclk          ( ap_clk        ),
  .aresetn       ( ap_rst_n      ),
  .s_axis_tvalid ( mac0_m_tvalid ),
  .s_axis_tready ( mac0_m_tready ),
  .s_axis_tdata  ( mac0_m_tdata  ),
  .s_axis_tkeep  ( mac0_m_tkeep  ),
  .s_axis_tlast  ( mac0_m_tlast  )
);


mac0_m_vip_slv_t   mac0_m_slv;
// AXI4-Stream slave (read_only) interface mac0_s

// AXI4-Stream VIP instantiation
mac0_s_vip inst_mac0_s_vip (
  .aclk          ( ap_clk        ),
  .aresetn       ( ap_rst_n      ),
  .m_axis_tvalid ( mac0_s_tvalid ),
  .m_axis_tready ( mac0_s_tready ),
  .m_axis_tdata  ( mac0_s_tdata  ),
  .m_axis_tkeep  ( mac0_s_tkeep  ),
  .m_axis_tlast  ( mac0_s_tlast  )
);


mac0_s_vip_mst_t   mac0_s_mst;
// AXI4-Stream master (write_only) interface mac1_m

// AXI4-Stream VIP instantiation
mac1_m_vip inst_mac1_m_vip (
  .aclk          ( ap_clk        ),
  .aresetn       ( ap_rst_n      ),
  .s_axis_tvalid ( mac1_m_tvalid ),
  .s_axis_tready ( mac1_m_tready ),
  .s_axis_tdata  ( mac1_m_tdata  ),
  .s_axis_tkeep  ( mac1_m_tkeep  ),
  .s_axis_tlast  ( mac1_m_tlast  )
);


mac1_m_vip_slv_t   mac1_m_slv;
// AXI4-Stream slave (read_only) interface mac1_s

// AXI4-Stream VIP instantiation
mac1_s_vip inst_mac1_s_vip (
  .aclk          ( ap_clk        ),
  .aresetn       ( ap_rst_n      ),
  .m_axis_tvalid ( mac1_s_tvalid ),
  .m_axis_tready ( mac1_s_tready ),
  .m_axis_tdata  ( mac1_s_tdata  ),
  .m_axis_tkeep  ( mac1_s_tkeep  ),
  .m_axis_tlast  ( mac1_s_tlast  )
);


mac1_s_vip_mst_t   mac1_s_mst;

parameter NUM_AXIS_MST = 2;
parameter NUM_AXIS_SLV = 2;

bit               error_found = 0;

axi4stream_monitor_transaction            slv_monitor_tran_q[2][$];
string                                    slv_name_q[$];

byte                                      original_byte_q[2][$];
axi4stream_transaction                    trans_q[2][$];
axi4stream_monitor_transaction            mst_monitor_tran_q[2][$];
string                                    mst_name_q[$];

axi4stream_monitor_transaction            mac0_m_slv_monitor_transaction;

axi4stream_monitor_transaction            mac0_s_mst_monitor_transaction;

axi4stream_monitor_transaction            mac1_m_slv_monitor_transaction;

axi4stream_monitor_transaction            mac1_s_mst_monitor_transaction;

task automatic system_reset_sequence(input integer unsigned width = 20);
  $display("%t : Starting System Reset Sequence", $time);
  fork
    ap_rst_n_sequence(25);
    
  join

  // Clear slave queue
  for(xil_axi4stream_uint slv=0; slv< NUM_AXIS_SLV; slv++) begin
    slv_monitor_tran_q[slv] = {};
  end

endtask


/////////////////////////////////////////////////////////////////////////////////////////////////
// Generate a random 32bit number
function bit [31:0] get_random_4bytes();
  bit [31:0] rptr;
  ptr_random_failed: assert(std::randomize(rptr));
  return(rptr);
endfunction

/////////////////////////////////////////////////////////////////////////////////////////////////
// Generate a random 64bit 4k aligned address pointer.
function bit [63:0] get_random_ptr();
  bit [63:0] rptr;
  ptr_random_failed: assert(std::randomize(rptr));
  rptr[31:0] &= ~(32'h00000fff);
  return(rptr);
endfunction

/////////////////////////////////////////////////////////////////////////////////////////////////
// Control interface non-blocking write
// The task will return when the transaction has been accepted by the driver. It will be some
// amount of time before it will appear on the interface.
task automatic write_register (input bit [31:0] addr_in, input bit [31:0] data);
  axi_transaction   wr_xfer;
  wr_xfer = ctrl.wr_driver.create_transaction("wr_xfer");
  assert(wr_xfer.randomize() with {addr == addr_in;});
  wr_xfer.set_data_beat(0, data);
  ctrl.wr_driver.send(wr_xfer);
endtask

/////////////////////////////////////////////////////////////////////////////////////////////////
// Control interface blocking write
// The task will return when the BRESP has been returned from the kernel.
task automatic blocking_write_register (input bit [31:0] addr_in, input bit [31:0] data);
  axi_transaction   wr_xfer;
  axi_transaction   wr_rsp;
  wr_xfer = ctrl.wr_driver.create_transaction("wr_xfer");
  wr_xfer.set_driver_return_item_policy(XIL_AXI_PAYLOAD_RETURN);
  assert(wr_xfer.randomize() with {addr == addr_in;});
  wr_xfer.set_data_beat(0, data);
  ctrl.wr_driver.send(wr_xfer);
  ctrl.wr_driver.wait_rsp(wr_rsp);
endtask

/////////////////////////////////////////////////////////////////////////////////////////////////
// Control interface blocking read
// The task will return when the BRESP has been returned from the kernel.
task automatic read_register (input bit [31:0] addr, output bit [31:0] rddata);
  axi_transaction   rd_xfer;
  axi_transaction   rd_rsp;
  bit [31:0] rd_value;
  rd_xfer = ctrl.rd_driver.create_transaction("rd_xfer");
  rd_xfer.set_addr(addr);
  rd_xfer.set_driver_return_item_policy(XIL_AXI_PAYLOAD_RETURN);
  ctrl.rd_driver.send(rd_xfer);
  ctrl.rd_driver.wait_rsp(rd_rsp);
  rd_value = rd_rsp.get_data_beat(0);
  rddata = rd_value;
endtask



/////////////////////////////////////////////////////////////////////////////////////////////////
// Start the control VIP, SLAVE memory models and AXI4-Stream.
task automatic start_vips();
  $display("///////////////////////////////////////////////////////////////////////////");
  $display("Control Master: ctrl");
  ctrl = new("ctrl", rtl_kernel_wizard_1_tb.inst_control_rtl_kernel_wizard_1_vip.inst.IF);
  ctrl.start_master();

  $display("///////////////////////////////////////////////////////////////////////////");
  $display("Starting AXI4-Stream slv: mac0_m");
  mac0_m_slv = new("mac0_m", rtl_kernel_wizard_1_tb.inst_mac0_m_vip.inst.IF);
  mac0_m_slv.start_slave();

  slv_name_q.push_back("mac0_m");

  $display("///////////////////////////////////////////////////////////////////////////");
  $display("Starting AXI4-Stream mst: mac0_s");
  mac0_s_mst = new("mac0_s", rtl_kernel_wizard_1_tb.inst_mac0_s_vip.inst.IF);
  mac0_s_mst.start_master();

  mst_name_q.push_back("mac0_s");

  $display("///////////////////////////////////////////////////////////////////////////");
  $display("Starting AXI4-Stream slv: mac1_m");
  mac1_m_slv = new("mac1_m", rtl_kernel_wizard_1_tb.inst_mac1_m_vip.inst.IF);
  mac1_m_slv.start_slave();

  slv_name_q.push_back("mac1_m");

  $display("///////////////////////////////////////////////////////////////////////////");
  $display("Starting AXI4-Stream mst: mac1_s");
  mac1_s_mst = new("mac1_s", rtl_kernel_wizard_1_tb.inst_mac1_s_vip.inst.IF);
  mac1_s_mst.start_master();

  mst_name_q.push_back("mac1_s");

endtask

/////////////////////////////////////////////////////////////////////////////////////////////////
// For each of the connected slave interfaces, set the Slave to not de-assert WREADY at any time.
// This will show the fastest outbound bandwidth from the WRITE channel.
task automatic slv_no_backpressure_wready();
  axi_ready_gen     rgen;
  $display("%t - Applying slv_no_backpressure_wready", $time);

endtask

task automatic slv_no_backpressure_tready();
  $display("%t - Applying slv_no_backpressure_tready", $time);
  fork

  begin
    axi4stream_ready_gen rgen_mac0_m_slv;
    rgen_mac0_m_slv = new("mac0_m_slv_no_backpressure_ready");
    rgen_mac0_m_slv.set_ready_policy(XIL_AXI4STREAM_READY_GEN_NO_BACKPRESSURE);
    mac0_m_slv.driver.send_tready(rgen_mac0_m_slv);
  end

  begin
    axi4stream_ready_gen rgen_mac1_m_slv;
    rgen_mac1_m_slv = new("mac1_m_slv_no_backpressure_ready");
    rgen_mac1_m_slv.set_ready_policy(XIL_AXI4STREAM_READY_GEN_NO_BACKPRESSURE);
    mac1_m_slv.driver.send_tready(rgen_mac1_m_slv);
  end

join_none
endtask


/////////////////////////////////////////////////////////////////////////////////////////////////
// For each of the connected slave interfaces, apply a WREADY policy to introduce backpressure.
// Based on the simulation seed the order/shape of the WREADY per-channel will be different.
task automatic slv_random_backpressure_wready();
  axi_ready_gen     rgen;
  $display("%t - Applying slv_random_backpressure_wready", $time);

endtask


task automatic slv_random_backpressure_tready();
  $display("%t - Applying slv_random_backpressure_tready", $time);
  fork

  begin
    axi4stream_ready_gen rgen_mac0_m_slv;
    rgen_mac0_m_slv = new("mac0_m_slv_random_backpressure_wready");
    rgen_mac0_m_slv.set_ready_policy(XIL_AXI4STREAM_READY_GEN_RANDOM);
    rgen_mac0_m_slv.set_low_time_range(0,12);
    rgen_mac0_m_slv.set_high_time_range(1,12);
    rgen_mac0_m_slv.set_event_count_range(3,5);
    mac0_m_slv.driver.send_tready(rgen_mac0_m_slv);
  end

  begin
    axi4stream_ready_gen rgen_mac1_m_slv;
    rgen_mac1_m_slv = new("mac1_m_slv_random_backpressure_wready");
    rgen_mac1_m_slv.set_ready_policy(XIL_AXI4STREAM_READY_GEN_RANDOM);
    rgen_mac1_m_slv.set_low_time_range(0,12);
    rgen_mac1_m_slv.set_high_time_range(1,12);
    rgen_mac1_m_slv.set_event_count_range(3,5);
    mac1_m_slv.driver.send_tready(rgen_mac1_m_slv);
  end

join_none
endtask


/////////////////////////////////////////////////////////////////////////////////////////////////
// For each of the connected slave interfaces, force the memory model to not insert any inter-beat
// gaps on the READ channel.
task automatic slv_no_delay_rvalid();
  $display("%t - Applying slv_no_delay_rvalid", $time);

endtask

/////////////////////////////////////////////////////////////////////////////////////////////////
// For each of the connected slave interfaces, Allow the memory model to insert any inter-beat
// gaps on the READ channel.
task automatic slv_random_delay_rvalid();
  $display("%t - Applying slv_random_delay_rvalid", $time);

endtask

task automatic start_stream_tready();
bit choose_pressure_type = 0;
RAND_TREADY_PRESSURE_FAILED: assert(std::randomize(choose_pressure_type));
case(choose_pressure_type)
0: slv_no_backpressure_tready();
1: slv_random_backpressure_tready();
endcase
endtask

function automatic void rand_value(inout integer seed, inout xil_axi4stream_uint incre_value,inout bit random_only,inout xil_axi4stream_uint start_value, inout xil_axi4stream_uint num_words);
   seed_random_failure: assert(std::randomize(seed));
   random_only_failure: assert(std::randomize(random_only));
   incre_value = $urandom() %6;
   start_value = $urandom() %6;
   num_words = $urandom_range(40,100);
endfunction
///////////////////////////////////////////////////////////////////////////////////////////
task automatic start_stream_traffic();
  ///////////////////////////////////////////////////////////////////////////
  fork

    begin
      integer                                seed_mac0_s_mst;
      xil_axi4stream_uint                    incremental_mac0_s_mst;
      bit                                    random_only_mac0_s_mst;
      xil_axi4stream_uint                    start_value_mac0_s_mst;
      xil_axi4stream_uint                    num_words_mac0_s_mst;
      axi4stream_transaction                 trans_q_mac0_s_mst[$];
      byte                                   original_byte_q_mac0_s_mst[$];
      axi4stream_transaction                 wr_transaction_mac0_s_mst;
      xil_axi4stream_uint                    data_width_mac0_s_mst;
      xil_axi4stream_uint                    total_trans_mac0_s_mst;
      xil_axi4stream_data_beat               data_beat_mac0_s_mst;
      bit[31:0]                              tmp_word_mac0_s_mst;
      xil_axi4stream_strb_beat               keep_beat_mac0_s_mst;
      byte                                   byte_q_mac0_s_mst[$];
      rand_value(seed_mac0_s_mst,incremental_mac0_s_mst,random_only_mac0_s_mst,start_value_mac0_s_mst,num_words_mac0_s_mst);
      if(random_only_mac0_s_mst ==1) begin
        for(xil_axi4stream_uint word_cnt =0; word_cnt < num_words_mac0_s_mst; word_cnt++) begin
          tmp_word_mac0_s_mst = $random(seed_mac0_s_mst);
          for(xil_axi4stream_uint byte_cnt =0; byte_cnt <4; byte_cnt++) begin
            byte_q_mac0_s_mst.push_back(tmp_word_mac0_s_mst[byte_cnt]);
          end
        end
      end else begin
        for(xil_axi4stream_uint word_cnt =0; word_cnt < num_words_mac0_s_mst ; word_cnt++) begin
          tmp_word_mac0_s_mst = start_value_mac0_s_mst + word_cnt*incremental_mac0_s_mst;
          for(xil_axi4stream_uint byte_cnt =0; byte_cnt <4; byte_cnt++) begin
            byte_q_mac0_s_mst.push_back(tmp_word_mac0_s_mst[byte_cnt*8+:8]);
          end
        end
      end
      wr_transaction_mac0_s_mst = mac0_s_mst.driver.create_transaction("mac0_s_axis transaction_mac0_s_mst");
      data_width_mac0_s_mst = wr_transaction_mac0_s_mst.get_data_width();
      if((num_words_mac0_s_mst*4)%(data_width_mac0_s_mst/8) !=0) begin
        $display("Warning, stream VIP TDATA_WIDTH of mac0_s_mst is %d byte, the number of words you wants to pass in a whole packet is %d, the last transfer will be filled with 0",data_width_mac0_s_mst, num_words_mac0_s_mst);
      end
      if( (num_words_mac0_s_mst*4)% (data_width_mac0_s_mst/8) !=0 ) begin
        total_trans_mac0_s_mst = (num_words_mac0_s_mst*4)/ (data_width_mac0_s_mst/8)+1;
      end else begin
        total_trans_mac0_s_mst = (num_words_mac0_s_mst*4)/ (data_width_mac0_s_mst/8) ;
      end
      for(xil_axi4stream_uint i=0; i<total_trans_mac0_s_mst; i++) begin
        for(xil_axi4stream_uint byte_cnt=0; byte_cnt<data_width_mac0_s_mst/8; byte_cnt++) begin
          data_beat_mac0_s_mst[byte_cnt*8+:8] = byte_q_mac0_s_mst.pop_front();
          keep_beat_mac0_s_mst[byte_cnt]=1'b1;
        end
        wr_transaction_mac0_s_mst.set_data_beat(data_beat_mac0_s_mst);
        if (data_width_mac0_s_mst > 8) begin
          wr_transaction_mac0_s_mst.set_keep_beat(keep_beat_mac0_s_mst);
        end
        wr_transaction_mac0_s_mst.set_last(0);
        if(i == total_trans_mac0_s_mst-1) begin
          wr_transaction_mac0_s_mst.set_last(1);
        end
        mac0_s_mst.driver.send(wr_transaction_mac0_s_mst);
      end
    end

    begin
      integer                                seed_mac1_s_mst;
      xil_axi4stream_uint                    incremental_mac1_s_mst;
      bit                                    random_only_mac1_s_mst;
      xil_axi4stream_uint                    start_value_mac1_s_mst;
      xil_axi4stream_uint                    num_words_mac1_s_mst;
      axi4stream_transaction                 trans_q_mac1_s_mst[$];
      byte                                   original_byte_q_mac1_s_mst[$];
      axi4stream_transaction                 wr_transaction_mac1_s_mst;
      xil_axi4stream_uint                    data_width_mac1_s_mst;
      xil_axi4stream_uint                    total_trans_mac1_s_mst;
      xil_axi4stream_data_beat               data_beat_mac1_s_mst;
      bit[31:0]                              tmp_word_mac1_s_mst;
      xil_axi4stream_strb_beat               keep_beat_mac1_s_mst;
      byte                                   byte_q_mac1_s_mst[$];
      rand_value(seed_mac1_s_mst,incremental_mac1_s_mst,random_only_mac1_s_mst,start_value_mac1_s_mst,num_words_mac1_s_mst);
      if(random_only_mac1_s_mst ==1) begin
        for(xil_axi4stream_uint word_cnt =0; word_cnt < num_words_mac1_s_mst; word_cnt++) begin
          tmp_word_mac1_s_mst = $random(seed_mac1_s_mst);
          for(xil_axi4stream_uint byte_cnt =0; byte_cnt <4; byte_cnt++) begin
            byte_q_mac1_s_mst.push_back(tmp_word_mac1_s_mst[byte_cnt]);
          end
        end
      end else begin
        for(xil_axi4stream_uint word_cnt =0; word_cnt < num_words_mac1_s_mst ; word_cnt++) begin
          tmp_word_mac1_s_mst = start_value_mac1_s_mst + word_cnt*incremental_mac1_s_mst;
          for(xil_axi4stream_uint byte_cnt =0; byte_cnt <4; byte_cnt++) begin
            byte_q_mac1_s_mst.push_back(tmp_word_mac1_s_mst[byte_cnt*8+:8]);
          end
        end
      end
      wr_transaction_mac1_s_mst = mac1_s_mst.driver.create_transaction("mac1_s_axis transaction_mac1_s_mst");
      data_width_mac1_s_mst = wr_transaction_mac1_s_mst.get_data_width();
      if((num_words_mac1_s_mst*4)%(data_width_mac1_s_mst/8) !=0) begin
        $display("Warning, stream VIP TDATA_WIDTH of mac1_s_mst is %d byte, the number of words you wants to pass in a whole packet is %d, the last transfer will be filled with 0",data_width_mac1_s_mst, num_words_mac1_s_mst);
      end
      if( (num_words_mac1_s_mst*4)% (data_width_mac1_s_mst/8) !=0 ) begin
        total_trans_mac1_s_mst = (num_words_mac1_s_mst*4)/ (data_width_mac1_s_mst/8)+1;
      end else begin
        total_trans_mac1_s_mst = (num_words_mac1_s_mst*4)/ (data_width_mac1_s_mst/8) ;
      end
      for(xil_axi4stream_uint i=0; i<total_trans_mac1_s_mst; i++) begin
        for(xil_axi4stream_uint byte_cnt=0; byte_cnt<data_width_mac1_s_mst/8; byte_cnt++) begin
          data_beat_mac1_s_mst[byte_cnt*8+:8] = byte_q_mac1_s_mst.pop_front();
          keep_beat_mac1_s_mst[byte_cnt]=1'b1;
        end
        wr_transaction_mac1_s_mst.set_data_beat(data_beat_mac1_s_mst);
        if (data_width_mac1_s_mst > 8) begin
          wr_transaction_mac1_s_mst.set_keep_beat(keep_beat_mac1_s_mst);
        end
        wr_transaction_mac1_s_mst.set_last(0);
        if(i == total_trans_mac1_s_mst-1) begin
          wr_transaction_mac1_s_mst.set_last(1);
        end
        mac1_s_mst.driver.send(wr_transaction_mac1_s_mst);
      end
    end

  join_none
endtask

/////////////////////////////////////////////////////////////////////////////////////////////////
// Check to ensure, following reset the value of the register is 0.
// Check that only the width of the register bits can be written.
task automatic check_register_value(input bit [31:0] addr_in, input integer unsigned register_width, output bit error_found);
  bit [31:0] rddata;
  bit [31:0] mask_data;
  error_found = 0;
  if (register_width < 32) begin
    mask_data = (1 << register_width) - 1;
  end else begin
    mask_data = 32'hffffffff;
  end
  read_register(addr_in, rddata);
  if (rddata != 32'h0) begin
    $error("Initial value mismatch: A:0x%0x : Expected 0x%x -> Got 0x%x", addr_in, 0, rddata);
    error_found = 1;
  end
  blocking_write_register(addr_in, 32'hffffffff);
  read_register(addr_in, rddata);
  if (rddata != mask_data) begin
    $error("Initial value mismatch: A:0x%0x : Expected 0x%x -> Got 0x%x", addr_in, mask_data, rddata);
    error_found = 1;
  end
endtask


/////////////////////////////////////////////////////////////////////////////////////////////////
// For each of the scalar registers, check:
// * reset value
// * correct number bits set on a write
task automatic check_scalar_registers(output bit error_found);
  bit tmp_error_found = 0;
  error_found = 0;
  $display("%t : Checking post reset values of scalar registers", $time);

endtask

task automatic set_scalar_registers();
  $display("%t : Setting Scalar Registers registers", $time);

endtask

task automatic check_pointer_registers(output bit error_found);
  bit tmp_error_found = 0;
  ///////////////////////////////////////////////////////////////////////////
  //Check the reset states of the pointer registers.
  $display("%t : Checking post reset values of pointer registers", $time);

endtask

task automatic set_memory_pointers();
  ///////////////////////////////////////////////////////////////////////////
  //Randomly generate memory pointers.

endtask

task automatic backdoor_fill_memories();

endtask

function automatic bit check_kernel_result();
  bit [31:0]        ret_rd_value = 32'h0;
  bit error_found = 0;
  integer error_counter;
  error_counter = 0;

  return(error_found);
endfunction

bit choose_pressure_type = 0;
bit axis_choose_pressure_type = 0;
bit [4-1:0] axis_tlast_received;

/////////////////////////////////////////////////////////////////////////////////////////////////
// Set up the kernel for operation and set the kernel START bit.
// The task will poll the DONE bit and check the results when complete.
task automatic multiple_iteration(input integer unsigned num_iterations, output bit error_found);
  error_found = 0;

  $display("Starting: multiple_iteration");
  for (integer unsigned iter = 0; iter < num_iterations; iter++) begin

    axis_tlast_received = 4'h0;
    $display("Starting iteration: %d / %d", iter+1, num_iterations);
    RAND_WREADY_PRESSURE_FAILED: assert(std::randomize(choose_pressure_type));
    case(choose_pressure_type)
      0: slv_no_backpressure_wready();
      1: slv_random_backpressure_wready();
    endcase
    RAND_RVALID_PRESSURE_FAILED: assert(std::randomize(choose_pressure_type));
    case(choose_pressure_type)
      0: slv_no_delay_rvalid();
      1: slv_random_delay_rvalid();
    endcase

    set_scalar_registers();
    ///////////////////////////////////////////////////////////////////////////
    //Start transfers

    fork
      start_stream_tready();
      start_stream_traffic();
    join_none

    ///////////////////////////////////////////////////////////////////////////
    //Wait for last to be transferred on all stream interfaces
    #1;
    @(axis_tlast_received == {4{1'b1}});
    ///////////////////////////////////////////////////////////////////////////

    error_found |= check_axis_result();

    $display("Finished iteration: %d / %d", iter+1, num_iterations);
  end
 endtask

function automatic void data_comparison(bit[31:0] slv_data, bit[31:0] expected_data, ref xil_axi4stream_uint err_cnt, ref bit error_found);
  if (slv_data != expected_data ) begin
    $error("Expected data beat(%h) does not match received slave monitor data beat(%h).", expected_data, slv_data);
    err_cnt++;
    error_found |=1;
  end
endfunction

function automatic xil_axi4stream_uint get_total_bytes(ref axi4stream_monitor_transaction mon[$]);
 xil_axi4stream_uint total_bytes;
 xil_axi4stream_uint size;
 xil_axi4stream_uint dw;
 xil_axi4stream_strb_beat keep;
 size = mon.size();
 keep = mon[size-1].get_keep_beat();
 dw = mon[0].get_data_width()/8;
 total_bytes = (size-1)*dw;
 for (xil_axi4stream_uint i = 0; i < dw; i++) begin
   if (keep[i] == 1'b1 || dw == 1) begin
     total_bytes++;
   end
   else begin
     break;
   end
 end
 return total_bytes;
endfunction


function automatic void check_monitor_result(ref axi4stream_monitor_transaction slv_mon[$], ref axi4stream_monitor_transaction mst_mon[$], ref xil_axi4stream_uint err_cnt, ref bit error_found);
  axi4stream_monitor_transaction  mst_tran;
  axi4stream_monitor_transaction  slv_tran;
  xil_axi4stream_data_beat        mst_data;
  xil_axi4stream_data_beat        slv_data;
  bit[31:0]                       mst_word;
  bit[31:0]                       slv_word;
  xil_axi4stream_uint             slv_trans_size;
  xil_axi4stream_uint             mst_trans_size;
  xil_axi4stream_uint             slv_data_width;
  xil_axi4stream_uint             mst_data_width;

  slv_data_width = slv_mon[0].get_data_width();
  mst_data_width = mst_mon[0].get_data_width();
  if(get_total_bytes(slv_mon) != get_total_bytes(mst_mon)) begin
    $error("Number of bytes in slv_mon (%d) does not equal mst_mon(%d)",get_total_bytes(slv_mon),get_total_bytes(mst_mon));
    error_found = 1;
    err_cnt     += 1;
    return;
  end
  mst_trans_size = mst_mon.size();
  slv_trans_size = slv_mon.size();
  if (mst_data_width >= slv_data_width) begin
    for(xil_axi4stream_uint mst_trans =0; mst_trans< mst_trans_size; mst_trans++) begin
      xil_axi4stream_strb_beat mst_keep ;
      bit slv_last;
      bit mst_last;
      mst_tran = mst_mon.pop_front();
      mst_last = mst_tran.get_last();
      mst_data = mst_tran.get_data_beat();
      if (mst_last == 1'b1) begin
        mst_keep = mst_tran.get_keep_beat();
      end

      for (xil_axi4stream_uint slv_trans = 0; slv_trans < mst_data_width / slv_data_width; slv_trans++) begin
        xil_axi4stream_strb_beat slv_keep ;
        slv_tran = slv_mon.pop_front();
        slv_data = slv_tran.get_data_beat();
        slv_last = slv_tran.get_last();
         if (slv_last == 1'b1) begin
          if (mst_last == 1'b0) begin
            $error("slv_mon received tlast, but mst_mon still has transfers");
          end

          slv_keep = slv_tran.get_keep_beat();

        end
         for(xil_axi4stream_uint word_cnt=0; word_cnt <(slv_data_width/32); word_cnt++) begin
          if (~slv_last || slv_keep[word_cnt*(slv_data_width/32/8)+:32/8] == '1) begin
            for(xil_axi4stream_uint byte_cnt=0; byte_cnt <4; byte_cnt++) begin
              slv_word[(byte_cnt*8)+:8] = slv_data[(word_cnt*32+byte_cnt*8)+:8];
              mst_word[(byte_cnt*8)+:8] = mst_data[(slv_trans*slv_data_width)+(word_cnt*32+byte_cnt*8)+:8];
            end
            data_comparison(slv_word,mst_word+1,err_cnt,error_found);
            if (err_cnt > 5) begin
              $display("Too many errors found. Exiting check...");
              return;
            end
          end
        end
        if (slv_last) begin
          break;
        end
      end
    end
  end
  else begin
    for(xil_axi4stream_uint slv_trans =0; slv_trans< slv_trans_size; slv_trans++) begin
      xil_axi4stream_strb_beat slv_keep ;
      bit mst_last;
      bit slv_last;
      slv_tran = slv_mon.pop_front();
      slv_last = slv_tran.get_last();
      slv_data = slv_tran.get_data_beat();
      if (slv_last == 1'b1) begin
        slv_keep = slv_tran.get_keep_beat();
      end

      for (xil_axi4stream_uint mst_trans = 0; mst_trans < slv_data_width / mst_data_width; mst_trans++) begin
        xil_axi4stream_strb_beat mst_keep ;
        mst_tran = mst_mon.pop_front();
        mst_data = mst_tran.get_data_beat();
        mst_last = mst_tran.get_last();
         if (mst_last == 1'b1) begin
          if (slv_last == 1'b0) begin
            $error("mst_mon received tlast, but slv_mon still has tranfers");
          end

          mst_keep = mst_tran.get_keep_beat();

        end
         for(xil_axi4stream_uint word_cnt=0; word_cnt <(mst_data_width/32); word_cnt++) begin
          if (~mst_last || mst_keep[word_cnt*(mst_data_width/32/8)+:32/8] == '1) begin
            for(xil_axi4stream_uint byte_cnt=0; byte_cnt <4; byte_cnt++) begin
              mst_word[(byte_cnt*8)+:8] = mst_data[(word_cnt*32+byte_cnt*8)+:8];
              slv_word[(byte_cnt*8)+:8] = slv_data[(mst_trans*mst_data_width)+(word_cnt*32+byte_cnt*8)+:8];
            end
          //   $info("loop slv_trans.mst_trans.word_cnt.slv_data_index %d.%d.%d", slv_trans, mst_trans, word_cnt, (mst_trans*mst_data_width)+(word_cnt*32));
            data_comparison(slv_word, mst_word+1,err_cnt,error_found);
            if (err_cnt > 5) begin
              $display("Too many errors found. Exiting check...");
              return;
            end
          end
        end
        if (mst_last) begin
          break;
        end
      end
    end
  end
endfunction

function automatic void check_autogen_monitor_result(ref axi4stream_monitor_transaction slv_mon[$], ref xil_axi4stream_uint err_cnt, ref bit error_found);
  axi4stream_monitor_transaction  slv_tran;
  xil_axi4stream_data_beat        slv_data;
  xil_axi4stream_ulong            shift_bit;
  bit[31:0]                       slv_word;
  bit [31:0]                      auto_gen_word =0;
  bit [31:0]                      final_word;
   while(slv_mon.size() >0) begin
    slv_tran = slv_mon.pop_front();
    slv_data = slv_tran.get_data_beat();
    if (slv_tran.get_data_width() <32) begin
      slv_word = slv_data;
      auto_gen_word +=1;
      shift_bit = (1<< slv_tran.get_data_width()) -1;
      final_word = auto_gen_word & shift_bit;
      data_comparison(slv_word,final_word, err_cnt, error_found);
      if (err_cnt > 5) begin
       $display("Too many errors found. Exiting check...");
       return;
      end
    end else begin
      for(xil_axi4stream_uint word_cnt=0; word_cnt <(slv_tran.get_data_width()/32); word_cnt++) begin
        slv_word = slv_data[(word_cnt*32)+:32];
        auto_gen_word +=1;
        data_comparison(slv_word,auto_gen_word, err_cnt, error_found);
        if (err_cnt > 5) begin
          $display("Too many errors found. Exiting check...");
          return;
        end
      end
    end
  end
endfunction

function automatic bit check_axis_result();
  //compare slave side monitor transaction with master side monitor transaction if the data width match
  string      mst_s="";
  string      slv_s="";

  xil_axi4stream_uint mst_monitor_data_width_q[];

  xil_axi4stream_uint increment_cnt =0 ;
  xil_axi4stream_uint comparison_cnt =0 ;
  xil_axi4stream_uint slv_monitor_data_width_q[];
  xil_axi4stream_uint axis_error_cnt =0;
  bit axis_error_found =0;
  xil_axi4stream_uint unique_slv_data_width_q[$];
  xil_axi4stream_uint unique_cnt;
  slv_monitor_data_width_q = new[2];

  mst_monitor_data_width_q = new[2];
  for(xil_axi4stream_uint mst=0; mst< NUM_AXIS_MST; mst++) begin
    if(mst_monitor_tran_q[mst].size()>0) begin
      mst_monitor_data_width_q[mst] = mst_monitor_tran_q[mst][0].get_data_width();
    end
    else begin
      $info("Master monitor transaction queue %s %1d is empty. ", mst_s, mst);
      mst_monitor_data_width_q[mst] = 0;
    end
  end

  for(xil_axi4stream_uint slv=0; slv< NUM_AXIS_SLV; slv++) begin
    slv_s = slv_name_q.pop_front();
    slv_monitor_data_width_q[slv] = slv_monitor_tran_q[slv][0].get_data_width();
    comparison_cnt = 0;

      for (xil_axi4stream_uint mst=0; mst< NUM_AXIS_MST; mst++) begin
        if((comparison_cnt ==0)&& (increment_cnt == mst)) begin
          mst_s = mst_name_q.pop_front();
        end
        if((comparison_cnt ==0)&&(mst_monitor_tran_q[mst].size()>0)) begin
           $info("Check slv %s against mst %s", slv_s, mst_s);
          // $info("check slv_monitor_data_width_q[%d] =%h agaist mst_monitor_data_width_q[%d] =%h",slv, slv_monitor_data_width_q[slv], mst,mst_monitor_data_width_q[mst]);
          check_monitor_result(slv_monitor_tran_q[slv],mst_monitor_tran_q[mst], axis_error_cnt, axis_error_found);
          comparison_cnt++;
          increment_cnt++;
        end
      end
      if (comparison_cnt ==0) begin
        $info("Check slv %s against autogeneration", slv_s);
        // $info(" check slv_monitor_data_width_q[%d] =%h  data is autogenerated ", slv, slv_monitor_data_width_q[slv]);
        check_autogen_monitor_result(slv_monitor_tran_q[slv],axis_error_cnt,axis_error_found);
      end
    end

  return(axis_error_found);
endfunction

initial begin
  #200001;
  fork

  forever begin
    mac0_m_slv.monitor.item_collected_port.get(mac0_m_slv_monitor_transaction);
    if (mac0_m_slv_monitor_transaction.get_last())
      axis_tlast_received[0] = 1'b1;
    slv_monitor_tran_q[0].push_back(mac0_m_slv_monitor_transaction);
  end

  forever begin
    mac0_s_mst.monitor.item_collected_port.get(mac0_s_mst_monitor_transaction);
    if (mac0_s_mst_monitor_transaction.get_last())
      axis_tlast_received[1] = 1'b1;
    mst_monitor_tran_q[0].push_back(mac0_s_mst_monitor_transaction);
  end

  forever begin
    mac1_m_slv.monitor.item_collected_port.get(mac1_m_slv_monitor_transaction);
    if (mac1_m_slv_monitor_transaction.get_last())
      axis_tlast_received[2] = 1'b1;
    slv_monitor_tran_q[1].push_back(mac1_m_slv_monitor_transaction);
  end

  forever begin
    mac1_s_mst.monitor.item_collected_port.get(mac1_s_mst_monitor_transaction);
    if (mac1_s_mst_monitor_transaction.get_last())
      axis_tlast_received[3] = 1'b1;
    mst_monitor_tran_q[1].push_back(mac1_s_mst_monitor_transaction);
  end

join_none
end

/////////////////////////////////////////////////////////////////////////////////////////////////
//Instantiate AXI4 LITE VIP
initial begin : STIMULUS
  #200000;
  start_vips();
  check_scalar_registers(error_found);
  if (error_found == 1) begin
    $display( "Test Failed!");
    $finish();
  end

  multiple_iteration(1, error_found);
  if (error_found == 1) begin
    $display( "Test Failed!");
    $finish();
  end

  multiple_iteration(5, error_found);

  if (error_found == 1) begin
    $display( "Test Failed!");
    $finish();
  end else begin
    $display( "Test completed successfully");
  end
  $finish;
end

endmodule
`default_nettype wire

