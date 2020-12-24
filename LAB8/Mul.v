module FullAdder(input a, input b, input c, output sum, output cout);
    assign sum = a^b^c;
    assign cout = a&b|b&c|a&c;
endmodule

module AddrArr #(parameter N = 32) 
(input [N-1:0]a, input [N-1:0]b, output [N-1:0]sum);
    wire cout;
    wire c=1'b0;
    genvar i;
    generate
        for(i=0;i<N;i=i+1)
        begin :S
            wire co;
            if(i==0)
                FullAdder F(a[i],b[i],c,sum[i],co);
            else
            begin
                FullAdder F(a[i],b[i],S[i-1].co,sum[i],co);
                if (i==N-1)
                begin
                    assign cout= co;
                end
            end 
        end
    endgenerate
endmodule

module Mul #(parameter N = 16)
(input [N-1:0]a, input [N-1:0]b, output [2*N-1:0]c);
    genvar i;
    generate
        for (i=0;i<N;i=i+1) 
        begin :L
            wire [2*N-1:0]w,out;
            assign w = (a&{N{b[i]}})<<i;   
            if(i==0)
            begin 
                AddrArr A ({2*N{1'b0}},w,out); 
            end        
            else
            begin
                AddrArr A (L[i-1].out,w,out);
                if(i==N-1)
                begin
                    assign c = out; 
                end
            end
        end
    endgenerate
endmodule

/*
module top;
    reg [15:0]a,b;
    wire [31:0]prod;

    Mul M1(a,b,prod);

    initial
    begin
        a=16'b10010100;b=16'b101;
    end

    initial
    begin
        $monitor("%b %b\n%b",a,b,prod);
    end
endmodule
*/
