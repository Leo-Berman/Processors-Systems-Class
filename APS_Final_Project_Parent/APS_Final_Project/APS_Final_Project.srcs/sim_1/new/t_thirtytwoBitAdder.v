`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/21/2024 08:50:28 PM
// Design Name: 
// Module Name: t_thirtytwoBitAdder
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Depe/t_thirtytwoBitAdder/sum[29]ndencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module t_thirtytwoBitAdder();

    reg[31:0] a,b;
    reg c_in;
    wire[31:0] sum;
    wire c_out;

    thirtytwoBitAdder tF1(.sum(sum), .c_out(c_out), .a(a), .b(b), .c_in(c_in));
    
    initial begin
        #10 a = 4294967294; b = 1; c_in = 0;
        #10 a = 2147483647; b = 2147483648; c_in = 0;
        #10 a = 300000; b = 8; c_in = 1;
        #10 a = 25; b = 1000; c_in = 1;
        #10 $finish;
    end

endmodule
