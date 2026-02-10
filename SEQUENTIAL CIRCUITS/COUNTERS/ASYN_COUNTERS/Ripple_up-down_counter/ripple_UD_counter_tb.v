module Ripple_UD_tb#(parameter N=4);
reg clk=0,reset,mode;
wire [N-1:0] Q;
ripple_UD dut(.clk(clk),.reset(reset),.mode(mode),.Q(Q));
always #5 clk =~clk;
initial begin
  $monitor("time=%0t reset=%b mode=%b Q=%b",$time,reset,mode,Q);
  reset =0;
  
end
endmodule
