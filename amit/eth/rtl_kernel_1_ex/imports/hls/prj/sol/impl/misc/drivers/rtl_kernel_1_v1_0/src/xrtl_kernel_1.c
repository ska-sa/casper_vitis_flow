// ==============================================================
// Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2020.1 (64-bit)
// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// ==============================================================
/***************************** Include Files *********************************/
#include "xrtl_kernel_1.h"

/************************** Function Implementation *************************/
#ifndef __linux__
int XRtl_kernel_1_CfgInitialize(XRtl_kernel_1 *InstancePtr, XRtl_kernel_1_Config *ConfigPtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(ConfigPtr != NULL);

    InstancePtr->Control_BaseAddress = ConfigPtr->Control_BaseAddress;
    InstancePtr->IsReady = XIL_COMPONENT_IS_READY;

    return XST_SUCCESS;
}
#endif

void XRtl_kernel_1_Start(XRtl_kernel_1 *InstancePtr) {
    u32 Data;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XRtl_kernel_1_ReadReg(InstancePtr->Control_BaseAddress, XRTL_KERNEL_1_CONTROL_ADDR_AP_CTRL) & 0x80;
    XRtl_kernel_1_WriteReg(InstancePtr->Control_BaseAddress, XRTL_KERNEL_1_CONTROL_ADDR_AP_CTRL, Data | 0x01);
}

u32 XRtl_kernel_1_IsDone(XRtl_kernel_1 *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XRtl_kernel_1_ReadReg(InstancePtr->Control_BaseAddress, XRTL_KERNEL_1_CONTROL_ADDR_AP_CTRL);
    return (Data >> 1) & 0x1;
}

u32 XRtl_kernel_1_IsIdle(XRtl_kernel_1 *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XRtl_kernel_1_ReadReg(InstancePtr->Control_BaseAddress, XRTL_KERNEL_1_CONTROL_ADDR_AP_CTRL);
    return (Data >> 2) & 0x1;
}

u32 XRtl_kernel_1_IsReady(XRtl_kernel_1 *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XRtl_kernel_1_ReadReg(InstancePtr->Control_BaseAddress, XRTL_KERNEL_1_CONTROL_ADDR_AP_CTRL);
    // check ap_start to see if the pcore is ready for next input
    return !(Data & 0x1);
}

void XRtl_kernel_1_EnableAutoRestart(XRtl_kernel_1 *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XRtl_kernel_1_WriteReg(InstancePtr->Control_BaseAddress, XRTL_KERNEL_1_CONTROL_ADDR_AP_CTRL, 0x80);
}

void XRtl_kernel_1_DisableAutoRestart(XRtl_kernel_1 *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XRtl_kernel_1_WriteReg(InstancePtr->Control_BaseAddress, XRTL_KERNEL_1_CONTROL_ADDR_AP_CTRL, 0);
}

void XRtl_kernel_1_Set_scalar00(XRtl_kernel_1 *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XRtl_kernel_1_WriteReg(InstancePtr->Control_BaseAddress, XRTL_KERNEL_1_CONTROL_ADDR_SCALAR00_DATA, Data);
}

u32 XRtl_kernel_1_Get_scalar00(XRtl_kernel_1 *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XRtl_kernel_1_ReadReg(InstancePtr->Control_BaseAddress, XRTL_KERNEL_1_CONTROL_ADDR_SCALAR00_DATA);
    return Data;
}

void XRtl_kernel_1_Set_A(XRtl_kernel_1 *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XRtl_kernel_1_WriteReg(InstancePtr->Control_BaseAddress, XRTL_KERNEL_1_CONTROL_ADDR_A_DATA, (u32)(Data));
    XRtl_kernel_1_WriteReg(InstancePtr->Control_BaseAddress, XRTL_KERNEL_1_CONTROL_ADDR_A_DATA + 4, (u32)(Data >> 32));
}

u64 XRtl_kernel_1_Get_A(XRtl_kernel_1 *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XRtl_kernel_1_ReadReg(InstancePtr->Control_BaseAddress, XRTL_KERNEL_1_CONTROL_ADDR_A_DATA);
    Data += (u64)XRtl_kernel_1_ReadReg(InstancePtr->Control_BaseAddress, XRTL_KERNEL_1_CONTROL_ADDR_A_DATA + 4) << 32;
    return Data;
}

void XRtl_kernel_1_Set_B(XRtl_kernel_1 *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XRtl_kernel_1_WriteReg(InstancePtr->Control_BaseAddress, XRTL_KERNEL_1_CONTROL_ADDR_B_DATA, (u32)(Data));
    XRtl_kernel_1_WriteReg(InstancePtr->Control_BaseAddress, XRTL_KERNEL_1_CONTROL_ADDR_B_DATA + 4, (u32)(Data >> 32));
}

u64 XRtl_kernel_1_Get_B(XRtl_kernel_1 *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XRtl_kernel_1_ReadReg(InstancePtr->Control_BaseAddress, XRTL_KERNEL_1_CONTROL_ADDR_B_DATA);
    Data += (u64)XRtl_kernel_1_ReadReg(InstancePtr->Control_BaseAddress, XRTL_KERNEL_1_CONTROL_ADDR_B_DATA + 4) << 32;
    return Data;
}

void XRtl_kernel_1_InterruptGlobalEnable(XRtl_kernel_1 *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XRtl_kernel_1_WriteReg(InstancePtr->Control_BaseAddress, XRTL_KERNEL_1_CONTROL_ADDR_GIE, 1);
}

void XRtl_kernel_1_InterruptGlobalDisable(XRtl_kernel_1 *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XRtl_kernel_1_WriteReg(InstancePtr->Control_BaseAddress, XRTL_KERNEL_1_CONTROL_ADDR_GIE, 0);
}

void XRtl_kernel_1_InterruptEnable(XRtl_kernel_1 *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XRtl_kernel_1_ReadReg(InstancePtr->Control_BaseAddress, XRTL_KERNEL_1_CONTROL_ADDR_IER);
    XRtl_kernel_1_WriteReg(InstancePtr->Control_BaseAddress, XRTL_KERNEL_1_CONTROL_ADDR_IER, Register | Mask);
}

void XRtl_kernel_1_InterruptDisable(XRtl_kernel_1 *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XRtl_kernel_1_ReadReg(InstancePtr->Control_BaseAddress, XRTL_KERNEL_1_CONTROL_ADDR_IER);
    XRtl_kernel_1_WriteReg(InstancePtr->Control_BaseAddress, XRTL_KERNEL_1_CONTROL_ADDR_IER, Register & (~Mask));
}

void XRtl_kernel_1_InterruptClear(XRtl_kernel_1 *InstancePtr, u32 Mask) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XRtl_kernel_1_WriteReg(InstancePtr->Control_BaseAddress, XRTL_KERNEL_1_CONTROL_ADDR_ISR, Mask);
}

u32 XRtl_kernel_1_InterruptGetEnabled(XRtl_kernel_1 *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XRtl_kernel_1_ReadReg(InstancePtr->Control_BaseAddress, XRTL_KERNEL_1_CONTROL_ADDR_IER);
}

u32 XRtl_kernel_1_InterruptGetStatus(XRtl_kernel_1 *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XRtl_kernel_1_ReadReg(InstancePtr->Control_BaseAddress, XRTL_KERNEL_1_CONTROL_ADDR_ISR);
}

