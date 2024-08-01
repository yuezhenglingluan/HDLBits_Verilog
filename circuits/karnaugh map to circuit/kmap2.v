module top_module(
    input a,
    input b,
    input c,
    input d,
    output out  ); 
    assign out = (~c & ~b) | (~d & ~a & b) | (c & ~a & ~d) | (c & ~a & b) | (c & d & a);
endmodule
