# Decoder

Design the instruction field decoder. It splits a 32-bit instruction into its fields depending on the opcode.

### Module Specification

```SystemVerilog
module decoder(
    input  logic [31:0] instruction,
    output logic [4:0]  rs1,
    output logic [4:0]  rs2,
    output logic [4:0]  rd,
    output logic [6:0]  opcode,
    output logic [6:0]  imm11_5,      // instruction[31:25] (I-type ALU only)
    output logic [2:0]  fn3,
    output logic [11:0] imm,          // I / S / B immediate bits
    output logic [19:0] imm_uj,       // U / J immediate bits
    output logic        fn7_5         // instruction[30] (R-type only)
);
```

### Working

`opcode = instruction[6:0]` always. Every other output is **0 unless the opcode below uses it**:

| Opcode | Instruction | Fields produced |
|---|---|---|
| `0110011` | R-type | `rd` `fn3` `rs1` `rs2` `fn7_5 = instruction[30]` |
| `0010011` | I-type ALU | `rd` `fn3` `rs1` `imm = instruction[31:20]` `imm11_5 = instruction[31:25]` |
| `0000011` | Load | `rd` `fn3` `rs1` `imm = instruction[31:20]` |
| `0100011` | Store | `fn3` `rs1` `rs2` `imm = {instruction[31:25], instruction[11:7]}` |
| `1100011` | Branch | `fn3` `rs1` `rs2` `imm = {instruction[31], instruction[7], instruction[30:25], instruction[11:8]}` |
| `1101111` | JAL | `rd` `imm_uj = {instruction[31], instruction[19:12], instruction[20], instruction[30:21]}` |
| `1100111` | JALR | `rd` `fn3` `rs1` `imm = instruction[31:20]` |
| `0110111` | LUI | `rd` `imm_uj = instruction[31:12]` |
| `0010111` | AUIPC | `rd` `imm_uj = instruction[31:12]` |
| other | unsupported | everything except `opcode` is 0 |

### Interface

> [!IMPORTANT]
> Your module, port and parameter names are up to you. Your design must have the same number of ports, with the same directions and widths, as shown above, and must behave as specified. Map your names to this spec in `rnr-stage.yaml` (see the assignment handout).
