module half_sub_tb;
  reg a,b;
  wire d,br;
  half_sub dut(.a(a),.b(b),.diff(d),.borrow(br));
  initial begin
    $monitor("time=%0t a=%b b=%b diff=%b borrow=%b ",$time,a,b,d,br);
    $dumpfile("hs_tb.vcd");
    $dumpvars(1,half_sub_tb);
    a=0; b=0; #10;
    a=0; b=1; #10;
    a=1; b=0; #10;
    a=1; b=1; #10;
    
  end
endmodule
