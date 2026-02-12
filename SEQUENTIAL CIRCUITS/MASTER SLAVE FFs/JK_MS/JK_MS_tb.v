module JK_tb;
reg clk=0,J,K,reset=0;
wire Q;
JK_ms dut(.clk(clk),.J(J),.K(K),.Q(Q),.reset(reset));
always #5 clk=~clk;
initial begin
  $monitor("time=%0t reset=%b J=%b K=%b Q=%b",$time,reset,J,K,Q);
  $dumpfile("JK_ms.vcd");
  $dumpvars(1,JK_tb);
  J=1; K=1; reset=1;
  #7 J=0; K=0; reset=0;
  #10 J=0; K=1;
  #10 J=1; K=0;
  #10 J=1; K=1;
  #20 $finish;
end
endmodule
