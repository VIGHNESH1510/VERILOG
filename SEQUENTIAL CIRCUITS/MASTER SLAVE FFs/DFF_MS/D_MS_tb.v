module D_tb;
reg clk=0,D,reset=0;
wire Q;
D_ms dut(.clk(clk),.D(D),.Q(Q),.reset(reset));
always #5 clk=~clk;
initial begin
  $monitor("time=%0t reset=%b D=%b Q=%b",$time,reset,D,Q);
  $dumpfile("D_ms.vcd");
  $dumpvars(2,D_tb);
  D=1;reset=1;
  #7 D=0; reset=0;
  #10 D=1;
  #10 D=1;
  #10 $finish;
end
endmodule
