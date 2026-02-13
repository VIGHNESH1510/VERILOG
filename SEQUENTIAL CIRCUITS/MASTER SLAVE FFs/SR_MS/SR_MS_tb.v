module SR_tb;
reg clk=0,reset,S,R;
wire Q;
SR_ms sr(.clk(clk),.reset(reset),.S(S),.R(R),.Q(Q));
always #5 clk=~clk;
initial begin
  reset=1;
  $monitor("time=%0t reset=%b S=%b R=%b Q=%b",$time,reset,S,R,Q);
  $dumpfile("SR.vcd");
  $dumpvars;
  #20 reset=0; S=0;R=0;
  #10 S=0;R=1;
  #10 S=1;R=0;
  #10 S=1;R=1;
  #10 $finish;
end
endmodule
