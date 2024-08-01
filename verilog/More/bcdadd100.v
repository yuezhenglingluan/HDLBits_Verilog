module top_module( 
    input [399:0] a, b,
    input cin,
    output cout,
    output [399:0] sum );
    wire cout_temp[99:0];
    assign cout = cout_temp[99];
    bcd_fadd bcd0(a[3:0], b[3:0], cin, cout_temp[0], sum[3:0]);
    genvar i;
    generate
        for (i = 1; i < 100; i = i + 1) begin: gen
            bcd_fadd bcd(.a(a[(4*i)+3:(4*i)]), .b(b[(4*i)+3:(4*i)]), .cin(cout_temp[i-1]), .cout(cout_temp[i]), .sum(sum[(4*i)+3:(4*i)]));
        end : gen
    endgenerate
endmodule
