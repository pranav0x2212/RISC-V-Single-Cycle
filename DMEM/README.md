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

- Addressing is **byte-addressable CPU addressing**: `a` is a byte address.
- Memory stores **32-bit words** and contains **64 words**.
- For aligned accesses, the word index is `a / 4`.
- Writes occur on the **rising edge of `clk`** when `we` (write enable) is high.
- Reads are **combinational**.

### Interface

> [!IMPORTANT]
> Your module, port and parameter names are up to you. Your design must have the same number of ports, with the same directions and widths, as shown above, and must behave as specified. Map your names to this spec in `rnr-stage.yaml` (see the assignment handout).
