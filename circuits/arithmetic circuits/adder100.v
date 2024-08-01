module top_module( 
    input [99:0] a, b,
    input cin,
    output cout,
    output [99:0] sum );
	reg [98:0]cout1;
    always @(a, b, cin) begin
        for (integer  i = 0; i < 100 ; i = i + 1) begin
            if (i == 0) begin
                sum[i] = a[i] ^ b[i] ^ cin;
            end else begin
                sum[i] = a[i] ^ b[i] ^ cout1[i - 1];
            end
            if (i < 99) begin
                if(i == 0)begin
                    cout1[i] = (a[i] & b[i]) | (a[i] & cin) | (b[i] & cin);
                end else begin
                    cout1[i] = (a[i] & b[i]) | (a[i] & cout1[i - 1]) | (b[i] & cout1[i - 1]);
                end
            end else begin
                cout = (a[i] & b[i]) | (a[i] & cout1[i - 1]) | (b[i] & cout1[i - 1]);
            end
        end
    end

endmodule
