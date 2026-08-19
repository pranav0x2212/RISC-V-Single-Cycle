# 3:1 Multiplexer

Design an 8-bit parameterized 3:1 Multiplexer.

### Module Specification

```SystemVerilog
module mux3 #(parameter WIDTH = 8)(
    input  logic [WIDTH-1:0] d0,  // Input 0
    input  logic [WIDTH-1:0] d1,  // Input 1
    input  logic [WIDTH-1:0] d2,  // Input 2
    input  logic [1:0]       s,   // 2-bit Select line
    output logic [WIDTH-1:0] y    // Output
    );
```

### Fixed Interface

> [!IMPORTANT]
> The module name, port list, and port widths shown above are a fixed contract for this course. Do not rename the module, rename/reorder/add/remove ports, or change port widths.