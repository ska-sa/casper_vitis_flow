Compilation Commands:

Host Code:  
Source Vitis
`source /opt/Xilinx/Vitis/2020.1/settings64.sh`  

Source XRT  
`source /opt/xilinx/xrt/setup.sh`  

Compile  
`g++ -Wall -g -std=c++11 host_example.cpp -o app.exe -I${XILINX_XRT}/include/ -L${XILINX_XRT}/lib/ -lOpenCL -lpthread -lrt -lstdc++ `    

Export platform path:  
`export XPFM=/opt/xilinx/platforms/xilinx_u50_gen3x16_xdma_201920_3/xilinx_u50_gen3x16_xdma_201920_3.xpfm`  

Generate Hardware Files, optional: including an example to include already routed vivado kernel:  
`v++ -l -t hw -o rtl_kernel_1.xclbin -f $XPFM rtl_kernel_1.xo --config u50.ini --jobs 16 --reuse_impl binary_container_1.build/link/vivado/vpl/prj/prj.runs/impl_1/level0_wrapper_routed.dcp`  

Run on the card:  
`./rtl_kernel_xclbin` or `./app.exe`  
