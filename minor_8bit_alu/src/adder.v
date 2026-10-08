// ============================================================
// Module: 8-bit Adder
// Description:
// Adds two 8-bit input values A and B.
// Produces an 8-bit result and a carry-out bit.
// ============================================================

module adder_8bit (
    input  [7:0] A,
    input  [7:0] B,
    output [7:0] result,
    output       carry_out
);

    // 9-bit addition is used so the extra bit becomes carry_out
    assign {carry_out, result} = A + B;

endmodule