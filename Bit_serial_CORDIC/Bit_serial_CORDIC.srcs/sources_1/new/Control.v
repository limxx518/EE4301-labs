`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.11.2018 16:38:57
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


module Control(input load, cycle, clk,output Enter, Iterate, readROM,
               output reg[3:0] iteration = 4'b0, output reg[4:0] cycles);

    localparam baseState = 3'b000;
    localparam loadState = 3'b001;
    localparam cycleState = 3'b010;
    localparam finishcycleState = 3'b011;
    localparam cyclePress = 3'b100;
    
    reg[2:0] state, nextState;
    wire done, finish;
    reg firstChange = 1'b1;
    
    always@(posedge clk)
    state <= nextState;
    
    always@(posedge clk)
    case(state)
    baseState: if(load) nextState = loadState;
    loadState: if(cycle) nextState = cyclePress;
               else nextState = loadState;
    cyclePress: if(~cycle) nextState = cycleState;
                else nextState = cyclePress;
    cycleState: if(finish) nextState = baseState;
                else if(done&(~finish)) nextState = finishcycleState;
                else nextState = cycleState;
    finishcycleState: if(cycle) nextState = cyclePress;
                      else if(load) nextState = loadState;
                      else nextState = finishcycleState;
    default: nextState = baseState;
    endcase
    
    always@(negedge clk)
    if(state==cycleState & (~done)) begin
    cycles <= cycles + 1'b1;
    firstChange <= 1'b0;end
    else if(state==finishcycleState)begin
    if(done & (~firstChange))begin
    iteration <= iteration + 1'b1;
    firstChange <= 1'b1;end
    cycles <= 5'b00000;
    end
    else if(state==loadState | state==baseState) begin 
    cycles <= 5'b00000;
    iteration <= 4'b0000;end
    //else if(done & (~finish)) iteration <= iteration + 1'b1;
    
    assign Enter = (nextState == loadState);
    assign Iterate = (state == cycleState & (cycles<=5'b10000) & (~finish));
    assign done = (cycles == 5'b10001);
    assign finish = (iteration == 4'b1110);
    assign readROM = ((state == cycleState & (~done)) | cycles == 5'b00000);                 
    
 endmodule 
