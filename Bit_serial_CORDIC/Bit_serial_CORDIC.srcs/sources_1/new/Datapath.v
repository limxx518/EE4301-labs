`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.11.2018 14:17:22
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


module Datapath(input[15:0]angle, input[3:0]iteration, input[4:0]cycles, input clk, enter,
                iterate, readROM, output[7:0] display, output reg[3:0]anode);             

    reg[15:0] x = 16'b0010011011011101;
    reg[15:0] y = 16'b0000000000000000;
    reg[15:0] z;
    reg storeX, storeY;
    reg gated_x = 1'b0, gated_y = 1'b0, gated_z = 1'b0;
    reg d;
    
    wire bits;
    wire cout_x, cout_y, cout_z;
    wire bin_x1, bin_x2, bin_y1, bin_y2; 
    wire final_bin_x, final_bin_y;
    wire sum_x, sum_y, sum_z;
    wire signal;
    wire[1:0] ctrl;
    wire[4:0] flag;
    reg[3:0]cathode;
    
    Serial_ROM ROM (.clk(clk), .readROM(readROM), .iteration(iteration), .Cycles(cycles), .bits(bits));
    clock_divider  #(200000) CLKDIV (.cin(clk), .cout(signal));
    counter COUNT (.signal_in(signal), .signal_out(ctrl));
    seven_seg DISPLAY (.bin(cathode), .display(display));
    
    full_adder FA_X(.ain(x[0]), .bin(final_bin_x), .cin(gated_x), .sum(sum_x), .cout(cout_x));
    full_adder FA_Y(.ain(y[0]), .bin(final_bin_y), .cin(gated_y), .sum(sum_y), .cout(cout_y));
    full_adder FA_Z(.ain(z[0]), .bin(bits^d), .cin(gated_z), .sum(sum_z), .cout(cout_z));
    
    always@(posedge clk)begin
    if (enter)begin
    z <= angle;
    x <= 16'b0010011011011101;
    y <= 16'b0000000000000000;
    end
    else if(iterate) begin
    x <= {sum_x, x[15:1]};
    y <= {sum_y, y[15:1]};
    z <= {sum_z, z[15:1]};
    end
    end
    
    always@(posedge clk)
    if(cycles == 5'b000000)begin
    storeX <= x[15];
    storeY <= y[15];
    d <= ~z[15];end
    
    always@(posedge clk)begin
    if(cycles==5'b00000)begin
        gated_x <= d;
        gated_y <= (~d);
        gated_z <= d;
    end
    else begin
        gated_x <= cout_x;
        gated_y <= cout_y;
        gated_z  <= cout_z;
    end
    end
    
    always@(posedge clk)
    case(ctrl)
    2'b00: begin 
    anode <= 4'b0111;
    cathode <= x[15:12];end
    2'b01: begin
    anode <= 4'b1011;
    cathode <= x[11:8];end
    2'b10: begin
    anode <= 4'b1101;
    cathode <= x[7:4];end
    2'b11: begin
    anode <= 4'b1110;
    cathode <= x[3:0];end
    endcase   
    
    assign bin_x1 = (y[iteration]^d);
    assign bin_x2 = (storeY^d);
    assign final_bin_x = (flag < 5'd16)? bin_x1:bin_x2;
    assign bin_y1 = ~(x[iteration]^d);
    assign bin_y2 = ~(storeX^d);
    assign final_bin_y = (flag < 5'd16)? bin_y1:bin_y2;
    assign flag = cycles+ iteration;
endmodule
