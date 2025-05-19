`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/19/2024 01:39:15 PM
// Design Name: 
// Module Name: d_flip_flop
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


module d_flip_flop (
    input D,        
    input clk,      
    input reset,  
    output reg Q   
);

  
    always @(posedge clk) begin
        if (reset)   
            Q <= 0;   
        else
            Q <= D;  
    end

endmodule
