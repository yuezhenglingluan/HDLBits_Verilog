module top_module (
    input clk,
    input areset,
    input x,
    output z
); 
    parameter A = 0, B = 1, C = 2;
    reg [1:0] state, next_state;
    always @(*) begin
        case(state)
            A: begin
                next_state = x ? B : A;
                z = 1'b0;
            end
            B: begin
                next_state = x ? C : B;
                z = 1'b1;
            end
            C: begin
                next_state = x ? C : B;
                z = 1'b0;
            end
        endcase
    end
    always @(posedge clk, posedge areset) begin
        if (areset) state <= A;
        else state <= next_state;
    end
endmodule
