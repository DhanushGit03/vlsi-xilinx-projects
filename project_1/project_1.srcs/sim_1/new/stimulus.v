`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/16/2024 11:52:06 AM
// Design Name: 
// Module Name: stimulus
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


module stimulus(

    );
    reg a,b;
    wire y0,y1,y2;
    logic_gates uut(a,b,y0,y1,y2);
    
    initial
    begin 
                a=0;    b=0;
            #10 a=0;    b=1;
            #10 a=1;    b=0;
            #10 a=1;    b=1;
            #10 $finish;
end            
endmodule
