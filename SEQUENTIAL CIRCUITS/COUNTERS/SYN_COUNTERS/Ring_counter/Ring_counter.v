module ring_counter #(parameter N=4)(input clk,reset,output [N-1:0]Q);
wire [N-1:0]j,k;
genvar i;
generate 
    for(i=0;i<N;i=i+1)
    begin
        if(i==0)
        begin
            assign j[i]=Q[N-1] & ~Q[i];
            assign k[i] = ~Q[N-1] & Q[i];
        end
        else begin
            assign j[i]=Q[i-1] & ~Q[i];
            assign k[i] = ~Q[i-1] & Q[i];
        end
    end
endgenerate
genvar a;
generate
    for(a=0;a<N;a=a+1)
    begin
        jk_ff ff(.clk(clk),.reset(reset),.preset(a==0? 1'b1:1'b0),.J(j[a]),.K(k[a]),.Q(Q[a]));
    end
endgenerate
endmodule
module jk_ff(input J,K,clk,reset,preset,output reg Q);
always@(posedge clk or posedge reset)begin
if(reset)
Q<=preset;
else
begin
    case({J,K})
    2'b00: Q<=0;
    2'b01: Q<=0;
    2'b10: Q<=1;
    2'b11: Q<= ~Q;
    endcase
end
end
endmodule
