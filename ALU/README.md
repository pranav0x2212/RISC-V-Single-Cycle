# ALU

Design a 32-bit Arithmetic Logic Unit (ALU) supporting basic operations.

### Module Specifications

```SystemVerilog
module alu(
    input  logic [31:0] a, b,          // operands
    input  logic [2:0]  alucontrol,    // operation selector
    output logic [31:0] result         // operation result
);
```

### ALU Control Table

|alucontrol|Operation|
|---|---|
|000|Add|
|001|Subtract|
|010|AND|
|011|OR|
|101|Set Less Than (SLT)|

### Interface

> [!IMPORTANT]
> Your module, port and parameter names are up to you. Your design must have the same number of ports, with the same directions and widths, as shown above, and must follow the `alucontrol` encodings in the table above. Map your names to this spec in `rnr-stage.yaml` (see the assignment handout).