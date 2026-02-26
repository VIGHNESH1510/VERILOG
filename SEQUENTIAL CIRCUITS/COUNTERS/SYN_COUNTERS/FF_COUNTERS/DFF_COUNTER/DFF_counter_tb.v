module dff_count_tb #(parameter N=4);
reg clk=0, reset;
wire [N-1:0] Q;
DFF_count dut(.clk(clk),.reset(reset),.Q(Q));
always #3 clk = ~clk;
initial begin
  $monitor("Time= %0t reset=%b Q=%d", $time,reset,Q);
  $dumpfile("dff_count.vcd");
  $dumpvars;
  reset=1'b1; #10;
  reset=1'b0;
  #150 $finish;
end
endmodule
