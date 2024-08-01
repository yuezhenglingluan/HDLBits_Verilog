module top_module(
    input [31:0] a,
    input [31:0] b,
    input sub,
    output [31:0] sum
);  
    wire cout1;
    wire [31:0]temp;
    assign temp = b ^ {32{sub}};
    add16 add1(a[15:0], temp[15:0], sub, sum[15:0], cout1);
    add16 add2(.a(a[31:16]), .b(temp[31:16]), .cin(cout1), .sum(sum[31:16]));
endmodule
