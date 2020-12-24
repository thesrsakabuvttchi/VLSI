module top;
    reg A,B,C;
    wire W1,W2,W3,W4,W5,W6,W7,W8;
    xor X1(W1,A,B);
    xor X2(W2,W1,C);

    and A1(W3,A,B);
    and A2(W4,B,C);
    and A3(W5,A,C);
    
    or O1(W6,W3,W4);
    or O2(W7,W6,W5);

    not N1(W8,W7);

    wire W9;
    not N2(W9,W8);
endmodule