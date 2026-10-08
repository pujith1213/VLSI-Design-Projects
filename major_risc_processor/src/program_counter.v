// ============================================================
// Module: Program Counter
// Description:
// Holds the address of the current instruction.
// Increments by 1 on every clock cycle.
// ============================================================

module program_counter (
    input        clk,
    input        reset,
    output reg [7:0] pc
);

    always @(posedge clk) begin

        if (reset)
            pc <= 8'b00000000;

        else
            pc <= pc + 1'b1;

    end

endmodule