`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/21/2024 08:28:07 PM
// Design Name: 
// Module Name: t_sixteenBitAdder
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


module t_sixteenBitAdder();

    reg[15:0] a,b;
    reg c_in;
    wire[15:0] sum;
    wire c_out;
    
    sixteenBitAdder tF1(.sum(sum), .c_out(c_out), .a(a), .b(b), .c_in(c_in));
    
    initial begin
        #10 a = 65534; b = 1; c_in = 0;
        #10 a = 32767; b = 32767; c_in = 0;
        #10 a = 30000; b = 8; c_in = 1;
        #10 a = 25; b = 1000; c_in = 1;
        #10 $finish;
    end

endmodule
