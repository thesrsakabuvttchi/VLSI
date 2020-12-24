/*
MODES(based on value of [2:0]option)
000 : Retain value
001 : PIPO mode
010	: Shift right (SIPO)
011	: Shift left (SIPO)
110	: Shift right (SISO)
111	: Shift left (SISO)
101	: PISO mode
*/
`include "Dff.v"
`include "Mux.v"

module USR(input [7:0]in, input [1:0]option, input clk, output [7:0]out);
	wire [3:0][7:0]Muxin;
	wire [7:0]tmp;
	assign Muxin [0] = out; 
	assign Muxin [1] = in;
	assign Muxin [2] = {in[7],out[7:1]};
	assign Muxin [3] = {out[6:0],in[0]};
	
	Eightmux EM1(Muxin,option,tmp);
	EightDff Edff1(tmp,clk,out);	
endmodule

module outputMode(input [7:0]tmp,input [1:0]option, input clk, output [7:0]out);
	wire [3:0][7:0]Muxin;
	wire [7:0]temp;
	assign Muxin [0] = tmp; 
	assign Muxin [1] = tmp;
	assign Muxin [2] = {7'bx,tmp[0]};
	assign Muxin [3] = {tmp[7],7'bx};

	Eightmux EM1(Muxin,option,out);
endmodule

