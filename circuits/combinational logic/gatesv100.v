module top_module( 
    input [99:0] in,
    output [98:0] out_both,
    output [99:1] out_any,
    output [99:0] out_different );
    always @(in) begin
        for (integer i = 0; i < 100; i = i + 1) begin
            if (i < 99) begin
                out_both[i] = in[i] & in[i+1];
            end
            if (i > 0) begin
                out_any[i] = in[i] | in[i-1];
            end
            if (i == 99) begin
                out_different[i] = in[i] ^ in[0];
            end else begin
                out_different[i] = in[i] ^ in[i+1];
            end
        end
    end
endmodule

module top_module (
	input [99:0] in,
	output [98:0] out_both,
	output [99:1] out_any,
	output [99:0] out_different
);

	// See gatesv for explanations.
	assign out_both = in & in[99:1];
	assign out_any = in[99:1] | in ;
	assign out_different = in ^ {in[0], in[99:1]};
	
endmodule
