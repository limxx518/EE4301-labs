`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.11.2018 08:23:43
// Design Name: 
// Module Name: Datapath
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


module Datapath(input[4:0]counter, input[2:0]buttons, input[7:0] switch, input load, reset, store, move, clk, output reg[7:0] cathodes, output reg[3:0] anodes);
    
    reg[7:0] memory [0:23];
    reg [4:0] index = 0, move_index = 5'b11110;
    wire control, pulse;
    wire[1:0] count;
    reg [23:0]valid = 0;
    wire[23:0] w1, w2, w3;
    
    integer i;
    initial begin
    for(i=0; i<24; i=i+1)
        memory[i] = 8'b11111111;
    end
    
    clock_divider #(200000) CTRL (.cin(clk), .cout(control));
    counter COUNT (.signal_in(control), .signal_out(count));
    clock_divider #(50000000) CTRL2 (.cin(clk), .cout(pulse));
    
    always@(posedge clk)
    case({reset,store})
    2'b01: begin
           memory[index] <= switch;
           valid[index] <= 1'b1;
           end
    2'b10: begin
           valid <= 24'b0;
           end
    endcase
    
    always@(posedge clk)
    case(count)
    2'b00: if(move)begin
           anodes <= 4'b0111;
           if(valid[move_index])cathodes <= memory[move_index];
           else cathodes <= 8'b11111111;
           end
           else if(load)begin
           anodes <= 4'b0111;
           cathodes <= 8'b11000111;   //L
           end
           else if (buttons[0])begin
           anodes <= 4'b0111;
           cathodes <= 8'b11000000;   //O
           end
           else anodes <= 4'b1111;
   2'b01: begin
          if(move)begin
          anodes <= 4'b1011;
          if(valid[w1]) cathodes <= memory[w1];
          else cathodes <= 8'b11111111;
          end
          else anodes <= 4'b1111;end
   2'b10: begin
          if(move)begin
          anodes <= 4'b1101;
          if(valid[w2])cathodes <= memory[w2];
          else cathodes <= 8'b11111111;
          end           
          else anodes <= 4'b1111;
          end
   2'b11: if(move)begin
          anodes <= 4'b1110;
          if(valid[w3]) cathodes <= memory[w3];
          else cathodes <= 8'b11111111;
          end
          else if (load) begin
          anodes <= 4'b1110;
          cathodes <= switch;
          end
          else if(store) begin
          anodes <= 4'b1110;
          cathodes <= memory[index];
          end
          else anodes <= 4'b1111;
   endcase
   
    assign w1 = (move_index+1'b1)%(counter+4);
    assign w2 = (move_index+2)%(counter+4);
    assign w3 = (move_index+3)%(counter+4);
    
    always@(posedge pulse)
        if(reset) move_index <= 5'b0;
        else if(move) move_index <= (move_index+1'b1)%(counter+4);
        
    always@(negedge clk)
        if(store) index <= (index+1)%(counter+4);
        else if(reset) index <= 5'b0;
endmodule
