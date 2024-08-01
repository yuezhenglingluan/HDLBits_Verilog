module top_module(
    input clk,
    input in,
    input reset,    // Synchronous reset
    output done
); 
    parameter S0 = 0, S1 = 1, S2 = 2, S3 = 3, S4 = 4, S5 = 5, S6 = 6, S7 = 7, S8 = 8, DONE = 9, FINISHED = 10, WAIT = 11;
    reg [3:0] state, next_state;

    always @(*) begin
        case(state)
            S0: begin 
                if (in) next_state = S0;
                else next_state = S1;
            end
            S1: next_state = S2;
            S2: next_state = S3;
            S3: next_state = S4;
            S4: next_state = S5;
            S5: next_state = S6;
            S6: next_state = S7;
            S7: next_state = S8;
            S8: next_state = DONE;
            DONE: begin
                if (in) next_state = FINISHED;
                else next_state = WAIT;
            end
            WAIT: begin
                if (in) next_state = S0;
                else next_state = WAIT;
            end
            FINISHED: begin
                if (in) next_state = S0;
                else next_state = S1;
            end
        endcase
    end

    always @(posedge clk) begin
        if (reset) state = S0;
        else state = next_state;
    end

    assign done = (state == FINISHED) ? 1 : 0;
endmodule
