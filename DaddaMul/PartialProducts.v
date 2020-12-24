module Mul #(parameter N = 16)
(input [N-1:0]a, input [N-1:0]b, output [0:N-1][N-1:0]c);
    genvar i,j;
    generate
        for (i=0;i<N;i=i+1) 
            for(j=15;j>=0;j=j-1)
                assign c[i][j] = a[15-j] & b[i];
    endgenerate
endmodule
