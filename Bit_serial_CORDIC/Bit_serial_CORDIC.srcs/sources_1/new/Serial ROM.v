`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.11.2018 13:07:18
// Design Name: 
// Module Name: Serial ROM
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


module Serial_ROM(input clk, readROM, input[3:0] iteration, input[4:0] Cycles, 
                  output reg bits);

    reg[15:0] tan_rom [0:15];
    //reg[15:0]temp;
    
    initial begin    
    tan_rom[0] = 16'b0011001001000011;  
    tan_rom[1] = 16'b0001110110101100;   
    tan_rom[2] = 16'b0000111110101101;   
    tan_rom[3] = 16'b0000011111110101;  
    tan_rom[4] = 16'b0000001111111110;
    tan_rom[5] = 16'b0000000111111111;
    tan_rom[6] = 16'b0000000011111111;
    tan_rom[7] = 16'b0000000001111111; 
    tan_rom[8] = 16'b0000000000111111;
    tan_rom[9] = 16'b0000000000011111;
    tan_rom[10] = 16'b0000000000001111;
    tan_rom[11] = 16'b0000000000000111;
    tan_rom[12] = 16'b0000000000000011;
    tan_rom[13] = 16'b0000000000000001;
    tan_rom[14] = 16'b0000000000000000; 
    tan_rom[15] = 16'b0000000000000000;    
    end    
    
    always@(posedge clk)
    if(readROM)bits <= tan_rom[iteration][Cycles];
    
endmodule
