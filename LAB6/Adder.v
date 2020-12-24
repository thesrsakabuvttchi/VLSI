module Sum(input a, input b, input cin, output sum); 
    xor x1(sum,a,b,cin);
endmodule

// 00 kill --- 01 propogate --- 10 generate
module Carry(input a, input b, output [1:0]mode);
    assign mode ={a&b,a^b};
endmodule

module CarryAdd(input [1:0]n0, output reg [1:0]n1);
    initial begin
        if(n1 == 2'b00)
            n1 = 2'b00;
        else if(n1 == 2'b10)
            n1 = 2'b10;
        else 
            n1 = n0;
    end
endmodule

module CarryAddArr(input [5:0]step,inout [31:0][1:0]a,output reg [31:0][1:0]b);
    integer i;
    always @(a) begin
        b = a;
        for(i=0;i<32-step;i++) begin
            if(b[i] == 2'b01)
                b[i] = a[i-step];
        end
    end
endmodule

module CarrArr(input [31:0]a,input [31:0]b,input cin,output reg [31:0][1:0]modeArr);
    integer i=0;
    always @(a,b) begin
        modeArr[0] = {(a[0]&b[0])|(b[0]&cin)|(a[0]&cin),1'b0};
        for(i=1; i<32; i++) begin
            modeArr[i] = {a[i]&b[i],a[i]^b[i]};
        end 
    end
endmodule

module RecrAddr(input [31:0][1:0]prev, output [31:0][1:0]out);
integer i;
wire [31:0][1:0]tmp1,tmp2,tmp3,tmp4;

CarryAddArr C1(6'b1,prev,tmp1);
CarryAddArr C2(6'b10,tmp1,tmp2);
CarryAddArr C3(6'b100,tmp2,tmp3);
CarryAddArr C4(6'b1000,tmp3,tmp4);
CarryAddArr C5(6'b10000,tmp4,out);

endmodule

module AddArr(input [31:0][1:0]carry,input [31:0]a,input [31:0]b,input cin, output reg [31:0]out,output reg cout);
integer i;
    always @(carry,a,b) begin
        cout = carry[31][0];
        out[0] = a[0]^b[0]^cin;
        for(i =1; i<32;i++) begin
            out[i] = a[i]^b[i]^(^carry[i-1]);
        end
    end
endmodule

module top;
reg [31:0]a, b;
wire [31:0]out;
reg cin;
wire cout;
wire [31:0][1:0]tmp,tmp2;

CarrArr C1(a[31:0],b[31:0],cin,tmp);
RecrAddr R1(tmp,tmp2);
AddArr A1(tmp2,a,b,cin,out,cout);

initial
begin
	#0 a=32'bx;b=32'bx;cin=1'b0;
    #10 a=32'b10001110100110011011;b=32'b100011011011101;
    #10 a=32'b10001110100110011010;b=32'b100011011011101;cin=1;
end

initial
begin
	$monitor($time, "a = %b, b = %b cin=%b\n\t\t\tcarries=%b\n\t\t\tout=%b cout=%b\n",a,b,cin,tmp2,out,cout);
	$dumpfile("Adder.vcd");
	$dumpvars;
end

endmodule