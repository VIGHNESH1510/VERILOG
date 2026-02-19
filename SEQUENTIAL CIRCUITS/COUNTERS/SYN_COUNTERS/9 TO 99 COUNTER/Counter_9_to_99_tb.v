module counter_99_tb;
reg clk=0,en,pre=0;
wire [7:0]Q;
counter_99 dut(.clk(clk),.enable(en),.preset(pre),.Q(Q));
always #2 clk =~clk;
/*always @(posedge clk)
begin
  #1 $display("time=%0t enable=%b preset=%b Q=%d",$time,en,pre,Q);
end*/

initial begin
 $monitor("time=%0t enable=%b preset=%b Q=%h",$time,en,pre,Q);
  $dumpfile("counter.vcd");
  $dumpvars;
  en=1;
  #10 pre=1;
  #5 pre=0;
  #200 $finish;
end
endmodule
