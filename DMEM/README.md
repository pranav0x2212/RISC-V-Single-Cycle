# Data Memory (DMEM)

Implement the Data Memory for the single-cycle RISC-V processor.

### Module Specification

```SystemVerilog
module dmem(
    input  logic        clk,
    input  logic        we,
    input  logic [31:0] a,   // Address
    input  logic [31:0] wd,  // Write data
    output logic [31:0] rd   // Read data
);
```

### Guidelines

- Memory should be **word-addressable**.
- Writes occur on the **rising edge of `clk`** when `we` (write enable) is high.
- Reads can be **combinational**.
- Memory size: 64 words (32-bit each).
