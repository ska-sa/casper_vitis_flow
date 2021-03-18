onbreak {quit -force}
onerror {quit -force}

asim +access +r +m+dsp_init_clk_pll -L xilinx_vip -L xpm -L xil_defaultlib -L xilinx_vip -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.dsp_init_clk_pll xil_defaultlib.glbl

do {wave.do}

view wave
view structure

do {dsp_init_clk_pll.udo}

run -all

endsim

quit -force
