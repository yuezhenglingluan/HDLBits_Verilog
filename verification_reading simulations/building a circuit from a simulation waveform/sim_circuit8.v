module top_module (
    input clock,
    input a,
    output p,
    output q );

    reg temp;
    always @(negedge clock) begin
        temp <= a;
        q <= a;
    end

    assign p = clock ? a : temp;

endmodule
