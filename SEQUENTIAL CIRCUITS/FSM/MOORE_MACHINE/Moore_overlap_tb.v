module moore_overlap_tb;
reg x,clk=0,reset;
wire y;
moore_overlap dut(.x(x),.clk(clk),.reset(reset),.y(y));
always #5 clk = ~clk;
initial begin
  $monitor("time = %0t reset = %b x = %b y = %b",$time,reset,x,y);
  $dumpfile("moore_tb.vcd");
  $dumpvars;
  reset = 1;
  x=0; #10; 
  x=1; #10;
  x=0; #10;
  x=0; #10;
  reset = 0;
  x=1; #10; 
  x=0; #10;
  x=0; #10;
  x=1; #10;
  x=0; #10;
  x=1; #10;
  x=0; #10;
  x=1; #10;
  x=0; #10;
  x=1; #10;
  x=0; #10;
  x=1; #10;
  x=0; #10;
 
end
initial #180 $finish;
endmodule
