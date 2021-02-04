/*
Author: Morag Brown

This is a code snippet that only deals with device selection and other OpenCL setup admin
It does not handle any interaction between the host machine and hardware kernels
As such, this is purely a bit of code that can be use in other projects to take care of device addressing
All other admin (setting up global memory, handling data transfers etc) must still be done according to
the desired application and kernel functionality
*/ 

#include <stdlib.h>
#include <fstream>
#include <iostream>
// Any other includes

// Any definitions go here

int main(int argc, char* argv[]) {

/*-------------------------------------------------------------------------------------

Start of device selection, setup and OpenCL context, command queue and program creation

-------------------------------------------------------------------------------------*/

    // Host application takes 2 command line args: device ID and which xclbin file to use 
    if(argc != 3) {
		std::cout << "Usage: " << argv[0] << " <device ID> <xclbin>" << std::endl;
		return EXIT_FAILURE;
	}

    // Select which device and xclbin file to use from appropriate args
    int deviceID = std::stoi(argv[1]);
    char* xclbinFilename = argv[2];

    // Create OpenCL devices and platform vectors
    // Create OpenCL device of type Device
    // A platform is a vendor specific OpenCL implementation
    // Devices are the actual hardware available within a platform
    std::vector<cl::Device> devices;
    cl::Device device;
    std::vector<cl::Platform> platforms;
    bool found_device = false;


    // Go through all Platforms and Devices to find Xilinx specific Platform
    // and targeted device
    // [Note: from what I can tell, building using Vitis makes the application
    // Xilinx specific by default (as in other platforms (eg NVIDIA) won't show up
    // even if trying to list all platforms and not just Xilinx)
    // But I could be wrong]
    cl::Platform::get(&platforms);
    for(size_t i = 0; (i < platforms.size() ) & (found_device == false) ;i++){
        cl::Platform platform = platforms[i];
        std::string platformName = platform.getInfo<CL_PLATFORM_NAME>();
        if ( platformName == "Xilinx"){
            devices.clear();
            platform.getDevices(CL_DEVICE_TYPE_ACCELERATOR, &devices);
	    if (devices.size()){
	    	// List all available devices
	        int device_id = 0;
	        for(cl::Device device: devices){
	            std::cout << "\tDevice " << device_id++ << ": " << std::endl;
	            std::cout << "\t\tDevice Name: " << device.getInfo<CL_DEVICE_NAME>() << std::endl;
	        }
                // Select targeted device as specified by device ID command line arg
		device = devices[deviceID];
		found_device = true;
		std::cout << "Using Device " << deviceID << ": " << device.getInfo<CL_DEVICE_NAME>() << "\n";
		break;
	    }
        }
    }
    if (found_device == false){
       std::cout << "Error: Unable to find Target Device "
           << device.getInfo<CL_DEVICE_NAME>() << std::endl;
       return EXIT_FAILURE;
    }

    // Create Context and Command Queue for selected device
    // - A context contains one or more devices (in this case only one device)
    // - A command queue manages execution of kernels on the devices within the context
    cl::Context context(device);
    cl::CommandQueue q(context, device, CL_QUEUE_PROFILING_ENABLE);

    // Load specified xclbin file containing kernel/s into a buffer array
    std::cout << "Loading: " << xclbinFilename << " onto device: " << device.getInfo<CL_DEVICE_NAME>() << " \n";
    std::ifstream bin_file(xclbinFilename, std::ifstream::binary);
    bin_file.seekg (0, bin_file.end);
    unsigned nb = bin_file.tellg();
    bin_file.seekg (0, bin_file.beg);
    char *buf = new char [nb];
    bin_file.read(buf, nb);

    // Append the above buffer and its length to the binary object "bins"
    cl::Program::Binaries bins;
    bins.push_back({buf,nb});

    // Program created for a valid context, a vector list of devices and a per-device list of binaries
    // In this case only one device is in the vector, and only one binary object is needed
    devices = {device};    // reusing the device vector from above and populating with only desired device
    cl::Program program(context, {device}, bins);

/*-------------------------------------------------------------------------------------

End of device selection, setup and OpenCL context, command queue and program creation

-------------------------------------------------------------------------------------*/





/*-------------------------------------------------------------------------------------

All other kernel, memory and data transfer management must now be done:
    - Calling kernel object from program
    - Allocating device memory via buffer objects
    - Setting kernel arguments to buffers mentioned above
    - Mapping buffers to pointers accessible by host application
    - Populating pointers with input data
    - Migrating input data to device buffers
    - Launching the kernel
    - Retrieving kernel execution output buffer 
    - Verifying the result
    - Unmapping the buffers and finish the command queue

-------------------------------------------------------------------------------------*/


}
