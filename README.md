# RISC-V Single-Cycle

This is the starter/specification repository for this course's single-cycle RISC-V processor project. Each student **creates their own repository from this template** (**Use this template** → **Create a new repository**) and independently builds their **own complete single-cycle RISC-V processor**, module by module.

Maintainer: COD TA's of '27 graduating batch.

## How this repository works

- This repository defines the **architecture and module contracts** for the processor. It does not contain any RTL implementation.
- Every student implements every module themselves, entirely within their own repository.
- Students do not submit pull requests back to this repository. It is the shared specification, not a shared codebase.
- Module, port, parameter and file names are up to you. Each module's **port count, directions, widths and behavior** must match its specification, and you tell the CI how your names map to it in `rnr-stage.yaml`. See the assignment handout.

## Modules

Click on a module name to see its folder and specification:

- [2to1_Multiplexer](2to1_Multiplexer/)
- [3to1_Multiplexer](3to1_Multiplexer/)
- [Adder](Adder/)
- [ALU](ALU/)
- [ALU_Decoder](ALU_Decoder/)
- [Control_Unit](Control_Unit/)
- [Datapath](Datapath/)
- [DMEM](DMEM/)
- [IMEM](IMEM/)
- [Main_Decoder](Main_Decoder/)
- [Register_File](Register_File/)
- [Resettable_En_FF](Resettable_En_FF/)
- [Resettable_FF](Resettable_FF/)
- [RISCV_Wrapper](RISCV_Wrapper/)
- [Sign_Extender](Sign_Extender/)
- [Top](Top/)

## Tools

- **Vivado is the official/recommended development environment** for this course.

## Architecture

The diagram below shows how the modules connect to form the single-cycle processor. It is the architectural source of truth for how modules integrate with each other. Your ports must stay consistent with it.

![RISC-V-Single-Cycle.png](https://i.postimg.cc/8C61F1RQ/RISC-V-Single-Cycle.png)

## Submission Workflow

Submit your repository URL for this checkpoint through the course Google Form. The assignment handout explains how to configure and verify your repository.
