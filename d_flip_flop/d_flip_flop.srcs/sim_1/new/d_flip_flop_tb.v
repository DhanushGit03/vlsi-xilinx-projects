`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/19/2024 01:40:22 PM
// Design Name: 
// Module Name: d_flip_flop_tb
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


module d_flip_flop_tb;

    // Inputs
    reg D;
    reg clk;
    reg reset;

    // Output
    wire Q;

    // Instantiate the D Flip-Flop module
    d_flip_flop uut (
        .D(D),
        .clk(clk),
        .reset(reset),
        .Q(Q)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk;  // Clock toggles every 5 time units
    end

    // Test procedure
    initial begin
        // Monitor changes in signals
        $monitor("Time: %0t | D = %b | clk = %b | reset = %b | Q = %b", $time, D, clk, reset, Q);
        
        // Initialize inputs
        D = 0;
        reset = 1;  // Assert reset initially
        #10;
        
        reset = 0;  // Deassert reset
        D = 1;      // Set D to 1
        #10;
        
        D = 0;      // Set D to 0
        #10;
        
        D = 1;      // Set D to 1
        #10;
        
        reset = 1;  // Assert reset again
        #10;
        
        reset = 0;  // Deassert reset
        D = 0;
        #10;

        // Finish the simulation
        $finish;
    end

endmodule

