# RISC-V Single-Cycle

This is the starter/specification repository for this course's single-cycle RISC-V processor project. Each student **creates their own repository from this template** (**Use this template** → **Create a new repository**) and independently builds their **own complete single-cycle RV32I processor**, module by module.

Maintainer: COD TA's of '27 graduating batch.

## How this repository works

- This repository defines the **architecture and module contracts** for the processor. It does not contain any RTL implementation.
- Every student implements every module themselves, entirely within their own repository.
- Students do not submit pull requests back to this repository. It is the shared specification, not a shared codebase.
- Module, port and parameter names are up to you. Each module's **port count, directions, widths and behavior** must match its specification, and you tell the CI how your names map to it in `rnr-stage.yaml`. See the assignment handout.

## Modules

Click on a module name to see its folder and specification. They are listed in the order the CI checks them (stage in brackets):

- [IF_Stage](IF_Stage/) (fetch)
- [Decoder](Decoder/) (decode)
- [Immediate_Generator](Immediate_Generator/) (decode)
- [Register_File](Register_File/) (decode)
- [Main_Control](Main_Control/) (decode)
- [ID_Stage](ID_Stage/) (decode)
- [ALU](ALU/) (execute)
- [ALU_Control](ALU_Control/) (execute)
- [EX_Stage](EX_Stage/) (execute)
- [WB_Stage](WB_Stage/) (writeback)
- [Single_Cycle_RISCV](Single_Cycle_RISCV/) (integration)

## Tools

- **Vivado is the official/recommended development environment** for this course.
- The CI synthesizes your RTL with **Yosys 0.33**, which cannot parse SystemVerilog assignment patterns such as `'{default: 0}`. Use a `for` loop to clear the register file. File paths in `rnr-stage.yaml` must not contain spaces.

## Architecture

The core is a single-cycle RV32I processor split into four stages. The instruction and data memories are **outside** the core (the `instruction` and `mem_out` inputs). The table below is the architectural source of truth for how the modules integrate; your ports must stay consistent with it.

| Signal | From -> To |
|---|---|
| `address` | IF -> instruction memory, EX |
| `instruction` | instruction memory -> ID |
| `rs1_data` `rs2_data` `imm_out` + control | ID -> EX |
| `and_out_ex` | EX -> IF `and_out` |
| `pc_ex_out` | EX -> IF `pc_signed_offset`, WB `pc_signed_offset` |
| `alu_out` | EX -> WB, data memory address |
| `pc_new` | IF -> WB `return_addr` |
| `wb_data` | WB -> ID register file |
| `rs2_data`, `mem_write`, `mem_read`, `fn3` | core outputs -> data memory |

## Submission Workflow

Submit your repository URL for this checkpoint through the course Google Form. The assignment handout explains how to configure and verify your repository.
