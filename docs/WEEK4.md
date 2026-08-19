# Week 4 - Full System Integration

## Objective

Integrate the Week 3 processor core with instruction and data memory to form a complete, self-contained single-cycle RISC-V processor that fetches and executes a program on its own, without a testbench driving `Instr` directly.

## Modules to Implement

- [Top](../Top/): see its README for the exact `top` interface. It integrates `RISCV_Wrapper`, `IMEM`, and `DMEM`.

## Dependencies

`Top` depends on `RISCV_Wrapper` (Week 3) and `IMEM`/`DMEM` (Week 1). Both memories are already implemented and unit-tested, and are now wired in instead of being driven standalone.

## What Should Be Working by End of Week

A complete, running processor: a program loaded into `IMEM` via its `.txt` initialization executes correctly end-to-end, with `DMEM` reads/writes and register updates matching the program's intended behavior, observable through `Top`'s `WriteData`, `DataAdr`, and `MemWrite` outputs.

## Testing Expectations

Run a test program through the full `Top` module that exercises the baseline instruction subset, including:

- arithmetic (R-type) instructions,
- immediate arithmetic (I-type) instructions,
- a memory write (SW) followed by a memory read (LW) of the same location, to confirm the address and data paths are correct end-to-end,
- a BEQ that is taken and one that is not taken,
- a JAL, including its `PC+4` write-back.

This repository does not currently provide a specific test program. Write your own program covering the cases above, hand-assembled into the `.txt` format your `IMEM` expects.

## Checkpoint Demonstration

Be prepared to show your test program, the `Top`-level simulation waveform (or simulator log) for the full run, and an explanation of the expected vs. observed memory/register state at the points in the program that exercise each instruction category above.

## Submission

Submit your repository URL for this checkpoint through the course Google Form.
