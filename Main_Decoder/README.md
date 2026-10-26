# Main Decoder

The Main Decoder generates control signals for the processor's ID stage based on the instruction opcode. This module determines which operations the datapath and ALU should perform for each instruction type.

### Module Specification

```SystemVerilog
module maindec(
    input  logic [6:0] op,        // Opcode of the instruction
    output logic [1:0] ResultSrc, // Selects ALU, memory, or PC+4 for writeback
    output logic       MemWrite,   // Enable writing to data memory
    output logic       Branch,     // Branch instruction flag
    output logic       ALUSrc,     // ALU source select (register vs immediate)
    output logic       RegWrite,   // Enable writing to register file
    output logic       Jump,       // Jump instruction flag
    output logic [1:0] ImmSrc,     // Immediate type selector
    output logic [1:0] ALUOp      // ALU operation selector
);
```

### Baseline Behavior (Locked ISA)

- `Branch` is asserted for **BEQ**.
- `Jump` is asserted for **JAL**.
- The baseline processor supports exactly **BEQ** for branch instructions and **JAL** for jump instructions. No other RV32I branch or jump instructions (e.g. BNE, BLT, JALR) are supported.

### Control Signal Table (Locked Baseline ISA)

The table below gives the required control-signal values for each baseline instruction category. "Don't care" means the datapath does not use that signal's value for the given category.

`ResultSrc` encoding: `00` = ALU result, `01` = memory read data, `10` = PC+4.
`ImmSrc` encoding (per Sign_Extender): `00` = I-type, `01` = S-type, `10` = B-type, `11` = J-type.
`ALUOp` encoding: `00` = always add (memory address calculation), `01` = always subtract (branch comparison), `10` = determined by `funct3`/`funct7b5` (see ALU_Decoder).

| Category | ResultSrc | MemWrite | Branch | ALUSrc | RegWrite | Jump | ImmSrc | ALUOp |
|---|---|---|---|---|---|---|---|---|
| R-type | 00 | 0 | 0 | 0 | 1 | 0 | Don't care | 10 |
| I-type ALU | 00 | 0 | 0 | 1 | 1 | 0 | 00 | 10 |
| LW | 01 | 0 | 0 | 1 | 1 | 0 | 00 | 00 |
| SW | Don't care | 1 | 0 | 1 | 0 | 0 | 01 | 00 |
| BEQ | Don't care | 0 | 1 | 0 | 0 | 0 | 10 | 01 |
| JAL | 10 | 0 | 0 | Don't care | 1 | 1 | 11 | Don't care |

### Hint for Students

>[!TIP]
>We have the following instruction types: `R-Type`, `I-Type`, `Load`, `Store`, `B-Type`, `Jump`.
> Think about which control signals are relevant for each type of instruction:       

Students should reason about the signal values for each instruction type instead of hardcoding them from external sources.

### Interface

> [!IMPORTANT]
> Your module, port and parameter names are up to you. Your design must have the same number of ports, with the same directions and widths, as shown above, and must behave as specified. Map your names to this spec in `rnr-stage.yaml` (see the assignment handout).