module mem_tb;
wire [7:0] out;
reg clk=0,rw;
reg [7:0]data;
reg [2:0]add;
ram dut(.clk(clk),.rw(rw),.data(data),.add(add),.out(out));
always #5 clk =~clk;
initial
begin
rw=0; data=$random; add=3'd0;
$monitor("time=%0t rw=%b data=%b add=%b out=%b ",$time,rw,data,add,out);
$dumpfile("mem_tb.vcd");
$dumpvars;
#15 rw=1; add=3'd0;
#10 rw=0; data=$random; add=3'd3;
#10 rw=0; data=$random; add=3'd6;
#10 rw=0; data=$random; add=3'd5;
#10 rw=1;  add=3'd3;
#10 rw=1;  add= 3'd6;
#10 rw=1; add=3'd5;
#10 $finish;
end
endmodule
