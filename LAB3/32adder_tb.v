`include "32adder.v"

module top;

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