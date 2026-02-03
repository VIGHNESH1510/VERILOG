module priority_encoder_tb;
  reg [3:0] in;
  reg v;
  wire [1:0] y;
  priority_encoder dut(.in(in),.v(v),.y(y));
//   initial begin
//     in=4'b0000;
//       v=0;
//       #10 v=1;
//   end
  initial 
    begin
      $dumpfile("encoder_tb.vcd");
      $dumpvars(1,priority_encoder_tb);
      $monitor("time=%0t in=%b v=%b y=%b",$time , in,v,y);
      
    //in=4'b0000;
      in=4'b0000;
      v=0;
      #10 v=1;
      for(integer i=0;i<16;i++)
      begin 
         in = i; #10; 
      end
     $finish; 
  end
endmodule
