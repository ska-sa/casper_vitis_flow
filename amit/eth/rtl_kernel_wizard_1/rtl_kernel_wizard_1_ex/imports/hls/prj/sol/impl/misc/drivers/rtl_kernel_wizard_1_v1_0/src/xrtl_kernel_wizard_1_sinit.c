// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.2 (64-bit)
// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef __linux__

#include "xstatus.h"
#include "xparameters.h"
#include "xrtl_kernel_wizard_1.h"

extern XRtl_kernel_wizard_1_Config XRtl_kernel_wizard_1_ConfigTable[];

XRtl_kernel_wizard_1_Config *XRtl_kernel_wizard_1_LookupConfig(u16 DeviceId) {
	XRtl_kernel_wizard_1_Config *ConfigPtr = NULL;

	int Index;

	for (Index = 0; Index < XPAR_XRTL_KERNEL_WIZARD_1_NUM_INSTANCES; Index++) {
		if (XRtl_kernel_wizard_1_ConfigTable[Index].DeviceId == DeviceId) {
			ConfigPtr = &XRtl_kernel_wizard_1_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XRtl_kernel_wizard_1_Initialize(XRtl_kernel_wizard_1 *InstancePtr, u16 DeviceId) {
	XRtl_kernel_wizard_1_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XRtl_kernel_wizard_1_LookupConfig(DeviceId);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XRtl_kernel_wizard_1_CfgInitialize(InstancePtr, ConfigPtr);
}

#endif

