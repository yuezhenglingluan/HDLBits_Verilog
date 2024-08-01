module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
    wire [15:0]x, y;
    wire cout1;
    add16 add1(a[15:0], b[15:0], 1'b0, sum[15:0], cout1);
    add16 add2(.a(a[31:16]), .b(b[31:16]), .cin(1'b0), .sum(x));
    add16 add3(.a(a[31:16]), .b(b[31:16]), .cin(1'b1), .sum(y));

    mux mux1(.a(x), .b(y), .sel(cout1), .out(sum[31:16]));

endmodule

module mux (input [15:0]a, input [15:0]b, input sel, output [15:0]out);
    always @(a, b, sel) begin
        case(sel)
            1'b0: out = a;
            1'b1: out = b;
            default: out = 16'b0;
        endcase
    end
endmodule