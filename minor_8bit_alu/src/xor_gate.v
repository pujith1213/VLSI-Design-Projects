// ============================================================
// Module: 8-bit XOR
// Description:
// Performs bitwise XOR operation on two 8-bit inputs.
// ============================================================

module xor_8bit (
    input  [7:0] A,
    input  [7:0] B,
    output [7:0] result
);

    // Bitwise XOR operation
    assign result = A ^ B;

endmodule
