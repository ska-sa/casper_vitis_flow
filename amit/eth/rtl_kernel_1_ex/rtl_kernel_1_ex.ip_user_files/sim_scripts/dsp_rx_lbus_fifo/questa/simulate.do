onbreak {quit -f}
onerror {quit -f}

vsim -lib xil_defaultlib dsp_rx_lbus_fifo_opt

do {wave.do}

view wave
view structure
view signals

do {dsp_rx_lbus_fifo.udo}

run -all

quit -force
