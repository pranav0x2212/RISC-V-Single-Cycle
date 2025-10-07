# RISC-V Single-Cycle Wrapper

This module wraps together the controller and datapath to form a complete single-cycle RISC-V processor.

### Module Specification

```SystemVerilog
module riscvsingle(
    input  logic        clk,       // Clock
    input  logic        reset,     // Asynchronous reset
    output logic [31:0] PC,        // Program counter
    input  logic [31:0] Instr,     // Current instruction
    output logic        MemWrite,  // Data memory write enable
    output logic [31:0] ALUResult, // Result from ALU
    output logic [31:0] WriteData, // Data to write to memory
    input  logic [31:0] ReadData   // Data read from memory
);
```

>[!TIP]
>Think what could "wrap" mean here :D