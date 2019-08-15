# contraints file (.xdc file) for lab 4

# Clock signal
set_property PACKAGE_PIN W5 [get_ports clk]
    set_property IOSTANDARD LVCMOS33 [get_ports clk]

create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports clk]

# leds
#set_property PACKAGE_PIN U16 [get_ports {qin[0]}]
#    set_property IOSTANDARD LVCMOS33 [get_ports {qin[0]}]
#set_property PACKAGE_PIN E19 [get_ports {qin[1]}]
#    set_property IOSTANDARD LVCMOS33 [get_ports {qin[1]}]
#set_property PACKAGE_PIN U19 [get_ports {qin[2]}]
#    set_property IOSTANDARD LVCMOS33 [get_ports {qin[2]}]
#set_property PACKAGE_PIN V19 [get_ports {qin[3]}]
#    set_property IOSTANDARD LVCMOS33 [get_ports {qin[3]}]
#set_property PACKAGE_PIN W18 [get_ports {qin[4]}]
#    set_property IOSTANDARD LVCMOS33 [get_ports {qin[4]}]
#set_property PACKAGE_PIN U15 [get_ports {qin[5]}]
#    set_property IOSTANDARD LVCMOS33 [get_ports {qin[5]}]
#set_property PACKAGE_PIN U14 [get_ports {qin[6]}]
#    set_property IOSTANDARD LVCMOS33 [get_ports {qin[6]}]
#set_property PACKAGE_PIN V14 [get_ports {qin[7]}]
#    set_property IOSTANDARD LVCMOS33 [get_ports {qin[7]}]

#Buttons
set_property PACKAGE_PIN T17 [get_ports buttons[0]]
    set_property IOSTANDARD LVCMOS33 [get_ports buttons[0]]
set_property PACKAGE_PIN U18 [get_ports buttons[1]]
    set_property IOSTANDARD LVCMOS33 [get_ports buttons[1]]
set_property PACKAGE_PIN W19 [get_ports buttons[2]]
    set_property IOSTANDARD LVCMOS33 [get_ports buttons[2]]    

#7-seg display
set_property PACKAGE_PIN W7 [get_ports {cathode[0]}]                    
   set_property IOSTANDARD LVCMOS33 [get_ports {cathode[0]}]
set_property PACKAGE_PIN W6 [get_ports {cathode[1]}]                    
   set_property IOSTANDARD LVCMOS33 [get_ports {cathode[1]}]
set_property PACKAGE_PIN U8 [get_ports {cathode[2]}]                    
   set_property IOSTANDARD LVCMOS33 [get_ports {cathode[2]}]
set_property PACKAGE_PIN V8 [get_ports {cathode[3]}]                    
   set_property IOSTANDARD LVCMOS33 [get_ports {cathode[3]}]
set_property PACKAGE_PIN U5 [get_ports {cathode[4]}]                    
   set_property IOSTANDARD LVCMOS33 [get_ports {cathode[4]}]
set_property PACKAGE_PIN V5 [get_ports {cathode[5]}]                    
   set_property IOSTANDARD LVCMOS33 [get_ports {cathode[5]}]
set_property PACKAGE_PIN U7 [get_ports {cathode[6]}]                    
   set_property IOSTANDARD LVCMOS33 [get_ports {cathode[6]}]
set_property PACKAGE_PIN V7 [get_ports {cathode[7]} ]
   set_property IOSTANDARD LVCMOS33 [get_ports {cathode[7]} ]
set_property PACKAGE_PIN U2 [get_ports {anode[0]} ]
    set_property IOSTANDARD LVCMOS33 [get_ports {anode[0]}]
set_property PACKAGE_PIN U4 [get_ports {anode[1]} ]
    set_property IOSTANDARD LVCMOS33 [get_ports {anode[1]}]
set_property PACKAGE_PIN V4 [get_ports {anode[2]} ]
    set_property IOSTANDARD LVCMOS33 [get_ports {anode[2]} ]
set_property PACKAGE_PIN W4 [get_ports {anode[3]} ]
    set_property IOSTANDARD LVCMOS33 [get_ports {anode[3]} ]
   
#Switches
set_property PACKAGE_PIN V17 [get_ports {switch[7]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {switch[7]}]
set_property PACKAGE_PIN V16 [get_ports {switch[6]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {switch[6]}]
set_property PACKAGE_PIN W16 [get_ports {switch[5]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {switch[5]}]
set_property PACKAGE_PIN W17 [get_ports {switch[4]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {switch[4]}]
set_property PACKAGE_PIN W15 [get_ports {switch[3]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {switch[3]}]
set_property PACKAGE_PIN V15 [get_ports {switch[2]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {switch[2]}]
set_property PACKAGE_PIN W14 [get_ports {switch[1]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {switch[1]}]
set_property PACKAGE_PIN W13 [get_ports {switch[0]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {switch[0]}]