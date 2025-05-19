`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/19/2024 02:42:24 PM
// Design Name: 
// Module Name: tb_sr_flip_flop
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

module tb_sr_flip_flop;
    // Inputs
    reg S;
    reg R;
    reg clk;
    
    // Outputs
    wire Q;
    wire Q_bar;
    
    // Instantiate the SR flip-flop module
    sr_flip_flop uut (
        .S(S), 
        .R(R), 
        .clk(clk), 
        .Q(Q), 
        .Q_bar(Q_bar)
    );
    
    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk;  // Clock with 10 time units period
    end
    
    // Stimulus
    initial begin
        // Monitor the outputs
        $monitor("Time = %0t, S = %b, R = %b, Q = %b, Q_bar = %b", $time, S, R, Q, Q_bar);
        
        // Test Case 1: Initial conditions
        S = 0; R = 0; #10;  // Q should retain its value (undefined initially)

        // Test Case 2: Set (S = 1, R = 0)
        S = 1; R = 0; #10;  // Q should be set to 1
        
        // Test Case 3: Reset (S = 0, R = 1)
        S = 0; R = 1; #10;  // Q should be reset to 0
        
        // Test Case 4: Invalid state (S = 1, R = 1)
        S = 1; R = 1; #10;  // Q should be undefined (x)
        
        // Test Case 5: No change (S = 0, R = 0)
        S = 0; R = 0; #10;  // Q should retain its previous state
        
        // Test Case 6: Another set operation
        S = 1; R = 0; #10;  // Q should be set to 1 again
        
        // Test Case 7: Another reset operation
        S = 0; R = 1; #10;  // Q should be reset to 0 again
        
        $finish;  // End the simulation
    end

endmodule

