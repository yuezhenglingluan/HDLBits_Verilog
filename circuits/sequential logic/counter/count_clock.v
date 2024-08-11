module top_module(
    input clk,
    input reset,
    input ena,
    output pm,
    output [7:0] hh,
    output [7:0] mm,
    output [7:0] ss); 

    wire enable_h, enable_m;

    assign enable_h = ((mm == {4'h5, 4'h9}) && enable_m);
    assign enable_m = (ss == {4'h5, 4'h9});

    counter59 c1(clk, reset, ena, ss);
    counter59 c2(clk, reset, enable_m, mm);
    counter12 c3(clk, reset, enable_h, hh);

    always @(posedge clk) begin
        if (reset) pm <=0;
        else pm <= ((hh == 8'h11) && (mm == 8'h59) && (ss == 8'h59)) ? ~pm : pm;
    end
endmodule


module counter59 (
    input clk,
    input reset,  // Synchronous active-high reset
    input enable,
    output reg [7:0] q
);

  always @(posedge clk) begin
    if (reset) q <= 0;
    else if (enable) begin
        if (q[3:0] == 4'h9) begin
            q[3:0] <= 0;
            if (q[7:4] == 4'h5) q[7:4] <= 0;
            else q[7:4] <= q[7:4] + 1'b1;
        end else q[3:0] <= q[3:0] + 1'b1;
    end
  end
endmodule

module counter12 (
    input clk,
    input reset,
    input enable,
    output reg [7:0] q
);

    always @(posedge clk) begin
        if (reset) q = {4'h1, 4'h2};
        else if (enable) begin
            if ((q == {4'h1, 4'h2})) q <= {4'h0, 4'h1};
            else if (q[3:0] == 4'h9) q <= {4'h1, 4'h0};
            else q[3:0] <= q[3:0] + 1'b1;
        end
    end
endmodule