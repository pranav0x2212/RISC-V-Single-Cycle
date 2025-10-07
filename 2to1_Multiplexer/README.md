# 2:1 Multiplexer

Design a 8-bit parameterized 2:1 Multiplexer.

### Module Specification

```SystemVerilog
module mux2 #(parameter WIDTH = 8)(
    input  logic [WIDTH-1:0] d0,   // Input 0
    input  logic [WIDTH-1:0] d1,   // Input 1
    input  logic              s,   // Select line
    output logic [WIDTH-1:0]  y    // Output
    );
```