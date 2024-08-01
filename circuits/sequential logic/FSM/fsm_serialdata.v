module top_module(
    input clk,
    input in,
    input reset,    // Synchronous reset
    output [7:0] out_byte,
    output done
); //

    // Use FSM from Fsm_serial
    parameter S0 = 0, S1 = 1, S2 = 2, S3 = 3, S4 = 4, S5 = 5, S6 = 6, S7 = 7, S8 = 8, DONE = 9, FINISHED = 10, WAIT = 11;
    reg [3:0] state, next_state;

    always @(*) begin
        case(state)
            S0: next_state = in ? S0 : S1; 
            S1: next_state = S2;
            S2: next_state = S3;
            S3: next_state = S4;
            S4: next_state = S5;
            S5: next_state = S6;
            S6: next_state = S7;
            S7: next_state = S8;
            S8: next_state = DONE;
            DONE: next_state = in ? FINISHED : WAIT;
            WAIT: next_state = in ? S0 : WAIT;
            FINISHED: next_state = in ? S0 : S1;
        endcase
    end

    always @(posedge clk) begin
        if (reset) state = S0;
        else state = next_state;
    end

    assign done = (state == FINISHED) ? 1 : 0;

    // New: Datapath to latch input bits.
    reg [8:1] data;
    always @(posedge clk) begin
        if (reset) data <= 0;
        else begin
            case(state)
                S1: data[1] <= in;
                S2: data[2] <= in;
                S3: data[3] <= in;
                S4: data[4] <= in;
                S5: data[5] <= in;
                S6: data[6] <= in;
                S7: data[7] <= in;
                S8: data[8] <= in;
            endcase
        end
    end
    
    assign out_byte = done ? data : 8'bx;
endmodule
