module ring_counter_tb #(parameter N=4);
reg clk=0,reset;
wire [N-1:0] Q;
D_ring_count dut(.clk(clk),.reset(reset),.Q(Q));
always #5 clk=~clk;
initial
begin
  $monitor("time=%0t reset=%b Q=%b",$time,reset,Q);
  $dumpfile("ring_tb.vcd");
  $dumpvars;
  reset=1;
  #10 reset=0;
  #100 $finish;
end
endmodule
