module top_module (
    input clk,
    input reset,   // Synchronous reset
    input s,
    input w,
    output z
);
    parameter A = 0, B = 1, C = 2, D = 3;
    reg [2:0] state, next_state;
    reg [1:0] counter;
    always @(*) begin
        case(state)
            A: next_state = s ? B : A;
            B: next_state = C;
            C: next_state = D;
            D: next_state = B;
        endcase
    end
    
    always @(posedge clk) begin
        if (reset) begin 
            state <= A;
        end
        else state <= next_state;
        case(state)
            A: counter <= 1'b0;
            B: counter <= w;
            default: counter <= w ? counter + 1'b1 : counter;
        endcase
    end
    assign z = ((state == B) && ((counter == 2'h2)));
endmodule
