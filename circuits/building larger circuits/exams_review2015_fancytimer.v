module top_module (
    input clk,
    input reset,      // Synchronous reset
    input data,
    output [3:0] count,
    output counting,
    output done,
    input ack );

    parameter IDLE = 0, A = 1, B = 2, C = 3, D = 4, E = 5, F = 6, G = 7, H = 8, I = 9;
    reg [3:0] state, next_state;
    reg [9:0] counter;

    always @(*) begin
        case (state)
            IDLE: next_state = data ? A : IDLE;
            A: next_state = data ? B : IDLE;
            B: next_state = data ? B : C;
            C: next_state = data ? D : IDLE;
            D: next_state = E;
            E: next_state = F;
            F: next_state = G;
            G: next_state = H;
            H: next_state = (count == 0 && counter == 999) ? I : H;
            I: next_state = ack ? IDLE : I;
        endcase
    end

    always @(posedge clk) begin
        if (reset) state <= IDLE;
        else state <= next_state;

        if (reset) begin
            count <= 0;
            counter <= 0;
        end
        else begin
            case (state)
                D: count[3] <= data;
                E: count[2] <= data;
                F: count[1] <= data;
                G: count[0] <= data;
                H: begin
                    if (count >= 0) begin
                        if (counter < 999) begin
                            counter <= counter + 1;
                        end
                        else begin
                            count <= count - 1;
                            counter <= 0;
                        end
                    end
                end
            endcase
        end
    end

    assign counting = (state == H);
    assign done = (state == I);
endmodule
