# ALU Decoder

Design the ALU Control Unit that generates the ALU operation signals based on instruction fields and `ALUOp`.

### Module Specification

```SystemVerilog
module aludec(
    input  logic        opb5,      // instruction bit [5] of opcode
    input  logic [2:0]  funct3,    // funct3 field of instruction
    input  logic        funct7b5,  // bit 5 of funct7 field
    input  logic [1:0]  ALUOp,     // high-level ALU operation
    output logic [2:0]  ALUControl // ALU operation code
);
```

### Working

- Determines the **ALU operation** (`ALUControl`) based on the instruction fields and `ALUOp`.
- Supports **R-type, I-type arithmetic, and branch instructions**.
- Must correctly differentiate between **add/subtract** for R-type instructions.

### ALUControl Mapping (Locked Baseline ISA)

The table below defines the required `ALUControl` value for every baseline instruction that reaches the ALU:

| Instruction | ALUControl |
|---|---|
| ADD, ADDI, LW, SW | 000 |
| SUB, BEQ | 001 |
| AND, ANDI | 010 |
| OR, ORI | 011 |
| SLT, SLTI | 101 |

### Fixed Interface

> [!IMPORTANT]
> The module name, port list, and port widths shown above are a fixed contract for this course. Do not rename the module, rename/reorder/add/remove ports, or change port widths.