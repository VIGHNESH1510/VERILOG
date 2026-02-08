module moore_overlap(input x,clk,reset,output reg y);
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
    s0: next_state = x ? s1 : s0;
    s1: next_state = x ? s1 : s2;
    s2: next_state = x ? s3 : s0;
    s3: next_state = x ? s1 : s4; 
    s4: next_state = x ? s1 : s3; 
    default: next_state = s0;
  endcase
end
always @(*) begin
  case(state)
    s4: y=1;
    default: y=0;
  endcase
end


endmodule

