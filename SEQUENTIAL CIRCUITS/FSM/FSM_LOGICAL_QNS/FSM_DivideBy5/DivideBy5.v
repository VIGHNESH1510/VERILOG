 module div_5(input clk,rst,in,output reg Q);
 localparam [2:0] s0=3'd0,
                  s1=3'd1,
                  s2=3'd2,
                  s3=3'd3,
                  s4=3'd4;
 reg [2:0]state, next;
 always @(posedge clk or posedge rst)
 begin
   if(rst) begin
     state <= state;
   end
     else begin
     state <= next;
 end
 end
 always @(*) begin
   case(state)
     s0: next = in ? s1: s0;
     s1: next = in ? s3: s2;
     s2: next = in ? s0: s4;
     s3: next = in ? s2: s1;
     s4: next = in ? s4: s3;
     default: next = s0;
   endcase
 end
   //FSM MEALY MACHINE
//assign Q = ((state == s0 && in==1'b0) || (state == s2 && in== 1'b1)) ? 1'b1: 1'b0;
   // FSM MOORE MACHINE
always @(state)
begin
  if(state==s0 || state== s2)
    Q <=1'b1;
  else
    Q <= 1'b0;
end
 endmodule
