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