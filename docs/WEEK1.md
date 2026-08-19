# Week 1 - Foundational Building Blocks

## Objective

Implement and individually verify the independent building-block modules that later weeks' modules (`Datapath`, `Control_Unit`, `Top`) will integrate. Nothing is wired together yet. Each module should work correctly on its own.

## Modules to Implement

- [2to1_Multiplexer](../2to1_Multiplexer/): see its README for the exact `mux2` interface and behavior.
- [3to1_Multiplexer](../3to1_Multiplexer/): see its README for the exact `mux3` interface and behavior.
- [Adder](../Adder/): see its README for the exact `adder` interface and behavior.
- [Resettable_FF](../Resettable_FF/): see its README for the exact `flopr` interface and behavior.
- [Resettable_En_FF](../Resettable_En_FF/): see its README for the exact `flopenr` interface and behavior.
- [Register_File](../Register_File/): see its README for the exact `regfile` interface and behavior.
- [Sign_Extender](../Sign_Extender/): see its README for the exact `extend` interface and behavior.
- [IMEM](../IMEM/): see its README for the exact `imem` interface and behavior.
- [DMEM](../DMEM/): see its README for the exact `dmem` interface and behavior.

## What Should Be Working by End of Week

All nine modules should simulate correctly in isolation, matching the interface and behavior defined in their individual READMEs exactly (module name, ports, and widths are fixed contracts. See each module's "Fixed Interface" note).

## Testing Expectations

For each module, verify:

- **Multiplexers**: correct output for all valid select-line combinations (`mux2`, `mux3`).
- **Adder**: correct 32-bit addition across representative operand values.
- **Resettable_FF / Resettable_En_FF**: asynchronous reset behavior, and (for `flopenr`) correct enable gating.
- **Register_File**: combinational reads on both read ports, synchronous write on the write port gated by `we3`, and explicit verification that `x0` always reads as zero and cannot be written.
- **Sign_Extender**: correct sign-extended output for all four immediate formats (I-type, S-type, B-type, J-type).
- **IMEM**: correct initialization from a `.txt` file and correct combinational reads.
- **DMEM**: correct combinational reads, correct synchronous writes gated by `we`, and correct use of the byte-address-to-word-index convention (word index = byte address / 4).

## Checkpoint Demonstration

Be prepared to show a per-module testbench and simulation waveform (or simulator log) for each of the nine modules above, demonstrating the behavior listed under Testing Expectations.

## Submission

Submit your repository URL for this checkpoint through the course Google Form.
