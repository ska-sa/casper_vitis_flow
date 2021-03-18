onbreak {quit -f}
onerror {quit -f}

vsim -lib xil_defaultlib dsp_init_clk_pll_opt

do {wave.do}

view wave
view structure
view signals

do {dsp_init_clk_pll.udo}

run -all

quit -force
