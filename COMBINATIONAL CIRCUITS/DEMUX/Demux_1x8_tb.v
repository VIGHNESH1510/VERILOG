module demux_1x8_tb;
  reg in;
  reg [2:0] sel;
  wire [7:0] y;
  demux_1x8 dut(.in(in),.sel(sel),.y(y));
  initial begin
    $monitor("time =%0t in=%b sel=%b y=%b",$time,in,sel,y);
    $dumpfile("demux_tb.vcd");
    $dumpvars(1,demux_1x8_tb);
    in=1'b1;
    for(integer i=0;i<8;i++)
      begin 
         sel=i;
        #10;
      end
    $finish;
  end
endmodule
