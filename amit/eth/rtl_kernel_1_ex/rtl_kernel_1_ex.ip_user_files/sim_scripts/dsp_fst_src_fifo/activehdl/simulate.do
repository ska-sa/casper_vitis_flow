onbreak {quit -force}
onerror {quit -force}

asim +access +r +m+dsp_fst_src_fifo -L xilinx_vip -L xpm -L xil_defaultlib -L xilinx_vip -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.dsp_fst_src_fifo xil_defaultlib.glbl

do {wave.do}

view wave
view structure

do {dsp_fst_src_fifo.udo}

run -all

endsim

quit -force
