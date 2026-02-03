module demux_1x8(input in,
                 input [2:0]sel,
                 output reg [7:0] y);
  always@(*) begin
    y=8'o0;
    case(sel)
      8'o0: y[0]=in;
      8'o1: y[1]=in;
      8'o2: y[2]=in;
      8'o3: y[3]=in;
      8'o4: y[4]=in;
      8'o5: y[5]=in;
      8'o6: y[6]=in;
      8'o7: y[7]=in;
    endcase 
  end
  
endmodule
