module top_module (
    input clk,
    input reset,
    input [3:1] s,
    output fr3,
    output fr2,
    output fr1,
    output dfr
); 
    reg [2:0] state, next_state;
    parameter S0 = 0, S1 = 1, S2 = 2, S3 = 3, S4 = 4, S5 = 5;
    always @(*) begin
        if (state == S0 && s[3] == 0 && s[2] == 0 && s[1] == 0) next_state = S0;
        if (state == S0 && s[3] == 0 && s[2] == 0 && s[1] == 1) next_state = S1;
        if (state == S0 && s[3] == 0 && s[2] == 1 && s[1] == 1) next_state = S2;
        if (state == S0 && s[3] == 1 && s[2] == 1 && s[1] == 1) next_state = S3;
        if (state == S1 && s[3] == 0 && s[2] == 0 && s[1] == 0) next_state = S0;
        if (state == S1 && s[3] == 0 && s[2] == 0 && s[1] == 1) next_state = S1;
        if (state == S1 && s[3] == 0 && s[2] == 1 && s[1] == 1) next_state = S2;
        if (state == S1 && s[3] == 1 && s[2] == 1 && s[1] == 1) next_state = S3;
        if (state == S2 && s[3] == 0 && s[2] == 0 && s[1] == 0) next_state = S0;
        if (state == S2 && s[3] == 0 && s[2] == 0 && s[1] == 1) next_state = S4;
        if (state == S2 && s[3] == 0 && s[2] == 1 && s[1] == 1) next_state = S2;
        if (state == S2 && s[3] == 1 && s[2] == 1 && s[1] == 1) next_state = S3;
        if (state == S3 && s[3] == 0 && s[2] == 0 && s[1] == 0) next_state = S0;
        if (state == S3 && s[3] == 0 && s[2] == 0 && s[1] == 1) next_state = S4;
        if (state == S3 && s[3] == 0 && s[2] == 1 && s[1] == 1) next_state = S5;
        if (state == S3 && s[3] == 1 && s[2] == 1 && s[1] == 1) next_state = S3;
        if (state == S4 && s[3] == 0 && s[2] == 0 && s[1] == 0) next_state = S0;
        if (state == S4 && s[3] == 0 && s[2] == 0 && s[1] == 1) next_state = S4;
        if (state == S4 && s[3] == 0 && s[2] == 1 && s[1] == 1) next_state = S2;
        if (state == S4 && s[3] == 1 && s[2] == 1 && s[1] == 1) next_state = S3;
        if (state == S5 && s[3] == 0 && s[2] == 0 && s[1] == 0) next_state = S0;
        if (state == S5 && s[3] == 0 && s[2] == 0 && s[1] == 1) next_state = S4;
        if (state == S5 && s[3] == 0 && s[2] == 1 && s[1] == 1) next_state = S5;
        if (state == S5 && s[3] == 1 && s[2] == 1 && s[1] == 1) next_state = S3;
    end
    always @(posedge clk) begin
        if(reset) state = S0;
        else state = next_state;
    end

    assign fr3 = (state == S0) ? 1 : 0;
    assign fr2 = (state == S0 || state == S1 || state == S4) ? 1 : 0;
    assign fr1 = (state == S0 || state == S1 || state == S2 || state == S4 || state == S5) ? 1 : 0;
    assign dfr = (state == S0 || state == S4 || state == S5) ? 1 : 0;

endmodule