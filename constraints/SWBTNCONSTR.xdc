# Clock signal
set_property -dict { PACKAGE_PIN U18 IOSTANDARD LVCMOS33 } [get_ports { clk }];

# Reset Button
set_property -dict {PACKAGE_PIN V15 IOSTANDARD LVCMOS33 } [get_ports { rst }];

# Switches
set_property -dict { PACKAGE_PIN W19 IOSTANDARD LVCMOS33 } [get_ports { sw[1] }]; #LSB 0
set_property -dict { PACKAGE_PIN N17 IOSTANDARD LVCMOS33 } [get_ports { sw[2] }]; # 1
set_property -dict { PACKAGE_PIN P18 IOSTANDARD LVCMOS33 } [get_ports { sw[3] }]; # 2
set_property -dict { PACKAGE_PIN P15 IOSTANDARD LVCMOS33 } [get_ports { sw[0] }]; #MSB 3

# LEDs
set_property -dict { PACKAGE_PIN R16 IOSTANDARD LVCMOS33 } [get_ports { led[3] }]; #LSB 0
set_property -dict { PACKAGE_PIN R17 IOSTANDARD LVCMOS33 } [get_ports { led[2] }]; #1
set_property -dict { PACKAGE_PIN T17 IOSTANDARD LVCMOS33 } [get_ports { led[1] }]; #2
set_property -dict { PACKAGE_PIN R18 IOSTANDARD LVCMOS33 } [get_ports { led[0] }]; #MSB 3