module N_bit_tb #(parameter N=4);
reg clk=0,reset;
wire [N-1:0] Q;
N_bit_counters dut(.clk(clk),.reset(reset),.Q(Q));
always #5 clk=~clk;
initial begin
  $monitor("time=%0t reset=%b Q=%b",$time,reset,Q);
  $dumpfile("N_bit.vcd");
  $dumpvars;
  reset=1;
  #10 reset =0;
  #120 $finish;

end
endmodule
