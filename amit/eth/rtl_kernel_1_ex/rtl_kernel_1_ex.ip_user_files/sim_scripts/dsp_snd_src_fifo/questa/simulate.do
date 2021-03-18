onbreak {quit -f}
onerror {quit -f}

vsim -lib xil_defaultlib dsp_snd_src_fifo_opt

do {wave.do}

view wave
view structure
view signals

do {dsp_snd_src_fifo.udo}

run -all

quit -force
