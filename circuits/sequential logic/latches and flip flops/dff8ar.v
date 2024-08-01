module top_module (
    input clk,
    input areset,   // active high asynchronous reset
    input [7:0] d,
    output [7:0] q
);
    always @(posedge clk, posedge areset) begin
        if (areset == 1) begin
            q = 8'b0;
        end else begin
            q = d;
        end
    end
endmodule

// Create 8 D flip-flops with active high asynchronous reset. 
// All DFFs should be triggered by the positive edge of clk.