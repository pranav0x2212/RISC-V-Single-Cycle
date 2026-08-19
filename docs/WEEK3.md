# Week 3 - Datapath and Processor Core

## Objective

Integrate the Week 1 building blocks and the Week 2 control logic into a working single-cycle processor core. At this stage, instructions can be driven directly into the core through its `Instr` input. Full memory-system integration (`IMEM`/`DMEM`) is not required until Week 4.

## Modules to Implement

- [Datapath](../Datapath/): see its README for the exact `datapath` interface, the submodules it integrates, and its PC-update and branch/jump-target behavior.
- [RISCV_Wrapper](../RISCV_Wrapper/): see its README for the exact `riscvsingle` interface. It wraps `Control_Unit` and `Datapath` together.

## Dependencies

`Datapath` depends on the Week 1 building blocks (`2to1_Multiplexer`, `3to1_Multiplexer`, `Adder`, `Register_File`, `Sign_Extender`, `Resettable_FF`, `Resettable_En_FF`) and the Week 2 `ALU`. `RISCV_Wrapper` depends on `Datapath` and `Control_Unit` (Week 2) together.

## What Should Be Working by End of Week

A complete `riscvsingle` core that correctly executes each instruction in the baseline subset when instructions are driven directly through `Instr`. `ReadData` can be driven by a testbench stand-in rather than a real `DMEM` at this stage.

## Testing Expectations

Demonstrate, by driving instructions directly through `Instr`:

- **Register write-back**: correct values written to the register file for ALU and immediate operations, and correctly read back by subsequent instructions.
- **ALU operations**: ADD, SUB, AND, OR, SLT with register operands.
- **Immediate operations**: ADDI, ANDI, ORI, SLTI with correct immediate sign-extension.
- **Memory interface signals**: for LW and SW, correct `ALUResult` (address), `MemWrite`, and `WriteData` values presented at the `Datapath`/`RISCV_Wrapper` boundary. A real memory does not need to be attached yet.
- **BEQ**: both the taken case (`PC` redirected to the branch target) and the not-taken case (`PC` advances to `PC+4`).
- **JAL**: correct `PC` redirection to the jump target, and correct `PC+4` written back to `rd`.

## Checkpoint Demonstration

Be prepared to show a short hand-encoded instruction sequence (covering each instruction type above, including both a taken and a not-taken BEQ) driven directly into `riscvsingle.Instr`, with the resulting `PC` and register/write-back trace matching expected values.

## Submission

Submit your repository URL for this checkpoint through the course Google Form.
