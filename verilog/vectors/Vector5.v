module top_module (
    input a, b, c, d, e,
    output [24:0] out );//

    // The output is XNOR of two vectors created by 
    // concatenating and replicating the five inputs.
    // assign out = ~{ ... } ^ { ... };
    wire [24:0]x;
    wire [4:0]y;
    wire [24:0]z;
    assign x = {{5{a}}, {5{b}}, {5{c}}, {5{d}}, {5{e}}};
    assign y = {a, b, c, d, e};
    assign z = {{5{y}}};

    assign out = ~x ^ z;
endmodule
