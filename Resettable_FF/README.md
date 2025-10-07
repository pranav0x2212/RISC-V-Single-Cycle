# Resettable Flip-Flop

Design a 8-bit parameterized flip-flop with asynchronous reset.

### Module Specification

```SystemVerilog
module flopr #(parameter WIDTH = 8)(
    input  logic [WIDTH-1:0] d,     // Data input
    input  logic              clk,   // Clock
    input  logic              reset, // Asynchronous reset
    output logic [WIDTH-1:0] q      // Data output
);
```

### Working

- Asynchronous reset: sets `q` to `0` when `reset` is high.
- Clocked behavior: updates output `q` with input `d` on the rising edge of `clk`.

> [!TIP] 
> Ensure the reset takes priority over normal data capture in the `always_ff` block.