module T_tb;
reg clk=0,T,reset=0;
wire Q;
T_ms dut(.clk(clk),.T(T),.Q(Q),.reset(reset));
always #5 clk=~clk;
initial begin
  $monitor("time=%0t reset=%b T=%b Q=%b",$time,reset,T,Q);
  $dumpfile("T_ms.vcd");
  $dumpvars(2,T_tb);
  T=1;reset=1;
  #7 T=0; reset=0;
  #10 T=1;
  #10 T=0;
  #10 T=1;
  #30 $finish;
end
endmodule
