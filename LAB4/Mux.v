module mux(input [3:0]in, input [1:0]option, output out);
	assign out = in[option];
endmodule

module Eightmux(input [3:0][7:0]in, input [1:0]option, output [7:0]out);
	assign out = in[option];
endmodule
