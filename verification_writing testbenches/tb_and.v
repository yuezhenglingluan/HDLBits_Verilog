module top_module();

    reg out;
    reg [1:0] in;

    initial begin
        #0  assign in = 0;
        #10 assign in = 2'b01;
        #10 assign in = 2'b10;
        #10 assign in = 2'b11;
    end

    andgate gnt(in, out);

endmodule
