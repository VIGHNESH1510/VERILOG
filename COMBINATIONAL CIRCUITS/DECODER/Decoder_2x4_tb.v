module decoder_2x4_tb;
  reg [1:0]in;
  wire [3:0]out;
  decoder_2x4 dut(.in(in),.out(out));
  initial begin
    $monitor("time =%0t in=%b out=%b ",$time,in,out);
    $dumpfile("dec_tb.vcd");
    $dumpvars(1,decoder_2x4_tb);
    for(integer i=0;i<4;i++)
      begin 
         in=i;
        #10;
      end
    $finish;
  end
endmodule
