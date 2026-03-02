module mealy_111_tb #(parameter N=0);
reg clk=0,rst=1;
reg in;
wire y;
mealy_111 dut(.clk(clk),.rst(rst),.in(in),.Y(y));
always #5 clk =~clk;
initial begin
  $monitor("time=%0t rst=%b in=%b y=%b ",$time,rst,in,y);
  $dumpfile("mealy_111.vcd");
  $dumpvars;
  in= N;
  #7 rst=0;
  #10 in= N;
  #10 in = N;
  #5 in = N;
  #5 in= ~N;
  #10 in =N;
  #5 in= N;
  #5 in=N;
  #10 $finish;
end
endmodule
