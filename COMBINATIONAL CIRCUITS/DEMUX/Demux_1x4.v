module demux_4x1(input in, input [1:0]sel,output [3:0]y);
  assign y[0] = ~sel[1] & ~sel[0] & in;
  assign y[1] = ~sel[1] & sel[0] & in;
  assign y[2] = sel[1] & ~sel[0] & in;
  assign y[3] = sel[1] & sel[0] & in;
endmodule
