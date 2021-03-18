# This is a generated file. Use and modify at your own risk.
################################################################################

open_project prj
open_solution sol
set_part  xcu50-fsvh2104-2-e
add_files ../rtl_kernel_1_cmodel.cpp
set_top rtl_kernel_1
config_sdx -optimization_level none -target xocc
config_rtl -auto_prefix=0
csynth_design
exit

