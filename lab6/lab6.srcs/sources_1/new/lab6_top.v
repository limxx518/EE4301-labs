`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.10.2018 12:36:09
// Design Name: 
// Module Name: lab6_top
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


module lab6_top(input Rb, reset, clk, input[7:0] seed, output[7:0] out, output[3:0] ctrl);

    wire[3:0] sum;
    wire roll, win, lose, base;
    
    Control CONTROL (.Rb(Rb), .reset(reset), .clk(clk), .sum(sum), .roll(roll), .win(win), .lose(lose), .base(base));
    Datapath PATH (.reset(reset), .base(base), .roll(roll), .win(win), .lose(lose), .clk(clk), .seed(seed), .out(out), .sum(sum), .ctrl(ctrl));
    
endmodule
