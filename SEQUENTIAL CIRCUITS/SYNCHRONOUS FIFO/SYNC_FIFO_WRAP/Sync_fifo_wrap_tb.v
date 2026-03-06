 module syn_fifo_tb;
 reg clk=0,rst,w_en,r_en;
 reg [1:0] data;
 wire [1:0] d_out;
 wire full,empty;
 syn_fifo dut(.clk(clk),.reset(rst),.w_en(w_en),.r_en(r_en),.data(data),.d_out(d_out),.full(full),.empty(empty));
 always #5 clk = ~clk;
 initial begin
   $dumpfile("syn_fifo.vcd");
   $dumpvars;
   rst=1;
   w_en=0; r_en=0;
   #15 rst=0;
   repeat(5) begin
     @(negedge clk)
     w_en=1;
     data=$random;
     @(posedge clk)
     if(!full) begin
     #1;
     $display("DW time=%0t data=%b",$time,data);
   end
     else
       $display("time=%0t memory is full",$time);
   end
   #20;
   w_en=0;
   repeat(5) begin
    @(negedge clk)
     r_en=1;
     @(posedge clk)
     if(!empty)
       #1
     $display("DR time=%0t d_out=%b",$time,d_out);
   else
     $display("time=%0t memory is empty",$time);
   end
   #20 $finish;
 end

 endmodule
