module SR_latch(input S,R,clk,output reg Q);
  always @(clk or S or R)
    begin
        case({S,R})
          2'b00: Q<=Q;
          2'b01: Q<=0;
          2'b10: Q<=1;
          2'b11: Q<=1'bx;
          default: Q<=0;
        endcase
      end
endmodule
