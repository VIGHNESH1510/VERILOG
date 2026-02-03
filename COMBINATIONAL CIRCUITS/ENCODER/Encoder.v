module encoder_4x2(input [3:0] in,output  [1:0]  y);
  assign y=(in[0]?2'b00:
            in[1]?2'b01:
            in[2]?2'b10:
            in[3]?2'b11:2'bxx);
//   always@(*)
//     begin
//       y=2'bXX;
//       case(in)
//         4'd1: y=2'b00;
//         4'd2: y=2'b01;
//         4'd4: y=2'b10;
//         4'd8: y=2'b11;
//         default: y=2'bxx;
        
//       endcase
//     end
endmodule
