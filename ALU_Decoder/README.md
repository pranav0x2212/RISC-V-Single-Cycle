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

### Interface

> [!IMPORTANT]
> Your module, port and parameter names are up to you. Your design must have the same number of ports, with the same directions and widths, as shown above, and must behave as specified. Map your names to this spec in `rnr-stage.yaml` (see the assignment handout).