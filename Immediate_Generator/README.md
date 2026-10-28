# Immediate Generator

Design the immediate generator. It builds the final 32-bit immediate from the decoder's `imm` / `imm_uj` fields.

### Module Specification

```SystemVerilog
module imm_generator(
    input  logic [11:0] imm_input,       // decoder `imm`
    input  logic [2:0]  fn3,
    input  logic [6:0]  opcode,
    input  logic [19:0] imm_input_uj,    // decoder `imm_uj`
    output logic [31:0] imm_output
);
```

### Working

| Opcode | Result |
|---|---|
| Branch `1100011` | `sign_extend(imm_input) << 1` |
| JAL `1101111` | `sign_extend(imm_input_uj) << 1` (20-bit sign extension) |
| LUI `0110111`, AUIPC `0010111` | `{imm_input_uj, 12'b0}` |
| JALR `1100111` | `sign_extend(imm_input)` |
| I-type ALU `0010011` with `fn3 = 001` or `101` (shifts) | `{27'b0, imm_input[4:0]}` |
| I-type ALU `0010011`, other `fn3` | `sign_extend(imm_input)` |
| anything else (load, store, R-type, ...) | `sign_extend(imm_input)` |

### Interface

> [!IMPORTANT]
> Your module, port and parameter names are up to you. Your design must have the same number of ports, with the same directions and widths, as shown above, and must behave as specified. Map your names to this spec in `rnr-stage.yaml` (see the assignment handout).
