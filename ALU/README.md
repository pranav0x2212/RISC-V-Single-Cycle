# ALU

Design a 32-bit Arithmetic Logic Unit (ALU) with 16 operations, including the branch comparisons.

### Module Specification

```SystemVerilog
module alu #(parameter int DATA_WIDTH = 32)(
    input  logic [4:0]            alu_control,
    input  logic [DATA_WIDTH-1:0] rs1_data,
    input  logic [DATA_WIDTH-1:0] rs2_data,
    output logic [DATA_WIDTH-1:0] alu_out,
    output logic                  zero          // branch condition true
);
```

### ALU Control Table

| alu_control | Operation | Result |
|---|---|---|
| `00000` | ADD | `alu_out = rs1 + rs2` |
| `00001` | SUB | `rs1 - rs2` |
| `00010` | XOR | `rs1 ^ rs2` |
| `00011` | OR | `rs1 \| rs2` |
| `00100` | AND | `rs1 & rs2` |
| `00101` | SLL | `rs1 << rs2[4:0]` |
| `00110` | SRL | `rs1 >> rs2[4:0]` (logical) |
| `00111` | SRA | `rs1 >>> rs2[4:0]` (arithmetic) |
| `01000` | SLT | `1` if `rs1 < rs2` signed, else `0` |
| `01001` | SLTU | `1` if `rs1 < rs2` unsigned, else `0` |
| `01010` | BEQ | `zero = (rs1 == rs2)` |
| `01011` | BNE | `zero = (rs1 != rs2)` |
| `01100` | BLT | `zero = (rs1 < rs2)` signed |
| `01101` | BGE | `zero = (rs1 >= rs2)` signed |
| `01110` | BLTU | `zero = (rs1 < rs2)` unsigned |
| `01111` | BGEU | `zero = (rs1 >= rs2)` unsigned |
| `1xxxx` | unused | `alu_out = 0`, `zero = 0` |

For the six branch codes (`01010`-`01111`) `alu_out` is 0 and only `zero` is set. For every other code `zero` is 0.

### Interface

> [!IMPORTANT]
> Your module, port and parameter names are up to you. Your design must have the same number of ports, with the same directions and widths, as shown above, and must behave as specified. Map your names to this spec in `rnr-stage.yaml` (see the assignment handout).
