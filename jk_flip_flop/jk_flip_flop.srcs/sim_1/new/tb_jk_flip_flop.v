`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/19/2024 02:48:37 PM
// Design Name: 
// Module Name: tb_jk_flip_flop
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


module tb_jk_flip_flop;
    // Inputs
    reg J;
    reg K;
    reg clk;
    reg reset;

    // Outputs
    wire Q;
    wire Q_bar;

    // Instantiate the JK flip-flop
    jk_flip_flop uut (
        .J(J), 
        .K(K), 
        .clk(clk), 
        .reset(reset), 
        .Q(Q), 
        .Q_bar(Q_bar)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk;  // Clock period of 10 time units
    end

    // Stimulus
    initial begin
        // Monitor the output
        $monitor("Time = %0t | J = %b | K = %b | Reset = %b | Q = %b | Q_bar = %b", $time, J, K, reset, Q, Q_bar);

        // Initialize inputs
        reset = 1; J = 0; K = 0; #10;  // Apply reset, expect Q = 0
        reset = 0; #10;

        // Test Case 1: J = 0, K = 0 (No change)
        J = 0; K = 0; #10;  // Q should remain the same

        // Test Case 2: J = 0, K = 1 (Reset Q)
        J = 0; K = 1; #10;  // Q should be reset to 0

        // Test Case 3: J = 1, K = 0 (Set Q)
        J = 1; K = 0; #10;  // Q should be set to 1

        // Test Case 4: J = 1, K = 1 (Toggle Q)
        J = 1; K = 1; #10;  // Q should toggle from 1 to 0

        // Test Case 5: Toggle again
        J = 1; K = 1; #10;  // Q should toggle from 0 to 1

        // Test Case 6: Apply reset
        reset = 1; #10;  // Q should be reset to 0
        reset = 0; #10;

        // Test Case 7: J = 0, K = 0 (No change)
        J = 0; K = 0; #10;  // Q should remain 0

        $finish;  // End the simulation
    end

endmodule
