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

### Fixed Interface

> [!IMPORTANT]
> The module name, port list, and port widths shown above are a fixed contract for this course. Do not rename the module, rename/reorder/add/remove ports, or change port widths.