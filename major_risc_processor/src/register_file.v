// ============================================================
// Module: Register File
// Description:
// 8 general-purpose registers, each 8 bits wide.
// Two registers can be read at the same time.
// One register can be written on the rising clock edge.
// ============================================================

module register_file (
    input        clk,
    input        reset,
    input        RegWrite,

    input  [2:0] rs1,
    input  [2:0] rs2,
    input  [2:0] rd,

    input  [7:0] write_data,

    output [7:0] read_data1,
    output [7:0] read_data2
);

    reg [7:0] registers [0:7];
    integer i;

    // Read two registers
    assign read_data1 = registers[rs1];
    assign read_data2 = registers[rs2];

    // Write / Reset registers
    always @(posedge clk) begin

        if (reset) begin
            for (i = 0; i < 8; i = i + 1)
                registers[i] <= 8'b00000000;
        end

        else if (RegWrite) begin
            registers[rd] <= write_data;
        end

    end

endmodule