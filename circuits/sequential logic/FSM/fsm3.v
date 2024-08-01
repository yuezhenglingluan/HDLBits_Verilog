module top_module(
    input clk,
    input in,
    input areset,
    output out); //
    reg [1:0]state, next_state;
    parameter A=0, B=1, C=2, D=3;
    // State transition logic
    always @(*) begin
        if(state == A && in)    next_state = B;
        if(state == A && ~in)   next_state = A;
        if(state == B && in)    next_state = B;
        if(state == B && ~in)   next_state = C;
        if(state == C && in)    next_state = D;
        if(state == C && ~in)   next_state = A;
        if(state == D && in)    next_state = B;
        if(state == D && ~in)   next_state = C;
    end
    // State flip-flops with asynchronous reset
    always @(posedge clk, posedge areset) begin
        if(areset) state = A;
        else state = next_state;
    end
    // Output logic
    assign out = (state == D) ? 1 : 0;

endmodule
