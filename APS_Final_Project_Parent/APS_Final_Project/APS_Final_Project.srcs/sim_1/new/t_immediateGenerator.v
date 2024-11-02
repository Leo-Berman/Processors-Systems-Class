`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/31/2024 10:24:23 PM
// Design Name: 
// Module Name: t_immediateGenerator
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


module t_immediateGenerator();

    reg[31:0] instruction;
    wire[63:0] immediate_value;
    
    immediateGenerator u0 (.instruction(instruction), .immediate_value(immediate_value));
    
    initial begin
        // S type
        #10 instruction = 32'b00000000000000000000000100000011;
        #10 instruction = 32'b11111111111000000000000100000011;
        
        // I type
        #10 instruction = 32'b00000000001000000000000000100011;
        #10 instruction = 32'b11111111111000000000000000100011;
        #10 $finish;
    end

endmodule
