`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/19/2024 02:41:28 PM
// Design Name: 
// Module Name: sr_flip_flop
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


module sr_flip_flop (
    input S, 
    input R,  
    input clk,  
    output reg Q, 
    output Q_bar  
);

assign Q_bar = ~Q; 
always @(posedge clk) begin
    if (S == 1 && R == 0) begin
        Q <= 1; 
    end else if (S == 0 && R == 1) begin
        Q <= 0;  
    end else if (S == 1 && R == 1) begin
        Q <= 1'bx;  
    end
end
endmodule

