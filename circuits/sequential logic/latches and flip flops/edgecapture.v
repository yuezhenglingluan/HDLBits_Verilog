module top_module (
    input clk,
    input reset,
    input [31:0] in,
    output [31:0] out
);
    reg [31:0]in_prev;
    always @(posedge clk) begin
        in_prev <= in;
        if (reset == 1 ) begin
            out <= 0;
        end else begin
            for (integer  i = 0; i < 32; i = i + 1) begin
                if ((in_prev[i] == 1 & in[i] == 0) | out[i] == 1) begin
                    out[i] <= 1;
                end
            end

        end
    end
endmodule