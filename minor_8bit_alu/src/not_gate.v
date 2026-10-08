// ============================================================
// Module: 8-bit NOT
// Description:
// Performs bitwise NOT operation on 8-bit input A.
// ============================================================

module not_8bit (
    input  [7:0] A,
    output [7:0] result
);

    // Bitwise NOT operation
    assign result = ~A;

endmodule