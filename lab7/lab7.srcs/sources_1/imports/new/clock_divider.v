`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.09.2018 07:19:58
// Design Name: 
// Module Name: clock_divider
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


module clock_divider(output reg cout=0, input cin);

    reg [25:0] counter = 25'b0;
    parameter timeconstant = 50000000;
    
    always@(posedge cin)
    begin
    if(counter < (timeconstant - 1))
        counter <= counter + 1'b1;
    else begin
        counter <= 25'b0;
        cout <= ~cout;
    end
    end
    
endmodule
