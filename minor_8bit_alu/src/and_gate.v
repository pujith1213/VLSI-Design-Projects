// ============================================================
// Module: 8-bit AND
// Description:
// Performs bitwise AND operation on two 8-bit inputs.
// ============================================================

module and_8bit (
    input  [7:0] A,
    input  [7:0] B,
    output [7:0] result
);

    // Bitwise AND operation
    assign result = A & B;

endmodule