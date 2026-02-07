module SR_FF_tb;
  reg S,R,clk=0,rst;
  wire Q;
  SR_FF dut(.S(S),.R(R),.clk(clk),.rst(rst),.Q(Q));
  always #5 clk=~clk;
  initial begin
    $monitor("time=%0t rst=%b S=%b R=%b Q=%b",$time,rst,S,R,Q);
    $dumpfile("SR_tb.vcd");
    $dumpvars(1,SR_FF_tb);
    rst =1;
    #10 S=0; R=0;
    #10 S=0; R=1;
    #10 S=1; R=0;
    #10 S=1; R=1;
    rst =0;
    #10 S=0; R=0;
    #10 S=0; R=1;
    #10 S=1; R=0;
  end
  initial #80 $finish;
endmodule
