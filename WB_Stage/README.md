# WB Stage (Write Back)

Design the write-back stage: it selects the value that is written to the register file.

### Module Specification

```SystemVerilog
module wb_stage(
    input  logic [31:0] mem_out,           // data from data memory
    input  logic [31:0] alu_out,
    input  logic [31:0] return_addr,       // PC + 4
    input  logic [31:0] imm_out,           // LUI immediate
    input  logic [31:0] pc_signed_offset,  // PC + upper immediate (AUIPC)
    input  logic [1:0]  memtoreg,
    input  logic [6:0]  opcode_out_d,
    output logic [31:0] wb_data
);
```

### Working

| memtoreg | wb_data |
|---|---|
| `00` | `alu_out` |
| `01` | `mem_out` |
| `10` | by opcode: JAL (`1101111`) / JALR (`1100111`) -> `return_addr`; LUI (`0110111`) -> `imm_out`; AUIPC (`0010111`) -> `pc_signed_offset`; otherwise `alu_out` |
| `11` | `alu_out` |

### Interface

> [!IMPORTANT]
> Your module, port and parameter names are up to you. Your design must have the same number of ports, with the same directions and widths, as shown above, and must behave as specified. Map your names to this spec in `rnr-stage.yaml` (see the assignment handout).
