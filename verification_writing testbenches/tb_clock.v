module top_module ( );
    reg clk = 0;
    always begin
        #5 clk = ~clk;
    end

    dut mut1 (.clk(clk));
endmodule
