# Single-Cycle RISC-V

Design the complete single-cycle RV32I core by connecting the **IF**, **ID**, **EX** and **WB** stages. The instruction and data memories are **outside** the core.

### Module Specification

```SystemVerilog
module single_cycle_riscv (
    input  logic        clk,
    input  logic        reset,
    input  logic        stall,
    input  logic [31:0] instruction,   // from instruction memory (addressed by `address`)
    input  logic [31:0] mem_out,       // from data memory
    output logic [31:0] rs2_data,      // store data
    output logic [31:0] alu_out,       // data memory address
    output logic        mem_write,
    output logic        mem_read,
    output logic [2:0]  fn3,           // load / store width
    output logic [6:0]  opcode,
    output logic [31:0] address        // PC
);
```

### Connections

- **IF:** `address` is the PC; `and_out` / `pc_signed_offset` come from EX (`and_out_ex`, `pc_ex_out`); `pc_new` is the link address.
- **ID:** takes `instruction` and `wb_data` from WB; supplies operands, immediate and control signals.
- **EX:** takes the ID outputs and `address`.
- **WB:** `mem_out`, `alu_out`, `return_addr` (= IF's `pc_new`), `imm_out`, and `pc_signed_offset` (= EX's `pc_ex_out`, which equals `address + imm_out` for AUIPC). `wb_data` goes back to ID.
- **Branch / jump target:** EX's `pc_ex_out` is fed to IF's `pc_signed_offset` and to WB's `pc_signed_offset`; EX's `and_out_ex` is IF's `and_out`.

The core supports RV32I except FENCE, ECALL, EBREAK and CSR instructions.

### Interface

> [!IMPORTANT]
> Your module, port and parameter names are up to you. Your design must have the same number of ports, with the same directions and widths, as shown above, and must behave as specified. Map your names to this spec in `rnr-stage.yaml` (see the assignment handout).
