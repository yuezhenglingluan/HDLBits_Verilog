module top_module (
    input a,
    input b,
    output q );

    // assign q = 0; // Fix me
    assign q = a & b;
endmodule