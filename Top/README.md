# Top Module

This module integrates the **RISC-V single-cycle processor** to form a fully functional system.

### Module Specification

```SystemVerilog
module top(
    input  logic        clk,       // Clock
    input  logic        reset,     // Asynchronous reset
    output logic [31:0] WriteData, // Data to write to memory
    output logic [31:0] DataAdr,   // Address for memory operations
    output logic        MemWrite    // Data memory write enable
);
```

> [!TIP]  
> Acts as the **top-level system** for simulation and verification.
> Think of this as the “glue” that ties the processor and memories together.

### Interface

> [!IMPORTANT]
> Your module, port and parameter names are up to you. Your design must have the same number of ports, with the same directions and widths, as shown above, and must behave as specified. Map your names to this spec in `rnr-stage.yaml` (see the assignment handout).