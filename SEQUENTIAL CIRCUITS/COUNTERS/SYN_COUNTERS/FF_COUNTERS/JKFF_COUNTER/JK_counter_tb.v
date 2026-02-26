module jk_count_tb #(parameter N=4);
reg clk=0,rst;
wire [N-1:0] Q;
jk_count dut(.clk(clk),.rst(rst),.Q(Q));
always #3 clk= ~clk;
initial begin
  $monitor("time=%0t reset=%b Q=%d",$time,rst,Q);
  $dumpfile("jk_count.vcd");
  $dumpvars;
  rst=1'b1; #10;
  rst=1'b0;
  #150 $finish;
end
endmodule
