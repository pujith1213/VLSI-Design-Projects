// ============================================================
// Testbench: 8-bit ALU
// Description:
// Tests all eight ALU operations using multiple input values.
// Minimum 3 test vectors are used for each operation.
// ============================================================

`timescale 1ns / 1ps

module alu_tb;

    // Inputs to the ALU
    reg [7:0] A;
    reg [7:0] B;
    reg [2:0] SEL;

    // Outputs from the ALU
    wire [7:0] result;
    wire       carry_out;
    wire       zero_flag;

    // Instantiate the ALU top module
    alu_top DUT (
        .A(A),
        .B(B),
        .SEL(SEL),
        .result(result),
        .carry_out(carry_out),
        .zero_flag(zero_flag)
    );

    initial begin

        // ====================================================
        // ADDITION - SEL = 000
        // ====================================================

        // Test 1: 10 + 5 = 15
        A = 8'd10;
        B = 8'd5;
        SEL = 3'b000;
        #10;

        // Test 2: 20 + 15 = 35
        A = 8'd20;
        B = 8'd15;
        SEL = 3'b000;
        #10;

        // Test 3: 255 + 1 = 256
        // 8-bit result = 0, carry_out = 1
        A = 8'hFF;
        B = 8'h01;
        SEL = 3'b000;
        #10;


        // ====================================================
        // SUBTRACTION - SEL = 001
        // ====================================================

        // Test 1: 10 - 5 = 5
        A = 8'd10;
        B = 8'd5;
        SEL = 3'b001;
        #10;

        // Test 2: 20 - 10 = 10
        A = 8'd20;
        B = 8'd10;
        SEL = 3'b001;
        #10;

        // Test 3: 5 - 5 = 0
        // zero_flag should become 1
        A = 8'd5;
        B = 8'd5;
        SEL = 3'b001;
        #10;


        // ====================================================
        // AND - SEL = 010
        // ====================================================

        // Test 1: AA AND CC = 88
        A = 8'hAA;
        B = 8'hCC;
        SEL = 3'b010;
        #10;

        // Test 2: F0 AND 0F = 00
        A = 8'hF0;
        B = 8'h0F;
        SEL = 3'b010;
        #10;

        // Test 3: FF AND 55 = 55
        A = 8'hFF;
        B = 8'h55;
        SEL = 3'b010;
        #10;


        // ====================================================
        // OR - SEL = 011
        // ====================================================

        // Test 1: AA OR CC = EE
        A = 8'hAA;
        B = 8'hCC;
        SEL = 3'b011;
        #10;

        // Test 2: F0 OR 0F = FF
        A = 8'hF0;
        B = 8'h0F;
        SEL = 3'b011;
        #10;

        // Test 3: 00 OR 55 = 55
        A = 8'h00;
        B = 8'h55;
        SEL = 3'b011;
        #10;


        // ====================================================
        // XOR - SEL = 100
        // ====================================================

        // Test 1: AA XOR CC = 66
        A = 8'hAA;
        B = 8'hCC;
        SEL = 3'b100;
        #10;

        // Test 2: FF XOR 0F = F0
        A = 8'hFF;
        B = 8'h0F;
        SEL = 3'b100;
        #10;

        // Test 3: 55 XOR 55 = 00
        A = 8'h55;
        B = 8'h55;
        SEL = 3'b100;
        #10;


        // ====================================================
        // NOT - SEL = 101
        // ====================================================

        // Test 1: NOT AA = 55
        A = 8'hAA;
        B = 8'h00;
        SEL = 3'b101;
        #10;

        // Test 2: NOT 00 = FF
        A = 8'h00;
        B = 8'h00;
        SEL = 3'b101;
        #10;

        // Test 3: NOT FF = 00
        A = 8'hFF;
        B = 8'h00;
        SEL = 3'b101;
        #10;


        // ====================================================
        // LEFT SHIFT - SEL = 110
        // ====================================================

        // Test 1: 05 << 1 = 0A
        A = 8'h05;
        B = 8'h00;
        SEL = 3'b110;
        #10;

        // Test 2: 01 << 1 = 02
        A = 8'h01;
        B = 8'h00;
        SEL = 3'b110;
        #10;

        // Test 3: 12 << 1 = 24
        A = 8'h12;
        B = 8'h00;
        SEL = 3'b110;
        #10;


        // ====================================================
        // RIGHT SHIFT - SEL = 111
        // ====================================================

        // Test 1: 05 >> 1 = 02
        A = 8'h05;
        B = 8'h00;
        SEL = 3'b111;
        #10;

        // Test 2: 10 >> 1 = 08
        A = 8'h10;
        B = 8'h00;
        SEL = 3'b111;
        #10;

        // Test 3: FF >> 1 = 7F
        A = 8'hFF;
        B = 8'h00;
        SEL = 3'b111;
        #10;


        // End simulation
        $finish;

    end

endmodule