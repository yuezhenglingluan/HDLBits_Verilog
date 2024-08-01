module top_module (
    input clk,
    input j,
    input k,
    output Q); 

    always @(posedge clk) begin
        if (j == 0 & k == 0) begin
            Q = Q;
        end if (j == 1 & k == 1) begin
            Q = ~Q;
        end if (j ^ k == 1) begin
            Q = j;
        end
    end
endmodule
