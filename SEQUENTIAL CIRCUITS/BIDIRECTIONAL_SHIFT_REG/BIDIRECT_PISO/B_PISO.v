module b_piso #(parameter N=4)(input clk,reset,mode,load,input[N-1:0]data,output reg Q);
reg[N-1:0] q;
always @(posedge clk or posedge reset)
begin
  if(reset) begin
    q = {N{1'b0}};
    Q =q[0];
  end
  else begin
    if(mode) begin
      q = load? data: {1'b0,q[N-1:1]};
      Q =q[0];
    end
    else begin
        q = load? data:{q[N-2:0],1'b0};
        Q = q[N-1];
      end
  end
end
endmodule
