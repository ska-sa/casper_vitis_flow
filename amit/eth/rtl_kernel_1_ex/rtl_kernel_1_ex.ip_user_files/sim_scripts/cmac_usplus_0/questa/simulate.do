onbreak {quit -f}
onerror {quit -f}

vsim -lib xil_defaultlib cmac_usplus_0_opt

do {wave.do}

view wave
view structure
view signals

do {cmac_usplus_0.udo}

run -all

quit -force
