module top_module (
    input clk,
    input [7:0] in,
    output [7:0] anyedge
);
    detect d1(clk, in[0], anyedge[0]);
    detect d2(clk, in[1], anyedge[1]);
    detect d3(clk, in[2], anyedge[2]);
    detect d4(clk, in[3], anyedge[3]);
    detect d5(clk, in[4], anyedge[4]);
    detect d6(clk, in[5], anyedge[5]);
    detect d7(clk, in[6], anyedge[6]);
    detect d8(clk, in[7], anyedge[7]);
endmodule

module detect ( input clk, input in, output anyedge);
    reg in_prev;
    always @(posedge clk) begin
        in_prev = in;
    end

    always @(posedge clk) begin
        if (in_prev != in) begin
            anyedge = 1;
        end else begin
            anyedge = 0;
        end
    end
endmodule