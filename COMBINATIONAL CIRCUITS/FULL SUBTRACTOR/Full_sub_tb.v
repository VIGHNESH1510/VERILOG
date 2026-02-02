module full_sub_tb;
  reg a,b,c;
  wire diff, borrow;
  wire d1,d2,b1,b2;
  full_sub h1(.a(a),.b(b),.c(c).diff(diff),.borrow(borrow));
  initial begin
    $monitor("time=%0t| a=%b | b=%b | c=%b | diff=%b | borrow=%b",$time,a,b,c,diff,borrow);
    $dumpfile("FS_tb.vcd");
    $dumpvars(1,full_sub_tb);
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
