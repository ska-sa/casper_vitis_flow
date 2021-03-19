set moduleName example_stream_plus1_512_512_s
set isTopModule 0
set isCombinational 0
set isDatapathOnly 0
set isPipelined 0
set pipeline_type none
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set C_modelName {example_stream_plus1<512, 512>}
set C_modelType { void 0 }
set C_modelArgList {
	{ s_axis_V_data_V int 512 regular {axi_s 0 volatile  { mac1_s Data } }  }
	{ s_axis_V_keep_V int 64 regular {axi_s 0 volatile  { mac1_s Keep } }  }
	{ s_axis_V_last_V int 1 regular {axi_s 0 volatile  { mac1_s Last } }  }
	{ m_axis_V_data_V int 512 regular {axi_s 1 volatile  { mac1_m Data } }  }
	{ m_axis_V_keep_V int 64 regular {axi_s 1 volatile  { mac1_m Keep } }  }
	{ m_axis_V_last_V int 1 regular {axi_s 1 volatile  { mac1_m Last } }  }
}
set C_modelArgMapList {[ 
	{ "Name" : "s_axis_V_data_V", "interface" : "axis", "bitwidth" : 512, "direction" : "READONLY"} , 
 	{ "Name" : "s_axis_V_keep_V", "interface" : "axis", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "s_axis_V_last_V", "interface" : "axis", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "m_axis_V_data_V", "interface" : "axis", "bitwidth" : 512, "direction" : "WRITEONLY"} , 
 	{ "Name" : "m_axis_V_keep_V", "interface" : "axis", "bitwidth" : 64, "direction" : "WRITEONLY"} , 
 	{ "Name" : "m_axis_V_last_V", "interface" : "axis", "bitwidth" : 1, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 16
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ mac1_s_TDATA sc_in sc_lv 512 signal 0 } 
	{ mac1_s_TVALID sc_in sc_logic 1 invld 0 } 
	{ mac1_s_TREADY sc_out sc_logic 1 inacc 2 } 
	{ mac1_s_TKEEP sc_in sc_lv 64 signal 1 } 
	{ mac1_s_TLAST sc_in sc_lv 1 signal 2 } 
	{ mac1_m_TDATA sc_out sc_lv 512 signal 3 } 
	{ mac1_m_TVALID sc_out sc_logic 1 outvld 5 } 
	{ mac1_m_TREADY sc_in sc_logic 1 outacc 3 } 
	{ mac1_m_TKEEP sc_out sc_lv 64 signal 4 } 
	{ mac1_m_TLAST sc_out sc_lv 1 signal 5 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "mac1_s_TDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "s_axis_V_data_V", "role": "default" }} , 
 	{ "name": "mac1_s_TVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "invld", "bundle":{"name": "s_axis_V_data_V", "role": "default" }} , 
 	{ "name": "mac1_s_TREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "inacc", "bundle":{"name": "s_axis_V_last_V", "role": "default" }} , 
 	{ "name": "mac1_s_TKEEP", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "s_axis_V_keep_V", "role": "default" }} , 
 	{ "name": "mac1_s_TLAST", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "s_axis_V_last_V", "role": "default" }} , 
 	{ "name": "mac1_m_TDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "m_axis_V_data_V", "role": "default" }} , 
 	{ "name": "mac1_m_TVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "m_axis_V_last_V", "role": "default" }} , 
 	{ "name": "mac1_m_TREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "outacc", "bundle":{"name": "m_axis_V_data_V", "role": "default" }} , 
 	{ "name": "mac1_m_TKEEP", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "m_axis_V_keep_V", "role": "default" }} , 
 	{ "name": "mac1_m_TLAST", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "m_axis_V_last_V", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "",
		"CDFG" : "example_stream_plus1_512_512_s",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "-1", "EstimateLatencyMax" : "-1",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "s_axis_V_data_V", "Type" : "Axis", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "mac1_s_TDATA_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "s_axis_V_keep_V", "Type" : "Axis", "Direction" : "I"},
			{"Name" : "s_axis_V_last_V", "Type" : "Axis", "Direction" : "I"},
			{"Name" : "m_axis_V_data_V", "Type" : "Axis", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "mac1_m_TDATA_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "m_axis_V_keep_V", "Type" : "Axis", "Direction" : "O"},
			{"Name" : "m_axis_V_last_V", "Type" : "Axis", "Direction" : "O"}]}]}


set ArgLastReadFirstWriteLatency {
	example_stream_plus1_512_512_s {
		s_axis_V_data_V {Type I LastRead 1 FirstWrite -1}
		s_axis_V_keep_V {Type I LastRead 1 FirstWrite -1}
		s_axis_V_last_V {Type I LastRead 1 FirstWrite -1}
		m_axis_V_data_V {Type O LastRead -1 FirstWrite 1}
		m_axis_V_keep_V {Type O LastRead -1 FirstWrite 1}
		m_axis_V_last_V {Type O LastRead -1 FirstWrite 1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "-1", "Max" : "-1"}
	, {"Name" : "Interval", "Min" : "-1", "Max" : "-1"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	s_axis_V_data_V { axis {  { mac1_s_TDATA in_data 0 512 }  { mac1_s_TVALID in_vld 0 1 } } }
	s_axis_V_keep_V { axis {  { mac1_s_TKEEP in_data 0 64 } } }
	s_axis_V_last_V { axis {  { mac1_s_TREADY in_acc 1 1 }  { mac1_s_TLAST in_data 0 1 } } }
	m_axis_V_data_V { axis {  { mac1_m_TDATA out_data 1 512 }  { mac1_m_TREADY out_acc 0 1 } } }
	m_axis_V_keep_V { axis {  { mac1_m_TKEEP out_data 1 64 } } }
	m_axis_V_last_V { axis {  { mac1_m_TVALID out_vld 1 1 }  { mac1_m_TLAST out_data 1 1 } } }
}
