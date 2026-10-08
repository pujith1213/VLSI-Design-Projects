// ============================================================
// Module: RISC Processor Top Level
// Description:
// Connects Program Counter, Instruction Memory,
// Control Unit, Register File, ALU and Data Memory.
// ============================================================

module risc_top (
    input clk,
    input reset,

    output [7:0]  pc_out,
    output [15:0] instruction_out
);

    // --------------------------------------------------------
    // Internal wires
    // --------------------------------------------------------

    wire [7:0] pc;
    wire [15:0] instruction;

    wire [3:0] opcode;
    wire [2:0] rd;
    wire [2:0] rs1;
    wire [2:0] rs2;

    wire [5:0] immediate;
    wire [7:0] immediate_ext;

    wire RegWrite;
    wire MemRead;
    wire MemWrite;
    wire ALUSrc;
    wire MemtoReg;
    wire [1:0] ALUOp;

    wire [2:0] read_addr2;

    wire [7:0] read_data1;
    wire [7:0] read_data2;

    wire [7:0] alu_input2;
    wire [7:0] alu_result;

    wire [7:0] memory_read_data;
    wire [7:0] write_back_data;


    // --------------------------------------------------------
    // Decode instruction fields
    // --------------------------------------------------------

    assign opcode    = instruction[15:12];
    assign rd        = instruction[11:9];
    assign rs1       = instruction[8:6];
    assign rs2       = instruction[5:3];
    assign immediate = instruction[5:0];


    // Sign extend 6-bit immediate to 8 bits
    assign immediate_ext = {{2{immediate[5]}}, immediate};


    // For STORE:
    // instruction[11:9] contains the register whose data
    // must be stored into memory.
    //
    // For other instructions:
    // read second source register from Rs2.
    assign read_addr2 =
        (opcode == 4'b0101) ? rd : rs2;


    // Select ALU second input
    assign alu_input2 =
        ALUSrc ? immediate_ext : read_data2;


    // Select data written back to register file
    assign write_back_data =
        MemtoReg ? memory_read_data : alu_result;


    // Outputs used for simulation/debugging
    assign pc_out          = pc;
    assign instruction_out = instruction;


    // --------------------------------------------------------
    // Program Counter
    // --------------------------------------------------------

    program_counter PC (
        .clk(clk),
        .reset(reset),
        .pc(pc)
    );


    // --------------------------------------------------------
    // Instruction Memory
    // --------------------------------------------------------

    instruction_memory IMEM (
        .address(pc),
        .instruction(instruction)
    );


    // --------------------------------------------------------
    // Control Unit
    // --------------------------------------------------------

    control_unit CONTROL (
        .opcode(opcode),
        .RegWrite(RegWrite),
        .MemRead(MemRead),
        .MemWrite(MemWrite),
        .ALUSrc(ALUSrc),
        .MemtoReg(MemtoReg),
        .ALUOp(ALUOp)
    );


    // --------------------------------------------------------
    // Register File
    // --------------------------------------------------------

    register_file REGFILE (
        .clk(clk),
        .reset(reset),
        .RegWrite(RegWrite),
        .rs1(rs1),
        .rs2(read_addr2),
        .rd(rd),
        .write_data(write_back_data),
        .read_data1(read_data1),
        .read_data2(read_data2)
    );


    // --------------------------------------------------------
    // ALU
    // --------------------------------------------------------

    risc_alu ALU (
        .A(read_data1),
        .B(alu_input2),
        .ALUOp(ALUOp),
        .result(alu_result)
    );


    // --------------------------------------------------------
    // Data Memory
    // --------------------------------------------------------

    data_memory DMEM (
        .clk(clk),
        .MemRead(MemRead),
        .MemWrite(MemWrite),
        .address(alu_result),
        .write_data(read_data2),
        .read_data(memory_read_data)
    );


endmodule