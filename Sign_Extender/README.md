# Sign Extender

This module generates a 32-bit immediate value from instruction fields, depending on the type of instruction (I-type, S-type, B-type, or J-type).

### Module Specification

```SystemVerilog
module extend(
    input  logic [31:7] instr,     // Instruction bits
    input  logic [1:0]  immsrc,    // Immediate type selector
    output logic [31:0] immext     // Sign-extended immediate
);
```

### Working

- `immsrc = 2'b00` → **I-type**    
- `immsrc = 2'b01` → **S-type**
- `immsrc = 2'b10` → **B-type**
- `immsrc = 2'b11` → **J-type** 

>[!TIP]  
> Think about which bits of the instruction correspond to each immediate type and how to extend the **sign bit** to fill 32 bits.

### Notes

- `immext` is always **sign-extended to 32 bits**, regardless of immediate type.
- **B-type** and **J-type** immediates are used as PC-relative offsets: they are shifted left by 1 when forming the branch/jump target address (`PC + (ImmExt << 1)`).

### Interface

> [!IMPORTANT]
> Your module, port and parameter names are up to you. Your design must have the same number of ports, with the same directions and widths, as shown above, and must behave as specified. Map your names to this spec in `rnr-stage.yaml` (see the assignment handout).