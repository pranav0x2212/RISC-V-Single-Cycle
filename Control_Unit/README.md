# Control Unit

Design the Processor Control Unit that coordinates all datapath operations for a single-cycle RISC-V processor.

### Module Specification

```SystemVerilog
module controller(
    input  logic [6:0]  op,         // opcode field of instruction
    input  logic [2:0]  funct3,     // funct3 field
    input  logic        funct7b5,   // bit 5 of funct7 field
    input  logic        Zero,       // Zero flag from ALU
    output logic [1:0]  ResultSrc,  // selects data to write to register
    output logic        MemWrite,   // memory write enable
    output logic        PCSrc,      // controls PC update
    output logic        ALUSrc,     // ALU input select
    output logic        RegWrite,   // register write enable
    output logic        Jump,       // jump signal
    output logic [1:0]  ImmSrc,     // immediate generator select
    output logic [2:0]  ALUControl  // ALU operation code
);
```

### Behavior

- Generates all **control signals** required by the datapath.
- Uses **Main Decoder** and **ALU Decoder** to determine the correct signal values.    
- Combines instruction fields and ALU results (e.g., `Zero`) to produce control outputs.
- Must handle **arithmetic, memory, branch, and jump instructions** correctly.