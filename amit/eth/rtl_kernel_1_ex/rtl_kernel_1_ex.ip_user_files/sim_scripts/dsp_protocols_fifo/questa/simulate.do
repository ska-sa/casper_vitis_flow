onbreak {quit -f}
onerror {quit -f}

vsim -lib xil_defaultlib dsp_protocols_fifo_opt

do {wave.do}

view wave
view structure
view signals

do {dsp_protocols_fifo.udo}

run -all

quit -force
