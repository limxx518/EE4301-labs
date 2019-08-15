`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.10.2018 09:15:25
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


module Datapath(input roll, win, lose, clk, reset, base, input[7:0] seed, output[7:0] out, output[3:0] sum, output reg[3:0] ctrl);

    wire[7:0] q;
    reg[6:0] in;
    wire cout, control;
    wire[1:0] count;
    wire[3:0] led1, led2;
       
    lfsr RAND (.seed(seed), .clk(cout), .reset(reset), .q(q), .roll(roll));
    seven_seg DISPLAY (.bin(in), .display(out));
    clock_divider CLKDIV1 (.cin(clk), .cout(cout));
    clock_divider #(200000) CTRL (.cin(clk), .cout(control));
    counter COUNT (.signal_in(control), .signal_out(count));
    
    assign sum = led1 + led2;
    assign led1 = q[3:0]%6 + 1;
    assign led2 = q[7:4]%6 + 1;
    
    always@(posedge clk)begin
    case(count)
    2'b00, 2'b11 : begin 
                   if(base)in <= 7'b1111111;  //force default state in 7seg
                   else in <= {3'b1xx, led1};
                   ctrl <= 4'b1110;
                   end
    2'b01: begin
           if(base)in <= 7'b1111111;   //force default state in 7seg         
           else in <= {3'b1xx, led2};
           ctrl <= 4'b1101;
           end
    2'b10: begin
           ctrl <= 4'b1011;           
           if(win) in <= 7'b001xxxx;        //U
           else if(lose) in <= 7'b011xxxx;  //L
           else if(base) in <= 7'b1000000; //0
           else in <= 7'b000xxxx;           //A
           end
     default: begin
              ctrl <= 4'b1011;
              in <= 7'b1000000;
              end
    endcase
    end
endmodule
