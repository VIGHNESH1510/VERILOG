module ripple_counter_tb #(parameter N=4);
reg clk=0,reset=1;
wire [N-1:0]Q;
ripple_counter r(.clk(clk),.reset(reset),.Q(Q));
always #5 clk=~clk;
initial begin
 $monitor("time=%0t reset=%b Q=%b",$time,reset,Q);
 $dumpfile("counter.vcd");
 $dumpvars;
 #20 reset=0;
 #10 reset=1;
 #20 reset=0;

#200 $finish;
end
endmodule
