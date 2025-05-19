`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/29/2024 11:41:14 PM
// Design Name: 
// Module Name: NOT_nand_nor
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


module NOT_nand_nor(
    input a,b,
    output y0,y1,y2
    );
    assign  y0 = -a;
    assign y1 = (a&b);
    assign y2 = -(a|b);
endmodule
