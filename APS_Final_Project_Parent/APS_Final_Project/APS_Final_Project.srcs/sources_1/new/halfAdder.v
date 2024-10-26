module halfAdder (
    output sum,
    output c_out,
    input a,
    input b
    );
    xor M1 (sum, a, b);
    and M2 (c_out, a, b);
endmodule