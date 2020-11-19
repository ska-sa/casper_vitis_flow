# This is a generated file. Use and modify at your own risk.
################################################################################

# Usage: Custom kernel level constraints can be added to this file.


# Example multicycle constraint on reset to inst_example:
# Multicycle paths can be used on the reset register to help with timing closure on designs with
# high reset fanouts.  To ensure the reset register is not optimized out, add a DONT_TOUCH = "yes"
# or KEEP = "yes" attribute to the register inside the RTL code.
# set_multicycle_path -setup 3 -hold 2 [get_cells inst_example/areset_reg]

create_clock -period 6.206 [get_ports refclk_gt_p]
set_property PACKAGE_PIN N37 [get_ports refclk_gt_n]
set_property PACKAGE_PIN N36 [get_ports refclk_gt_p]

## QSPF28_4 reset:
##
#set_property PACKAGE_PIN E33 [get_ports qsfp28_rst_n]
#set_property IOSTANDARD LVCMOS18 [get_ports qsfp28_rst_n]

## QSPF28_1 lane 0:
##
set_property PACKAGE_PIN J45 [get_ports qsfp28_rx_p[0]]
set_property PACKAGE_PIN J46 [get_ports qsfp28_rx_n[0]]
set_property PACKAGE_PIN D42 [get_ports qsfp28_tx_p[0]]
set_property PACKAGE_PIN D43 [get_ports qsfp28_tx_n[0]]

## QSPF28_1 lane 1:
##
set_property PACKAGE_PIN G45 [get_ports qsfp28_rx_p[1]]
set_property PACKAGE_PIN G46 [get_ports qsfp28_rx_n[1]]
set_property PACKAGE_PIN C40 [get_ports qsfp28_tx_p[1]]
set_property PACKAGE_PIN C41 [get_ports qsfp28_tx_n[1]]

## QSPF28_2 lane 2:
##
set_property PACKAGE_PIN F43 [get_ports qsfp28_rx_p[2]]
set_property PACKAGE_PIN F44 [get_ports qsfp28_rx_n[2]]
set_property PACKAGE_PIN B42 [get_ports qsfp28_tx_p[2]]
set_property PACKAGE_PIN B43 [get_ports qsfp28_tx_n[2]]

## QSPF28_2 lane 3:
##
set_property PACKAGE_PIN E45 [get_ports qsfp28_rx_p[3]]
set_property PACKAGE_PIN E46 [get_ports qsfp28_rx_n[3]]
set_property PACKAGE_PIN A40 [get_ports qsfp28_tx_p[3]]
set_property PACKAGE_PIN A41 [get_ports qsfp28_tx_n[3]]
