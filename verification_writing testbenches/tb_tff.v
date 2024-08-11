module top_module ();

    reg clk = 0;
    reg reset, t, q;

    initial begin
            reset = 1'b1;
            t = 1'b0;

        #10 reset = 1'b0;
            t = 1'b1;
    end
    always begin
        #5 clk = ~clk;
    end

    tff test(clk, reset, t, q);
endmodule
