// ============================================================
// Module: Data Memory
// Description:
// Stores 8-bit data for LOAD and STORE instructions.
// Contains 256 memory locations.
// ============================================================

module data_memory (
    input        clk,
    input        MemRead,
    input        MemWrite,
    input  [7:0] address,
    input  [7:0] write_data,
    output [7:0] read_data
);

    // 256 locations, each location stores 8 bits
    reg [7:0] memory [0:255];

    // Read from memory
    assign read_data = MemRead ? memory[address] : 8'b00000000;

    // Write to memory
    always @(posedge clk) begin
        if (MemWrite)
            memory[address] <= write_data;
    end

endmodule