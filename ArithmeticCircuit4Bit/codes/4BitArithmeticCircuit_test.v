module ArithmeticCircuit4Bit_test;
reg [3:0] A, B;
reg Cin,S0,S1;
wire [3:0] D;
wire Cout;

ArithmeticCircuit4Bit AC4 (D,Cout,A,B,Cin,S0,S1);
initial begin
 
    A=4'b0101;
    B=4'b0010;

    // D = A + B
    //#100;
    S1=0; S0=0; Cin=0;

    // D = A + B + 1 
    #100;
    S1=0; S0=0; Cin=1;

    // D = A + B'
    #100;
    S1=0; S0=1; Cin=0;

    // D = A + B' + 1
    #100;
    S1=0; S0=1; Cin=1;

    // D = A 
    #100;
    S1=1; S0=0; Cin=0;

    // D = A + 1
    #100;
    S1=1; S0=0; Cin=1;

    // D = A - 1
    #100;
    S1=1; S0=1; Cin=0;

    // D = A 
    #100;
    S1=1; S0=1; Cin=1;

    #100; $finish;
    
end
endmodule