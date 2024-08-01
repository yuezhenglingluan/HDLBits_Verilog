module top_module( 
    input [254:0] in,
    output [7:0] out );
    //assign out = 8'b0;
    always @(in) begin
        integer i;
        out = 8'b0;
        for (i = 0; i<255; i=i+1) begin
            if (in[i] == 1'b1) begin
                out = out + 1'b1;
            end
        end
    end
endmodule
