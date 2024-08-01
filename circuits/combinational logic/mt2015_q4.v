module top_module (input x, input y, output z);
    wire n, m, o, p;
    a a1 (x, y, n);
    b b1 (x, y, m);
    a a2 (x, y, o);
    b b2 (x, y, p);

    wire k, j;
    assign k = n | m;
    assign j = o & p;
    assign z = k ^ j;
endmodule
module a (input x, input y, output z);
    assign z = (x ^ y) & x;
endmodule
module b ( input x, input y, output z );
    assign z = ~(x ^ y);
endmodule
