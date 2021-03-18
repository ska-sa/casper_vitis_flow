onbreak {quit -force}
onerror {quit -force}

asim +access +r +m+axi_cdma_0 -L xilinx_vip -L xpm -L lib_pkg_v1_0_2 -L lib_srl_fifo_v1_0_2 -L fifo_generator_v13_2_5 -L lib_fifo_v1_0_14 -L lib_cdc_v1_0_2 -L axi_datamover_v5_1_23 -L axi_sg_v4_1_13 -L axi_cdma_v4_1_21 -L xil_defaultlib -L xilinx_vip -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.axi_cdma_0 xil_defaultlib.glbl

do {wave.do}

view wave
view structure

do {axi_cdma_0.udo}

run -all

endsim

quit -force
