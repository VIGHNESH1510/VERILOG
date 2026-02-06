module Tff_tb;
  reg clk=0,reset=1,T=0;
  wire Q;
  Tff t(.clk(clk),.reset(reset),.T(T),.Q(Q));
  always #5 clk=~clk;
  always #15 reset=~reset;
  always #10 T=~T;
  initial begin
    $monitor("time=%0t clk=%b reset=%b T=%b Q=%b",$time,clk,reset,T,Q);
    $dumpfile("Tff_tb.vcd");
    $dumpvars(1,Tff_tb);
    #100 $finish;
  end
endmodule
