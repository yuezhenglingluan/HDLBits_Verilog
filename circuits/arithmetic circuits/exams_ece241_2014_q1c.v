module top_module (
    input [7:0] a,
    input [7:0] b,
    output [7:0] s,
    output overflow
); //
 
    // assign s = ...
    // assign overflow = ...
    wire [7:0]cout;
    adder8 adder8_1 (a, b, 1'b0, cout, s);
    assign overflow = cout[7] ^ cout[6];

endmodule


module adder8( input [7:0] a, b, input cin, output [7:0]cout, output [7:0] sum );
    full_adder adder1(a[0], b[0], cin, cout[0], sum[0]);
    full_adder adder2(a[1], b[1], cout[0], cout[1], sum[1]);
    full_adder adder3(a[2], b[2], cout[1], cout[2], sum[2]);
    full_adder adder4(a[3], b[3], cout[2], cout[3], sum[3]);
    full_adder adder5(a[4], b[4], cout[3], cout[4], sum[4]);
    full_adder adder6(a[5], b[5], cout[4], cout[5], sum[5]);
    full_adder adder7(a[6], b[6], cout[5], cout[6], sum[6]);
    full_adder adder8(a[7], b[7], cout[6], cout[7], sum[7]);
endmodule

module full_adder( 
    input a, b, cin,
    output cout, sum );
    assign sum = a ^ b ^ cin;
    assign cout = (a & b) | (a & cin) | (b & cin);
endmodule