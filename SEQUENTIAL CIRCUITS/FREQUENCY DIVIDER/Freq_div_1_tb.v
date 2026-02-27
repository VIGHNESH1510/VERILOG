module freq_divider_tb;
reg clk=0,rst;
wire f_clk;
always #10 clk = ~clk;
freq_divider dut(.clk(clk),.rst(rst),.f_clk(f_clk));
initial begin
$monitor("time=%0t reset=%b f_clk=%b", $realtime,rst,f_clk);
$dumpfile("freq_div.vcd");
$dumpvars;
rst=1; #10;
rst=0;
#200000 $finish;
end
endmodule
