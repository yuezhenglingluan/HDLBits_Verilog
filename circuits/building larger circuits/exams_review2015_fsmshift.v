module top_module (
    input clk,
    input reset,      // Synchronous reset
    output shift_ena);

    parameter A = 0, B = 1, C = 2, D = 3, IDEL = 4;
    reg [2:0] state, next_state;

    always @(posedge clk) begin
        if (reset) state <= A;
        else state <= next_state;
    end

    always @(*) begin
        case(state)
            A: next_state = B;
            B: next_state = C;
            C: next_state = D;
            D: next_state = IDEL;
            IDEL: next_state = IDEL;
        endcase
    end

    assign shift_ena = (state != IDEL);
endmodule
