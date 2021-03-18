onbreak {quit -f}
onerror {quit -f}

vsim -lib xil_defaultlib control_rtl_kernel_1_vip_opt

do {wave.do}

view wave
view structure
view signals

do {control_rtl_kernel_1_vip.udo}

run -all

quit -force
