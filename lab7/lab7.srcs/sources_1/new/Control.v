`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.11.2018 08:01:56
// Design Name: 
// Module Name: Control
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


module Control(input[2:0] buttons,input clk,output load, store, reset, move, output reg[4:0]tally); 

    localparam Move = 2'b00;
    localparam Load = 2'b01;
    localparam Store = 2'b10;
    localparam Reset = 2'b11;
    
    reg[1:0] state, nextState;
    reg[4:0]ptr = 5'b11111;
    reg [4:0] currentTally = 0;
   
    //state register logic
    always@(posedge clk)begin
        state <= nextState;
        tally <= currentTally;
    end   
    
   
    always@(posedge clk)begin
    case(state)
    Reset: if(buttons==3'b110) nextState = Load;
           else nextState = Reset;
    Load: if(buttons==3'b111) begin
          nextState = Store;
          currentTally = (tally + 1'b1)%20;end
          else if(buttons==3'b110) nextState = Load;
          else if(buttons==3'b010) nextState = Reset;
          else nextState = Move;
    Store: if(buttons==3'b110) nextState = Load;
           else if(buttons==3'b111) nextState = Store;
           else if(buttons==3'b010) nextState = Reset;
           else nextState = Move;
    Move: if(buttons==3'b110) nextState = Load;
          else if(buttons==3'b111) nextState = Move;
          else if(buttons==3'b010) begin
          nextState = Reset;
          currentTally = 0;end
          else nextState = Move; 
    endcase
    end
    
    //output logic
    assign load = (nextState == Load);
    assign store = (nextState == Store & state == Load);
    assign reset = (nextState == Reset);
    assign move = (nextState == Move);
    //assign add = (nextState == Store);
    
endmodule
