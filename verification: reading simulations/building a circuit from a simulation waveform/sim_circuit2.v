module top_module (
    input a,
    input b,
    input c,
    input d,
    output q );

    // assign q = 0; // Fix me
    assign q = ~(a ^ b ^ c ^ d);
endmodule;