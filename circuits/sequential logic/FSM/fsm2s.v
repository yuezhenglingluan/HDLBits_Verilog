module top_module(
    input clk,
    input reset,    // Synchronous reset to OFF
    input j,
    input k,
    output out); //  

    parameter OFF=0, ON=1; 
    reg state, next_state;

    always @(*) begin
        // State transition logic
        if(state == OFF && ~j)      next_state = OFF;
        else if(state == OFF && j)  next_state = ON;
        else if(state == ON && ~k)  next_state = ON;
        else if(state == ON && k)   next_state = OFF;
    end

    always @(posedge clk) begin
        // State flip-flops with synchronous reset
        if(reset) state = OFF;
        else state = next_state;
    end

    // Output logic
    // assign out = (state == ...);
    assign out = (state == ON) ? 1 : 0;

endmodule
