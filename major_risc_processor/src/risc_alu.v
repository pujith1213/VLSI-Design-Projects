// ============================================================
// Module: RISC Processor ALU
// Description:
// Performs ADD, SUB, AND and OR operations.
// ============================================================

module risc_alu (
    input  [7:0] A,
    input  [7:0] B,
    input  [1:0] ALUOp,
    output reg [7:0] result
);

    always @(*) begin
        case (ALUOp)

            2'b00: result = A + B;   // ADD

            2'b01: result = A - B;   // SUB

            2'b10: result = A & B;   // AND

            2'b11: result = A | B;   // OR

            default: result = 8'b00000000;

        endcase
    end

endmodule