module top_module (
    input clk,
    input reset,      // Synchronous active-high reset
    output [3:0] q);
    always @(posedge clk) begin
        if (reset | q == 4'hf) begin
            q = 0;
        end else begin
            q = q + 1'b1;
        end
    end
endmodule
