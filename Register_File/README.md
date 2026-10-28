# Register File

Design a 32×32 register file with two read ports and one write port, with an asynchronous reset.

### Module Specification

```SystemVerilog
module register_file(
    input  logic [4:0]  rs1_sel, rs2_sel,   // read addresses
    input  logic        reg_write,          // write enable
    input  logic        clk,
    input  logic        reset,              // Asynchronous, active high
    input  logic [31:0] wb_data,            // write data
    input  logic [4:0]  rd_sel,             // write address
    output logic [31:0] rs1_data, rs2_data  // read data
);
```

### Working

- **Reads are combinational:** `rs1_data = rs1_sel == 0 ? 0 : register[rs1_sel]`, same for `rs2_data`.
- **Write:** `register[rd_sel] <= wb_data` on the rising edge of `clk` if `reg_write` is high and `rd_sel != 0`.
- **Register 0** always reads 0 and cannot be written.
- **Reset:** when `reset` goes high, **all registers are cleared to 0** immediately (no clock needed).

> [!NOTE]
> The CI synthesizes with Yosys 0.33, which cannot parse assignment patterns. Do **not** write `register <= '{default: 0};`; clear the registers with a `for` loop instead.

### Interface

> [!IMPORTANT]
> Your module, port and parameter names are up to you. Your design must have the same number of ports, with the same directions and widths, as shown above, and must behave as specified. Map your names to this spec in `rnr-stage.yaml` (see the assignment handout).
