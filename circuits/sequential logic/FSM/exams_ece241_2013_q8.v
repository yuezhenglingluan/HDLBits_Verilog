module top_module (
    input clk,
    input aresetn,    // Asynchronous active-low reset
    input x,
    output z ); 

    reg counter;
    parameter A = 0, B = 1, C = 2;
    reg [1:0] state, next_state;

    always @(*) begin
        case(state)
            C: next_state = x ? A : C;
            A: next_state = x ? A : B;
            B: next_state = x ? A : C;
        endcase
    end

    always @(posedge clk, negedge aresetn) begin
        if(!aresetn) state <= C;
        else state <= next_state;
    end

    assign z = (state == B && x == 1'b1);
endmodule
