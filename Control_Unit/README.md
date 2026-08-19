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

### PC Source Selection

- `PCSrc` selects the next `PC` value between **PC+4** and the **branch/jump target address**.
- `PCSrc = Jump | (Branch & Zero)`, where `Jump` and `Branch` are the corresponding flags produced by the Main Decoder instantiated internally within this module for the current instruction.
- `Jump` is asserted for **JAL**.
- `Branch` is asserted for **BEQ**.
- `Zero` is the datapath's ALU-result-zero indication, used to determine whether a **BEQ** branch is taken.

### Fixed Interface

> [!IMPORTANT]
> The module name, port list, and port widths shown above are a fixed contract for this course. Do not rename the module, rename/reorder/add/remove ports, or change port widths.