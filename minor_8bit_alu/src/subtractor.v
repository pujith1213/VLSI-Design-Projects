// ============================================================
// Module: 8-bit Subtractor
// Description:
// Subtracts 8-bit input B from 8-bit input A.
// Produces an 8-bit result and a borrow-out bit.
// ============================================================

module subtractor_8bit (
    input  [7:0] A,
    input  [7:0] B,
    output [7:0] result,
    output       borrow_out
);

    // Perform subtraction: A - B
    assign result = A - B;

    // Borrow occurs when A is smaller than B
    assign borrow_out = (A < B);

endmodule