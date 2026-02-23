module syn_fifo(input clk,reset,w_en,r_en,input [1:0]data,output reg [1:0]d_out,output full,empty);
reg [1:0]r_ptr,w_ptr;
reg [1:0] mem[3:0];
reg [2:0] count;
always @(posedge clk or posedge reset)
begin
  if(reset) begin
    d_out <=0;
    r_ptr <=0;
    w_ptr <=0;
  end
  else begin
    if(w_en && !full)
    begin
      mem[w_ptr] <= data;
      w_ptr <= w_ptr+1;
    end
   
    if(r_en && !empty)
    begin
      d_out <= mem[r_ptr];
      r_ptr <= r_ptr+1;
    end
  end
end
assign full = ((w_ptr+1'b1) == r_ptr);
assign empty = (w_ptr ==r_ptr);

endmodule
