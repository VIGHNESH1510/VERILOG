module JKff_tb;
  reg clk=0,reset=1,J=0,K=0;
  wire Q;
  JK_FF dut(.clk(clk),.reset(reset),.J(J),.K(K),.Q(Q));
  always #5 clk=~clk;
  always #15 reset=~reset;
  initial begin
    J=0; K=0; #20;
    J=0; K=1; #20;
    J=1; K=0; #20;
    J=1; K=1; #20;
  end
  initial begin
    $monitor("time=%0t clk=%b reset=%b J=%b  K= %b Q=%b",$time,clk,reset,J,K,Q);
    $dumpfile("jff_tb.vcd");
    $dumpvars(1,JKff_tb);
    #100 $finish; #1;
  end
endmodule
