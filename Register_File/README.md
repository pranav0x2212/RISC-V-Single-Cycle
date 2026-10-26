# Register File

Design a 32×32 three-ported register file with two read ports and one write port.

The register file contains **32 registers, each 32 bits wide**.

### Module Specification

```SystemVerilog
module regfile(
    input  logic        clk,   // clock
    input  logic        we3,   // write enable for port 3
    input  logic [4:0]  a1, a2, a3, // read addresses (a1,a2), write address (a3)
    input  logic [31:0] wd3,       // write data for port 3
    output logic [31:0] rd1, rd2   // read data outputs
);
```

### Working

- **Read Ports:**
    
    - `rd1` reads `rf[a1]`
        
    - `rd2` reads `rf[a2]`
        
    - Reads are **combinational**, i.e., reflect memory instantly.
        
- **Write Port:**
    
    - `rf[a3] <= wd3` on rising edge of `clk` **if `we3` is high**.
        
- **Register 0:**
    
    - Always hardwired to 0, cannot be written.

### Interface

> [!IMPORTANT]
> Your module, port and parameter names are up to you. Your design must have the same number of ports, with the same directions and widths, as shown above, and must behave as specified. Map your names to this spec in `rnr-stage.yaml` (see the assignment handout).