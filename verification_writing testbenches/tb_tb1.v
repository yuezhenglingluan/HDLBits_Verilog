module top_module ( output reg A, output reg B );//

    // generate input patterns here
    initial begin
        #0	assign A = 0;
        #0	assign B = 0;
		#10 assign A = 1;
        #5	assign B = 1;
        #5 	assign A = 0;
        #20 assign B = 0;
    end

endmodule
