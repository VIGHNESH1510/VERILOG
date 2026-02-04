module gray_to_bin_tb #(parameter N=4);
  wire [N-1:0]bin;
  reg [N-1:0] gray;
  gray_to_bin gb(.bin(bin),.gray(gray));
  initial begin
    $dumpfile("gtb.vcd");
    $dumpvars(1,gray_to_bin_tb);
    $monitor("time =%0t gray=%b bin=%b",$time,gray,bin);
    for(int i=0;i<16;i++) begin
      gray=i; #10;
    end
    $finish;
  end
endmodule
