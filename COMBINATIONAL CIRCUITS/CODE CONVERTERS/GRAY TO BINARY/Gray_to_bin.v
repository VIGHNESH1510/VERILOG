module gray_to_bin #(parameter N = 4)(input[N-1:0] gray, output reg [N-1:0]  bin);
  always @(*)
    begin 
      for(int i=N-1;i>=0;i--)
        begin
          bin[i]= (i!=N-1)?(bin[i+1] ^ gray[i]):gray[i];
        end
    end
  
endmodule
