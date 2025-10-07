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

### Hint for Contributors

>[!TIP]
>We have the following instruction types: `R-Type`, `I-Type`, `Load`, `Store`, `B-Type`, `Jump`.
> Think about which control signals are relevant for each type of instruction:       

Contributors should reason about the signal values for each instruction type instead of hardcoding them from external sources.