module N_bit_tb #(parameter N=4);
reg clk=0,reset;
reg [N-1:0] mod;
wire [N-1:0] Q;
N_bit_counters dut(.clk(clk),.reset(reset),.mod(mod),.Q(Q));
always #5 clk=~clk;
initial begin
  $monitor("time=%0t reset=%b mod=%b Q=%b",$time,reset,mod,Q);
  $dumpfile("N_bit.vcd");
  $dumpvars;
  reset=1;mod=10;
  #10 reset =0;
  #100 $finish;

end
endmodule
