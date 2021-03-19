set moduleName rtl_kernel_wizard_1
set isTopModule 1
set isCombinational 0
set isDatapathOnly 0
set isPipelined 0
set pipeline_type none
set FunctionProtocol ap_ctrl_none
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set C_modelName {rtl_kernel_wizard_1}
set C_modelType { void 0 }
set C_modelArgList {
	{ mac0_m_V_data_V int 512 regular {axi_s 1 volatile  { mac0_m Data } }  }
	{ mac0_m_V_keep_V int 64 regular {axi_s 1 volatile  { mac0_m Keep } }  }
	{ mac0_m_V_last_V int 1 regular {axi_s 1 volatile  { mac0_m Last } }  }
	{ mac0_s_V_data_V int 512 regular {axi_s 0 volatile  { mac0_s Data } }  }
	{ mac0_s_V_keep_V int 64 regular {axi_s 0 volatile  { mac0_s Keep } }  }
	{ mac0_s_V_last_V int 1 regular {axi_s 0 volatile  { mac0_s Last } }  }
	{ mac1_m_V_data_V int 512 regular {axi_s 1 volatile  { mac1_m Data } }  }
	{ mac1_m_V_keep_V int 64 regular {axi_s 1 volatile  { mac1_m Keep } }  }
	{ mac1_m_V_last_V int 1 regular {axi_s 1 volatile  { mac1_m Last } }  }
	{ mac1_s_V_data_V int 512 regular {axi_s 0 volatile  { mac1_s Data } }  }
	{ mac1_s_V_keep_V int 64 regular {axi_s 0 volatile  { mac1_s Keep } }  }
	{ mac1_s_V_last_V int 1 regular {axi_s 0 volatile  { mac1_s Last } }  }
}
set C_modelArgMapList {[ 
	{ "Name" : "mac0_m_V_data_V", "interface" : "axis", "bitwidth" : 512, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "mac0_m.V.data.V","cData": "int512","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "mac0_m_V_keep_V", "interface" : "axis", "bitwidth" : 64, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "mac0_m.V.keep.V","cData": "long","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "mac0_m_V_last_V", "interface" : "axis", "bitwidth" : 1, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "mac0_m.V.last.V","cData": "int1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "mac0_s_V_data_V", "interface" : "axis", "bitwidth" : 512, "direction" : "READONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "mac0_s.V.data.V","cData": "int512","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "mac0_s_V_keep_V", "interface" : "axis", "bitwidth" : 64, "direction" : "READONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "mac0_s.V.keep.V","cData": "long","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "mac0_s_V_last_V", "interface" : "axis", "bitwidth" : 1, "direction" : "READONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "mac0_s.V.last.V","cData": "int1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "mac1_m_V_data_V", "interface" : "axis", "bitwidth" : 512, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "mac1_m.V.data.V","cData": "int512","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "mac1_m_V_keep_V", "interface" : "axis", "bitwidth" : 64, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "mac1_m.V.keep.V","cData": "long","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "mac1_m_V_last_V", "interface" : "axis", "bitwidth" : 1, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "mac1_m.V.last.V","cData": "int1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "mac1_s_V_data_V", "interface" : "axis", "bitwidth" : 512, "direction" : "READONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "mac1_s.V.data.V","cData": "int512","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "mac1_s_V_keep_V", "interface" : "axis", "bitwidth" : 64, "direction" : "READONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "mac1_s.V.keep.V","cData": "long","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "mac1_s_V_last_V", "interface" : "axis", "bitwidth" : 1, "direction" : "READONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "mac1_s.V.last.V","cData": "int1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} ]}
