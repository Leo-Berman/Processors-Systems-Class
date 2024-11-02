`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/30/2024 12:30:47 PM
// Design Name: 
// Module Name: t_sixtyfourBitMultiplier
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
module t_sixtyfourBitUnsignedMultiplier();

    reg[63:0] a;
    reg[63:0] b;
    wire[127:0] product;
    
    sixtyfourBitUnsignedMultiplier u0(.product(product), .a(a), .b(b));
    
    initial begin
        #10 a = 5; b = 5;
        #10 a = 10; b = 10;
        #10 a = 1000; b = 1000; 
        #10 $finish;
    end
endmodule

module t_sixtyfourBitSignedMultiplier();

    reg[63:0] a;
    reg[63:0] b;
    wire[127:0] product;
    
    sixtyfourBitSignedMultiplier u1(.product(product), .a(a), .b(b));
    
    initial begin
        #10 a = 5; b = -5;
        #10 a = 10; b = 10;
        #10 a = 1000; b = 1000; 
        #10 $finish;
    end
endmodule
