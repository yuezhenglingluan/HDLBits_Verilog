module top_module ( 
    input clk, 
    input [7:0] d, 
    input [1:0] sel, 
    output [7:0] q 
);
    wire [7:0]x;
    wire [7:0]y;
    wire [7:0]z;

    my_dff8 dff1(clk, d, x);
    my_dff8 dff2(clk, x, y);
    my_dff8 dff3(clk, y, z);

    mux mux1(d, x, y, z, sel, q);
endmodule

module mux (input [7:0]a, input [7:0]b, input [7:0]c, input [7:0]d, input [1:0]sel, output [7:0]out);
    always @(a, b, c, d, sel) begin
        case(sel)
            2'b00: out = a;
            2'b01: out = b;
            2'b10: out = c;
            2'b11: out = d;
            default: out = 7'b0;
        endcase
    end
endmodule