module pattern_tb #(parameter N=6);
  integer mid_sp=1,sp=N-1;
  // space printing
  task space;
    input integer n;
   // begin
    for(integer i=0;i<n;i=i+1)
      $write(" ");
  //end
  endtask

  
  initial
    begin
      // upper half
      for(integer i=0;i<N-1;i=i+1)
        begin
          space(N-i-1);
          sp = sp-1;
          $write("%0d",i+1);
          if(i!=0) begin
            space(mid_sp);
            mid_sp = mid_sp+2;
             $write("%0d",i+1);
          end
          $display("");
        end
      // middle 
      for(integer i=0;i<N;i=i+1)
        begin
          $write("%0d",N);
          if(i!=N-1)
          $write(" ");
        end
      $display("");
      // lower half
     mid_sp = mid_sp-2;
      for(integer i=N-1;i>0;i=i-1)
        begin
          space(N-i);
          //sp = sp+1;
           $write("%0d",i);
          if(i>1) begin
            space(mid_sp);
            mid_sp = mid_sp-2;
             $write("%0d",i);
          end
          $display();
        end
    end

endmodule


/*
     1
    2 2
   3   3
  4     4
 5       5
6 6 6 6 6 6
 5       5
  4     4
   3   3
    2 2
     1
     */
