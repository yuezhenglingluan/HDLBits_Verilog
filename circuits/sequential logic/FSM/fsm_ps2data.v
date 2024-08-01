module top_module(
    input clk,
    input [7:0] in,
    input reset,    // Synchronous reset
    output [23:0] out_bytes,
    output done); //

    // FSM from fsm_ps2
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

    // New: Datapath to store incoming bytes.
    reg [23:0] data;
    always @(posedge clk) begin
        if(reset) data <= 24'b0;
        else begin
            // Method 1:
            case(state)
                DONE: data[23:16] <= in;
                B1: data[23:16] <= in;
                B2: data[15:8] <= in;
                B3: data[7:0] <= in;
            endcase

            // Method 2:
            // data[23:16] <= data[15:8];
            // data[15:8] <= data[7:0];
            // data[7:0] <= in;
        end
    end
    assign out_bytes = done ? data : 24'bx;
endmodule
