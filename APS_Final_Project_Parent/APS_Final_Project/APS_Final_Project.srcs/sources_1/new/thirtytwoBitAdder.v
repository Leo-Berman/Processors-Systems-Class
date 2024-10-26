`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/21/2024 08:47:26 PM
// Design Name: 
// Module Name: thirtytwoBitAdder
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


module thirtytwoBitAdder(
    output [31:0] sum,
    output c_out,
    input [31:0] a,
    input [31:0] b,
    input c_in
    );
    
    wire c_in2;
    sixteenBitAdder u0(.sum(sum[15:0]), .c_out(c_in2), .a(a[15:0]), .b(b[15:0]), .c_in(c_in));
    sixteenBitAdder u1(.sum(sum[31:16]), .c_out(c_out), .a(a[31:16]), .b(b[31:16]), .c_in(c_in2));
endmodule
