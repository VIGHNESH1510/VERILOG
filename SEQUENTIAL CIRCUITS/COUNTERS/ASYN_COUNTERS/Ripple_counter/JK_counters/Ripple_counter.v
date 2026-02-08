module ripple_counter#(parameter N=4)(input clk,reset,output [N-1:0]Q);
// JK_FF j0(.clk(clk),.J(1'b1),.K(1'b1),.reset(reset),.Q(Q[0]));
 //JK_FF j1(.clk(Q[0]),.J(1'b1),.K(1'b1),.reset(reset),.Q(Q[1]));
 //JK_FF j2(.clk(Q[1]),.J(1'b1),.K(1'b1),.reset(reset),.Q(Q[2]));
// JK_FF j3(.clk(Q[2]),.J(1)'b1,.K(1'b1),.reset(reset),.Q(Q[3]));

 genvar i;
 generate
   for(i=0;i<N;i=i+1)
   begin
     if(i==0)
       JK_FF j(.clk(clk),.J(1'b1),.K(1'b1),.reset(reset),.Q(Q[i]));
     else
       JK_FF j(.clk(~Q[i-1]),.J(1'b1),.K(1'b1),.reset(reset),.Q(Q[i]));
   end
   endgenerate


endmodule
module JK_FF(input clk,reset,J,K,output reg Q);
always@(posedge clk or posedge reset) 
begin
  if(reset)
    Q <= 0;
  else
    case({J,K})
      2'b00: Q<=Q;
      2'b01: Q<=0;
      2'b10: Q<=1;
      2'b11: Q<=~Q;
    endcase
end
endmodule
