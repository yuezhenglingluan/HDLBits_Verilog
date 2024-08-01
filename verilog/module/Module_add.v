module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
    wire temp;
    add16 add1(.a(a[15:0]), .b(b[15:0]), .sum(sum[15:0]), .cout(temp));
    add16 add2(.a(a[31:16]), .b(b[31:16]), .sum(sum[31:16]), .cin(temp));
endmodule
