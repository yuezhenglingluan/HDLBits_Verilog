module top_module ( );
    reg clk = 0;
    always begin
        #5 clk = ~clk;
    end

    reg in, out;
    reg [2:0] s;

    initial begin
        #0  assign in = 0;
            assign s = 3'h2;
        #10 assign s = 3'h6;
        #10 assign in = 1;
            assign s = 3'h2;
        #10 assign in = 0;
            assign s = 3'h7;
        #10 assign in = 1;
            assign s = 3'h0;
        #30 assign in = 0;
    end

    q7 test(clk, in, s, out);
endmodule
