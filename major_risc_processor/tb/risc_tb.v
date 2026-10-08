// ============================================================
// Testbench: RISC Processor
// Description:
// Tests LOAD, STORE, ADD, SUB, AND and OR instructions.
// ============================================================

`timescale 1ns / 1ps

module risc_tb;

    reg clk;
    reg reset;

    wire [7:0]  pc_out;
    wire [15:0] instruction_out;


    // --------------------------------------------------------
    // Instantiate RISC Processor
    // --------------------------------------------------------

    risc_top DUT (
        .clk(clk),
        .reset(reset),
        .pc_out(pc_out),
        .instruction_out(instruction_out)
    );


    // --------------------------------------------------------
    // Clock generation
    // 10 ns clock period
    // --------------------------------------------------------

    initial begin
        clk = 1'b0;

        forever #5 clk = ~clk;
    end


    // --------------------------------------------------------
    // Test Program
    // --------------------------------------------------------

    initial begin

        reset = 1'b1;


        // ====================================================
        // Initialize Data Memory
        // ====================================================

        // Memory[0] = 10
        DUT.DMEM.memory[0] = 8'd10;

        // Memory[1] = 5
        DUT.DMEM.memory[1] = 8'd5;


        // ====================================================
        // Load Instructions into Instruction Memory
        // ====================================================

        // Address 0:
        // LOAD R1, [R0 + 0]
        // R1 = Memory[0] = 10
        DUT.IMEM.memory[0] = 16'h4200;


        // Address 1:
        // LOAD R2, [R0 + 1]
        // R2 = Memory[1] = 5
        DUT.IMEM.memory[1] = 16'h4401;


        // Address 2:
        // ADD R3, R1, R2
        // R3 = 10 + 5 = 15
        DUT.IMEM.memory[2] = 16'h0650;


        // Address 3:
        // SUB R4, R1, R2
        // R4 = 10 - 5 = 5
        DUT.IMEM.memory[3] = 16'h1850;


        // Address 4:
        // AND R5, R1, R2
        // R5 = 10 AND 5 = 0
        DUT.IMEM.memory[4] = 16'h2A50;


        // Address 5:
        // OR R6, R1, R2
        // R6 = 10 OR 5 = 15
        DUT.IMEM.memory[5] = 16'h3C50;


        // Address 6:
        // STORE R3, [R0 + 2]
        // Memory[2] = R3 = 15
        DUT.IMEM.memory[6] = 16'h5602;


        // Address 7:
        // Unused instruction / no operation
        DUT.IMEM.memory[7] = 16'hF000;


        // Keep reset active for first clock edge
        #12;

        reset = 1'b0;


        // Allow all instructions to execute
        #68;


        // ====================================================
        // Display Final Results
        // ====================================================

        $display("------------------------------------");
        $display("RISC PROCESSOR TEST RESULTS");
        $display("------------------------------------");

        $display("R1 = %d  Expected = 10",
                 DUT.REGFILE.registers[1]);

        $display("R2 = %d  Expected = 5",
                 DUT.REGFILE.registers[2]);

        $display("R3 = %d  Expected = 15",
                 DUT.REGFILE.registers[3]);

        $display("R4 = %d  Expected = 5",
                 DUT.REGFILE.registers[4]);

        $display("R5 = %d  Expected = 0",
                 DUT.REGFILE.registers[5]);

        $display("R6 = %d  Expected = 15",
                 DUT.REGFILE.registers[6]);

        $display("Memory[2] = %d  Expected = 15",
                 DUT.DMEM.memory[2]);

        $display("------------------------------------");


        // ====================================================
        // Automatic Check
        // ====================================================

        if (
            DUT.REGFILE.registers[1] == 8'd10 &&
            DUT.REGFILE.registers[2] == 8'd5  &&
            DUT.REGFILE.registers[3] == 8'd15 &&
            DUT.REGFILE.registers[4] == 8'd5  &&
            DUT.REGFILE.registers[5] == 8'd0  &&
            DUT.REGFILE.registers[6] == 8'd15 &&
            DUT.DMEM.memory[2]        == 8'd15
        )
            $display("TEST PASSED");
        else
            $display("TEST FAILED");


        #10;

        $finish;

    end

endmodule