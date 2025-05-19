`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/19/2024 02:55:31 PM
// Design Name: 
// Module Name: tb_d_latch
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


module tb_d_latch;
    // Inputs
    reg D;
    reg enable;

    // Outputs
    wire Q;
    wire Q_bar;

    // Instantiate the D latch
    d_latch uut (
        .D(D), 
        .enable(enable), 
        .Q(Q), 
        .Q_bar(Q_bar)
    );

    // Stimulus
    initial begin
        // Monitor the output
        $monitor("Time = %0t | D = %b | Enable = %b | Q = %b | Q_bar = %b", $time, D, enable, Q, Q_bar);

        // Test Case 1: Enable = 0 (Latch disabled)
        D = 0; enable = 0; #10;  // Q should retain its initial state
        D = 1; #10;  // Q should still retain its state (Q should not follow D)

        // Test Case 2: Enable = 1 (Latch enabled, Q follows D)
        enable = 1; #10;  // Q should now follow D (Q = 1)
        
        // Test Case 3: Change D with enable = 1
        D = 0; #10;  // Q should follow D (Q = 0)
        D = 1; #10;  // Q should follow D (Q = 1)
        
        // Test Case 4: Disable latch again (Enable = 0)
        enable = 0; D = 0; #10;  // Q should retain its last state (Q = 1)
        
        // Test Case 5: Change D with enable = 0 (Q should not change)
        D = 0; #10;  // Q should still be 1 (Q does not follow D when enable = 0)
        
        $finish;  // End the simulation
    end

endmodule

