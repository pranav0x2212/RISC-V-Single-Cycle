# Datapath

Design the datapath module for a single-cycle RISC-V processor. This module integrates various submodules to implement instruction execution.

### Module Specification

```SystemVerilog
module datapath(
    input  logic        clk,
    input  logic        reset,
    input  logic [1:0]  ResultSrc,
    input  logic        PCSrc,
    input  logic        ALUSrc,
    input  logic        RegWrite,
    input  logic [1:0]  ImmSrc,
    input  logic [2:0]  ALUControl,
    output logic        Zero,
    output logic [31:0] PC,
    input  logic [31:0] Instr,
    output logic [31:0] ALUResult,
    output logic [31:0] WriteData,
    input  logic [31:0] ReadData
);
```

### Guidelines

- The datapath should handle **instruction fetch, decode, execution, memory access, and write-back**.    
- Integrate the submodules **without modifying their interfaces**.
- All mux selections, register file writes, and ALU operations should follow the **control signals** provided.
- Ensure **combinational outputs and sequential registers** are used correctly (e.g., PC update).
- Do **not change widths or naming** of input/output signals.