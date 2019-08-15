`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.09.2018 09:34:44
// Design Name: 
// Module Name: 7seg
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


module seven_seg(input[6:0]bin, output reg [7:0] display);
    
    always@(*)
    casex(bin)
    7'b1000000: display = 8'b00000011;
    7'b1000001: display = 8'b10011111;
    7'b1000010: display = 8'b00100101;
    7'b1000011: display = 8'b00001101;
    7'b1000100: display = 8'b10011001;
    7'b1000101: display = 8'b01001001;
    7'b1000110: display = 8'b01000001;
    7'b1000111: display = 8'b00011111;
    7'b1001000: display = 8'b00000001;
    7'b1001001: display = 8'b00001001;
    7'b1001010: display = 8'b00010001;
    7'b1001011: display = 8'b11000001;
    7'b1001100: display = 8'b01100011;
    7'b1001101: display = 8'b10000101;
    7'b1001110: display = 8'b01100001;
    7'b1001111: display = 8'b01110001;
    7'b000xxxx: display = 8'b00010001;   //A
    7'b001xxxx: display = 8'b10000011;   //U
    7'b010xxxx: display = 8'b00000011;   //O
    7'b011xxxx: display = 8'b11100011;   //L
    default: display = 8'b11111101;
    endcase
    
endmodule
