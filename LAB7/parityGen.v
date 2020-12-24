module XORarr #(parameter N = 8)(input [N-1:0]in, output [(N/2)-1:0]out);
    genvar i;
    generate
        for(i=0;i<N/2;i=i+1)
            begin
                xor x(out[i],in[2*i],in[2*i+1]);
            end
    endgenerate
endmodule

module parityGen #(parameter N = 8)(input [N-1:0]in, output out);
    genvar i;
    generate
    for(i=N;i>=1;i=i/2)
    begin : LV
        wire [(i/2)-1:0]out1;
        if (i==N)
            XORarr x(in,out1);
        else if(i==1)
            assign out=LV[2].out1;
        else
            XORarr #(i)x(LV[2*i].out1,out1);
    end
    endgenerate
endmodule

module top;
    reg [7:0]Number;
    wire out;
    parityGen Pg(Number,out);
    initial
    begin
        #0 Number = 8'b00000011;
        #10 Number = 8'b10001001;
    end

    initial
    begin
        $monitor($time,"Number=%b Parity=%b",Number,out);
    end

endmodule
