`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.09.2018 07:30:13
// Design Name: 
// Module Name: lfsr
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

//Note: To avoid ambiguity in operation, must push rst button to initialize seed value in reg

module lfsr(output reg [7:0]q, input[7:0]seed, input reset, input clk, roll);

    wire din;
    assign din = q[1]^q[2]^q[3]^q[7];     

    always@(posedge clk)
    begin
        if(reset)
        q <= seed;
        else 
        if(roll) q <= {q[6:0], din};
    end
endmodule
