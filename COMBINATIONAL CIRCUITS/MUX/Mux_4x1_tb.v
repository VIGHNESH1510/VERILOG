module mux_4x1_tb;
  reg [3:0]a;
  reg[1:0]s;
  wire y;
  mux_4x1 dut(.a(a),.s(s),.y(y));
  initial begin
    $monitor("time=%0t a=%b s=%b y=%b",$time,a,s,y);
    $dumpfile("mux_tb.vcd");
    $dumpvars(1,mux_4x1_tb);
    a= 4'b1010;
    s=2'b00; #10;
    s=2'b01; #10;
    s=2'b10; #10;
    s=2'b11; #10;
    $finish;
  end
endmodule
