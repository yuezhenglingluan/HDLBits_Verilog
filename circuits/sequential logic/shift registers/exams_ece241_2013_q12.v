module top_module (
    input clk,
    input enable,
    input S,
    input A, B, C,
    output Z ); 

    reg [0:7]Q;
    wire [2:0]X;
    assign X = {A, B, C};
    always @(posedge clk) begin
        if (enable) begin
            Q[0] <= S;
            Q[1:7] <= Q[0:6];
        end else begin
            Q <= Q;
        end
    end

    always @(*) begin
        case (X)
            3'h0: Z = Q[0]; 
            3'h1: Z = Q[1];
            3'h2: Z = Q[2]; 
            3'h3: Z = Q[3]; 
            3'h4: Z = Q[4]; 
            3'h5: Z = Q[5]; 
            3'h6: Z = Q[6]; 
            3'h7: Z = Q[7]; 
            default: Z = 1'bx;
        endcase
    end
endmodule
