module mealy_111 #(parameter N=0)(input clk,rst,in,output Y);
localparam [1:0]s0=2'b00,
         s1=2'b01,
         s2=2'b10;
reg [1:0]c_state, n_state;
always @(posedge clk or posedge rst)
  c_state <= rst ? s0: n_state;
always @(*) begin
    case(c_state)
      s0: n_state = (in==N)? s1:s0;
      s1: n_state = (in==N)? s2:s0;
      s2: n_state = (in==N)? s2:s0;
      default: n_state= s0;
    endcase
end
assign Y= (c_state == s2 && in==N) ? 1'b1:1'b0;
endmodule
