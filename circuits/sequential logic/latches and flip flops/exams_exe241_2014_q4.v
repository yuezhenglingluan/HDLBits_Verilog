module top_module (
    input clk,
    input x,
    output z
); 
    wire D1, D2, D3;
    reg Q1, Q2, Q3;
    
    assign D1 = x ^ Q1;
    assign D2 = x & (~Q2);
    assign D3 = x | (~Q3);

    always @(posedge clk) begin
        Q1 = D1;
        Q2 = D2;
        Q3 = D3;
    end

    assign z = ~(Q1 | Q2 | Q3);
endmodule
