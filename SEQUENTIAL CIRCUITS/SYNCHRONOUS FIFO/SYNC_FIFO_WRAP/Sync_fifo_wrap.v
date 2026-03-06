module syn_fifo #(parameter depth=4, width=2)(input clk,reset,w_en,r_en,input [1:0]data,output reg [1:0]d_out,output full,empty);
reg [2:0]r_ptr,w_ptr;
reg [width-1:0] mem[depth-1:0];
reg [2:0] count;
wire wrap;
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
      mem[w_ptr[1:0]] <= data;
      w_ptr <= w_ptr+1;

    end

    if(r_en && !empty)
    begin
      d_out <= mem[r_ptr[1:0]];
      r_ptr <= r_ptr+1;
 
    end
  end
end

assign wrap = w_ptr[2] ^ r_ptr[2];
assign full = wrap & (w_ptr[1:0] == r_ptr[1:0]);
assign empty = (w_ptr==r_ptr);

endmodule
