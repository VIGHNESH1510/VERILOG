module priority_encoder(input [3:0]in,
                        output v,
                        output[1:0] y);
  assign v= in==4'd0?0:1;
  
  assign y = ((in[3] & v)?2'b11:
              (in[2] & v)?2'b10:
              (in[1] & v)?2'b01:
              (in[0] & v)?2'b00:2'b00);
  
endmodule
