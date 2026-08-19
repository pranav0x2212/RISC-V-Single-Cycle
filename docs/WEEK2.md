# Week 2 - Execution and Control Logic

## Objective

Implement the combinational logic that decodes instructions and generates control signals for the baseline instruction subset. Verify it against every required instruction before wiring it into the datapath.

## Modules to Implement

- [ALU](../ALU/): see its README for the exact `alu` interface and ALU control table.
- [ALU_Decoder](../ALU_Decoder/): see its README for the exact `aludec` interface and behavior.
- [Main_Decoder](../Main_Decoder/): see its README for the exact `maindec` interface and baseline behavior (including which instructions assert `Branch` and `Jump`).
- [Control_Unit](../Control_Unit/): see its README for the exact `controller` interface, its `PCSrc` relationship, and how it uses `Main_Decoder` and `ALU_Decoder` internally.

## Dependencies

`ALU`, `ALU_Decoder`, and `Main_Decoder` are self-contained (leaf modules). `Control_Unit` depends on `Main_Decoder` and `ALU_Decoder`. It instantiates both internally, so those two should be working correctly first.

## What Should Be Working by End of Week

Given the opcode, `funct3`, and `funct7b5` fields for any instruction in the baseline subset, `Control_Unit` should produce the exact control-signal vector required by the datapath. No datapath is wired in yet. This is purely combinational logic, so it can be fully verified without a clock.

## Testing Expectations

- **ALU**: correct `result` for each of the five required operations (ADD, SUB, AND, OR, SLT) across representative operand values, using the `alucontrol` encodings from its README.
- **ALU_Decoder**: correct `ALUControl` output for the baseline R-type and I-type ALU instructions, with explicit verification that ADD and SUB (same `funct3`, different `funct7b5`) are correctly distinguished.
- **Main_Decoder**: correct control signals for each instruction category actually present in the baseline subset (R-type, I-type ALU, Load, Store, B-type, Jump), with explicit verification that `Branch` is asserted only for BEQ and `Jump` is asserted only for JAL.
- **Control_Unit**: for every instruction in the baseline subset, verify the full output vector (`ResultSrc`, `MemWrite`, `PCSrc`, `ALUSrc`, `RegWrite`, `Jump`, `ImmSrc`, `ALUControl`). This includes `PCSrc` behavior for BEQ (`PCSrc = Branch & Zero`, tested with `Zero` driven both high and low) and for JAL (`PCSrc = 1` regardless of `Zero`).

## Checkpoint Demonstration

Be prepared to show the `Control_Unit` output signals produced for each of the 13 baseline instructions' encodings. Ideally, use a single testbench that sweeps all 13 cases with expected-vs-actual checks.

## Submission

Submit your repository URL for this checkpoint through the course Google Form.
