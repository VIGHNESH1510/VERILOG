module ripple(input [3:0]A,B,input C,output [3:0]sum,output carry);
wire c1,c2,c3,c4;
FA f0(.A(A[0]),.B(B[0]),.cin(C),.sum(sum[0]),.carry(c1));
FA f1(.A(A[1]),.B(B[1]),.cin(c1),.sum(sum[1]),.carry(c2));
FA f2(.A(A[2]),.B(B[2]),.cin(c2),.sum(sum[2]),.carry(c3));
FA f3(.A(A[3]),.B(B[3]),.cin(c3),.sum(sum[3]),.carry(carry));
endmodule

module FA(input A,B,cin,output sum,carry);
xor x1(sum,A,B,cin);
wire c1,c2,c3;
and a1(c1,A,B);
and a2(c2,A,cin);
and a3(c3,B,cin);
or o1(carry,c1,c2,c3);
endmodule
