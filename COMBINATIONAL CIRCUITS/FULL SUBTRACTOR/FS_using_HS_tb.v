module full_sub_tb;
  reg a,b,c;
  wire diff, borrow;
  wire d1,d2,b1,b2;
  
  half_sub h1(.a(b),.b(c),.diff(d1),.borrow(b1));
  half_sub h2(.a(d1),.b(a),.diff(diff),.borrow(b2));
  assign borrow= b1 | a&~d1;
  initial begin
    $monitor("time=%0t| a=%b | b=%b | c=%b | diff=%b | borrow=%b",$time,a,b,c,diff,borrow);
    a=0; b=0; c=0;#10
    a=0; b=0; c=1;#10
    a=0; b=1; c=0;#10
    a=0; b=1; c=1;#10
    a=1; b=0; c=0;#10
    a=1; b=0; c=1;#10
    a=1; b=1; c=0;#10
    a=1; b=1; c=1;#10
    $finish;
  end
  
endmodule
