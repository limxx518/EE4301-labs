`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.11.2018 10:05:38
// Design Name: 
// Module Name: CORDIC_tb
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


module CORDIC_tb();

    reg load, cycle, clk;
    reg[15:0] angle;
    
    wire[3:0]anode;
    wire[7:0]display;
    
    top DUT (.load(load), .cycle(cycle), .clk(clk), .angle(angle), .anode(anode),
             .display(display));
             
    always begin
                 clk <= 1; #1; clk <= 0; #1;
                 end
                 
        
     initial begin
     #50;
     #40 load = 1'b1; angle = 16'h011e;
     #40 load = 1'b0; cycle = 1'b1;
     #40 load = 1'b0; cycle = 1'b0;
     #40 load = 1'b0; cycle = 1'b1;
     #40 load = 1'b0; cycle = 1'b0;
     #40 load = 1'b0; cycle = 1'b1;
     #40 load = 1'b0; cycle = 1'b0;
     #40 load = 1'b0; cycle = 1'b1;
     #40 load = 1'b0; cycle = 1'b0;
     #40 load = 1'b0; cycle = 1'b1;
     #40 load = 1'b0; cycle = 1'b0;
     #40 load = 1'b0; cycle = 1'b1;
     #40 load = 1'b0; cycle = 1'b0;
     #40 load = 1'b0; cycle = 1'b1;
     #40 load = 1'b0; cycle = 1'b0;
     #40 load = 1'b0; cycle = 1'b1;
     #40 load = 1'b0; cycle = 1'b0;
     #40 load = 1'b0; cycle = 1'b1;
     #40 load = 1'b0; cycle = 1'b0;
     #40 load = 1'b0; cycle = 1'b1;
     #40 load = 1'b0; cycle = 1'b0;
     #40 load = 1'b0; cycle = 1'b1;
     #40 load = 1'b0; cycle = 1'b0;
     #40 load = 1'b0; cycle = 1'b1;
     #40 load = 1'b0; cycle = 1'b0;
     #40 load = 1'b0; cycle = 1'b1;
     #40 load = 1'b0; cycle = 1'b0;
     #40 load = 1'b0; cycle = 1'b1;
     #40 load = 1'b0; cycle = 1'b0;
     #40 load = 1'b0; cycle = 1'b1;
     #40 load = 1'b0; cycle = 1'b0;
     end
     endmodule
