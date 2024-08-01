module top_module (
    input             clk,
    input             reset,  // Synchronous active-high reset
    output reg [ 3:1] ena,
    output reg [15:0] q
);
    always @(posedge clk) begin
        if (reset) begin 
            ena <= 3'b0;
        end else begin
            if (q[3:0] == 4'd8) begin
                ena[1] <= 1'b1;
            end else begin 
                ena[1] <= 0;
            end if (q[3:0] == 4'd8 && q[7:4] == 4'd9) begin
                ena[2] <= 1'b1;
            end else begin 
                ena[2] <= 0;
            end if (q[3:0] == 4'd8 && q[7:4] == 4'd9 && q[11:8] == 4'd9) begin
                ena[3] <= 1'b1;
            end else begin 
                ena[3] <= 0;
            end
        end
    end
    count10 c1 (.clk(clk), .reset(reset), .enable(1), .q(q[3:0]));
    count10 c2 (.clk(clk), .reset(reset), .enable(ena[1]), .q(q[7:4]));
    count10 c3 (.clk(clk), .reset(reset), .enable(ena[2]), .q(q[11:8]));
    count10 c4 (.clk(clk), .reset(reset), .enable(ena[3]), .q(q[15:12]));
endmodule

module count10 (
    input clk,
    input reset,
    input enable,
    output reg [3:0] q
);
    always @(posedge clk) begin
        if (reset) begin
            q <= 4'b0;
        end else if (enable) begin
            if (q == 4'd9) begin
                q = 4'b0;
            end else begin
                q = q + 1'b1;
            end
        end else begin
            q = q;
        end
    end
endmodule