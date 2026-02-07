module SR_latch_tb;
  reg S,R,clk;
  wire Q;
  SR_latch dut(.S(S),.R(R),.clk(clk),.Q(Q));
  initial begin
    $monitor("time=%0t clk=%b S=%b R=%b Q=%b",$time,clk,S,R,Q);
    $dumpfile("SR_tb.vcd");
    $dumpvars(1,SR_latch_tb);
    clk =0;
    #10 S=0; R=0;
    #10 S=0; R=1;
    clk=1;
    #10 S=1; R=0;
    #10 S=1; R=1;
    #10 S=0; R=0;
    #10 S=0; R=1;
    #10 S=1; R=0;
  end
  initial #80 $finish;
endmodule
