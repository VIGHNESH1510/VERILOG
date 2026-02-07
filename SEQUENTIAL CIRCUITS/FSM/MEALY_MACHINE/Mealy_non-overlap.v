module mealy_non(input x,clk,reset,output y);
localparam[1:0] s0 = 2'b00,
                s1 = 2'b01,
                s2 = 2'b10,
                s3 = 2'b11;
reg [1:0] state,next_state;
always@(posedge clk or posedge reset)
  state <= reset ? s0:next_state;
always @(*) begin
  case(state)
    s0: next_state = x ? s1 : s0;
    s1: next_state = x ? s1 : s2;
    s2: next_state = x ? s3 : s0;
    s3: next_state = x ? s1 : s0;
    default: next_state <= s0;
  endcase
end
assign y = (x == 0 && state == s3) ? 1 : 0;

endmodule

