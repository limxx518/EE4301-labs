`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.11.2018 20:18:06
// Design Name: 
// Module Name: lab7_top
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module lab7_top(input[2:0] buttons,input clk,input[7:0] switch,output [7:0] cathode, output [3:0] anode);

    wire load, store, reset, move;
    wire [4:0] c;
    
    Control CONTROL(.buttons(buttons), .clk(clk), .load(load), .store(store), .reset(reset), .move(move), .tally(c));
    Datapath PATH(.buttons(buttons),.clk(clk), .load(load), .store(store), .reset(reset), .move(move), .switch(switch), .anodes(anode), .cathodes(cathode), .counter(c));
    
endmodule
