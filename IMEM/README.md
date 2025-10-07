# Instruction Memory (IMEM)

Implement the Instruction Memory for the single-cycle RISC-V processor.

### Module Specification

```SystemVerilog
module imem(
    input  logic [31:0] a,   // Address
    output logic [31:0] rd   // Instruction
);
```

### Guidelines

- Memory should be **word-addressable**.
- Initialize memory using a `.txt` file.
- Reads are **combinational**.
- Memory size: 64 words (32-bit each).
