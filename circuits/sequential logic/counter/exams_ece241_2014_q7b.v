module top_module (
    input clk,
    input reset,
    output OneHertz,
    output [2:0] c_enable
); //

    // bcdcount counter0 (clk, reset, c_enable[0]/*, ... */);
    // bcdcount counter1 (clk, reset, c_enable[1]/*, ... */);

    wire [3:0] out0, out1, out2;

    assign c_enable = {((out1 == 4'h9) && (out0 == 4'h9)), (out0 == 4'h9),1'b1};
    assign OneHertz = ((out0 == 4'h9) && (out1 == 4'h9) && (out2 == 4'h9));

    bcdcount counter0 (clk, reset, c_enable[0], out0);
    bcdcount counter1 (clk, reset, c_enable[1], out1);
    bcdcount counter2 (clk, reset, c_enable[2], out2);
endmodule
