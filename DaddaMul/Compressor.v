module HalfAdder(input a,input b,output o,output c);

    assign o = a^b;
    assign c = a&b;

endmodule

module FullAdder(input a, input b, input c, output sum, output cout);

    assign sum = a^b^c;
    assign cout = a&b|b&c|a&c;

endmodule

module Compressor(input a,input b,input c, input d, input cin, output o,output c1,output cout);
    
    wire tmp;
    FullAdder F1 (a,b,c,tmp,cout);
    FullAdder F2 (tmp,d,cin,o,c1);

endmodule