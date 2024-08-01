module top_module(
    input clk,
    input areset,    // Asynchronous reset to OFF
    input j,
    input k,
    output out); //  

    parameter OFF=0, ON=1; 
    reg state, next_state;
    always @(*) begin
        // State transition logic
        if(state == OFF && ~j) begin
            next_state = OFF;
        end else if(state == ON && k) begin
            next_state = OFF;    
        end else if(state == OFF && j) begin
            next_state = ON;
        end else if(state == ON && ~k) begin
            next_state = ON;
        end
    end

    always @(posedge clk, posedge areset) begin
        // State flip-flops with asynchronous reset
        if(areset) begin
            state = OFF;
        end else begin
            state = next_state;
        end
    end

    // Output logic
    // assign out = (state == ...);
    assign out = (state == ON) ? 1 : 0;

endmodule
