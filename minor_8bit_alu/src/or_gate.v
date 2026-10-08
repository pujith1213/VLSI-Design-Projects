// ============================================================
// Module: 8-bit OR
// Description:
// Performs bitwise OR operation on two 8-bit inputs.
// ============================================================

module or_8bit (
    input  [7:0] A,
    input  [7:0] B,
    output [7:0] result
);

    // Bitwise OR operation
    assign result = A | B;

endmodule