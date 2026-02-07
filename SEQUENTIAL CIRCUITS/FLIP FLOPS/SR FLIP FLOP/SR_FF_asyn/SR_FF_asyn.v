module SR_FF(input S,R,clk,rst,output reg Q);
  always @( posedge clk or posedge rst)
    begin
      if(rst) Q<=0; // Active High reset
      else begin
        case({S,R})
          2'b00: Q<=Q;
          2'b01: Q<=0;
          2'b10: Q<=1;
          2'b11: Q<=1'bx;
          default: Q<=0;
        endcase
      end
    end
endmodule
