module top_module (
    input clk,
    input [7:0] in,
    output [7:0] pedge
);
    detect d1(clk, in[0], pedge[0]);
    detect d2(clk, in[1], pedge[1]);
    detect d3(clk, in[2], pedge[2]);
    detect d4(clk, in[3], pedge[3]);
    detect d5(clk, in[4], pedge[4]);
    detect d6(clk, in[5], pedge[5]);
    detect d7(clk, in[6], pedge[6]);
    detect d8(clk, in[7], pedge[7]);
endmodule

module detect ( input clk, input in, output pedge);
    reg in_prev;
    always @(posedge clk) begin
        in_prev = in;
    end

    always @(posedge clk) begin
        if (in_prev == 0 & in == 1) begin
            pedge = 1;
        end else begin
            pedge = 0;
        end
    end
endmodule