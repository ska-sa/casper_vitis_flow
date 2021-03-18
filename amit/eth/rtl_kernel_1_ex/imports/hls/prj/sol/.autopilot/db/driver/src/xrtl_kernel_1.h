// ==============================================================
// Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2020.1 (64-bit)
// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef XRTL_KERNEL_1_H
#define XRTL_KERNEL_1_H

#ifdef __cplusplus
extern "C" {
#endif

/***************************** Include Files *********************************/
#ifndef __linux__
#include "xil_types.h"
#include "xil_assert.h"
#include "xstatus.h"
#include "xil_io.h"
#else
#include <stdint.h>
#include <assert.h>
#include <dirent.h>
#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/mman.h>
#include <unistd.h>
#include <stddef.h>
#endif
#include "xrtl_kernel_1_hw.h"

/**************************** Type Definitions ******************************/
#ifdef __linux__
typedef uint8_t u8;
typedef uint16_t u16;
typedef uint32_t u32;
#else
typedef struct {
    u16 DeviceId;
    u32 Control_BaseAddress;
} XRtl_kernel_1_Config;
#endif

typedef struct {
    u32 Control_BaseAddress;
    u32 IsReady;
} XRtl_kernel_1;

/***************** Macros (Inline Functions) Definitions *********************/
#ifndef __linux__
#define XRtl_kernel_1_WriteReg(BaseAddress, RegOffset, Data) \
    Xil_Out32((BaseAddress) + (RegOffset), (u32)(Data))
#define XRtl_kernel_1_ReadReg(BaseAddress, RegOffset) \
    Xil_In32((BaseAddress) + (RegOffset))
#else
#define XRtl_kernel_1_WriteReg(BaseAddress, RegOffset, Data) \
    *(volatile u32*)((BaseAddress) + (RegOffset)) = (u32)(Data)
#define XRtl_kernel_1_ReadReg(BaseAddress, RegOffset) \
    *(volatile u32*)((BaseAddress) + (RegOffset))

#define Xil_AssertVoid(expr)    assert(expr)
#define Xil_AssertNonvoid(expr) assert(expr)

#define XST_SUCCESS             0
#define XST_DEVICE_NOT_FOUND    2
#define XST_OPEN_DEVICE_FAILED  3
#define XIL_COMPONENT_IS_READY  1
#endif

/************************** Function Prototypes *****************************/
#ifndef __linux__
int XRtl_kernel_1_Initialize(XRtl_kernel_1 *InstancePtr, u16 DeviceId);
XRtl_kernel_1_Config* XRtl_kernel_1_LookupConfig(u16 DeviceId);
int XRtl_kernel_1_CfgInitialize(XRtl_kernel_1 *InstancePtr, XRtl_kernel_1_Config *ConfigPtr);
#else
int XRtl_kernel_1_Initialize(XRtl_kernel_1 *InstancePtr, const char* InstanceName);
int XRtl_kernel_1_Release(XRtl_kernel_1 *InstancePtr);
#endif

void XRtl_kernel_1_Start(XRtl_kernel_1 *InstancePtr);
u32 XRtl_kernel_1_IsDone(XRtl_kernel_1 *InstancePtr);
u32 XRtl_kernel_1_IsIdle(XRtl_kernel_1 *InstancePtr);
u32 XRtl_kernel_1_IsReady(XRtl_kernel_1 *InstancePtr);
void XRtl_kernel_1_EnableAutoRestart(XRtl_kernel_1 *InstancePtr);
void XRtl_kernel_1_DisableAutoRestart(XRtl_kernel_1 *InstancePtr);

void XRtl_kernel_1_Set_scalar00(XRtl_kernel_1 *InstancePtr, u32 Data);
u32 XRtl_kernel_1_Get_scalar00(XRtl_kernel_1 *InstancePtr);
void XRtl_kernel_1_Set_A(XRtl_kernel_1 *InstancePtr, u64 Data);
u64 XRtl_kernel_1_Get_A(XRtl_kernel_1 *InstancePtr);
void XRtl_kernel_1_Set_B(XRtl_kernel_1 *InstancePtr, u64 Data);
u64 XRtl_kernel_1_Get_B(XRtl_kernel_1 *InstancePtr);

void XRtl_kernel_1_InterruptGlobalEnable(XRtl_kernel_1 *InstancePtr);
void XRtl_kernel_1_InterruptGlobalDisable(XRtl_kernel_1 *InstancePtr);
void XRtl_kernel_1_InterruptEnable(XRtl_kernel_1 *InstancePtr, u32 Mask);
void XRtl_kernel_1_InterruptDisable(XRtl_kernel_1 *InstancePtr, u32 Mask);
void XRtl_kernel_1_InterruptClear(XRtl_kernel_1 *InstancePtr, u32 Mask);
u32 XRtl_kernel_1_InterruptGetEnabled(XRtl_kernel_1 *InstancePtr);
u32 XRtl_kernel_1_InterruptGetStatus(XRtl_kernel_1 *InstancePtr);

#ifdef __cplusplus
}
#endif

#endif
