`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.11.2018 15:36:23
// Design Name: 
// Module Name: top
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


module top(input load, cycle, clk, input[15:0] angle, output[3:0]anode, output[7:0]display);

    wire enter, iterate, readROM;
    wire[3:0] iteration;
    wire[4:0] cycles; 
    
    Control CTRL (.load(load), .cycle(cycle), .clk(clk), .Enter(enter), .cycles(cycles), .readROM(readROM),
                  .Iterate(iterate), .iteration(iteration));
    Datapath PATH (.angle(angle), .iteration(iteration), .clk(clk), .enter(enter), .readROM(readROM),
                   .iterate(iterate), .display(display), .anode(anode), .cycles(cycles));

endmodule
