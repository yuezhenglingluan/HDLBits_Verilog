module top_module (
    input clk,
    input slowena,
    input reset,      // Synchronous active-high reset
    output [3:0] q);
    always @(posedge clk) begin
        if (reset || (q == 4'h9 && slowena == 1)) begin
            q = 0;
        end else begin
            if (slowena == 0) begin
                q = q;
            end else begin
                q = q + 1'b1;
            end

        end
    end
endmodule
