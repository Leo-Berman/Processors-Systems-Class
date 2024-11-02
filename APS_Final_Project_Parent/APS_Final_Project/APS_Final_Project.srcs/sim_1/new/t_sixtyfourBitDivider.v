`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/31/2024 02:54:30 PM
// Design Name: 
// Module Name: t_sixtyfourBitDivider
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


module t_sixtyfourBitUnsignedDivider();

    reg[63:0] a;
    reg[63:0] b;
    wire[63:0] quotient;

    sixtyfourBitUnsignedDivider u0(.quotient(quotient), .dividend(a), .divisor(b));
    
    initial begin
        #10 a = 5; b = 5;
        #10 a = 10; b = 10;
        #10 a = 1000; b = 1000; 
        #10 a = 7; b = 2; 
        #10 $finish;
    end
endmodule

module t_sixtyfourBitSignedDivider();

    reg[63:0] a;
    reg[63:0] b;
    wire[63:0] quotient;

    sixtyfourBitSignedDivider u1(.quotient(quotient), .dividend(a), .divisor(b));
    
    initial begin
        #10 a = 5; b = 5;
        #10 a = 10; b = 10;
        #10 a = 1000; b = -1000; 
        #10 a = -7; b = -2; 
        #10 $finish;
    end
endmodule
