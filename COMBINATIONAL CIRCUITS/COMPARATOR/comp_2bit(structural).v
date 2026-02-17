module compare_2bit(input [1:0]a,b,output y1,y2,y3);
wire a_b1,b_b1,a_b0,b_b0;
not n1(b_b0,b[0]);
not n2(b_b1,b[1]);
not n3(a_b0,a[0]);
not n4(a_b1,a[1]);
  
wire w0,w1,x0,x1,w4,w5;
and a1(w0,a[0],b[0]); // a[0] & b[0]
and a2(x0,a[1],b[1]); // a[1] & b[1]
and a3(w1,a_b0,b_b0); // a[0]' & b[0]'
and a4(x1,a_b1,b_b1); // a[1]' & b[1]'
or o1(w4,w0,w1); // a[0]b[0] xnor ~a[0]~b[0]
or o2(w5,x0,x1); // a[1]b[1] xnor ~a[1]~b[1]
and a5(y1, w4,w5); // y1 -> a==b

wire e1,e2,f1,f2,f3,e3;
and q1(e1,a[1],b_b1); //a[1] & b[1]'
and q2(e2,a[0],b_b0); //a[0] & b[0]'
and q3(e3,w5,e2);
or k1(y2,e1,e3); // y2 -> A>B


and h1(f1,b[1],a_b1);
and h2(f2,b[0],a_b0);
and h3(f3,w5,f2);
or k2(y3,f1,f3); // y3 -> A<B

endmodule
