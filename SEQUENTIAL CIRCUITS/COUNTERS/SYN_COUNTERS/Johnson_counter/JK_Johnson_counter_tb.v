module johnson_counter_tb #(parameter N=4);
reg clk=0, reset=1;
wire [N-1:0]Q;
johnson_counter dut(.clk(clk),.reset(reset),.Q(Q));
always #5 clk=~clk;
initial
begin
    $monitor("time=%0t reset=%b Q=%b",$time,reset,Q);
    $dumpfile("johnson_tb.vcd");
    $dumpvars(1,johnson_counter_tb);
    #20 reset=0;
    #200 $finish;
    
end
endmodule
