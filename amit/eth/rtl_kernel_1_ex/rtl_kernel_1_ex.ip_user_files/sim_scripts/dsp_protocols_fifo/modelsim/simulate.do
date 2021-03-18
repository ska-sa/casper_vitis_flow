onbreak {quit -f}
onerror {quit -f}

vsim -voptargs="+acc" -L xilinx_vip -L xpm -L xil_defaultlib -L xilinx_vip -L unisims_ver -L unimacro_ver -L secureip -lib xil_defaultlib xil_defaultlib.dsp_protocols_fifo xil_defaultlib.glbl

do {wave.do}

view wave
view structure
view signals

do {dsp_protocols_fifo.udo}

run -all

quit -force
