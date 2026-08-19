# 2:1 Multiplexer

Design an 8-bit parameterized 2:1 Multiplexer.

### Module Specification

```SystemVerilog
module mux2 #(parameter WIDTH = 8)(
    input  logic [WIDTH-1:0] d0,   // Input 0
    input  logic [WIDTH-1:0] d1,   // Input 1
    input  logic              s,   // Select line
    output logic [WIDTH-1:0]  y    // Output
    );
```

### Fixed Interface

> [!IMPORTANT]
> The module name, port list, and port widths shown above are a fixed contract for this course. Do not rename the module, rename/reorder/add/remove ports, or change port widths.