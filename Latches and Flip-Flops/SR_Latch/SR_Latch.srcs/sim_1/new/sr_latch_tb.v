`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/18/2024 08:40:42 PM
// Design Name: 
// Module Name: sr_latch_tb
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


module sr_latch_tb;

    // Inputs
    reg S;
    reg R;

    // Outputs
    wire Q;
    wire Qn;

    // Instantiate the Unit Under Test (UUT)
    sr_latch uut (
        .S(S), 
        .R(R), 
        .Q(Q), 
        .Qn(Qn)
    );

    initial begin
        // Monitor the outputs and inputs
        $monitor("Time: %0t | S = %b | R = %b | Q = %b | Qn = %b", $time, S, R, Q, Qn);
        
        // Initialize inputs
        S = 0;
        R = 0;
        #10;
        
        // Apply Set = 1, Reset = 0 (Set condition)
        S = 1;
        R = 0;
        #10;
        
        // Apply Set = 0, Reset = 0 (Hold condition)
        S = 0;
        R = 0;
        #10;
        
        // Apply Set = 0, Reset = 1 (Reset condition)
        S = 0;
        R = 1;
        #10;
        
        // Apply Set = 1, Reset = 1 (Invalid condition)
        S = 1;
        R = 1;
        #10;

        // Apply Set = 0, Reset = 0 again to check hold state
        S = 0;
        R = 0;
        #10;

        $finish;
    end

endmodule

