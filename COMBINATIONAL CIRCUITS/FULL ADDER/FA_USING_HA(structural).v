module FA(input A,B,Cin,output sum,carry);
wire s1,c1,c2;
HA h1(.A(A),.B(B),.sum(s1),.carry(c1));
HA h2(.A(s1),.B(cin),.sum(sum),.carry(c2));
or o(carry,c1,c2);
endmodule

module HA(input A,B,output sum,carry);
xor x1(sum,A,B);
and a1(carry,A,B);
endmodule
