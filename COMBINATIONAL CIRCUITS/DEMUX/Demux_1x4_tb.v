module demux_4x1_tb;
  reg in;
  reg[1:0]sel;
  wire [3:0]y;
  demux_4x1 dut(.in(in),.sel(sel),.y(y));
  initial begin
    $monitor("time=%0t in=%b sel=%b y=%b",$time,in,sel,y);
    $dumpfile("demux_tb.vcd");
    $dumpvars(1,demux_4x1_tb);
    in=1'b1;
    sel=2'b00; #10;
    sel=2'b01; #10;
    sel=2'b10; #10;
    sel=2'b11; #10;
    $finish;
  end
endmodule
