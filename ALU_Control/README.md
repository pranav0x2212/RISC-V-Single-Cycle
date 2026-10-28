# ALU Control

Design the ALU control decoder. It turns the operation class from Main Control, plus the instruction's `fn3` / `fn7_5` / `imm11_5` bits, into the ALU's 5-bit `alu_control` code.

### Module Specification

```SystemVerilog
module alu_control (
    input  logic [2:0] alu_op,        // operation class from main_control
    input  logic [2:0] fn3,
    input  logic [6:0] imm11_5,       // instruction[31:25]: shift qualifier (I-type)
    input  logic       fn7_5,         // instruction[30]: SUB / SRA qualifier (R-type)
    output logic [4:0] control_out
);
```

### Working

| alu_op | Class | control_out |
|---|---|---|
| `000` | R-type | by `fn3`: `000` ADD (SUB if `fn7_5`), `001` SLL, `010` SLT, `011` SLTU, `100` XOR, `101` SRL (SRA if `fn7_5`), `110` OR, `111` AND |
| `001` | I-type ALU | same `fn3` mapping, no SUB; `fn3 = 101` is SRAI if `imm11_5 == 7'h20`, else SRLI |
| `010` | Load | ADD |
| `011` | Store | ADD |
| `100` | Branch | by `fn3`: `000` BEQ, `001` BNE, `100` BLT, `101` BGE, `110` BLTU, `111` BGEU (other `fn3`: ADD) |
| `110` | JAL / LUI | ADD |
| other | - | ADD |

The output codes are the ALU's control table (`00000` ADD, `00001` SUB, `00010` XOR, `00011` OR, `00100` AND, `00101` SLL, `00110` SRL, `00111` SRA, `01000` SLT, `01001` SLTU, `01010`-`01111` BEQ BNE BLT BGE BLTU BGEU).

### Interface

> [!IMPORTANT]
> Your module, port and parameter names are up to you. Your design must have the same number of ports, with the same directions and widths, as shown above, and must behave as specified. Map your names to this spec in `rnr-stage.yaml` (see the assignment handout).
