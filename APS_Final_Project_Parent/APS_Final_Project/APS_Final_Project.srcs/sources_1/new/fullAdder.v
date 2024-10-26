`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/21/2024 06:57:22 PM
// Design Name: 
// Module Name: fullAdder
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


module fullAdder(
    output sum,
    output c_out,
    input a,
    input b,
    input c_in
    );
    
    wire w1, w2, w3;
    
    halfAdder A1 (.sum(w1), .c_out(w2), .a(a), .b(b));   
    halfAdder A2 (.sum(sum), .c_out(w3), .a(w1), .b(c_in));   
    or A3(c_out,w2,w3);
    
endmodule
