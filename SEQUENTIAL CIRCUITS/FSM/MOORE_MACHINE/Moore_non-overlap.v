module moore_non(input x,clk,reset,output reg y);
localparam[2:0] s0 = 3'b000,
                s1 = 3'b001,
                s2 = 3'b010,
                s3 = 3'b011,
                s4 = 3'b100;
reg [2:0] state,next_state;
always@(posedge clk or posedge reset)
  state <= reset ? s0:next_state;
always @(*) begin
  case(state)
    s0: begin
      next_state = x ? s1 : s0;
      y=0;
    end
    s1: begin 
      next_state = x ? s1 : s2;
      y=0;
    end
    s2: begin
      next_state = x ? s3 : s0;
      y=0;
    end
    s3: begin
      next_state = x ? s1 : s4;
      y=0;
    end
    s4: begin
      next_state = x ? s1 : s0;
      y=1;
    end
    default: next_state = s0;
  endcase
end
//assign y = (x == 0 && state == s3) ? 1 : 0;

endmodule

