module DFlipFlop (input D, input clk, output Q, output notQ);

	reg Q,notQ;

	always @(posedge clk) begin
		Q = D;
		notQ = ~D;
	end
endmodule

module EightDff (input [7:0]in, input clk, output [7:0]out);
	wire [7:0] out,outN;
	DFlipFlop DF0(in[0],clk,out[0],outN[0]);
	DFlipFlop DF1(in[1],clk,out[1],outN[1]);
	DFlipFlop DF2(in[2],clk,out[2],outN[2]);
	DFlipFlop DF3(in[3],clk,out[3],outN[3]);
	DFlipFlop DF4(in[4],clk,out[4],outN[4]);
	DFlipFlop DF5(in[5],clk,out[5],outN[5]);
	DFlipFlop DF6(in[6],clk,out[6],outN[6]);
	DFlipFlop DF7(in[7],clk,out[7],outN[7]);
endmodule

