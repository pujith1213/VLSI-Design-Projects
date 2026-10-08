// ============================================================
// Module: Control Unit
// Description:
// Generates control signals based on the 4-bit opcode.
// ============================================================

module control_unit (
    input  [3:0] opcode,

    output reg       RegWrite,
    output reg       MemRead,
    output reg       MemWrite,
    output reg       ALUSrc,
    output reg       MemtoReg,
    output reg [1:0] ALUOp
);

    always @(*) begin

        // Default control values
        RegWrite = 1'b0;
        MemRead  = 1'b0;
        MemWrite = 1'b0;
        ALUSrc   = 1'b0;
        MemtoReg = 1'b0;
        ALUOp    = 2'b00;

        case (opcode)

            // ADD
            4'b0000: begin
                RegWrite = 1'b1;
                ALUOp    = 2'b00;
            end

            // SUB
            4'b0001: begin
                RegWrite = 1'b1;
                ALUOp    = 2'b01;
            end

            // AND
            4'b0010: begin
                RegWrite = 1'b1;
                ALUOp    = 2'b10;
            end

            // OR
            4'b0011: begin
                RegWrite = 1'b1;
                ALUOp    = 2'b11;
            end

            // LOAD
            4'b0100: begin
                RegWrite = 1'b1;
                MemRead  = 1'b1;
                ALUSrc   = 1'b1;
                MemtoReg = 1'b1;
                ALUOp    = 2'b00;
            end

            // STORE
            4'b0101: begin
                MemWrite = 1'b1;
                ALUSrc   = 1'b1;
                ALUOp    = 2'b00;
            end

            default: begin
                RegWrite = 1'b0;
                MemRead  = 1'b0;
                MemWrite = 1'b0;
                ALUSrc   = 1'b0;
                MemtoReg = 1'b0;
                ALUOp    = 2'b00;
            end

        endcase

    end

endmodule