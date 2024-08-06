module top_module (
    input clk,
    input reset,      // Synchronous reset
    input data,
    output shift_ena,
    output counting,
    input done_counting,
    output done,
    input ack );
    
    parameter A = 0, B = 1, C = 2, D = 3, E = 4, F = 5, G = 6;
    reg [2:0] state, next_state, counter;

    always @(*) begin
        case(state)
            A: next_state = data ? B : A;
            B: next_state = data ? C : A;
            C: next_state = data ? C : D;
            D: next_state = data ? E : A;
            E: next_state = (counter == 3'h3) ? F : E;
            F: next_state = (done_counting == 1) ? G : F;
            G: next_state = ack ? A : G;
        endcase
    end

    always @(posedge clk) begin
        if (reset) state <= A;
        else state <= next_state;

        if (reset) counter <= 0;
        else if (state == E) begin
            if (counter == 3'h3) counter <= 0;
            else counter <= counter + 1'b1;
        end
    end

    assign shift_ena = (state == E);
    assign counting = (state == F);
    assign done = (state == G);
endmodule
