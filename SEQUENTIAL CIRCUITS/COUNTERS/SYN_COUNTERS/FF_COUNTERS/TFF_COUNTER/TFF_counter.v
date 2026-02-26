 module T_FF(input clk,rst,T,output reg Q);
 always @(posedge clk or posedge rst)
 begin
   if(rst)
     Q <=1'b0;
   else
     Q <= T? ~Q: Q;
 end
 endmodule

 module TFF_counter #(parameter N=4)(input clk,reset,output [N-1:0]Q);
 genvar i;
 wire [N-1:0] T;
 generate
   for(i=0;i<N;i=i+1)
   begin: gen
     assign T[i] = (i==1'b0 ? 1'b1: (Q[i-1] & T[i-1]) ); //  UP COUNTER     
    // assign T[i] = (i==1'b0 ? 1'b1: (~Q[i-1] & T[i-1]) ); //  DOWN COUNTER
      T_FF ins(.clk(clk),.rst(reset),.T(T[i]),.Q(Q[i]));
   end
 endgenerate
 endmodule
