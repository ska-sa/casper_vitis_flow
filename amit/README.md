Files related to Vitis toolflow

Directory Structure
platform
-application
--Emulation-HW (Platform emulation)
--Emulation-SW (Software simulation only)
--Hardware (Build for specific platform, e.g. u50)
--src (files for host as well as platform/rtl kernels etc)
---vitis_rtl_kernel
----rtl_kernel (contains host file for given rtl kernel)
