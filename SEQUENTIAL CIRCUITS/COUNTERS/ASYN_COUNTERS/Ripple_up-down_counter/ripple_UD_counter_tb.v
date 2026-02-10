module Ripple_UD_tb#(parameter N=4);
reg clk=0,reset,mode;
wire [N-1:0] Q;
ripple_ud dut(.clk(clk),.reset(reset),.mode(mode),.Q(Q));
always #5 clk =~clk;
initial begin
  $dumpfile("rc_ud.vcd");
  $dumpvars;
  $monitor("time=%0t reset=%b mode=%b Q=%b",$time,reset,mode,Q);
  reset =1;
  mode =1;
  #10 reset =0;
  #25 mode =0;
  #25 mode =1;
  #100 $finish;

end
endmodule
