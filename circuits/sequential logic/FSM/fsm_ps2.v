module top_module(
    input clk,
    input [7:0] in,
    input reset,    // Synchronous reset
    output done); //

    parameter B1 = 0, B2 = 1, B3 = 2, DONE = 3;
    reg [1:0] state, next_state;
    // State transition logic (combinational)
    always @(*) begin
        case(state)
            B1: begin 
                if (in[3]) next_state = B2;
                else next_state = B1;
            end
            B2: next_state = B3;
            B3: next_state = DONE;
            DONE: begin
                if (in[3]) next_state = B2;
                else next_state = B1;
            end
        endcase
    end
    // State flip-flops (sequential)

    always @(posedge clk) begin
        if (reset) state = B1;
        else state = next_state;
    end
 
    // Output logic
    assign done = (state == DONE) ? 1 : 0;

endmodule
