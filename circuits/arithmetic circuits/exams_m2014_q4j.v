module top_module (
    input [3:0] x,
    input [3:0] y, 
    output [4:0] sum);
    wire cout0, cout1, cout2;
    full_adder adder1(.a(x[0]), .b(y[0]), .cout(cout0), .sum(sum[0]));
    full_adder adder2(.a(x[1]), .b(y[1]), .cout(cout1), .cin(cout0), .sum(sum[1]));
    full_adder adder3(.a(x[2]), .b(y[2]), .cout(cout2), .cin(cout1), .sum(sum[2]));
    full_adder adder4(.a(x[3]), .b(y[3]), .cout(sum[4]), .cin(cout2), .sum(sum[3]));
endmodule
module full_adder( 
    input a, b, cin,
    output cout, sum );
    assign sum = a ^ b ^ cin;
    assign cout = (a & b) | (a & cin) | (b & cin);
endmodule