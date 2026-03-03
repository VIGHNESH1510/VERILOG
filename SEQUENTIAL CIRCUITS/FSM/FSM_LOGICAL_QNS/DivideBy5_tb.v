module div_5_tb;
reg clk=0,rst=1;
reg in;
wire Q;
div_5 dut(.clk(clk),.rst(rst),.in(in),.Q(Q));
always #5 clk =~clk;
initial begin
  $monitor("time=%0t rst=%b in=%b y=%b ",$time,rst,in,Q);
  $dumpfile("div_5.vcd");
  $dumpvars;
  in= 0;
  #7 rst=0;
  #10 in= 1;
  #10 in = 0;
  #5 in = 1;
  #5 in= 0;
  #10 in =1;
  #5 in= 1;
  #5 in=1;
  #20 $finish;
end
endmodule
