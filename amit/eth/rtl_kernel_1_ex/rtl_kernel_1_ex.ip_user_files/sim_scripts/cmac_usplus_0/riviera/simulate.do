onbreak {quit -force}
onerror {quit -force}

asim +access +r +m+cmac_usplus_0 -L xilinx_vip -L xpm -L xilinx_vip -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.cmac_usplus_0 xil_defaultlib.glbl

do {wave.do}

view wave
view structure

do {cmac_usplus_0.udo}

run -all

endsim

quit -force
