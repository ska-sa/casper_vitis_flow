Files related to Vitis toolflow

XRT: 2.8.743
Vitis Version: 2020.2

Directory Structure  
platform  

-eth (sample project for ethernet)  

--src (files for host as well as platform/rtl kernels etc)  
---vitis_rtl_kernel  
----rtl_kernel (contains host file for given rtl kernel)  

--rtl_kernel_wizard_0 (vivado kernel project)   
---src (file related to kernel including generating block diagram for cmac/upd core)  
---rtl_kernel_wizard_0_ex (vivado rtl kernel project)
----imports (vivado kernel files)
----exports (vivado packaged rtl kernel xo files)  
----rtl_kernel_wizard_0 (packaged ip used in rtl kernel)

--rtl_kernel_wizard_1
---src (file to generate rtl kernel)
---rtl_kernel_wizard_1_ex (vivado rtl kernel project)
---hls_kernels (all hls kernels)
----src (hls kernel sources)

