`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/18/2024 08:39:44 PM
// Design Name: 
// Module Name: sr_latch
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


module sr_latch (
    input S,    // Set input
    input R,    // Reset input
    output Q,   // Output Q
    output Qn   // Output Q' (complement of Q)
);
    wire S_g, R_g; // NAND gate outputs
    wire Qa, Qb;   // Internal wires for feedback

    // NAND gates implementation
    assign S_g = ~(S & Qb);  // First NAND gate
    assign R_g = ~(R & Qa);  // Second NAND gate
    
    // Outputs
    assign Qa = S_g;  // Internal connection for feedback
    assign Qb = R_g;  // Internal connection for feedback
    
    // Outputs of the latch
    assign Q = Qa;
    assign Qn = Qb;

endmodule
