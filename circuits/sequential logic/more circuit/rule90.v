module top_module(
    input clk,
    input load,
    input [511:0] data,
    output [511:0] q ); 

    int i;
    
    always @(posedge clk) begin
        if (load) q <= data;
        else begin
            for (i = 1; i < 511; i++)
                q[i] <= q[i-1] ^ q[i+1];
            
            q[0] <= q[1] ^ 1'b0;
            q[511] <= q[510] ^ 1'b0;
        end
    end
endmodule
