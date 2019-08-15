`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.09.2018 08:25:29
// Design Name: 
// Module Name: full_adder
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

module full_adder(output cout,
                  output sum,
                  input ain,
                  input bin,
                  input cin);
                  
        assign sum = ain^bin^cin;
        assign cout = (ain&bin) | (ain&cin) | (bin&cin);
                 
endmodule
