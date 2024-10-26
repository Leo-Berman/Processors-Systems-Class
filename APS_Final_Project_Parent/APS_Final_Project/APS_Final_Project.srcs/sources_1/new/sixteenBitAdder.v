`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/21/2024 08:34:44 PM
// Design Name: 
// Module Name: sixteenBitAdder
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


module sixteenBitAdder(
    output [15:0] sum,
    output c_out,
    input [15:0] a,
    input [15:0] b,
    input c_in
    );
    
    wire c_in2, c_in3, c_in4;
    
    fourBitAdder u0(.sum(sum[3:0]), .c_out(c_in2), .a(a[3:0]), .b(b[3:0]), .c_in(c_in));
    fourBitAdder u1(.sum(sum[7:4]), .c_out(c_in3), .a(a[7:4]), .b(b[7:4]), .c_in(c_in2));
    fourBitAdder u2(.sum(sum[11:8]), .c_out(c_in4), .a(a[11:8]), .b(b[11:8]), .c_in(c_in3));
    fourBitAdder u3(.sum(sum[15:12]), .c_out(c_out), .a(a[15:12]), .b(b[15:12]), .c_in(c_in4));
    
endmodule
