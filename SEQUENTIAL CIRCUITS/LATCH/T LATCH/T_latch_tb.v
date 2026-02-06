module T_latch_tb;
  reg clk=0,T=0;
  wire Q;
  T_latch t(.clk(clk),.T(T),.Q(Q));
  
  always #5 clk=~clk;
  always #15 T=~T;
  initial begin
    $monitor("time=%0t clk=%b T=%b Q=%b",$time,clk,T,Q);
    $dumpfile("T_latch_tb.vcd");
    $dumpvars(1,T_latch_tb);
    #100 $finish;
  end
endmodule
