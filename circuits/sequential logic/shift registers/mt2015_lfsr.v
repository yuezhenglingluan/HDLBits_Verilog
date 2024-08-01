module top_module (
	input [2:0] SW,      // R
	input [1:0] KEY,     // L and clk
	output [2:0] LEDR);  // Q
    box box1(.r(SW[0]), .q_in(LEDR[2]), .clk(KEY[0]), .l(KEY[1]), .q_out(LEDR[0]));
    box box2(.r(SW[1]), .q_in(LEDR[0]), .clk(KEY[0]), .l(KEY[1]), .q_out(LEDR[1]));
    wire a;
    assign a = LEDR[1] ^ LEDR[2];
    box box3(.r(SW[2]), .q_in(a), .clk(KEY[0]), .l(KEY[1]), .q_out(LEDR[2]));
endmodule

module box (input r, q_in, clk, l, output q_out);
    wire d;
    assign d = l ? r : q_in;
    always @(posedge clk) begin
        q_out = d;
    end
endmodule