module top_module (
    input a,
    input b,
    input c,
    input d,
    output q );

    // assign q = 0; // Fix me
    assign q = (a & c) | (a & d) | (b & c) | (b & d);


endmodule