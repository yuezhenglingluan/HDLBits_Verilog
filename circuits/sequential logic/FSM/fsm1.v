module top_module(
    input clk,
    input areset,    // Asynchronous reset to state B
    input in,
    output out);//  

    parameter A=0, B=1; 
    reg state, next_state;

    always @(*) begin    // This is a combinational always block
        // State transition logic
        if (state == B && in) begin
            next_state <= B;
        end else if (state == B && ~in) begin
            next_state <= A;
        end else if (state == A && in) begin
            next_state <= A;
        end else if (state == A && ~in) begin
            next_state <= B;
        end
    end

    always @(posedge clk, posedge areset) begin    // This is a sequential always block
        // State flip-flops with asynchronous reset
        if (areset) begin
            state <= B;
        end else begin
            state = next_state;
        end
    end

    assign out = (state == B) ? 1 : 0;
    // Output logic
    // assign out = (state == ...);

endmodule
