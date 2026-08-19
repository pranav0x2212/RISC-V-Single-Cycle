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

- Addressing is **byte-addressable CPU addressing**: `a` is a byte address.
- Memory stores **32-bit words** and contains **64 words**.
- For aligned accesses, the word index is `a / 4`.
- Initialize memory using a `.txt` file.
- Reads are **combinational**.

### Fixed Interface

> [!IMPORTANT]
> The module name, port list, and port widths shown above are a fixed contract for this course. Do not rename the module, rename/reorder/add/remove ports, or change port widths.
