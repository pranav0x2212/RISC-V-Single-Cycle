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

### Interface

> [!IMPORTANT]
> Your module, port and parameter names are up to you. Your design must have the same number of ports, with the same directions and widths, as shown above, and must behave as specified. Map your names to this spec in `rnr-stage.yaml` (see the assignment handout).
