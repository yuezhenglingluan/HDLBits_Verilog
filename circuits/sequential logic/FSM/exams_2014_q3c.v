module top_module (
    input clk,
    input [2:0] y,
    input x,
    output Y0,
    output z
);
    reg [2:0] next_state;
    parameter A = 0, B = 1, C = 2, D = 3, E = 4;

    always @(*) begin
        case(y)
            A: next_state = x ? B : A;
            B: next_state = x ? E : B;
            C: next_state = x ? B : C;
            D: next_state = x ? C : B;
            E: next_state = x ? E : D;
        endcase
    end
    assign z = ((y == D) || (y == E));
    assign Y0 = next_state[0];
endmodule
