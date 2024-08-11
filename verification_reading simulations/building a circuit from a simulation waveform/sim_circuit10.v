module top_module (
    input clk,
    input a,
    input b,
    output q,
    output state  );

    always @(posedge clk) begin
        if (a == b) begin
            if (a == 1 && state == 0) state <= 1;
            else if (a == 0 && state == 1) state <= 0;
        end
    end

    assign q = a ^ b ^ state;
endmodule
