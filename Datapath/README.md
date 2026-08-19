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

### PC Update and Branch/Jump Target

- The next value of `PC` is selected using `PCSrc` between **PC+4** and the **PC-relative branch/jump target**.
- The target address is computed as: `PC + (ImmExt << 1)`.
- **B-type** immediates (`ImmExt`) are used for **BEQ** targets; **J-type** immediates are used for **JAL** targets.
- `Zero` is asserted when the ALU result is zero.
- For **JAL**, `PC+4` is written to `rd` through the `ResultSrc` write-back mux.

### Fixed Interface

> [!IMPORTANT]
> The module name, port list, and port widths shown above are a fixed contract for this course. Do not rename the module, rename/reorder/add/remove ports, or change port widths.