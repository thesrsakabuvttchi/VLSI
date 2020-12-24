`include "USR.v"

module top;
    reg clk;
    reg [7:0]in;
    reg [2:0]option;
    wire [7:0]out,tmp,tmp2;


    USR U1(in,option[1:0],clk,tmp);
    outputMode OM1(tmp,{option[2],option[0]},clk,out);

    initial 
    begin
		in=8'b10101;option=3'b001;			//Add value PIPO
		#20 option=3'b011;in=8'b00000000;	//Shift left SIPO
		#20 option=3'b010;					//Shift right SIPO
		#20 option=3'b111;					//Shift left SISO
		#20 option=3'b000;					//Display value
		#20 option=3'b110;					//Shift right SISO
		#20 option=3'b000;					//Display value
		#20 option=3'b101;in=8'b01100010;	//PISO mode
		#20 option=3'b000;					//Display value
    end

	initial begin
		clk=0;
		forever #10 clk = ~clk;
	end

    initial
    begin
       $monitor($time, "\tin=%b option=%b out=%b clock=%b",in,option,out,clk);
        $dumpfile("USR.vcd");
	    $dumpvars;
	   #160 $finish;
    end

endmodule
