`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/21/2024 06:57:39 PM
// Design Name: 
// Module Name: t_fullAdder
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


module t_fullAdder();

    reg a, b, c_in;
    wire sum, c_out;
    
    fullAdder F1 (.sum(sum),.c_out(c_out), .a(a), .b(b), .c_in(c_in));
    
    initial begin
        #10 a = 0; b = 0; c_in = 0;
        #10 a = 0; b = 0; c_in = 1;
        #10 a = 0; b = 1; c_in = 0;
        #10 a = 0; b = 1; c_in = 1;
        #10 a = 1; b = 0; c_in = 0;
        #10 a = 1; b = 0; c_in = 1;
        #10 a = 1; b = 1; c_in = 0;
        #10 a = 1; b = 1; c_in = 1;
        #10 $finish ;
    end
        
endmodule
