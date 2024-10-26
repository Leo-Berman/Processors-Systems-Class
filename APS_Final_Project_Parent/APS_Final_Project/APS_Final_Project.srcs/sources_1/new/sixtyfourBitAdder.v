`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/22/2024 09:54:44 AM
// Design Name: 
// Module Name: sixtyfourBitAdder
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


module sixtyfourBitAdder(
    output [63:0] sum,
    output c_out,
    input [63:0] a,
    input [63:0] b,
    input c_in
    );
    
    wire c_in2;
    thirtytwoBitAdder u0(.sum(sum[31:0]), .c_out(c_in2), .a(a[31:0]), .b(b[31:0]), .c_in(c_in));
    thirtytwoBitAdder u1(.sum(sum[63:32]), .c_out(c_out), .a(a[63:32]), .b(b[63:32]), .c_in(c_in2));
    
endmodule
