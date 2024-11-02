`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/24/2024 08:18:27 PM
// Design Name: 
// Module Name: immediateGenerator
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


module immediateGenerator(
    input [31:0] instruction,
    output [63:0] immediate_value
    );
    
    reg[12:0] unpadded_value;
    reg[63:0] padded_value;
    always @(*) begin
        case(instruction[6:0])
            // S type
            7'b0100011: begin
                unpadded_value <= {instruction[31],instruction[31:25], instruction[11:7]};
            end
            
            // SB Type      
            7'b1100111: begin
                unpadded_value <= {instruction[31], instruction[7], instruction[30:25], instruction[11:8],1'b0};
            end
            
            // I Type
            7'b0000011: begin
                unpadded_value <= {instruction[31], instruction[31:20]};
            end
        endcase
    end
    
    always @(unpadded_value) begin
        case(unpadded_value[12])
            1'b0:padded_value <= {51'd0,unpadded_value};
            1'b1:padded_value <= {~51'd0,unpadded_value};
        endcase
    end
    
    assign immediate_value = padded_value;
endmodule
