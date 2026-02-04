module binary_to_gray #(parameter N = 4)(input[N-1:0] bin, output reg [N-1:0]  gray);
  always @(*)
    begin 
      for(int i=N-1;i>=0;i--)
        begin
          gray[i]= (i!=N-1)?(bin[i] ^ bin[i+1]):bin[i];
        end
    end
  
endmodule
