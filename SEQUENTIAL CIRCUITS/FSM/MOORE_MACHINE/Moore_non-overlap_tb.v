module moore_non_tb;
reg x,clk=0,reset;
wire y;
moore_non dut(.x(x),.clk(clk),.reset(reset),.y(y));
always #5 clk = ~clk;
initial begin
  $monitor("time = %0t clock = %b reset = %b x = %b y = %b",$time,clk,reset,x,y);
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
 
end
initial #170 $finish;
endmodule
