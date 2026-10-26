# 32-bit Adder

Design a 32-bit adder.

### Module Specification

```SystemVerilog
module adder(
    input  logic [31:0] a,  // Operand A
    input  logic [31:0] b,  // Operand B
    output logic [31:0] y   // Sum output
);
```

> [!NOTE]
> There's no need to implement carry-in/carry-out signals!

### Interface

> [!IMPORTANT]
> Your module, port and parameter names are up to you. Your design must have the same number of ports, with the same directions and widths, as shown above, and must behave as specified. Map your names to this spec in `rnr-stage.yaml` (see the assignment handout).