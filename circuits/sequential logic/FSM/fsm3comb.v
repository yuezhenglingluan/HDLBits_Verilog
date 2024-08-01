module top_module(
    input in,
    input [1:0] state,
    output [1:0] next_state,
    output out); //

    parameter A=0, B=1, C=2, D=3;

    // State transition logic: next_state = f(state, in)
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
    // Output logic:  out = f(state) for a Moore state machine
    assign out = (state == D) ? 1 : 0;
endmodule
