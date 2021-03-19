// This is a generated file. Use and modify at your own risk.
////////////////////////////////////////////////////////////////////////////////

/*******************************************************************************
Vendor: Xilinx
Associated Filename: main.c
#Purpose: This example shows a basic vector add +1 (constant) by manipulating
#         memory inplace.
*******************************************************************************/

#include <fcntl.h>
#include <stdio.h>
#include <iostream>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#ifdef _WINDOWS
#include <io.h>
#else
#include <unistd.h>
#include <sys/time.h>
#endif
#include <assert.h>
#include <stdbool.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <CL/opencl.h>
#include <CL/cl_ext.h>
#include "xclhal2.h"

////////////////////////////////////////////////////////////////////////////////

#define NUM_WORKGROUPS (1)
#define WORKGROUP_SIZE (256)
#define MAX_LENGTH 8192
#define MEM_ALIGNMENT 4096
#if defined(VITIS_PLATFORM) && !defined(TARGET_DEVICE)
#define STR_VALUE(arg)      #arg
#define GET_STRING(name) STR_VALUE(name)
#define TARGET_DEVICE GET_STRING(VITIS_PLATFORM)
#endif

////////////////////////////////////////////////////////////////////////////////

cl_uint load_file_to_memory(const char *filename, char **result)
{
    cl_uint size = 0;
    FILE *f = fopen(filename, "rb");
    if (f == NULL) {
        *result = NULL;
        return -1; // -1 means file opening fail
    }
    fseek(f, 0, SEEK_END);
    size = ftell(f);
    fseek(f, 0, SEEK_SET);
    *result = (char *)malloc(size+1);
    if (size != fread(*result, sizeof(char), size, f)) {
        free(*result);
        return -2; // -2 means file reading fail
    }
    fclose(f);
    (*result)[size] = 0;
    return size;
}

