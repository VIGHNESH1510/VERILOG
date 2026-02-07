module JKlatch_tb;
  reg clk=0,J=0,K=0;
  wire Q;
  JK_latch dut(.clk(clk),.J(J),.K(K),.Q(Q));
  initial begin
    clk=0; #10
    clk=1;
    J=0; K=0; #20;
    J=0; K=1; #20;
    J=1; K=0; #20;
    J=1; K=1; #20;
  end
  initial begin
    $monitor("time=%0t clk=%b J=%b  K= %b Q=%b",$time,clk,J,K,Q);
    $dumpfile("jK_tb.vcd");
    $dumpvars(1,JKlatch_tb);
    #80 $finish; #1;
  end
endmodule


