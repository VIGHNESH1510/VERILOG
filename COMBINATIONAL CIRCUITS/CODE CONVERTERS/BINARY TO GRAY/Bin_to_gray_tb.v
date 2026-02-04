module binary_to_gray_tb #(parameter N=4);
  reg [N-1:0]bin;
  wire [N-1:0] gray;
  binary_to_gray bg(.bin(bin),.gray(gray));
  initial begin
    $dumpfile("btg.vcd");
    $dumpvars(1,binary_to_gray_tb);
    $monitor("time =%0t bin=%b gray=%b",$time,bin,gray);
    for(int i=0;i<(2**N);i++) begin
      bin=i; #10;
    end
    $finish;
  end
endmodule
