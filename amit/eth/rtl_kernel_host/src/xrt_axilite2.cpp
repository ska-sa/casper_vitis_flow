// This is a generated file. Use and modify at your own risk.
////////////////////////////////////////////////////////////////////////////////

/*******************************************************************************
Vendor: Xilinx
Associated Filename: main.c
#Purpose: Write and reads from AXI Lite Interface
*******************************************************************************/

#include "experimental/xrt_kernel.h"
#include "experimental/xrt_aie.h"
// This extension file is required for stream APIs
// This file is required for OpenCL C++ wrapper APIs
////////////////////////////////////////////////////////////////////////////////

int main(int argc, char** argv)
{

    unsigned int dev_index = 2;

	int read_data;
	int write_data = 7;


	auto device = xrt::device(dev_index);
    auto xclbin_uuid = device.load_xclbin("../../rtl_u280_hw_link/Hardware/binary_container_1.xclbin");

    auto kernel2 = xrt::kernel(device, xclbin_uuid, "rtl_kernel_wizard_0:{rtl_kernel_wizard_0_1}", true);
	auto offset2 = 0xF100;

	read_data = kernel2.read_register(offset2);

	printf("%#010x\n", read_data);

	kernel2.write_register(0x200c,0x0000FF12);
	kernel2.write_register(0x2010,0x6200);
	read_data = kernel2.read_register(0x200c);
	printf("%#010x\n", read_data);


	kernel2.write_register(0x2000,0x00000403);
	kernel2.write_register(0x2004,0x6200);
	read_data = kernel2.read_register(0x2000);
	printf("%#010x\n", read_data);

	kernel2.write_register(0x2014,0x0008);
	kernel2.write_register(0x2018,0x001c0045);
	kernel2.write_register(0x201c,0x0000db00);
	kernel2.write_register(0x2020,0x00001180);


	kernel2.write_register(0x2028,0xC0A80106);
	read_data = kernel2.read_register(0x2028);
	printf("%#010x\n", read_data);


	kernel2.write_register(0x2024,0xC0A80107);
	read_data = kernel2.read_register(0x2024);
	printf("%#010x\n", read_data);


	kernel2.write_register(0x202c,0xF0D0F0D0);
	read_data = kernel2.read_register(0x202c);
	printf("%#010x\n", read_data);
	kernel2.write_register(0x2038,0x0000000f);


	kernel2.write_register(0x4000,0x0000FF13);
	read_data = kernel2.read_register(0x00004000);
	printf("%#010x\n", read_data);

	kernel2.write_register(0x400c,0x00000402);
	read_data = kernel2.read_register(0x0000400c);
	printf("%#010x\n", read_data);
	kernel2.write_register(0x4004,0x6200);
	kernel2.write_register(0x4010,0x6200);

	kernel2.write_register(0x4014,0x0008);
		kernel2.write_register(0x4018,0x001c0045);
		kernel2.write_register(0x401c,0x0000db00);
		kernel2.write_register(0x4020,0x00001180);

	kernel2.write_register(0x00004024,0xC0A80116);
	read_data = kernel2.read_register(0x00004024);
	printf("%#010x\n", read_data);

	kernel2.write_register(0x00004028,0xC0A80117);
	read_data = kernel2.read_register(0x00004028);
	printf("%#010x\n", read_data);

	kernel2.write_register(0x0000402c,0xF0D0F0D0);
	read_data = kernel2.read_register(0x0000402c);
	printf("%#010x\n", read_data);
	kernel2.write_register(0x4038,0x0000000f);




} // end of main
