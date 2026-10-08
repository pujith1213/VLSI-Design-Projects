// ============================================================
// Module: 8-bit ALU Top Module
// Description:
// Combines all individual ALU operation modules.
// A 3-bit SEL input selects one of eight operations.
// ============================================================

module alu_top (
    input  [7:0] A,
    input  [7:0] B,
    input  [2:0] SEL,
    output reg [7:0] result,
    output reg       carry_out,
    output           zero_flag
);

    // Internal wires for individual module outputs
    wire [7:0] add_result;
    wire [7:0] sub_result;
    wire [7:0] and_result;
    wire [7:0] or_result;
    wire [7:0] xor_result;
    wire [7:0] not_result;
    wire [7:0] left_shift_result;
    wire [7:0] right_shift_result;

    wire add_carry;
    wire sub_borrow;

    // --------------------------------------------------------
    // Instantiate individual operation modules
    // --------------------------------------------------------

    adder_8bit ADDER (
        .A(A),
        .B(B),
        .result(add_result),
        .carry_out(add_carry)
    );

    subtractor_8bit SUBTRACTOR (
        .A(A),
        .B(B),
        .result(sub_result),
        .borrow_out(sub_borrow)
    );

    and_8bit AND_UNIT (
        .A(A),
        .B(B),
        .result(and_result)
    );

    or_8bit OR_UNIT (
        .A(A),
        .B(B),
        .result(or_result)
    );

    xor_8bit XOR_UNIT (
        .A(A),
        .B(B),
        .result(xor_result)
    );

    not_8bit NOT_UNIT (
        .A(A),
        .result(not_result)
    );

    shifter_8bit SHIFTER (
        .A(A),
        .left_shift(left_shift_result),
        .right_shift(right_shift_result)
    );

    // --------------------------------------------------------
    // Operation selection using SEL
    // --------------------------------------------------------

    always @(*) begin

        // Default values
        result = 8'b00000000;
        carry_out = 1'b0;

        case (SEL)

            3'b000: begin
                // Addition
                result = add_result;
                carry_out = add_carry;
            end

            3'b001: begin
                // Subtraction
                result = sub_result;
                carry_out = sub_borrow;
            end

            3'b010: begin
                // AND
                result = and_result;
            end

            3'b011: begin
                // OR
                result = or_result;
            end

            3'b100: begin
                // XOR
                result = xor_result;
            end

            3'b101: begin
                // NOT A
                result = not_result;
            end

            3'b110: begin
                // Left Shift
                result = left_shift_result;
            end

            3'b111: begin
                // Right Shift
                result = right_shift_result;
            end

        endcase
    end

    // Zero flag becomes 1 whenever the ALU result is zero
    assign zero_flag = (result == 8'b00000000);

endmodule