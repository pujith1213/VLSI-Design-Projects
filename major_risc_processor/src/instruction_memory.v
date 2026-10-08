// ============================================================
// Module: Instruction Memory
// Description:
// Stores 16-bit instructions for the RISC processor.
// The Program Counter gives the address of the instruction.
// ============================================================

module instruction_memory (
    input  [7:0]  address,
    output [15:0] instruction
);

    // 256 locations, each instruction is 16 bits
    reg [15:0] memory [0:255];

    // Read instruction using the address from the PC
    assign instruction = memory[address];

endmodule