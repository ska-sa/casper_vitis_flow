Compilation Commands:

Host Code:
Source Vitis
`source /opt/Xilinx/Vitis/2020.1/settings64.sh`  

Compile  
`g++ -o "rtl_2" src/vitis_rtl_kernel/rtl_kernel_1/host_example.o -lxilinxopencl -lpthread -lrt -lstdc++ -lmpfr -lgmp -lhlsmc++-GCC46 -lIp_floating_point_v7_0_bitacc_cmodel -lIp_xfft_v9_1_bitacc_cmodel -lIp_fir_compiler_v7_2_bitacc_cmodel -lIp_dds_compiler_v6_0_bitacc_cmodel -L/opt/xilinx/xrt/lib/ -L/opt/Xilinx/Vivado/2020.1/lnx64/tools/fpo_v7_0 -L/opt/Xilinx/Vivado/2020.1/lnx64/lib/csim -L/opt/Xilinx/Vivado/2020.1/lnx64/tools/dds_v6_0 -L/opt/Xilinx/Vivado/2020.1/lnx64/tools/fir_v7_0 -L/opt/Xilinx/Vivado/2020.1/lnx64/tools/fft_v9_1 -Wl,-rpath-link,/opt/xilinx/xrt/lib -Wl,-rpath,/opt/Xilinx/Vivado/2020.1/lnx64/lib/csim -Wl,-rpath,/opt/Xilinx/Vivado/2020.1/lnx64/tools/fpo_v7_0 -Wl,-rpath,/opt/Xilinx/Vivado/2020.1/lnx64/tools/fft_v9_1 -Wl,-rpath,/opt/Xilinx/Vivado/2020.1/lnx64/tools/fir_v7_0 -Wl,-rpath,/opt/Xilinx/Vivado/2020.1/lnx64/tools/dds_v6_0
/opt/Xilinx/Vitis/2020.1/bin/v++ --package --config package.cfg binary_container_1.xclbin`  

Export platform path:  
`export XPFM=/opt/xilinx/platforms/xilinx_u50_gen3x16_xdma_201920_3/xilinx_u50_gen3x16_xdma_201920_3.xpfm`  

Generate Hardware Files, optional: including an example to include already routed vivado kernel:  
`v++ -l -t hw -o rtl_kernel_1.xclbin -f $XPFM rtl_kernel_1.xo --config u50.ini --jobs 16 --reuse_impl binary_container_1.build/link/vivado/vpl/prj/prj.runs/impl_1/level0_wrapper_routed.dcp`  

Run on the card:  
`./rtl_kernel_xclbin`  