# RTL Port declarations: 
set portNum 39
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst_n sc_in sc_logic 1 reset -1 active_low_sync } 
	{ mac0_m_TDATA sc_out sc_lv 512 signal 0 } 
	{ mac0_m_TVALID sc_out sc_logic 1 outvld 2 } 
	{ mac0_m_TREADY sc_in sc_logic 1 outacc 2 } 
	{ mac0_m_TKEEP sc_out sc_lv 64 signal 1 } 
	{ mac0_m_TLAST sc_out sc_lv 1 signal 2 } 
	{ mac0_s_TDATA sc_in sc_lv 512 signal 3 } 
	{ mac0_s_TVALID sc_in sc_logic 1 invld 5 } 
	{ mac0_s_TREADY sc_out sc_logic 1 inacc 5 } 
	{ mac0_s_TKEEP sc_in sc_lv 64 signal 4 } 
	{ mac0_s_TLAST sc_in sc_lv 1 signal 5 } 
	{ mac1_m_TDATA sc_out sc_lv 512 signal 6 } 
	{ mac1_m_TVALID sc_out sc_logic 1 outvld 8 } 
	{ mac1_m_TREADY sc_in sc_logic 1 outacc 8 } 
	{ mac1_m_TKEEP sc_out sc_lv 64 signal 7 } 
	{ mac1_m_TLAST sc_out sc_lv 1 signal 8 } 
	{ mac1_s_TDATA sc_in sc_lv 512 signal 9 } 
	{ mac1_s_TVALID sc_in sc_logic 1 invld 11 } 
	{ mac1_s_TREADY sc_out sc_logic 1 inacc 11 } 
	{ mac1_s_TKEEP sc_in sc_lv 64 signal 10 } 
	{ mac1_s_TLAST sc_in sc_lv 1 signal 11 } 
	{ s_axi_control_AWVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_AWREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_AWADDR sc_in sc_lv 4 signal -1 } 
	{ s_axi_control_WVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_WREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_WDATA sc_in sc_lv 32 signal -1 } 
	{ s_axi_control_WSTRB sc_in sc_lv 4 signal -1 } 
	{ s_axi_control_ARVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_ARREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_ARADDR sc_in sc_lv 4 signal -1 } 
	{ s_axi_control_RVALID sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_RREADY sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_RDATA sc_out sc_lv 32 signal -1 } 
	{ s_axi_control_RRESP sc_out sc_lv 2 signal -1 } 
	{ s_axi_control_BVALID sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_BREADY sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_BRESP sc_out sc_lv 2 signal -1 } 
}
set NewPortList {[ 
	{ "name": "s_axi_control_AWADDR", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "control", "role": "AWADDR" },"address":[{"name":"rtl_kernel_wizard_1","role":"start","value":"0","valid_bit":"0"},{"name":"rtl_kernel_wizard_1","role":"continue","value":"0","valid_bit":"4"},{"name":"rtl_kernel_wizard_1","role":"auto_start","value":"0","valid_bit":"7"}] },
	{ "name": "s_axi_control_AWVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "AWVALID" } },
	{ "name": "s_axi_control_AWREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "AWREADY" } },
	{ "name": "s_axi_control_WVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "WVALID" } },
	{ "name": "s_axi_control_WREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "WREADY" } },
	{ "name": "s_axi_control_WDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "control", "role": "WDATA" } },
	{ "name": "s_axi_control_WSTRB", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "control", "role": "WSTRB" } },
	{ "name": "s_axi_control_ARADDR", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "control", "role": "ARADDR" },"address":[{"name":"rtl_kernel_wizard_1","role":"start","value":"0","valid_bit":"0"},{"name":"rtl_kernel_wizard_1","role":"done","value":"0","valid_bit":"1"},{"name":"rtl_kernel_wizard_1","role":"idle","value":"0","valid_bit":"2"},{"name":"rtl_kernel_wizard_1","role":"ready","value":"0","valid_bit":"3"},{"name":"rtl_kernel_wizard_1","role":"auto_start","value":"0","valid_bit":"7"}] },
	{ "name": "s_axi_control_ARVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "ARVALID" } },
	{ "name": "s_axi_control_ARREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "ARREADY" } },
	{ "name": "s_axi_control_RVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "RVALID" } },
	{ "name": "s_axi_control_RREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "RREADY" } },
	{ "name": "s_axi_control_RDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "control", "role": "RDATA" } },
	{ "name": "s_axi_control_RRESP", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "control", "role": "RRESP" } },
	{ "name": "s_axi_control_BVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "BVALID" } },
	{ "name": "s_axi_control_BREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "BREADY" } },
	{ "name": "s_axi_control_BRESP", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "control", "role": "BRESP" } }, 
 	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst_n", "role": "default" }} , 
 	{ "name": "mac0_m_TDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "mac0_m_V_data_V", "role": "default" }} , 
 	{ "name": "mac0_m_TVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "mac0_m_V_last_V", "role": "default" }} , 
 	{ "name": "mac0_m_TREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "outacc", "bundle":{"name": "mac0_m_V_last_V", "role": "default" }} , 
 	{ "name": "mac0_m_TKEEP", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "mac0_m_V_keep_V", "role": "default" }} , 
 	{ "name": "mac0_m_TLAST", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "mac0_m_V_last_V", "role": "default" }} , 
 	{ "name": "mac0_s_TDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "mac0_s_V_data_V", "role": "default" }} , 
 	{ "name": "mac0_s_TVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "invld", "bundle":{"name": "mac0_s_V_last_V", "role": "default" }} , 
 	{ "name": "mac0_s_TREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "inacc", "bundle":{"name": "mac0_s_V_last_V", "role": "default" }} , 
 	{ "name": "mac0_s_TKEEP", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "mac0_s_V_keep_V", "role": "default" }} , 
 	{ "name": "mac0_s_TLAST", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "mac0_s_V_last_V", "role": "default" }} , 
 	{ "name": "mac1_m_TDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "mac1_m_V_data_V", "role": "default" }} , 
 	{ "name": "mac1_m_TVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "mac1_m_V_last_V", "role": "default" }} , 
 	{ "name": "mac1_m_TREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "outacc", "bundle":{"name": "mac1_m_V_last_V", "role": "default" }} , 
 	{ "name": "mac1_m_TKEEP", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "mac1_m_V_keep_V", "role": "default" }} , 
 	{ "name": "mac1_m_TLAST", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "mac1_m_V_last_V", "role": "default" }} , 
 	{ "name": "mac1_s_TDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "mac1_s_V_data_V", "role": "default" }} , 
 	{ "name": "mac1_s_TVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "invld", "bundle":{"name": "mac1_s_V_last_V", "role": "default" }} , 
 	{ "name": "mac1_s_TREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "inacc", "bundle":{"name": "mac1_s_V_last_V", "role": "default" }} , 
 	{ "name": "mac1_s_TKEEP", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "mac1_s_V_keep_V", "role": "default" }} , 
 	{ "name": "mac1_s_TLAST", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "mac1_s_V_last_V", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15"],
		"CDFG" : "rtl_kernel_wizard_1",
		"Protocol" : "ap_ctrl_none",
		"ControlExist" : "0", "ap_start" : "0", "ap_ready" : "0", "ap_done" : "0", "ap_continue" : "0", "ap_idle" : "0", "real_start" : "0",
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
			{"Name" : "mac0_m_V_data_V", "Type" : "Axis", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "2", "SubInstance" : "grp_example_stream_plus1_512_512_s_fu_50", "Port" : "m_axis_V_data_V"}]},
			{"Name" : "mac0_m_V_keep_V", "Type" : "Axis", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "2", "SubInstance" : "grp_example_stream_plus1_512_512_s_fu_50", "Port" : "m_axis_V_keep_V"}]},
			{"Name" : "mac0_m_V_last_V", "Type" : "Axis", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "2", "SubInstance" : "grp_example_stream_plus1_512_512_s_fu_50", "Port" : "m_axis_V_last_V"}]},
			{"Name" : "mac0_s_V_data_V", "Type" : "Axis", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "2", "SubInstance" : "grp_example_stream_plus1_512_512_s_fu_50", "Port" : "s_axis_V_data_V"}]},
			{"Name" : "mac0_s_V_keep_V", "Type" : "Axis", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "2", "SubInstance" : "grp_example_stream_plus1_512_512_s_fu_50", "Port" : "s_axis_V_keep_V"}]},
			{"Name" : "mac0_s_V_last_V", "Type" : "Axis", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "2", "SubInstance" : "grp_example_stream_plus1_512_512_s_fu_50", "Port" : "s_axis_V_last_V"}]},
			{"Name" : "mac1_m_V_data_V", "Type" : "Axis", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "3", "SubInstance" : "grp_example_stream_plus1_512_512_s_fu_66", "Port" : "m_axis_V_data_V"}]},
			{"Name" : "mac1_m_V_keep_V", "Type" : "Axis", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "3", "SubInstance" : "grp_example_stream_plus1_512_512_s_fu_66", "Port" : "m_axis_V_keep_V"}]},
			{"Name" : "mac1_m_V_last_V", "Type" : "Axis", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "3", "SubInstance" : "grp_example_stream_plus1_512_512_s_fu_66", "Port" : "m_axis_V_last_V"}]},
			{"Name" : "mac1_s_V_data_V", "Type" : "Axis", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "3", "SubInstance" : "grp_example_stream_plus1_512_512_s_fu_66", "Port" : "s_axis_V_data_V"}]},
			{"Name" : "mac1_s_V_keep_V", "Type" : "Axis", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "3", "SubInstance" : "grp_example_stream_plus1_512_512_s_fu_66", "Port" : "s_axis_V_keep_V"}]},
			{"Name" : "mac1_s_V_last_V", "Type" : "Axis", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "3", "SubInstance" : "grp_example_stream_plus1_512_512_s_fu_66", "Port" : "s_axis_V_last_V"}]}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.control_s_axi_U", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_example_stream_plus1_512_512_s_fu_50", "Parent" : "0",
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
			{"Name" : "m_axis_V_last_V", "Type" : "Axis", "Direction" : "O"}]},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_example_stream_plus1_512_512_s_fu_66", "Parent" : "0",
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
			{"Name" : "m_axis_V_last_V", "Type" : "Axis", "Direction" : "O"}]},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_mac0_m_V_data_V_U", "Parent" : "0"},
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_mac0_m_V_keep_V_U", "Parent" : "0"},
	{"ID" : "6", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_mac0_m_V_last_V_U", "Parent" : "0"},
	{"ID" : "7", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_mac0_s_V_data_V_U", "Parent" : "0"},
	{"ID" : "8", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_mac0_s_V_keep_V_U", "Parent" : "0"},
	{"ID" : "9", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_mac0_s_V_last_V_U", "Parent" : "0"},
	{"ID" : "10", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_mac1_m_V_data_V_U", "Parent" : "0"},
	{"ID" : "11", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_mac1_m_V_keep_V_U", "Parent" : "0"},
	{"ID" : "12", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_mac1_m_V_last_V_U", "Parent" : "0"},
	{"ID" : "13", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_mac1_s_V_data_V_U", "Parent" : "0"},
	{"ID" : "14", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_mac1_s_V_keep_V_U", "Parent" : "0"},
	{"ID" : "15", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_mac1_s_V_last_V_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	rtl_kernel_wizard_1 {
		mac0_m_V_data_V {Type O LastRead -1 FirstWrite 1}
		mac0_m_V_keep_V {Type O LastRead -1 FirstWrite 1}
		mac0_m_V_last_V {Type O LastRead -1 FirstWrite 1}
		mac0_s_V_data_V {Type I LastRead 1 FirstWrite -1}
		mac0_s_V_keep_V {Type I LastRead 1 FirstWrite -1}
		mac0_s_V_last_V {Type I LastRead 1 FirstWrite -1}
		mac1_m_V_data_V {Type O LastRead -1 FirstWrite 1}
		mac1_m_V_keep_V {Type O LastRead -1 FirstWrite 1}
		mac1_m_V_last_V {Type O LastRead -1 FirstWrite 1}
		mac1_s_V_data_V {Type I LastRead 1 FirstWrite -1}
		mac1_s_V_keep_V {Type I LastRead 1 FirstWrite -1}
		mac1_s_V_last_V {Type I LastRead 1 FirstWrite -1}}
	example_stream_plus1_512_512_s {
		s_axis_V_data_V {Type I LastRead 1 FirstWrite -1}
		s_axis_V_keep_V {Type I LastRead 1 FirstWrite -1}
		s_axis_V_last_V {Type I LastRead 1 FirstWrite -1}
		m_axis_V_data_V {Type O LastRead -1 FirstWrite 1}
		m_axis_V_keep_V {Type O LastRead -1 FirstWrite 1}
		m_axis_V_last_V {Type O LastRead -1 FirstWrite 1}}
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
	, {"Name" : "Interval", "Min" : "0", "Max" : "0"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	mac0_m_V_data_V { axis {  { mac0_m_TDATA out_data 1 512 } } }
	mac0_m_V_keep_V { axis {  { mac0_m_TKEEP out_data 1 64 } } }
	mac0_m_V_last_V { axis {  { mac0_m_TVALID out_vld 1 1 }  { mac0_m_TREADY out_acc 0 1 }  { mac0_m_TLAST out_data 1 1 } } }
	mac0_s_V_data_V { axis {  { mac0_s_TDATA in_data 0 512 } } }
	mac0_s_V_keep_V { axis {  { mac0_s_TKEEP in_data 0 64 } } }
	mac0_s_V_last_V { axis {  { mac0_s_TVALID in_vld 0 1 }  { mac0_s_TREADY in_acc 1 1 }  { mac0_s_TLAST in_data 0 1 } } }
	mac1_m_V_data_V { axis {  { mac1_m_TDATA out_data 1 512 } } }
	mac1_m_V_keep_V { axis {  { mac1_m_TKEEP out_data 1 64 } } }
	mac1_m_V_last_V { axis {  { mac1_m_TVALID out_vld 1 1 }  { mac1_m_TREADY out_acc 0 1 }  { mac1_m_TLAST out_data 1 1 } } }
	mac1_s_V_data_V { axis {  { mac1_s_TDATA in_data 0 512 } } }
	mac1_s_V_keep_V { axis {  { mac1_s_TKEEP in_data 0 64 } } }
	mac1_s_V_last_V { axis {  { mac1_s_TVALID in_vld 0 1 }  { mac1_s_TREADY in_acc 1 1 }  { mac1_s_TLAST in_data 0 1 } } }
}

set busDeadlockParameterList { 
}

# RTL port scheduling information:
set fifoSchedulingInfoList { 
}

# RTL bus port read request latency information:
set busReadReqLatencyList { 
}

# RTL bus port write response latency information:
set busWriteResLatencyList { 
}

# RTL array port load latency information:
set memoryLoadLatencyList { 
}
