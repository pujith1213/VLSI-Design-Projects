# VLSI Design Projects

This repository contains two Verilog HDL projects completed as part of the VLSI Design project work.

## Projects

### 1. Minor Project - 8-Bit ALU

The 8-bit Arithmetic Logic Unit performs eight operations using two 8-bit inputs and a 3-bit select signal.

Operations implemented:

- Addition
- Subtraction
- AND
- OR
- XOR
- NOT
- Left Shift
- Right Shift

The ALU also provides:

- Carry-out flag
- Zero flag

### ALU Verification

The testbench contains 3 test vectors for each operation, giving a total of 24 test vectors.

Simulation was verified using Questa.

The design was synthesized using Vivado for:

`xc7a12tcpg238-1`

Resource utilization:

- Slice LUTs: 40
- F7 Muxes: 8
- Slice Registers: 0
- Block RAM: 0
- DSPs: 0

Maximum combinational propagation delay:

`8.464 ns`

---

### 2. Major Project - RISC Processor

A simplified single-cycle RISC processor was designed using Verilog HDL.

The processor uses:

- 16-bit instruction format
- 8-bit datapath
- 8 general-purpose registers
- Program Counter
- Instruction Memory
- Register File
- ALU
- Control Unit
- Data Memory

### Supported Instructions

- ADD
- SUB
- AND
- OR
- LOAD
- STORE

### Test Program

The processor was tested with the following instruction sequence:

1. LOAD R1, [R0 + 0]
2. LOAD R2, [R0 + 1]
3. ADD R3, R1, R2
4. SUB R4, R1, R2
5. AND R5, R1, R2
6. OR R6, R1, R2
7. STORE R3, [R0 + 2]

Expected and simulated results:

- R1 = 10
- R2 = 5
- R3 = 15
- R4 = 5
- R5 = 0
- R6 = 15
- Memory[2] = 15

The complete simulation finished with:

`TEST PASSED`

### Timing Analysis

A 10 ns clock period was used for timing analysis.

Vivado timing results:

- WNS = 7.524 ns
- TNS = 0.000 ns
- WHS = 0.140 ns
- THS = 0.000 ns

All specified timing constraints were met.

---

## Tools Used

- Verilog HDL
- Questa Altera Starter FPGA Edition
- AMD Vivado 2026.1
- Visual Studio Code
- Git and GitHub

## Repository Structure

```text
VLSI_Design_Projects/
│
├── docs/
│
├── minor_8bit_alu/
│   ├── src/
│   ├── tb/
│   └── simulation/
│
├── major_risc_processor/
│   ├── src/
│   ├── tb/
│   └── simulation/
│
├── .gitignore
└── README.md