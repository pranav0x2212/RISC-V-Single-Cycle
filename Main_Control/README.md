# Main Control

Design the main control unit. It decodes the opcode into the control signals of the datapath.

### Module Specification

```SystemVerilog
module main_control (
    input  logic [6:0] opcode,
    input  logic [2:0] fn3,
    output logic [1:0] memtoreg,    // write-back select
    output logic       branch,
    output logic       mux_inp,     // 1 = JALR (target comes from the ALU)
    output logic       memread,
    output logic       memwrite,
    output logic       alusrc,      // 0 = rs2, 1 = immediate
    output logic       reg_write,
    output logic [2:0] aluop        // operation class for the ALU control
);
```

### Control Table

| Instruction | Opcode | memtoreg | branch | mux_inp | memread | memwrite | alusrc | reg_write | aluop |
|---|---|---|---|---|---|---|---|---|---|
| R-type | `0110011` | 00 | 0 | 0 | 0 | 0 | 0 | 1 | 000 |
| I-type ALU | `0010011` | 00 | 0 | 0 | 0 | 0 | 1 | 1 | 001 |
| Load | `0000011` | 01 | 0 | 0 | 1 | 0 | 1 | 1 | 010 |
| Store | `0100011` | 11 | 0 | 0 | 0 | 1 | 1 | 0 | 011 |
| Branch | `1100011` | 00 | 1 | 0 | 0 | 0 | 0 | 0 | 100 |
| JAL | `1101111` | 10 | 0 | 0 | 0 | 0 | 1 | 1 | 110 |
| JALR | `1100111` | 10 | 0 | 1 | 0 | 0 | 1 | 1 | 001 |
| LUI | `0110111` | 10 | 0 | 0 | 0 | 0 | 1 | 1 | 110 |
| AUIPC | `0010111` | 10 | 0 | 0 | 0 | 0 | 1 | 1 | 000 |
| other | - | 00 | 0 | 0 | 0 | 0 | 0 | 0 | 000 |

`memtoreg` is a don't-care for instructions that do not write a register (store, branch, unsupported). `fn3` is not used by this table.

### Interface

> [!IMPORTANT]
> Your module, port and parameter names are up to you. Your design must have the same number of ports, with the same directions and widths, as shown above, and must behave as specified. Map your names to this spec in `rnr-stage.yaml` (see the assignment handout).
