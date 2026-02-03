module mux_8x1_tb;
  reg [7:0]in;
  reg [2:0]sel;
  wire y;
  mux_8x1 dut(.in(in),.sel(sel),.y(y));
  initial begin
    $monitor("time=%0t in=%b sel=%b y=%b",$time,in,sel,y);
    $dumpfile("mux_8x1_tb.vcd");
    $dumpvars(1, mux_8x1_tb);
    in=8'b10101111;
    sel=3'd0; #10
    sel=3'd1; #10
    sel=3'd2; #10
    sel=3'd3; #10
    sel=3'd4; #10
    sel=3'd5; #10
    sel=3'd6; #10
    sel=3'd7; #10
    $finish;
  end
  endmodule
