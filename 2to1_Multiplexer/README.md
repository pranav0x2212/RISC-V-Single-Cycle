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

### Interface

> [!IMPORTANT]
> Your module, port and parameter names are up to you. Your design must have the same number of ports, with the same directions and widths, as shown above, and must behave as specified. Map your names to this spec in `rnr-stage.yaml` (see the assignment handout).