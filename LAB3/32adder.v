module HalfAdder(a,b,s,c);
    input a, b;
    output s,c;

    //assign s = a^b; 
    xor x1(s,a,b);
    //assign c = a&b; 
    and a1(c,a,b);

endmodule

module FullAdder (a,b,c,sum,carry);
    input a,b,c;
    output sum,carry;
    wire x,y,z;

    HalfAdder HA1(a,b,x,y);    
    HalfAdder HA2(x,c,sum,z);

    //assign carry = y|z; 
    or o1(carry,y,z);

endmodule

module FourBitAdder(
   input [3:0]a,
   input [3:0]b,
   input cin,
   output [3:0]sum,
   output cout);

    wire [2:0]carry;

   FullAdder FA1(a[0],b[0],cin,sum[0],carry[0]);
   FullAdder FA2(a[1],b[1],carry[0],sum[1],carry[1]);
   FullAdder FA3(a[2],b[2],carry[1],sum[2],carry[2]);
   FullAdder FA4(a[3],b[3],carry[2],sum[3],cout);
endmodule

module SixteenBitAdder(
   input [15:0]a,
   input [15:0]b,
   input cin,
   output [15:0]sum,
   output cout);

    wire [2:0]carry;

    FourBitAdder FA1(a[3:0],b[3:0],cin,sum[3:0],carry[0]);
    FourBitAdder FA2(a[7:4],b[7:4],carry[0],sum[7:4],carry[1]);
    FourBitAdder FA3(a[11:8],b[11:8],carry[1],sum[11:8],carry[2]);
    FourBitAdder FA4(a[15:12],b[15:12],carry[2],sum[15:12],cout);

endmodule

module ThirtyTwoBitAdder(
   input [31:0]a,
   input [31:0]b,
   input cin,
   output [31:0]sum,
   output cout);

    wire carry;

    SixteenBitAdder SA1(a[15:0],b[15:0],cin,sum[15:0],carry);
    SixteenBitAdder SA2(a[31:16],b[31:16],carry,sum[31:16],cout);
endmodule

/*module top;

    reg [31:0]a,b;
    reg c;
    wire [31:0]sum;
    wire cout;

    ThirtyTwoBitAdder addr1(a,b,c,sum,cout);

    initial
    begin
        a=1; b=0; c=0;
        #10 a=32'b10;
        #10 b=32'b1010111; 
        #10 a=32'b111010;
    end

    initial
    begin
        $monitor($time, "\ta =%h, b = %h, c=%b, Sum = %h, ca = %b",a,b,c,sum, cout);
        $dumpfile("32Adder.vcd");
	    $dumpvars;
    end

endmodule
*/