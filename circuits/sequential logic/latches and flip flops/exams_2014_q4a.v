module top_module (
    input clk,
    input w, R, E, L,
    output Q
);
    wire a, b;
    assign a = E ? w : Q;
    assign b = L ? R : a;

    always @(posedge clk) begin
        Q = b;
    end
endmodule
