`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/21/2024 07:13:46 PM
// Design Name: 
// Module Name: fourBitAdder
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


module fourBitAdder(
    output [3:0] sum,
    output c_out,
    input [3:0] a,
    input [3:0] b,
    input c_in
    );
    
    wire c_in2, c_in3, c_in4;
    
    fullAdder u0(.sum(sum[0]), .c_out(c_in2), .a(a[0]), .b(b[0]), .c_in(c_in));
    fullAdder u1(.sum(sum[1]), .c_out(c_in3), .a(a[1]), .b(b[1]), .c_in(c_in2));
    fullAdder u2(.sum(sum[2]), .c_out(c_in4), .a(a[2]), .b(b[2]), .c_in(c_in3));
    fullAdder u3(.sum(sum[3]), .c_out(c_out), .a(a[3]), .b(b[3]), .c_in(c_in4));
endmodule
