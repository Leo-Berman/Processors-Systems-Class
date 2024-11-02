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

module sixtyfourBitUnsignedMultiplier(
    output [127:0] product,
    input [63:0] a,
    input [63:0] b
    );

    wire [127:0] padded_a;
    wire [127:0] padded_b;
    reg padded_a_neg;
    reg padded_b_neg;


    wire c_out;
    reg c_in = 0;
    
    
    assign padded_a = {64'd0,a};
    
    assign padded_b = {64'd0,b};
    
    reg [127:0] multiplier, multiplicand, to_sum, working_product;
    
    always @(padded_b) 
        begin
            working_product <= 0;
            multiplier <= padded_a;
            multiplicand <= padded_b;
        end
    // 1
    always @(multiplicand)
        begin
            if(multiplier[0]==1)
                begin
                    to_sum <= multiplicand;
                end
            else
                begin
                    to_sum <= 0;
                end
            multiplicand <= multiplicand << 1;
            multiplier <= multiplier >> 1;
        end 
    always @(to_sum)
        begin
            working_product <= to_sum + working_product;
        end
    // 2
     always @(multiplicand)
        begin
            if(multiplier[0]==1)
                begin
                    to_sum <= multiplicand;
                end
            else
                begin
                    to_sum <= 0;
                end
            multiplicand <= multiplicand << 1;
            multiplier <= multiplier >> 1;
        end 
    always @(to_sum)
        begin
            working_product <= to_sum + working_product;
        end
    // 3
    always @(multiplicand)
        begin
            if(multiplier[0]==1)
                begin
                    to_sum <= multiplicand;
                end
            else
                begin
                    to_sum <= 0;
                end
            multiplicand <= multiplicand << 1;
            multiplier <= multiplier >> 1;
        end 
    always @(to_sum)
        begin
            working_product <= to_sum + working_product;
        end
    // 4
     always @(multiplicand)
        begin
            if(multiplier[0]==1)
                begin
                    to_sum <= multiplicand;
                end
            else
                begin
                    to_sum <= 0;
                end
            multiplicand <= multiplicand << 1;
            multiplier <= multiplier >> 1;
        end 
    always @(to_sum)
        begin
            working_product <= to_sum + working_product;
        end
    // 5
    always @(multiplicand)
        begin
            if(multiplier[0]==1)
                begin
                    to_sum <= multiplicand;
                end
            else
                begin
                    to_sum <= 0;
                end
            multiplicand <= multiplicand << 1;
            multiplier <= multiplier >> 1;
        end 
    always @(to_sum)
        begin
            working_product <= to_sum + working_product;
        end
    // 6
     always @(multiplicand)
        begin
            if(multiplier[0]==1)
                begin
                    to_sum <= multiplicand;
                end
            else
                begin
                    to_sum <= 0;
                end
            multiplicand <= multiplicand << 1;
            multiplier <= multiplier >> 1;
        end 
    always @(to_sum)
        begin
            working_product <= to_sum + working_product;
        end
    // 7
    always @(multiplicand)
        begin
            if(multiplier[0]==1)
                begin
                    to_sum <= multiplicand;
                end
            else
                begin
                    to_sum <= 0;
                end
            multiplicand <= multiplicand << 1;
            multiplier <= multiplier >> 1;
        end 
    always @(to_sum)
        begin
            working_product <= to_sum + working_product;
        end
    // 8
     always @(multiplicand)
        begin
            if(multiplier[0]==1)
                begin
                    to_sum <= multiplicand;
                end
            else
                begin
                    to_sum <= 0;
                end
            multiplicand <= multiplicand << 1;
            multiplier <= multiplier >> 1;
        end 
    always @(to_sum)
        begin
            working_product <= to_sum + working_product;
        end
    // 9
    always @(multiplicand)
        begin
            if(multiplier[0]==1)
                begin
                    to_sum <= multiplicand;
                end
            else
                begin
                    to_sum <= 0;
                end
            multiplicand <= multiplicand << 1;
            multiplier <= multiplier >> 1;
        end 
    always @(to_sum)
        begin
            working_product <= to_sum + working_product;
        end
    // 10
     always @(multiplicand)
        begin
            if(multiplier[0]==1)
                begin
                    to_sum <= multiplicand;
                end
            else
                begin
                    to_sum <= 0;
                end
            multiplicand <= multiplicand << 1;
            multiplier <= multiplier >> 1;
        end 
    always @(to_sum)
        begin
            working_product <= to_sum + working_product;
        end
    // 11
    always @(multiplicand)
        begin
            if(multiplier[0]==1)
                begin
                    to_sum <= multiplicand;
                end
            else
                begin
                    to_sum <= 0;
                end
            multiplicand <= multiplicand << 1;
            multiplier <= multiplier >> 1;
        end 
    always @(to_sum)
        begin
            working_product <= to_sum + working_product;
        end
    // 12
     always @(multiplicand)
        begin
            if(multiplier[0]==1)
                begin
                    to_sum <= multiplicand;
                end
            else
                begin
                    to_sum <= 0;
                end
            multiplicand <= multiplicand << 1;
            multiplier <= multiplier >> 1;
        end 
    always @(to_sum)
        begin
            working_product <= to_sum + working_product;
        end
    // 13
    always @(multiplicand)
        begin
            if(multiplier[0]==1)
                begin
                    to_sum <= multiplicand;
                end
            else
                begin
                    to_sum <= 0;
                end
            multiplicand <= multiplicand << 1;
            multiplier <= multiplier >> 1;
        end 
    always @(to_sum)
        begin
            working_product <= to_sum + working_product;
        end
    // 14
     always @(multiplicand)
        begin
            if(multiplier[0]==1)
                begin
                    to_sum <= multiplicand;
                end
            else
                begin
                    to_sum <= 0;
                end
            multiplicand <= multiplicand << 1;
            multiplier <= multiplier >> 1;
        end 
    always @(to_sum)
        begin
            working_product <= to_sum + working_product;
        end
    // 15
    always @(multiplicand)
        begin
            if(multiplier[0]==1)
                begin
                    to_sum <= multiplicand;
                end
            else
                begin
                    to_sum <= 0;
                end
            multiplicand <= multiplicand << 1;
            multiplier <= multiplier >> 1;
        end 
    always @(to_sum)
        begin
            working_product <= to_sum + working_product;
        end
    // 16
     always @(multiplicand)
        begin
            if(multiplier[0]==1)
                begin
                    to_sum <= multiplicand;
                end
            else
                begin
                    to_sum <= 0;
                end
            multiplicand <= multiplicand << 1;
            multiplier <= multiplier >> 1;
        end 
    always @(to_sum)
        begin
            working_product <= to_sum + working_product;
        end
    
    // 17
    always @(multiplicand)
        begin
            if(multiplier[0]==1)
                begin
                    to_sum <= multiplicand;
                end
            else
                begin
                    to_sum <= 0;
                end
            multiplicand <= multiplicand << 1;
            multiplier <= multiplier >> 1;
        end 
    always @(to_sum)
        begin
            working_product <= to_sum + working_product;
        end
    // 18
     always @(multiplicand)
        begin
            if(multiplier[0]==1)
                begin
                    to_sum <= multiplicand;
                end
            else
                begin
                    to_sum <= 0;
                end
            multiplicand <= multiplicand << 1;
            multiplier <= multiplier >> 1;
        end 
    always @(to_sum)
        begin
            working_product <= to_sum + working_product;
        end
    // 19
    always @(multiplicand)
        begin
            if(multiplier[0]==1)
                begin
                    to_sum <= multiplicand;
                end
            else
                begin
                    to_sum <= 0;
                end
            multiplicand <= multiplicand << 1;
            multiplier <= multiplier >> 1;
        end 
    always @(to_sum)
        begin
            working_product <= to_sum + working_product;
        end
    // 20
     always @(multiplicand)
        begin
            if(multiplier[0]==1)
                begin
                    to_sum <= multiplicand;
                end
            else
                begin
                    to_sum <= 0;
                end
            multiplicand <= multiplicand << 1;
            multiplier <= multiplier >> 1;
        end 
    always @(to_sum)
        begin
            working_product <= to_sum + working_product;
        end
    // 21
    always @(multiplicand)
        begin
            if(multiplier[0]==1)
                begin
                    to_sum <= multiplicand;
                end
            else
                begin
                    to_sum <= 0;
                end
            multiplicand <= multiplicand << 1;
            multiplier <= multiplier >> 1;
        end 
    always @(to_sum)
        begin
            working_product <= to_sum + working_product;
        end
    // 22
     always @(multiplicand)
        begin
            if(multiplier[0]==1)
                begin
                    to_sum <= multiplicand;
                end
            else
                begin
                    to_sum <= 0;
                end
            multiplicand <= multiplicand << 1;
            multiplier <= multiplier >> 1;
        end 
    always @(to_sum)
        begin
            working_product <= to_sum + working_product;
        end
    // 23
    always @(multiplicand)
        begin
            if(multiplier[0]==1)
                begin
                    to_sum <= multiplicand;
                end
            else
                begin
                    to_sum <= 0;
                end
            multiplicand <= multiplicand << 1;
            multiplier <= multiplier >> 1;
        end 
    always @(to_sum)
        begin
            working_product <= to_sum + working_product;
        end
    // 24
     always @(multiplicand)
        begin
            if(multiplier[0]==1)
                begin
                    to_sum <= multiplicand;
                end
            else
                begin
                    to_sum <= 0;
                end
            multiplicand <= multiplicand << 1;
            multiplier <= multiplier >> 1;
        end 
    always @(to_sum)
        begin
            working_product <= to_sum + working_product;
        end
    // 25
    always @(multiplicand)
        begin
            if(multiplier[0]==1)
                begin
                    to_sum <= multiplicand;
                end
            else
                begin
                    to_sum <= 0;
                end
            multiplicand <= multiplicand << 1;
            multiplier <= multiplier >> 1;
        end 
    always @(to_sum)
        begin
            working_product <= to_sum + working_product;
        end
    // 26
     always @(multiplicand)
        begin
            if(multiplier[0]==1)
                begin
                    to_sum <= multiplicand;
                end
            else
                begin
                    to_sum <= 0;
                end
            multiplicand <= multiplicand << 1;
            multiplier <= multiplier >> 1;
        end 
    always @(to_sum)
        begin
            working_product <= to_sum + working_product;
        end
    // 27
    always @(multiplicand)
        begin
            if(multiplier[0]==1)
                begin
                    to_sum <= multiplicand;
                end
            else
                begin
                    to_sum <= 0;
                end
            multiplicand <= multiplicand << 1;
            multiplier <= multiplier >> 1;
        end 
    always @(to_sum)
        begin
            working_product <= to_sum + working_product;
        end
    // 28
     always @(multiplicand)
        begin
            if(multiplier[0]==1)
                begin
                    to_sum <= multiplicand;
                end
            else
                begin
                    to_sum <= 0;
                end
            multiplicand <= multiplicand << 1;
            multiplier <= multiplier >> 1;
        end 
    always @(to_sum)
        begin
            working_product <= to_sum + working_product;
        end
    // 29
    always @(multiplicand)
        begin
            if(multiplier[0]==1)
                begin
                    to_sum <= multiplicand;
                end
            else
                begin
                    to_sum <= 0;
                end
            multiplicand <= multiplicand << 1;
            multiplier <= multiplier >> 1;
        end 
    always @(to_sum)
        begin
            working_product <= to_sum + working_product;
        end
    // 30
     always @(multiplicand)
        begin
            if(multiplier[0]==1)
                begin
                    to_sum <= multiplicand;
                end
            else
                begin
                    to_sum <= 0;
                end
            multiplicand <= multiplicand << 1;
            multiplier <= multiplier >> 1;
        end 
    always @(to_sum)
        begin
            working_product <= to_sum + working_product;
        end
    
    // 31
    always @(multiplicand)
        begin
            if(multiplier[0]==1)
                begin
                    to_sum <= multiplicand;
                end
            else
                begin
                    to_sum <= 0;
                end
            multiplicand <= multiplicand << 1;
            multiplier <= multiplier >> 1;
        end 
    always @(to_sum)
        begin
            working_product <= to_sum + working_product;
        end
    
    // 32
     always @(multiplicand)
        begin
            if(multiplier[0]==1)
                begin
                    to_sum <= multiplicand;
                end
            else
                begin
                    to_sum <= 0;
                end
            multiplicand <= multiplicand << 1;
            multiplier <= multiplier >> 1;
        end 
    always @(to_sum)
        begin
            working_product <= to_sum + working_product;
        end
    
    // 33
    always @(multiplicand)
        begin
            if(multiplier[0]==1)
                begin
                    to_sum <= multiplicand;
                end
            else
                begin
                    to_sum <= 0;
                end
            multiplicand <= multiplicand << 1;
            multiplier <= multiplier >> 1;
        end 
    always @(to_sum)
        begin
            working_product <= to_sum + working_product;
        end
    // 34
     always @(multiplicand)
        begin
            if(multiplier[0]==1)
                begin
                    to_sum <= multiplicand;
                end
            else
                begin
                    to_sum <= 0;
                end
            multiplicand <= multiplicand << 1;
            multiplier <= multiplier >> 1;
        end 
    always @(to_sum)
        begin
            working_product <= to_sum + working_product;
        end
    // 35
    always @(multiplicand)
        begin
            if(multiplier[0]==1)
                begin
                    to_sum <= multiplicand;
                end
            else
                begin
                    to_sum <= 0;
                end
            multiplicand <= multiplicand << 1;
            multiplier <= multiplier >> 1;
        end 
    always @(to_sum)
        begin
            working_product <= to_sum + working_product;
        end
    // 36
     always @(multiplicand)
        begin
            if(multiplier[0]==1)
                begin
                    to_sum <= multiplicand;
                end
            else
                begin
                    to_sum <= 0;
                end
            multiplicand <= multiplicand << 1;
            multiplier <= multiplier >> 1;
        end 
    always @(to_sum)
        begin
            working_product <= to_sum + working_product;
        end
    // 37
    always @(multiplicand)
        begin
            if(multiplier[0]==1)
                begin
                    to_sum <= multiplicand;
                end
            else
                begin
                    to_sum <= 0;
                end
            multiplicand <= multiplicand << 1;
            multiplier <= multiplier >> 1;
        end 
    always @(to_sum)
        begin
            working_product <= to_sum + working_product;
        end
    // 38
     always @(multiplicand)
        begin
            if(multiplier[0]==1)
                begin
                    to_sum <= multiplicand;
                end
            else
                begin
                    to_sum <= 0;
                end
            multiplicand <= multiplicand << 1;
            multiplier <= multiplier >> 1;
        end 
    always @(to_sum)
        begin
            working_product <= to_sum + working_product;
        end
    // 39
    always @(multiplicand)
        begin
            if(multiplier[0]==1)
                begin
                    to_sum <= multiplicand;
                end
            else
                begin
                    to_sum <= 0;
                end
            multiplicand <= multiplicand << 1;
            multiplier <= multiplier >> 1;
        end 
    always @(to_sum)
        begin
            working_product <= to_sum + working_product;
        end
    // 40
     always @(multiplicand)
        begin
            if(multiplier[0]==1)
                begin
                    to_sum <= multiplicand;
                end
            else
                begin
                    to_sum <= 0;
                end
            multiplicand <= multiplicand << 1;
            multiplier <= multiplier >> 1;
        end 
    always @(to_sum)
        begin
            working_product <= to_sum + working_product;
        end
    // 41
    always @(multiplicand)
        begin
            if(multiplier[0]==1)
                begin
                    to_sum <= multiplicand;
                end
            else
                begin
                    to_sum <= 0;
                end
            multiplicand <= multiplicand << 1;
            multiplier <= multiplier >> 1;
        end 
    always @(to_sum)
        begin
            working_product <= to_sum + working_product;
        end
    // 42
     always @(multiplicand)
        begin
            if(multiplier[0]==1)
                begin
                    to_sum <= multiplicand;
                end
            else
                begin
                    to_sum <= 0;
                end
            multiplicand <= multiplicand << 1;
            multiplier <= multiplier >> 1;
        end 
    always @(to_sum)
        begin
            working_product <= to_sum + working_product;
        end
    // 43
    always @(multiplicand)
        begin
            if(multiplier[0]==1)
                begin
                    to_sum <= multiplicand;
                end
            else
                begin
                    to_sum <= 0;
                end
            multiplicand <= multiplicand << 1;
            multiplier <= multiplier >> 1;
        end 
    always @(to_sum)
        begin
            working_product <= to_sum + working_product;
        end
    // 44
     always @(multiplicand)
        begin
            if(multiplier[0]==1)
                begin
                    to_sum <= multiplicand;
                end
            else
                begin
                    to_sum <= 0;
                end
            multiplicand <= multiplicand << 1;
            multiplier <= multiplier >> 1;
        end 
    always @(to_sum)
        begin
            working_product <= to_sum + working_product;
        end
    // 45
    always @(multiplicand)
        begin
            if(multiplier[0]==1)
                begin
                    to_sum <= multiplicand;
                end
            else
                begin
                    to_sum <= 0;
                end
            multiplicand <= multiplicand << 1;
            multiplier <= multiplier >> 1;
        end 
    always @(to_sum)
        begin
            working_product <= to_sum + working_product;
        end
    // 46
     always @(multiplicand)
        begin
            if(multiplier[0]==1)
                begin
                    to_sum <= multiplicand;
                end
            else
                begin
                    to_sum <= 0;
                end
            multiplicand <= multiplicand << 1;
            multiplier <= multiplier >> 1;
        end 
    always @(to_sum)
        begin
            working_product <= to_sum + working_product;
        end
    // 47
    always @(multiplicand)
        begin
            if(multiplier[0]==1)
                begin
                    to_sum <= multiplicand;
                end
            else
                begin
                    to_sum <= 0;
                end
            multiplicand <= multiplicand << 1;
            multiplier <= multiplier >> 1;
        end 
    always @(to_sum)
        begin
            working_product <= to_sum + working_product;
        end
    // 48
     always @(multiplicand)
        begin
            if(multiplier[0]==1)
                begin
                    to_sum <= multiplicand;
                end
            else
                begin
                    to_sum <= 0;
                end
            multiplicand <= multiplicand << 1;
            multiplier <= multiplier >> 1;
        end 
    always @(to_sum)
        begin
            working_product <= to_sum + working_product;
        end
    
    // 49
    always @(multiplicand)
        begin
            if(multiplier[0]==1)
                begin
                    to_sum <= multiplicand;
                end
            else
                begin
                    to_sum <= 0;
                end
            multiplicand <= multiplicand << 1;
            multiplier <= multiplier >> 1;
        end 
    always @(to_sum)
        begin
            working_product <= to_sum + working_product;
        end
    // 50
     always @(multiplicand)
        begin
            if(multiplier[0]==1)
                begin
                    to_sum <= multiplicand;
                end
            else
                begin
                    to_sum <= 0;
                end
            multiplicand <= multiplicand << 1;
            multiplier <= multiplier >> 1;
        end 
    always @(to_sum)
        begin
            working_product <= to_sum + working_product;
        end
    // 51
    always @(multiplicand)
        begin
            if(multiplier[0]==1)
                begin
                    to_sum <= multiplicand;
                end
            else
                begin
                    to_sum <= 0;
                end
            multiplicand <= multiplicand << 1;
            multiplier <= multiplier >> 1;
        end 
    always @(to_sum)
        begin
            working_product <= to_sum + working_product;
        end
    // 52
     always @(multiplicand)
        begin
            if(multiplier[0]==1)
                begin
                    to_sum <= multiplicand;
                end
            else
                begin
                    to_sum <= 0;
                end
            multiplicand <= multiplicand << 1;
            multiplier <= multiplier >> 1;
        end 
    always @(to_sum)
        begin
            working_product <= to_sum + working_product;
        end
    // 53
    always @(multiplicand)
        begin
            if(multiplier[0]==1)
                begin
                    to_sum <= multiplicand;
                end
            else
                begin
                    to_sum <= 0;
                end
            multiplicand <= multiplicand << 1;
            multiplier <= multiplier >> 1;
        end 
    always @(to_sum)
        begin
            working_product <= to_sum + working_product;
        end
    // 54
     always @(multiplicand)
        begin
            if(multiplier[0]==1)
                begin
                    to_sum <= multiplicand;
                end
            else
                begin
                    to_sum <= 0;
                end
            multiplicand <= multiplicand << 1;
            multiplier <= multiplier >> 1;
        end 
    always @(to_sum)
        begin
            working_product <= to_sum + working_product;
        end
    // 55
    always @(multiplicand)
        begin
            if(multiplier[0]==1)
                begin
                    to_sum <= multiplicand;
                end
            else
                begin
                    to_sum <= 0;
                end
            multiplicand <= multiplicand << 1;
            multiplier <= multiplier >> 1;
        end 
    always @(to_sum)
        begin
            working_product <= to_sum + working_product;
        end
    // 56
     always @(multiplicand)
        begin
            if(multiplier[0]==1)
                begin
                    to_sum <= multiplicand;
                end
            else
                begin
                    to_sum <= 0;
                end
            multiplicand <= multiplicand << 1;
            multiplier <= multiplier >> 1;
        end 
    always @(to_sum)
        begin
            working_product <= to_sum + working_product;
        end
    // 57
    always @(multiplicand)
        begin
            if(multiplier[0]==1)
                begin
                    to_sum <= multiplicand;
                end
            else
                begin
                    to_sum <= 0;
                end
            multiplicand <= multiplicand << 1;
            multiplier <= multiplier >> 1;
        end 
    always @(to_sum)
        begin
            working_product <= to_sum + working_product;
        end
    // 58
     always @(multiplicand)
        begin
            if(multiplier[0]==1)
                begin
                    to_sum <= multiplicand;
                end
            else
                begin
                    to_sum <= 0;
                end
            multiplicand <= multiplicand << 1;
            multiplier <= multiplier >> 1;
        end 
    always @(to_sum)
        begin
            working_product <= to_sum + working_product;
        end
    // 59
    always @(multiplicand)
        begin
            if(multiplier[0]==1)
                begin
                    to_sum <= multiplicand;
                end
            else
                begin
                    to_sum <= 0;
                end
            multiplicand <= multiplicand << 1;
            multiplier <= multiplier >> 1;
        end 
    always @(to_sum)
        begin
            working_product <= to_sum + working_product;
        end
    // 60
     always @(multiplicand)
        begin
            if(multiplier[0]==1)
                begin
                    to_sum <= multiplicand;
                end
            else
                begin
                    to_sum <= 0;
                end
            multiplicand <= multiplicand << 1;
            multiplier <= multiplier >> 1;
        end 
    always @(to_sum)
        begin
            working_product <= to_sum + working_product;
        end
    // 61
    always @(multiplicand)
        begin
            if(multiplier[0]==1)
                begin
                    to_sum <= multiplicand;
                end
            else
                begin
                    to_sum <= 0;
                end
            multiplicand <= multiplicand << 1;
            multiplier <= multiplier >> 1;
        end 
    always @(to_sum)
        begin
            working_product <= to_sum + working_product;
        end
    // 62
     always @(multiplicand)
        begin
            if(multiplier[0]==1)
                begin
                    to_sum <= multiplicand;
                end
            else
                begin
                    to_sum <= 0;
                end
            multiplicand <= multiplicand << 1;
            multiplier <= multiplier >> 1;
        end 
    always @(to_sum)
        begin
            working_product <= to_sum + working_product;
        end
    
    // 63
    always @(multiplicand)
        begin
            if(multiplier[0]==1)
                begin
                    to_sum <= multiplicand;
                end
            else
                begin
                    to_sum <= 0;
                end
            multiplicand <= multiplicand << 1;
            multiplier <= multiplier >> 1;
        end 
    always @(to_sum)
        begin
            working_product <= to_sum + working_product;
        end
    
    // 64
     always @(multiplicand)
        begin
            if(multiplier[0]==1)
                begin
                    to_sum <= multiplicand;
                end
            else
                begin
                    to_sum <= 0;
                end
            multiplicand <= multiplicand << 1;
            multiplier <= multiplier >> 1;
        end 
    always @(to_sum)
        begin
            working_product <= to_sum + working_product;
        end

    assign product = working_product;
    

endmodule

module sixtyfourBitSignedMultiplier(
    output [127:0] product,
    input [63:0] a,
    input [63:0] b
    );

    wire [127:0] padded_a;
    wire [127:0] padded_b;
    reg padded_a_neg;
    reg padded_b_neg;

    
    reg[127:0] inverted_a;
    reg[127:0] inverted_b;
    reg[127:0] bit_add;    

    wire c_out;
    reg c_in = 0;
    
    // Convert a to positive number
    always @(a) begin
    case(a[63])
        1'b0: 
            begin
                inverted_a <= {64'd0,a};
            end
        1'b1: 
            begin
                inverted_a <= {64'd0,~a} + 1;
                padded_a_neg <= 1;
            end
    endcase
    end
    assign padded_a = inverted_a;
    // end conversion
    
    
    // Convert b to positive number
    always @(b) begin
    case(b[63])
        1'b0: 
            begin
                inverted_b <= {64'd0,b};
            end
        1'b1:
            begin 
                inverted_b <= {64'd0,~b} + 1;
                padded_b_neg <= 1;
            end
    endcase
    end
    
    assign padded_b = inverted_b;
    // end conversion
    
    reg [127:0] multiplier, multiplicand, to_sum, working_product;
    
    always @(padded_b) 
        begin
            working_product <= 0;
            multiplier <= padded_a;
            multiplicand <= padded_b;
        end
    // 1
    always @(multiplicand)
        begin
            if(multiplier[0]==1)
                begin
                    to_sum <= multiplicand;
                end
            else
                begin
                    to_sum <= 0;
                end
            multiplicand <= multiplicand << 1;
            multiplier <= multiplier >> 1;
        end 
    always @(to_sum)
        begin
            working_product <= to_sum + working_product;
        end
    // 2
     always @(multiplicand)
        begin
            if(multiplier[0]==1)
                begin
                    to_sum <= multiplicand;
                end
            else
                begin
                    to_sum <= 0;
                end
            multiplicand <= multiplicand << 1;
            multiplier <= multiplier >> 1;
        end 
    always @(to_sum)
        begin
            working_product <= to_sum + working_product;
        end
    // 3
    always @(multiplicand)
        begin
            if(multiplier[0]==1)
                begin
                    to_sum <= multiplicand;
                end
            else
                begin
                    to_sum <= 0;
                end
            multiplicand <= multiplicand << 1;
            multiplier <= multiplier >> 1;
        end 
    always @(to_sum)
        begin
            working_product <= to_sum + working_product;
        end
    // 4
     always @(multiplicand)
        begin
            if(multiplier[0]==1)
                begin
                    to_sum <= multiplicand;
                end
            else
                begin
                    to_sum <= 0;
                end
            multiplicand <= multiplicand << 1;
            multiplier <= multiplier >> 1;
        end 
    always @(to_sum)
        begin
            working_product <= to_sum + working_product;
        end
    // 5
    always @(multiplicand)
        begin
            if(multiplier[0]==1)
                begin
                    to_sum <= multiplicand;
                end
            else
                begin
                    to_sum <= 0;
                end
            multiplicand <= multiplicand << 1;
            multiplier <= multiplier >> 1;
        end 
    always @(to_sum)
        begin
            working_product <= to_sum + working_product;
        end
    // 6
     always @(multiplicand)
        begin
            if(multiplier[0]==1)
                begin
                    to_sum <= multiplicand;
                end
            else
                begin
                    to_sum <= 0;
                end
            multiplicand <= multiplicand << 1;
            multiplier <= multiplier >> 1;
        end 
    always @(to_sum)
        begin
            working_product <= to_sum + working_product;
        end
    // 7
    always @(multiplicand)
        begin
            if(multiplier[0]==1)
                begin
                    to_sum <= multiplicand;
                end
            else
                begin
                    to_sum <= 0;
                end
            multiplicand <= multiplicand << 1;
            multiplier <= multiplier >> 1;
        end 
    always @(to_sum)
        begin
            working_product <= to_sum + working_product;
        end
    // 8
     always @(multiplicand)
        begin
            if(multiplier[0]==1)
                begin
                    to_sum <= multiplicand;
                end
            else
                begin
                    to_sum <= 0;
                end
            multiplicand <= multiplicand << 1;
            multiplier <= multiplier >> 1;
        end 
    always @(to_sum)
        begin
            working_product <= to_sum + working_product;
        end
    // 9
    always @(multiplicand)
        begin
            if(multiplier[0]==1)
                begin
                    to_sum <= multiplicand;
                end
            else
                begin
                    to_sum <= 0;
                end
            multiplicand <= multiplicand << 1;
            multiplier <= multiplier >> 1;
        end 
    always @(to_sum)
        begin
            working_product <= to_sum + working_product;
        end
    // 10
     always @(multiplicand)
        begin
            if(multiplier[0]==1)
                begin
                    to_sum <= multiplicand;
                end
            else
                begin
                    to_sum <= 0;
                end
            multiplicand <= multiplicand << 1;
            multiplier <= multiplier >> 1;
        end 
    always @(to_sum)
        begin
            working_product <= to_sum + working_product;
        end
    // 11
    always @(multiplicand)
        begin
            if(multiplier[0]==1)
                begin
                    to_sum <= multiplicand;
                end
            else
                begin
                    to_sum <= 0;
                end
            multiplicand <= multiplicand << 1;
            multiplier <= multiplier >> 1;
        end 
    always @(to_sum)
        begin
            working_product <= to_sum + working_product;
        end
    // 12
     always @(multiplicand)
        begin
            if(multiplier[0]==1)
                begin
                    to_sum <= multiplicand;
                end
            else
                begin
                    to_sum <= 0;
                end
            multiplicand <= multiplicand << 1;
            multiplier <= multiplier >> 1;
        end 
    always @(to_sum)
        begin
            working_product <= to_sum + working_product;
        end
    // 13
    always @(multiplicand)
        begin
            if(multiplier[0]==1)
                begin
                    to_sum <= multiplicand;
                end
            else
                begin
                    to_sum <= 0;
                end
            multiplicand <= multiplicand << 1;
            multiplier <= multiplier >> 1;
        end 
    always @(to_sum)
        begin
            working_product <= to_sum + working_product;
        end
    // 14
     always @(multiplicand)
        begin
            if(multiplier[0]==1)
                begin
                    to_sum <= multiplicand;
                end
            else
                begin
                    to_sum <= 0;
                end
            multiplicand <= multiplicand << 1;
            multiplier <= multiplier >> 1;
        end 
    always @(to_sum)
        begin
            working_product <= to_sum + working_product;
        end
    // 15
    always @(multiplicand)
        begin
            if(multiplier[0]==1)
                begin
                    to_sum <= multiplicand;
                end
            else
                begin
                    to_sum <= 0;
                end
            multiplicand <= multiplicand << 1;
            multiplier <= multiplier >> 1;
        end 
    always @(to_sum)
        begin
            working_product <= to_sum + working_product;
        end
    // 16
     always @(multiplicand)
        begin
            if(multiplier[0]==1)
                begin
                    to_sum <= multiplicand;
                end
            else
                begin
                    to_sum <= 0;
                end
            multiplicand <= multiplicand << 1;
            multiplier <= multiplier >> 1;
        end 
    always @(to_sum)
        begin
            working_product <= to_sum + working_product;
        end
    
    // 17
    always @(multiplicand)
        begin
            if(multiplier[0]==1)
                begin
                    to_sum <= multiplicand;
                end
            else
                begin
                    to_sum <= 0;
                end
            multiplicand <= multiplicand << 1;
            multiplier <= multiplier >> 1;
        end 
    always @(to_sum)
        begin
            working_product <= to_sum + working_product;
        end
    // 18
     always @(multiplicand)
        begin
            if(multiplier[0]==1)
                begin
                    to_sum <= multiplicand;
                end
            else
                begin
                    to_sum <= 0;
                end
            multiplicand <= multiplicand << 1;
            multiplier <= multiplier >> 1;
        end 
    always @(to_sum)
        begin
            working_product <= to_sum + working_product;
        end
    // 19
    always @(multiplicand)
        begin
            if(multiplier[0]==1)
                begin
                    to_sum <= multiplicand;
                end
            else
                begin
                    to_sum <= 0;
                end
            multiplicand <= multiplicand << 1;
            multiplier <= multiplier >> 1;
        end 
    always @(to_sum)
        begin
            working_product <= to_sum + working_product;
        end
    // 20
     always @(multiplicand)
        begin
            if(multiplier[0]==1)
                begin
                    to_sum <= multiplicand;
                end
            else
                begin
                    to_sum <= 0;
                end
            multiplicand <= multiplicand << 1;
            multiplier <= multiplier >> 1;
        end 
    always @(to_sum)
        begin
            working_product <= to_sum + working_product;
        end
    // 21
    always @(multiplicand)
        begin
            if(multiplier[0]==1)
                begin
                    to_sum <= multiplicand;
                end
            else
                begin
                    to_sum <= 0;
                end
            multiplicand <= multiplicand << 1;
            multiplier <= multiplier >> 1;
        end 
    always @(to_sum)
        begin
            working_product <= to_sum + working_product;
        end
    // 22
     always @(multiplicand)
        begin
            if(multiplier[0]==1)
                begin
                    to_sum <= multiplicand;
                end
            else
                begin
                    to_sum <= 0;
                end
            multiplicand <= multiplicand << 1;
            multiplier <= multiplier >> 1;
        end 
    always @(to_sum)
        begin
            working_product <= to_sum + working_product;
        end
    // 23
    always @(multiplicand)
        begin
            if(multiplier[0]==1)
                begin
                    to_sum <= multiplicand;
                end
            else
                begin
                    to_sum <= 0;
                end
            multiplicand <= multiplicand << 1;
            multiplier <= multiplier >> 1;
        end 
    always @(to_sum)
        begin
            working_product <= to_sum + working_product;
        end
    // 24
     always @(multiplicand)
        begin
            if(multiplier[0]==1)
                begin
                    to_sum <= multiplicand;
                end
            else
                begin
                    to_sum <= 0;
                end
            multiplicand <= multiplicand << 1;
            multiplier <= multiplier >> 1;
        end 
    always @(to_sum)
        begin
            working_product <= to_sum + working_product;
        end
    // 25
    always @(multiplicand)
        begin
            if(multiplier[0]==1)
                begin
                    to_sum <= multiplicand;
                end
            else
                begin
                    to_sum <= 0;
                end
            multiplicand <= multiplicand << 1;
            multiplier <= multiplier >> 1;
        end 
    always @(to_sum)
        begin
            working_product <= to_sum + working_product;
        end
    // 26
     always @(multiplicand)
        begin
            if(multiplier[0]==1)
                begin
                    to_sum <= multiplicand;
                end
            else
                begin
                    to_sum <= 0;
                end
            multiplicand <= multiplicand << 1;
            multiplier <= multiplier >> 1;
        end 
    always @(to_sum)
        begin
            working_product <= to_sum + working_product;
        end
    // 27
    always @(multiplicand)
        begin
            if(multiplier[0]==1)
                begin
                    to_sum <= multiplicand;
                end
            else
                begin
                    to_sum <= 0;
                end
            multiplicand <= multiplicand << 1;
            multiplier <= multiplier >> 1;
        end 
    always @(to_sum)
        begin
            working_product <= to_sum + working_product;
        end
    // 28
     always @(multiplicand)
        begin
            if(multiplier[0]==1)
                begin
                    to_sum <= multiplicand;
                end
            else
                begin
                    to_sum <= 0;
                end
            multiplicand <= multiplicand << 1;
            multiplier <= multiplier >> 1;
        end 
    always @(to_sum)
        begin
            working_product <= to_sum + working_product;
        end
    // 29
    always @(multiplicand)
        begin
            if(multiplier[0]==1)
                begin
                    to_sum <= multiplicand;
                end
            else
                begin
                    to_sum <= 0;
                end
            multiplicand <= multiplicand << 1;
            multiplier <= multiplier >> 1;
        end 
    always @(to_sum)
        begin
            working_product <= to_sum + working_product;
        end
    // 30
     always @(multiplicand)
        begin
            if(multiplier[0]==1)
                begin
                    to_sum <= multiplicand;
                end
            else
                begin
                    to_sum <= 0;
                end
            multiplicand <= multiplicand << 1;
            multiplier <= multiplier >> 1;
        end 
    always @(to_sum)
        begin
            working_product <= to_sum + working_product;
        end
    
    // 31
    always @(multiplicand)
        begin
            if(multiplier[0]==1)
                begin
                    to_sum <= multiplicand;
                end
            else
                begin
                    to_sum <= 0;
                end
            multiplicand <= multiplicand << 1;
            multiplier <= multiplier >> 1;
        end 
    always @(to_sum)
        begin
            working_product <= to_sum + working_product;
        end
    
    // 32
     always @(multiplicand)
        begin
            if(multiplier[0]==1)
                begin
                    to_sum <= multiplicand;
                end
            else
                begin
                    to_sum <= 0;
                end
            multiplicand <= multiplicand << 1;
            multiplier <= multiplier >> 1;
        end 
    always @(to_sum)
        begin
            working_product <= to_sum + working_product;
        end
    
    // 33
    always @(multiplicand)
        begin
            if(multiplier[0]==1)
                begin
                    to_sum <= multiplicand;
                end
            else
                begin
                    to_sum <= 0;
                end
            multiplicand <= multiplicand << 1;
            multiplier <= multiplier >> 1;
        end 
    always @(to_sum)
        begin
            working_product <= to_sum + working_product;
        end
    // 34
     always @(multiplicand)
        begin
            if(multiplier[0]==1)
                begin
                    to_sum <= multiplicand;
                end
            else
                begin
                    to_sum <= 0;
                end
            multiplicand <= multiplicand << 1;
            multiplier <= multiplier >> 1;
        end 
    always @(to_sum)
        begin
            working_product <= to_sum + working_product;
        end
    // 35
    always @(multiplicand)
        begin
            if(multiplier[0]==1)
                begin
                    to_sum <= multiplicand;
                end
            else
                begin
                    to_sum <= 0;
                end
            multiplicand <= multiplicand << 1;
            multiplier <= multiplier >> 1;
        end 
    always @(to_sum)
        begin
            working_product <= to_sum + working_product;
        end
    // 36
     always @(multiplicand)
        begin
            if(multiplier[0]==1)
                begin
                    to_sum <= multiplicand;
                end
            else
                begin
                    to_sum <= 0;
                end
            multiplicand <= multiplicand << 1;
            multiplier <= multiplier >> 1;
        end 
    always @(to_sum)
        begin
            working_product <= to_sum + working_product;
        end
    // 37
    always @(multiplicand)
        begin
            if(multiplier[0]==1)
                begin
                    to_sum <= multiplicand;
                end
            else
                begin
                    to_sum <= 0;
                end
            multiplicand <= multiplicand << 1;
            multiplier <= multiplier >> 1;
        end 
    always @(to_sum)
        begin
            working_product <= to_sum + working_product;
        end
    // 38
     always @(multiplicand)
        begin
            if(multiplier[0]==1)
                begin
                    to_sum <= multiplicand;
                end
            else
                begin
                    to_sum <= 0;
                end
            multiplicand <= multiplicand << 1;
            multiplier <= multiplier >> 1;
        end 
    always @(to_sum)
        begin
            working_product <= to_sum + working_product;
        end
    // 39
    always @(multiplicand)
        begin
            if(multiplier[0]==1)
                begin
                    to_sum <= multiplicand;
                end
            else
                begin
                    to_sum <= 0;
                end
            multiplicand <= multiplicand << 1;
            multiplier <= multiplier >> 1;
        end 
    always @(to_sum)
        begin
            working_product <= to_sum + working_product;
        end
    // 40
     always @(multiplicand)
        begin
            if(multiplier[0]==1)
                begin
                    to_sum <= multiplicand;
                end
            else
                begin
                    to_sum <= 0;
                end
            multiplicand <= multiplicand << 1;
            multiplier <= multiplier >> 1;
        end 
    always @(to_sum)
        begin
            working_product <= to_sum + working_product;
        end
    // 41
    always @(multiplicand)
        begin
            if(multiplier[0]==1)
                begin
                    to_sum <= multiplicand;
                end
            else
                begin
                    to_sum <= 0;
                end
            multiplicand <= multiplicand << 1;
            multiplier <= multiplier >> 1;
        end 
    always @(to_sum)
        begin
            working_product <= to_sum + working_product;
        end
    // 42
     always @(multiplicand)
        begin
            if(multiplier[0]==1)
                begin
                    to_sum <= multiplicand;
                end
            else
                begin
                    to_sum <= 0;
                end
            multiplicand <= multiplicand << 1;
            multiplier <= multiplier >> 1;
        end 
    always @(to_sum)
        begin
            working_product <= to_sum + working_product;
        end
    // 43
    always @(multiplicand)
        begin
            if(multiplier[0]==1)
                begin
                    to_sum <= multiplicand;
                end
            else
                begin
                    to_sum <= 0;
                end
            multiplicand <= multiplicand << 1;
            multiplier <= multiplier >> 1;
        end 
    always @(to_sum)
        begin
            working_product <= to_sum + working_product;
        end
    // 44
     always @(multiplicand)
        begin
            if(multiplier[0]==1)
                begin
                    to_sum <= multiplicand;
                end
            else
                begin
                    to_sum <= 0;
                end
            multiplicand <= multiplicand << 1;
            multiplier <= multiplier >> 1;
        end 
    always @(to_sum)
        begin
            working_product <= to_sum + working_product;
        end
    // 45
    always @(multiplicand)
        begin
            if(multiplier[0]==1)
                begin
                    to_sum <= multiplicand;
                end
            else
                begin
                    to_sum <= 0;
                end
            multiplicand <= multiplicand << 1;
            multiplier <= multiplier >> 1;
        end 
    always @(to_sum)
        begin
            working_product <= to_sum + working_product;
        end
    // 46
     always @(multiplicand)
        begin
            if(multiplier[0]==1)
                begin
                    to_sum <= multiplicand;
                end
            else
                begin
                    to_sum <= 0;
                end
            multiplicand <= multiplicand << 1;
            multiplier <= multiplier >> 1;
        end 
    always @(to_sum)
        begin
            working_product <= to_sum + working_product;
        end
    // 47
    always @(multiplicand)
        begin
            if(multiplier[0]==1)
                begin
                    to_sum <= multiplicand;
                end
            else
                begin
                    to_sum <= 0;
                end
            multiplicand <= multiplicand << 1;
            multiplier <= multiplier >> 1;
        end 
    always @(to_sum)
        begin
            working_product <= to_sum + working_product;
        end
    // 48
     always @(multiplicand)
        begin
            if(multiplier[0]==1)
                begin
                    to_sum <= multiplicand;
                end
            else
                begin
                    to_sum <= 0;
                end
            multiplicand <= multiplicand << 1;
            multiplier <= multiplier >> 1;
        end 
    always @(to_sum)
        begin
            working_product <= to_sum + working_product;
        end
    
    // 49
    always @(multiplicand)
        begin
            if(multiplier[0]==1)
                begin
                    to_sum <= multiplicand;
                end
            else
                begin
                    to_sum <= 0;
                end
            multiplicand <= multiplicand << 1;
            multiplier <= multiplier >> 1;
        end 
    always @(to_sum)
        begin
            working_product <= to_sum + working_product;
        end
    // 50
     always @(multiplicand)
        begin
            if(multiplier[0]==1)
                begin
                    to_sum <= multiplicand;
                end
            else
                begin
                    to_sum <= 0;
                end
            multiplicand <= multiplicand << 1;
            multiplier <= multiplier >> 1;
        end 
    always @(to_sum)
        begin
            working_product <= to_sum + working_product;
        end
    // 51
    always @(multiplicand)
        begin
            if(multiplier[0]==1)
                begin
                    to_sum <= multiplicand;
                end
            else
                begin
                    to_sum <= 0;
                end
            multiplicand <= multiplicand << 1;
            multiplier <= multiplier >> 1;
        end 
    always @(to_sum)
        begin
            working_product <= to_sum + working_product;
        end
    // 52
     always @(multiplicand)
        begin
            if(multiplier[0]==1)
                begin
                    to_sum <= multiplicand;
                end
            else
                begin
                    to_sum <= 0;
                end
            multiplicand <= multiplicand << 1;
            multiplier <= multiplier >> 1;
        end 
    always @(to_sum)
        begin
            working_product <= to_sum + working_product;
        end
    // 53
    always @(multiplicand)
        begin
            if(multiplier[0]==1)
                begin
                    to_sum <= multiplicand;
                end
            else
                begin
                    to_sum <= 0;
                end
            multiplicand <= multiplicand << 1;
            multiplier <= multiplier >> 1;
        end 
    always @(to_sum)
        begin
            working_product <= to_sum + working_product;
        end
    // 54
     always @(multiplicand)
        begin
            if(multiplier[0]==1)
                begin
                    to_sum <= multiplicand;
                end
            else
                begin
                    to_sum <= 0;
                end
            multiplicand <= multiplicand << 1;
            multiplier <= multiplier >> 1;
        end 
    always @(to_sum)
        begin
            working_product <= to_sum + working_product;
        end
    // 55
    always @(multiplicand)
        begin
            if(multiplier[0]==1)
                begin
                    to_sum <= multiplicand;
                end
            else
                begin
                    to_sum <= 0;
                end
            multiplicand <= multiplicand << 1;
            multiplier <= multiplier >> 1;
        end 
    always @(to_sum)
        begin
            working_product <= to_sum + working_product;
        end
    // 56
     always @(multiplicand)
        begin
            if(multiplier[0]==1)
                begin
                    to_sum <= multiplicand;
                end
            else
                begin
                    to_sum <= 0;
                end
            multiplicand <= multiplicand << 1;
            multiplier <= multiplier >> 1;
        end 
    always @(to_sum)
        begin
            working_product <= to_sum + working_product;
        end
    // 57
    always @(multiplicand)
        begin
            if(multiplier[0]==1)
                begin
                    to_sum <= multiplicand;
                end
            else
                begin
                    to_sum <= 0;
                end
            multiplicand <= multiplicand << 1;
            multiplier <= multiplier >> 1;
        end 
    always @(to_sum)
        begin
            working_product <= to_sum + working_product;
        end
    // 58
     always @(multiplicand)
        begin
            if(multiplier[0]==1)
                begin
                    to_sum <= multiplicand;
                end
            else
                begin
                    to_sum <= 0;
                end
            multiplicand <= multiplicand << 1;
            multiplier <= multiplier >> 1;
        end 
    always @(to_sum)
        begin
            working_product <= to_sum + working_product;
        end
    // 59
    always @(multiplicand)
        begin
            if(multiplier[0]==1)
                begin
                    to_sum <= multiplicand;
                end
            else
                begin
                    to_sum <= 0;
                end
            multiplicand <= multiplicand << 1;
            multiplier <= multiplier >> 1;
        end 
    always @(to_sum)
        begin
            working_product <= to_sum + working_product;
        end
    // 60
     always @(multiplicand)
        begin
            if(multiplier[0]==1)
                begin
                    to_sum <= multiplicand;
                end
            else
                begin
                    to_sum <= 0;
                end
            multiplicand <= multiplicand << 1;
            multiplier <= multiplier >> 1;
        end 
    always @(to_sum)
        begin
            working_product <= to_sum + working_product;
        end
    // 61
    always @(multiplicand)
        begin
            if(multiplier[0]==1)
                begin
                    to_sum <= multiplicand;
                end
            else
                begin
                    to_sum <= 0;
                end
            multiplicand <= multiplicand << 1;
            multiplier <= multiplier >> 1;
        end 
    always @(to_sum)
        begin
            working_product <= to_sum + working_product;
        end
    // 62
     always @(multiplicand)
        begin
            if(multiplier[0]==1)
                begin
                    to_sum <= multiplicand;
                end
            else
                begin
                    to_sum <= 0;
                end
            multiplicand <= multiplicand << 1;
            multiplier <= multiplier >> 1;
        end 
    always @(to_sum)
        begin
            working_product <= to_sum + working_product;
        end
    
    // 63
    always @(multiplicand)
        begin
            if(multiplier[0]==1)
                begin
                    to_sum <= multiplicand;
                end
            else
                begin
                    to_sum <= 0;
                end
            multiplicand <= multiplicand << 1;
            multiplier <= multiplier >> 1;
        end 
    always @(to_sum)
        begin
            working_product <= to_sum + working_product;
        end
    
    // 64
     always @(multiplicand)
        begin
            if(multiplier[0]==1)
                begin
                    to_sum <= multiplicand;
                end
            else
                begin
                    to_sum <= 0;
                end
            multiplicand <= multiplicand << 1;
            multiplier <= multiplier >> 1;
        end 
    always @(to_sum)
        begin
            working_product <= to_sum + working_product;
        end


    reg [127:0] negated_product;

    always @(*) begin
        if(padded_b_neg ^ padded_a_neg) begin
                negated_product = ~working_product + 1;
        end
        else begin
            negated_product = working_product;
        end
    end

    assign product = negated_product;
    

endmodule
