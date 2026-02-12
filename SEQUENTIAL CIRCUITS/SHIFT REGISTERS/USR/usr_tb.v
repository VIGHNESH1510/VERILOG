module usr_tb #(parameter N=4);
reg clk=0,reset;
reg [N-1:0]data;
reg [1:0] sel;
wire [N-1:0]Q;
usr dut(.clk(clk),.reset(reset),.data(data),.sel(sel),.Q(Q));
always #5 clk= ~clk;
initial
begin
  $monitor("time=%0t reset=%b sel=%b data=%b Q=%b",$time,reset,sel,data,Q);
  $dumpfile("usr.vcd");
  $dumpvars;
  reset=1; data=4'b1011;
  #15 reset=0;
  sel=2'b00;
  #15 sel=2'b01;
  #15 sel=2'b10;
  #15 data=4'b1111; sel=2'b11;
  #20 $finish;

end
endmodule