int main(int argc, char** argv)
{

    cl_int err;                            // error code returned from api calls
    cl_uint check_status = 0;
    const cl_uint number_of_words = 4096; // 16KB of data


    cl_platform_id platform_id;         // platform id
    cl_device_id device_id;             // compute device id
    cl_context context;                 // compute context
    cl_command_queue commands;          // compute command queue
    cl_program program;                 // compute programs
    cl_kernel kernel;                   // compute kernel

    cl_uint* h_data;                                // host memory for input vector
    char cl_platform_vendor[1001];
    char target_device_name[1001] = TARGET_DEVICE;
    cl_stream mac0_m_stream;                 // device stream object
    cl_stream mac0_s_stream;                 // device stream object
    cl_stream mac1_m_stream;                 // device stream object
    cl_stream mac1_s_stream;                 // device stream object

    if (argc != 2) {
        printf("Usage: %s xclbin\n", argv[0]);
        return EXIT_FAILURE;
    }

    // Fill our data sets with pattern
    h_data = (cl_uint*)aligned_alloc(MEM_ALIGNMENT,MAX_LENGTH * sizeof(cl_uint*));
    for(cl_uint i = 0; i < MAX_LENGTH; i++) {
        h_data[i]  = i;

    }

    // Get all platforms and then select Xilinx platform
    cl_platform_id platforms[16];       // platform id
    cl_uint platform_count;
    cl_uint platform_found = 0;
    err = clGetPlatformIDs(16, platforms, &platform_count);
    if (err != CL_SUCCESS) {
        printf("ERROR: Failed to find an OpenCL platform!\n");
        printf("ERROR: Test failed\n");
        return EXIT_FAILURE;
    }
    printf("INFO: Found %d platforms\n", platform_count);

    // Find Xilinx Plaftorm
    for (cl_uint iplat=0; iplat<platform_count; iplat++) {
        err = clGetPlatformInfo(platforms[iplat], CL_PLATFORM_VENDOR, 1000, (void *)cl_platform_vendor,NULL);
        if (err != CL_SUCCESS) {
            printf("ERROR: clGetPlatformInfo(CL_PLATFORM_VENDOR) failed!\n");
            printf("ERROR: Test failed\n");
            return EXIT_FAILURE;
        }
        if (strcmp(cl_platform_vendor, "Xilinx") == 0) {
            printf("INFO: Selected platform %d from %s\n", iplat, cl_platform_vendor);
            platform_id = platforms[iplat];
            platform_found = 1;
        }
    }
    if (!platform_found) {
        printf("ERROR: Platform Xilinx not found. Exit.\n");
        return EXIT_FAILURE;
    }

    // Get Accelerator compute device
    cl_uint num_devices;
    cl_uint device_found = 0;
    cl_device_id devices[16];  // compute device id
    char cl_device_name[1001];
    err = clGetDeviceIDs(platform_id, CL_DEVICE_TYPE_ACCELERATOR, 16, devices, &num_devices);
    printf("INFO: Found %d devices\n", num_devices);
    if (err != CL_SUCCESS) {
        printf("ERROR: Failed to create a device group!\n");
        printf("ERROR: Test failed\n");
        return -1;
    }

    //iterate all devices to select the target device.
    for (cl_uint i=0; i<num_devices; i++) {
        err = clGetDeviceInfo(devices[i], CL_DEVICE_NAME, 1024, cl_device_name, 0);
        if (err != CL_SUCCESS) {
            printf("ERROR: Failed to get device name for device %d!\n", i);
            printf("ERROR: Test failed\n");
            return EXIT_FAILURE;
        }
        printf("CL_DEVICE_NAME %s\n", cl_device_name);
        if(strcmp(cl_device_name, target_device_name) == 0) {
            device_id = devices[i];
            device_found = 1;
            printf("Selected %s as the target device\n", cl_device_name);
        }
    }

    if (!device_found) {
        printf("ERROR:Target device %s not found. Exit.\n", target_device_name);
        return EXIT_FAILURE;
    }

    // Create a compute context
    //
    context = clCreateContext(0, 1, &device_id, NULL, NULL, &err);
    if (!context) {
        printf("ERROR: Failed to create a compute context!\n");
        printf("ERROR: Test failed\n");
        return EXIT_FAILURE;
    }

    // Create a command commands
    commands = clCreateCommandQueue(context, device_id, CL_QUEUE_PROFILING_ENABLE | CL_QUEUE_OUT_OF_ORDER_EXEC_MODE_ENABLE, &err);
    if (!commands) {
        printf("ERROR: Failed to create a command commands!\n");
        printf("ERROR: code %i\n",err);
        printf("ERROR: Test failed\n");
        return EXIT_FAILURE;
    }

    cl_int status;

    // Create Program Objects
    // Load binary from disk
    unsigned char *kernelbinary;
    char *xclbin = argv[1];

    //------------------------------------------------------------------------------
    // xclbin
    //------------------------------------------------------------------------------
    printf("INFO: loading xclbin %s\n", xclbin);
    cl_uint n_i0 = load_file_to_memory(xclbin, (char **) &kernelbinary);
    if (n_i0 < 0) {
        printf("ERROR: failed to load kernel from xclbin: %s\n", xclbin);
        printf("ERROR: Test failed\n");
        return EXIT_FAILURE;
    }

    size_t n0 = n_i0;

    // Create the compute program from offline
    program = clCreateProgramWithBinary(context, 1, &device_id, &n0,
                                        (const unsigned char **) &kernelbinary, &status, &err);
    free(kernelbinary);

    if ((!program) || (err!=CL_SUCCESS)) {
        printf("ERROR: Failed to create compute program from binary %d!\n", err);
        printf("ERROR: Test failed\n");
        return EXIT_FAILURE;
    }


    // Create the compute kernel in the program we wish to run
    //
    kernel = clCreateKernel(program, "rtl_kernel_wizard_1", &err);
    if (!kernel || err != CL_SUCCESS) {
        printf("ERROR: Failed to create compute kernel!\n");
        printf("ERROR: Test failed\n");
        return EXIT_FAILURE;
    }

    //--------------Create streaming queues ---------------------------------------------
    //
    cl_mem_ext_ptr_t ext_stream;
    ssize_t sz;
    cl_uint *read_data;

    read_data = (cl_uint *)aligned_alloc(MEM_ALIGNMENT,sizeof(cl_uint)*number_of_words);
    memset(&ext_stream, 0, sizeof(ext_stream));
    ext_stream.param = kernel; 

    ext_stream.flags = 0; // Argument ID of kernel AXI4-Stream master interface mac0_m (write_only.)
    mac0_m_stream = clCreateStream(device_id, CL_STREAM_READ_ONLY, CL_STREAM, &ext_stream, &err);
    if (err != CL_SUCCESS) {
        printf("ERROR: Failed to create stream (clCreateStream) for kernel interface mac0_m (arg 0): %d\n", err);
        printf("ERROR: Test failed\n");
        exit(1);
    }

    ext_stream.flags = 1; // Argument ID of kernel AXI4-Stream slave interface mac0_s (read_only.)
    mac0_s_stream = clCreateStream(device_id, CL_STREAM_WRITE_ONLY, CL_STREAM, &ext_stream, &err);
    if (err != CL_SUCCESS) {
        printf("ERROR: Failed to create stream (clCreateStream) for kernel interface mac0_s (arg 1): %d\n", err);
        printf("ERROR: Test failed\n");
        exit(1);
    }

    ext_stream.flags = 2; // Argument ID of kernel AXI4-Stream master interface mac1_m (write_only.)
    mac1_m_stream = clCreateStream(device_id, CL_STREAM_READ_ONLY, CL_STREAM, &ext_stream, &err);
    if (err != CL_SUCCESS) {
        printf("ERROR: Failed to create stream (clCreateStream) for kernel interface mac1_m (arg 2): %d\n", err);
        printf("ERROR: Test failed\n");
        exit(1);
    }

    ext_stream.flags = 3; // Argument ID of kernel AXI4-Stream slave interface mac1_s (read_only.)
    mac1_s_stream = clCreateStream(device_id, CL_STREAM_WRITE_ONLY, CL_STREAM, &ext_stream, &err);
    if (err != CL_SUCCESS) {
        printf("ERROR: Failed to create stream (clCreateStream) for kernel interface mac1_s (arg 3): %d\n", err);
        printf("ERROR: Test failed\n");
        exit(1);
    }

    cl_stream_xfer_req wr_req;
    wr_req.flags = CL_STREAM_EOT;


    sz = clWriteStream(mac0_s_stream, h_data, sizeof(cl_uint)*number_of_words, &wr_req, &err);

    if (err) {
        printf("ERROR: Failed to write stream mac0_s_stream with h_data: %d\n", err);
        printf("ERROR: Test failed\n");
        exit(1);
    }

    sz = clWriteStream(mac1_s_stream, h_data, sizeof(cl_uint)*number_of_words, &wr_req, &err);

    if (err) {
        printf("ERROR: Failed to write stream mac1_s_stream with h_data: %d\n", err);
        printf("ERROR: Test failed\n");
        exit(1);
    }

    cl_stream_xfer_req rd_req;
    rd_req.flags = CL_STREAM_EOT;

    sz = clReadStream(mac0_m_stream, read_data, sizeof(cl_uint)*number_of_words, &rd_req, &err);
    if (err) {
        printf("ERROR: Failed to read from stream mac0_m_stream into read_data: %ld\n", sz);
        printf("ERROR: Test failed\n");
        exit(1);
    }
    for (cl_uint i = 0; i < number_of_words*1; i++) {
        if ((cl_uint)(h_data[i] + 1) != read_data[i]) {
            printf("ERROR in rtl_kernel_wizard_1::mac0_m_stream - array index %d - input=%d (0x%x), output=%d (0x%x)\n", i, h_data[i], h_data[i], read_data[i], read_data[i]);
            check_status = 1;
        }
    }


    sz = clReadStream(mac1_m_stream, read_data, sizeof(cl_uint)*number_of_words, &rd_req, &err);
    if (err) {
        printf("ERROR: Failed to read from stream mac1_m_stream into read_data: %ld\n", sz);
        printf("ERROR: Test failed\n");
        exit(1);
    }
    for (cl_uint i = 0; i < number_of_words*1; i++) {
        if ((cl_uint)(h_data[i] + 1) != read_data[i]) {
            printf("ERROR in rtl_kernel_wizard_1::mac1_m_stream - array index %d - input=%d (0x%x), output=%d (0x%x)\n", i, h_data[i], h_data[i], read_data[i], read_data[i]);
            check_status = 1;
        }
    }


    //--------------------------------------------------------------------------
    // Shutdown and cleanup
    //-------------------------------------------------------------------------- 
    clReleaseStream(mac0_m_stream);

    clReleaseStream(mac0_s_stream);

    clReleaseStream(mac1_m_stream);

    clReleaseStream(mac1_s_stream);


    free(read_data);



    free(h_data);
    clReleaseProgram(program);
    clReleaseKernel(kernel);
    clReleaseCommandQueue(commands);
    clReleaseContext(context);

    if (check_status) {
        printf("ERROR: Test failed\n");
        return EXIT_FAILURE;
    } else {
        printf("INFO: Test completed successfully.\n");
        return EXIT_SUCCESS;
    }


} // end of main
