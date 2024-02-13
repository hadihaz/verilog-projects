module Synchronous_Down_Counter (
    input CLK,
    output [3:0] Q
  );
  wire [3:0] Q_Bar;
  wire AND0, AND1;
  JK_FlipFlop FFA (.J(1), .K(1), .CLK(CLK), .Q(Q[0]), .QBar(Q_Bar[0]));
  JK_FlipFlop FFB (.J(Q_Bar[0]), .K(Q_Bar[0]), .CLK(CLK), .Q(Q[1]), .QBar(Q_Bar[1]));
  JK_FlipFlop FFC (.J(AND0), .K(AND0), .CLK(CLK), .Q(Q[2]), .QBar(Q_Bar[2]));
  JK_FlipFlop FFD (.J(AND1), .K(AND1), .CLK(CLK), .Q(Q[3]), .QBar(Q_Bar[3]));
  and AND_0 (AND0, Q_Bar[1], Q_Bar[0]);
  and AND_1 (AND1,  AND0 , Q_Bar[2]);
endmodule

module JK_FlipFlop (
  input J,
  input K,
  input CLK,
  output reg Q=0,
  output reg QBar
);
  always @(posedge CLK) begin
    if (J && !K)
      Q <= 1;
    else if (!J && K)
      Q <= 0;
    else if (J && K)
      Q <= ~Q;
  end
  initial begin
    assign QBar = ~Q;
  end
endmodule