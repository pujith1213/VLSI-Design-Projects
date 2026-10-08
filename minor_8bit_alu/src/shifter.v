// ============================================================
// Module: 8-bit Shifter
// Description:
// Performs logical left shift and logical right shift
// on the 8-bit input A.
// ============================================================

module shifter_8bit (
    input  [7:0] A,
    output [7:0] left_shift,
    output [7:0] right_shift
);

    // Shift input A one bit to the left
    assign left_shift = A << 1;

    // Shift input A one bit to the right
    assign right_shift = A >> 1;

endmodule