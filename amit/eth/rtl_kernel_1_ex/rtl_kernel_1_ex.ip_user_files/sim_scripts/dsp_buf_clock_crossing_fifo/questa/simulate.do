onbreak {quit -f}
onerror {quit -f}

vsim -lib xil_defaultlib dsp_buf_clock_crossing_fifo_opt

do {wave.do}

view wave
view structure
view signals

do {dsp_buf_clock_crossing_fifo.udo}

run -all

quit -force
