module mux_8x1(input [7:0]A,input [2:0]s,output Y);
wire y1,y2;
mux_4x1 m1(.A(A[7:4]),.s(s[1:0]),.Y(y1));
mux_4x1 m2(.A(A[3:0]),.s(s[1:0]),.Y(y2));
mux_4x1 m3(.A({y1,y1,y2,y2}),.s({1'b0,s[2]}),.Y(Y));
endmodule

module mux_4x1(input [3:0]A,input [1:0]s,output Y);
wire s_b1,s_b0,m1,m2,m3,m4;
not n1(s_b0,s[0]);
not n2(s_b1,s[1]);
and a1(m1,A[0],s_b0,s_b1);
and a2(m2,A[1],s_b0,s[1]);
and a3(m3,A[2],s[0],s_b1);
and a4(m4,A[3],s[0],s[1]);
or o1(Y,m1,m2,m3,m4);
endmodule
