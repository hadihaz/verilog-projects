module Synchronous_Down_Counter_tb;
  reg CLK=1;
  wire [3:0] Q;
  Synchronous_Down_Counter dut (
    .CLK(CLK),
    .Q(Q)
  );
    always begin
      #100 CLK = ~CLK; 
    end
endmodule