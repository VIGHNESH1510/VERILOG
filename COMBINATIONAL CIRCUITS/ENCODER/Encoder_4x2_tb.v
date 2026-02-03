module encoder_4x2_tb;
  reg [3:0] in;
  wire [1:0] y;
  encoder_4x2 dut(.in(in),.y(y));
  initial 
    begin
      $dumpfile("encoder_tb");
      $dumpvars(1,encoder_4x2_tb);
      $monitor("time=%0t in=%b y=%b",$time , in,y);
      for(integer i=0;i<4;i++)
      begin 
        in = 4'b0001<<i; #10;
      end
    in= 4'bxxxx; #10;
    $finish; 
  end
endmodule
