module top_module( 
    input [99:0] a, b,
    input cin,
    output [99:0] cout,
    output [99:0] sum );

        adder aa(a[0], b[0], cin, cout[0], sum[0]);
    	genvar i;
    	generate
            for (i = 1; i < 100; i = i + 1) begin : gen
                adder aaaa(.a(a[i]), .b(b[i]), .cin(cout[i-1]), .cout(cout[i]), .sum(sum[i]));
        	end : gen
    	endgenerate
    
endmodule
module adder (input a, b, cin, output cout, sum);
	assign sum = a ^ b ^ cin;
    assign cout = (a & b) | (a & cin) | (b & cin);
endmodule
