module mealy_non_overlap_tb;
reg x,clk=0,reset;
wire y;
mealy_non dut(.x(x),.clk(clk),.reset(reset),.y(y));
always #5 clk = ~clk;
initial begin
  $monitor("time = %0t clock = %b reset = %b x = %b y = %b",$time,clk,reset,x,y);
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
  $finish;
end
endmodule
