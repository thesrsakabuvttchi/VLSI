`include "Compressor.v"
`include "PartialProducts.v"

module stage1(input [0:15][0:15]in, output [0:7][0:30]out);

    genvar i;
    generate
        assign out[0] = {in[0],in[1][15],in[2][15],in[3][15],in[4][15],in[5][15],in[6][15],in[7][15],in[8][15],in[9][15],in[10][15],in[11][15],in[12][15],in[13][15],in[14][15],in[15][15]};
        assign out[1] = {1'b0,in[1][0:14],in[2][14],in[3][14],in[4][14],in[5][14],in[6][14],in[7][14],in[8][14],in[9][14],in[10][14],in[11][14],in[12][14],in[13][14],in[14][14],in[15][14],1'b0};                                                     //5372696e69766173616e205220536861726d61a

        assign out[2] = {2'b0,in[2][0:13],in[3][13],in[4][13],in[5][13],in[6][13],in[7][13],in[8][13],in[9][13],in[10][13],in[11][13],in[12][13],in[13][13],in[14][13],in[15][13],2'b0};

        wire o15_1,c15_1;
        HalfAdder HA15_1(in[3][12],in[4][11],o15_1,c15_1);

        assign out[3] = {3'b0,in[3][0:11],o15_1,in[4][11],in[5][12],in[6][12],in[7][12],in[8][12],in[9][12],in[10][12],in[11][12],in[12][12],in[13][12],in[14][12],in[15][12],3'b0};        

        wire o14_1,c14_1;
        HalfAdder HA14_1(in[4][10],in[5][9],o14_1,c14_1);

        wire o15_2,c15_2;
        FullAdder FA15_2(in[5][10],in[6][9],in[7][8],o15_2,c15_2);

        wire o16_1,c16_1,c16_2;
        Compressor C16_1(in[5][11],in[6][10],in[7][9],in[8][8],in[9][7],o16_1,c16_1,c16_2);

        wire o17_1,c17_1;
        FullAdder FA17_1(in[6][11],in[7][10],in[8][9],o17_1,c17_1);

        assign out[4]= {4'b0,in[4][0:9],o14_1,o15_2,o16_1,o17_1,in[7][11],in[8][11],in[9][11],in[10][11],in[11][11],in[12][11],in[13][11],in[14][11],in[15][11],4'b0};

        wire o12_1,c12_1;
        HalfAdder HA12_1(in[5][7],in[6][6],o12_1,c12_1);

        wire o13_1,c13_1,c13_2;
        Compressor C13_1(in[5][8],in[6][7],in[7][6],in[8][5],in[9][4],o13_1,c13_1,c13_2);

        wire o14_2,c14_2,c14_3;
        Compressor C14_2(in[6][8],in[7][7],in[8][6],in[9][5],in[10][4],o14_2,c14_2,c14_3);

        wire o15_3,c15_3,c15_4;
        Compressor C15_2(in[8][7],in[9][6],in[10][5],in[11][4],in[12][3],o15_3,c15_3,c15_4);

        wire o16_2,c16_3,c16_4;
        Compressor C16_2(in[10][6],in[11][5],in[12][4],in[13][3],in[14][2],o16_2,c16_3,c16_4);

        wire o17_2,c17_2,c17_3;
        Compressor C17_2(in[9][8],in[10][7],in[11][6],in[12][5],in[13][4],o17_2,c17_2,c17_3);

        wire o18_1,c18_1,c18_2;
        Compressor C18_1(in[8][10],in[9][9],in[10][8],in[11][7],in[12][6],o18_1,c18_1,c18_2);

        wire o19_1,c19_1;
        FullAdder FA19_1(in[9][10],in[10][9],in[11][8],o19_1,c19_1);

        assign out[5]= {5'b0,in[5][0:6],o12_1,o13_1,o14_2,o15_3,o16_2,o17_2,o18_1,o19_1,in[10][10],in[11][10],in[12][10],in[13][10],in[14][10],in[15][10],5'b0};

        wire o10_1,c10_1;
        HalfAdder HA10_1(in[6][4],in[7][3],o10_1,c10_1);

        wire o11_1,c11_1,c11_2;
        Compressor C11_1(in[6][5],in[7][4],in[8][3],in[9][2],in[10][1],o11_1,c11_1,c11_2);

        wire o12_2,c12_2,c12_3;
        Compressor C12_2(in[7][5],in[8][4],in[9][3],in[10][2],in[11][1],o12_2,c12_2,c12_3);

        wire o13_2,c13_3,c13_4;
        Compressor C13_2(in[10][3],in[11][2],in[12][1],in[13][0],c12_1,o13_2,c13_3,c13_4);

        wire o14_3,c14_4,c14_5;
        Compressor C14_3(in[11][3],in[12][2],in[13][1],in[14][0],c13_1,o14_3,c14_4,c14_5);

        wire o15_4,c15_5,c15_6;
        Compressor C15_4(in[13][2],in[14][1],in[15][0],c14_1,c14_2,o15_4,c15_5,c15_6);

        wire o16_3,c16_5,c16_6;
        Compressor C16_3(in[15][1],c15_1,c15_2,c15_3,c15_4,o16_3,c16_5,c16_6);
        wire o17_3,c17_4,c17_5;
        Compressor C17_3(in[14][3],in[15][2],c16_1,c16_2,c16_3,o17_3,c17_4,c17_5);

        wire o18_2,c18_3,c18_4;
        Compressor C18_2(in[13][5],in[14][4],in[15][3],c17_1,c17_2,o18_2,c18_3,c18_4);

        wire o19_2,c19_2,c19_3;
        Compressor C19_2(in[12][7],in[13][6],in[14][5],in[15][4],c19_1,o19_2,c19_2,c19_3);

        wire o20_1,c20_1,c20_2;
        Compressor C20_1(in[11][9],in[12][8],in[13][7],in[14][6],in[15][5],o20_1,c20_1,c20_2);

        wire o21_1,c21_1;
        FullAdder FA21_1(in[12][9],in[13][8],in[14][7],o21_1,c21_1);

        assign out[6] = {6'b0,in[6][0:3],o10_1,o11_1,o12_2,o13_2,o14_3,o15_4,o16_3,o17_3,o18_2,o19_2,o20_1,o21_1,in[13][9],in[14][9],in[15][9],6'b0};

        wire o8_1,c8_1;
        HalfAdder HA8_1(in[7][1],in[8][0],o8_1,c8_1);

        wire o9_1,c9_1,c9_2;
        Compressor C9_1(in[7][2],in[8][1],in[9][0],c8_1,1'b0,o9_1,c9_1,c9_2);

        wire o10_2,c10_2,c10_3;
        Compressor C10_2(in[8][2],in[9][1],in[10][0],c9_1,c9_2,o10_2,c10_2,c10_3);

        wire o11_2,c11_3,c11_4;
        Compressor C11_2(in[11][0],c10_1,c10_2,c10_3,1'b0,o11_2,c11_3,c11_4);

        wire o12_3,c12_4,c12_5;
        Compressor C12_3(in[12][0],c11_1,c11_2,c11_3,c11_4,o12_3,c12_4,c12_5);

        wire o13_3,c13_5,c13_6;
        Compressor C13_3(c12_2,c12_3,c12_4,c12_5,1'b0,o13_3,c13_5,c13_6);

        wire o14_4,c14_6,c14_7;
        Compressor C14_4(c13_2,c13_3,c13_4,c13_5,c13_6,o14_4,c14_6,c14_7);

        wire o15_5,c15_7,c15_8;
        Compressor C15_5(c14_3,c14_4,c14_5,c14_6,c14_7,o15_5,c15_7,c15_8);

        wire o16_4,c16_7,c16_8;
        Compressor C16_4(c15_5,c15_6,c15_7,c15_8,1'b0,o16_4,c16_7,c16_8);

        wire o17_4,c17_6,c17_7;
        Compressor C17_4(c16_4,c16_5,c16_6,c16_7,c16_8,o17_4,c17_6,c17_7);

        wire o18_3,c18_5,c18_6;
        Compressor C18_3(c17_3,c17_4,c17_5,c17_6,c17_7,o18_3,c18_5,c18_6);

        wire o19_3,c19_4,c19_5;
        Compressor C19_3(c18_2,c18_3,c18_4,c18_5,c18_6,o19_3,c19_4,c19_5);

        wire o20_2,c20_3,c20_4;
        Compressor C20_2(c19_1,c19_2,c19_3,c19_4,c19_5,o20_2,c20_3,c20_4);

        wire o21_2,c21_2,c21_3;
        Compressor C21_2(in[15][6],c20_1,c20_2,c20_3,c20_4,o21_2,c21_2,c21_3);

        wire o22_1,c22_1,c22_2;
        Compressor C22_1(in[14][8],in[15][7],c21_1,c21_2,c21_3,o22_1,c22_1,c22_2);

        wire o23_1,c23_1;
        FullAdder FA23_1(in[15][8],c22_1,c22_2,o23_1,c23_1);

        assign out[7] ={7'b0,in[7][0],o8_1,o9_1,o10_2,o11_2,o12_3,o13_3,o14_4,o15_5,o16_4,o17_4,o18_3,o19_3,o20_2,o21_2,o22_1,o23_1,c23_1,6'b0};

    endgenerate

endmodule

module stage2(input [0:7][0:30]in, output [0:3][0:30]out);

    assign out[0] = in[0];
    assign out[1] = in[1];
    assign out[2][0:5] = in[2][0:5];
    assign out[2][26:30] = in[2][26:30];
    assign out[3][0:3] = in[3][0:3];
    assign out[3][29:30] = in[3][29:30];

    wire c4_1;
    HalfAdder HA4_1(in[3][4],in[4][4],out[3][4],c4_1);

    wire c5_1,c5_2;
    Compressor C5_1(in[3][5],in[4][5],in[5][5],c4_1,1'b0,out[3][5],c5_1,c5_2);

    wire c6_1,c6_2,c6_3;
    HalfAdder HA7_1(in[2][6],in[3][6],out[2][6],c6_1);
    Compressor CA7_2(in[4][6],in[5][6],in[6][6],c5_1,c5_2,out[3][6],c6_2,c6_3);

    genvar i;

    wire c25_1,c25_2,c25_3,c25_4;

    generate
        for(i=7;i<25;i=i+1)
        begin : LV
            wire w1,w2,w3,w4;
            if(i==7)
            begin
                Compressor C1(in[2][i],in[3][i],in[4][i],in[5][i],in[6][i],out[2][i],w1,w2);
                Compressor C2(in[7][i],c6_1,c6_2,c6_3,1'b0,out[3][i],w3,w4);
            end

            else if(i<24)
            begin
                Compressor C1(in[2][i],in[3][i],in[4][i],in[5][i],in[6][i],out[2][i],w1,w2);
                Compressor C2(in[7][i],LV[i-1].w1,LV[i-1].w2,LV[i-1].w3,LV[i-1].w4,out[3][i],w3,w4);
            end        

            else
            begin
                Compressor C1(in[2][i],in[3][i],in[4][i],in[5][i],in[6][i],out[2][i],c25_1,c25_2);
                Compressor C2(in[7][i],LV[i-1].w1,LV[i-1].w2,LV[i-1].w3,LV[i-1].w4,out[3][i],c25_3,c25_4);
            end    
        end
    endgenerate

    wire c26_1,c26_2,c26_3;
    FullAdder FA26_1(in[2][25],in[3][25],in[4][25],out[2][25],c26_1);
    Compressor C26_2(in[5][25],c25_1,c25_2,c25_3,c25_4,out[3][25],c26_2,c26_3);

    wire c27_1,c27_2;
    Compressor C27_1(in[3][26],in[4][26],c26_1,c26_2,c26_3,out[3][26],c27_1,c27_2);

    FullAdder FA28_1(in[3][27],c27_1,c27_2,out[3][27],out[3][28]);

endmodule

module stage3 (input [0:3][0:30]in,output [0:1][0:30]out);

    genvar i;

    wire c3_1;
    HalfAdder HA1(in[1][2],in[2][2],out[1][2],c3_1);

    wire c1,c2;

    generate

        for(i=3;i<29;i=i+1)
        begin : LV

            wire w1,w2;

            if(i==3)
                Compressor C(in[1][i],in[2][i],in[3][i],c3_1,1'b0,out[1][i],w1,w2);

            else if(i<28)
                Compressor C(in[1][i],in[2][i],in[3][i],LV[i-1].w1,LV[i-1].w2,out[1][i],w1,w2);

            else
                Compressor C(in[1][i],in[2][i],in[3][i],LV[i-1].w1,LV[i-1].w2,out[1][i],c1,c2);

        end

    endgenerate

    FullAdder FA(in[1][29],c1,c2,out[1][29],out[1][30]);
    assign out[1][0] = 1'b0;
    assign out[1][1] = in[1][1];
    assign out[0] = in[0];

endmodule

module rev(input [0:1][0:30]in,output [0:1][0:30]out);
    genvar i;
    generate
        for(i=0;i<31;i=i+1)
        begin
            assign out[0][30-i] = in[0][i];
            assign out[1][30-i] = in[1][i];
        end
    endgenerate
endmodule

module top;
    
    reg [15:0]a,b;
    wire [0:15][0:15]c;
    wire [0:7][0:30]out1;
    wire [0:3][0:30]out2;
    wire [0:1][0:30]out3,out4;
    reg [30:0]tot;

    Mul M1 (a,b,c);
    stage1 s(c,out1);
    stage2 s2(out1,out2);
    stage3 s3(out2,out3);

    rev R (out3,out4);

    wire [31:0]out;
    assign out = out4[0]+out4[1];

    initial
    begin
        a= 16'd3024; b= 16'd5;
        #10 a= 16'd3024; b= 16'd0;
        #10 a= 16'd19283; b= 16'd1000;
        #10 a= 16'd1024; b= 16'd1024;
        #10 a= 16'd13; b= 16'd255;
        #10 a= 16'd52968; b= 16'd62468;
        #10 a= 16'd0; b= 16'd0;
    end

    initial
    begin
        $monitor("a= %d\tb= %d\tout= %d",a,b,out); 
        $dumpfile("Dadda.vcd");
		$dumpvars; 
    end

endmodule


//1000000000000001
//
