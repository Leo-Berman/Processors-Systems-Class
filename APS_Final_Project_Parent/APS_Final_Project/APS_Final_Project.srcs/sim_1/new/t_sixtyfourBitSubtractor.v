`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/22/2024 10:22:06 AM
// Design Name: 
// Module Name: t_sixtyfourBitSubtractor
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


module t_sixtyfourBitSubtractor();

    reg[63:0] a,b;
    reg c_in;
    wire[63:0] sum;
    wire c_out;
    
    sixtyfourBitSubtractor tF1(.sum(sum), .c_out(c_out), .a(a), .b(b), .c_in(c_in));
    
    initial begin
        #10 a = 18446744073709551614; b = 1; c_in = 0;
        #10 a = 9223372036854775807; b = 9223372036854775808; c_in = 1;
        #10 a = 300000; b = 8; c_in = 1;
        #10 a = 25; b = 1000; c_in = 1;
        #10 $finish;
    end
endmodule
