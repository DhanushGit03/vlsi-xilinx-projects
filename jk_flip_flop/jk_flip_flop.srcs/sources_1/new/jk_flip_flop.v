`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/19/2024 02:47:03 PM
// Design Name: 
// Module Name: jk_flip_flop
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


module jk_flip_flop (
    input J,       
    input K,       
    input clk,     
    input reset,  
    output reg Q,  
    output Q_bar  
);
assign Q_bar = ~Q;  
always @(posedge clk or posedge reset) begin
    if (reset) begin
        Q <= 0;  
    end else begin
        case ({J, K})
            2'b00: Q <= Q;       
            2'b01: Q <= 0;      
            2'b10: Q <= 1;       
            2'b11: Q <= ~Q;      
        endcase
    end
end
endmodule
