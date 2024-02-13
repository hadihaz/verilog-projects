module ArithmeticCircuit4Bit (D,Cout,A,B,Cin,S0,S1);
    input [3:0] A, B;
    input Cin, S0, S1;
    output [3:0] D;
    output Cout;
    wire [3:0] nB ,Y, C;

    TwoComplementCalculator tcc(.Aout(nB),.A(B),.cin(0),.E(1));

    MUX4_1 mux0 (.Y(Y[0]),.i0(B[0]),.i1(nB[0]),.i2(0),.i3(1),.S0(S0),.S1(S1));
    MUX4_1 mux1 (.Y(Y[1]),.i0(B[1]),.i1(nB[1]),.i2(0),.i3(1),.S0(S0),.S1(S1));
    MUX4_1 mux2 (.Y(Y[2]),.i0(B[2]),.i1(nB[2]),.i2(0),.i3(1),.S0(S0),.S1(S1));
    MUX4_1 mux3 (.Y(Y[3]),.i0(B[3]),.i1(nB[3]),.i2(0),.i3(1),.S0(S0),.S1(S1));

    FA FA0 (.D(D[0]),.Cout(C[1]),.X(A[0]),.Y(Y[0]),.Cin(Cin));
    FA FA1 (.D(D[1]),.Cout(C[2]),.X(A[1]),.Y(Y[1]),.Cin(C[1]));
    FA FA2 (.D(D[2]),.Cout(C[3]),.X(A[2]),.Y(Y[2]),.Cin(C[2]));
    FA FA3 (.D(D[3]),.Cout(Cout),.X(A[3]),.Y(Y[3]),.Cin(C[3]));
endmodule


module TwoComplementCalculator(Aout, A, cin, E);

  input  [3:0] A;
  input  cin, E;
  output [3:0] Aout;
  wire y0,y1,y2,y3,c0,c1,c2;

  assign y0 = E & cin;
  assign Aout[0] = A[0] ^ y0;

  assign c0=A[0] | cin;
  assign y1 = E & c0;
  assign Aout[1] = A[1] ^ y1;

  assign c1=A[1] | c0;
  assign y2= E & c1;
  assign Aout[2] = A[2] ^ y2;

  assign c2=A[2] | c1;
  assign y3 = E & c2;
  assign Aout[3] = A[3] ^ y3;

endmodule

module MUX4_1(Y,i0,i1,i2,i3,S0,S1);
    input i0,i1,i2,i3,S0,S1;
    output Y;
    reg Y;
    always @(i0 or i1 or i2 or i3 or S0 or S1) begin
        case ({S1,S0})
            2'b00 :Y =i0;
            2'b01 :Y =i1;
            2'b10 :Y =i2;
            2'b11 :Y =i3;
        endcase
    end
endmodule

module FA(D,Cout,X,Y,Cin);
    input  X,Y,Cin;
    output D,Cout;
    assign {Cout,D}=X+Y+Cin;
endmodule