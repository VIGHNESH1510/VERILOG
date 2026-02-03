module mux_8x1(input [7:0]in, 
               input [2:0]sel,
               output  y);
  always @(*)
    begin 
      case(sel)
        3'd0: y = in[sel];
        3'd1: y = in[sel];
        3'd2: y = in[sel];
        3'd3: y = in[sel];
        3'd4: y = in[sel];
        3'd5: y = in[sel];
        3'd6: y = in[sel];
        3'd7: y = in[sel];
      endcase
    end
endmodule
