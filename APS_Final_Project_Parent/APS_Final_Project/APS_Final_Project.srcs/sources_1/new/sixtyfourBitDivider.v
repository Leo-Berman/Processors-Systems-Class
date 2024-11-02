`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/30/2024 11:47:00 AM
// Design Name: 
// Module Name: sixtyfourMultiplier
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


module sixtyfourBitUnsignedDivider(
    output [63:0] quotient,
    input [63:0] dividend,
    input [63:0] divisor
    );

    reg [127:0] remainder_r, divisor_r;//, quotient_r;
    reg[63:0] quotient_r;
    integer i;

    always @(dividend or divisor) begin
        remainder_r = {64'd0, dividend};
        divisor_r = {divisor,64'd0};
        quotient_r = {64'd0};
    end
      
    always @(quotient_r) begin 
        for (i = 0; i < 65; i = i + 1) begin
            
            remainder_r = remainder_r - divisor_r;
           
            if (remainder_r[127] == 1'd0) begin
                quotient_r = (quotient_r << 1) + 1;
                divisor_r = divisor_r >> 1;
            end
            
            else begin
                quotient_r = quotient_r << 1;
                remainder_r = remainder_r + divisor_r;
                divisor_r = divisor_r >> 1;
            end
            
        end
    end
   
   assign quotient = quotient_r;
   
    
    
endmodule

module sixtyfourBitSignedDivider(
    output [63:0] quotient,
    input [63:0] dividend,
    input [63:0] divisor
    );

    reg [127:0] remainder_r, divisor_r, inverted_remainder, inverted_divisor;//, quotient_r;
    reg[63:0] quotient_r;
    integer i;
    reg remainder_neg, divisor_neg;
    // Convert a to positive number
    always @(dividend) begin
    case(dividend[63])
        1'b0: 
            begin
                inverted_remainder = {64'd0,dividend};
                remainder_neg = 0;
            end
        1'b1: 
            begin
                inverted_remainder = {64'd0,~dividend+1};
                remainder_neg = 1;
            end
    endcase
    remainder_r = inverted_remainder;
    end
    
    always @(divisor) begin
    case(divisor[63])
        1'b0: 
            begin
                inverted_divisor = {divisor,64'd0};
                divisor_neg = 0;
            end
        1'b1: 
            begin
                inverted_divisor = {~divisor+1,64'd0};
                divisor_neg = 1;
            end
    endcase
    divisor_r = inverted_divisor;
    end
    
    always @(dividend or divisor) begin
        quotient_r = {64'd0};
    end
      
    always @(quotient_r) begin 
        for (i = 0; i < 65; i = i + 1) begin
            
            remainder_r = remainder_r - divisor_r;
           
            if (remainder_r[127] == 1'd0) begin
                quotient_r = (quotient_r << 1) + 1;
                divisor_r = divisor_r >> 1;
            end
            
            else begin
                quotient_r = quotient_r << 1;
                remainder_r = remainder_r + divisor_r;
                divisor_r = divisor_r >> 1;
            end
            
        end
    end
   
    reg [63:0] negated_product;

    always @(*) begin
        if(remainder_neg ^ divisor_neg) begin
                negated_product = ~quotient_r + 1;
        end
        else begin
            negated_product = quotient_r;
        end
    end
    
   
   assign quotient = negated_product;

endmodule