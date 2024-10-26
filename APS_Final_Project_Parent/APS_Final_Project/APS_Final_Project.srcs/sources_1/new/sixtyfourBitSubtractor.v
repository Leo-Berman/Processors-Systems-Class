`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/22/2024 10:18:36 AM
// Design Name: 
// Module Name: sixtyfourBitSubtractor
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


module sixtyfourBitSubtractor(
    output [63:0] sum,
    output c_out,
    input [63:0] a,
    input [63:0] b,
    input c_in
    );

   wire[63:0] a2, b2, sum2;
   wire c_in2, c_out2;
   assign a2 = ~b;
   assign b2 = 1;
   assign c_in2 = 0;
   assign c_out2 = 0;
   
    sixtyfourBitAdder u0(.sum(sum2), .c_out(c_out2), .a(a2), .b(b2), .c_in(c_in2));
   
   
    sixtyfourBitAdder u1 (.sum(sum), .c_out(c_out), .a(a), .b(sum2), .c_in(c_in));
      
endmodule
