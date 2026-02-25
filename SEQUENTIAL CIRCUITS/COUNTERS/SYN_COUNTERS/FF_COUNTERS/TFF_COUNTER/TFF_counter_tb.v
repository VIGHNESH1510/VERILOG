module Tff_counter_tb #(parameter N=4);
reg clk,reset;
wire [N-1:0]Q;
TFF_counter dut(.clk(clk),.reset(reset),.Q(Q));
initial begin
forever #3 clk= ~clk;
end
initial begin
  $monitor("time=%0t reset=%b Q=%d",$time,reset,Q);
  $dumpfile("tff_cnt.vcd");
  $dumpvars();
  reset=1; clk=1;
  #15 reset=0;
  #150 $finish;

end
endmodule
