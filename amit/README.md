Files related to Vitis toolflow

Platform/Shell: xilinx_u50_gen3x16_xdma_201920_3

XRT Version: 2.6.655
Vitis Version: 2020.1

Directory Structure  
platform  

-eth (sample project for ethernet)  

--src (files for host as well as platform/rtl kernels etc)  
---vitis_rtl_kernel  
----rtl_kernel (contains host file for given rtl kernel)  

--rtl_kernel_1_ex (vivado kernel project)   
---imports (file to package the ip into xo file)  
---rtl_kernel_1 (ip wrapper for ethernet)  
