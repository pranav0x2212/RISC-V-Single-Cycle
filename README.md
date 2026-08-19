# RISC-n-Roll

RISC-n-Roll is the starter/specification repository for this course's single-cycle RISC-V processor project. Each student **forks this repository** and independently builds their **own complete single-cycle RISC-V processor**, module by module, over four weeks.

Maintainer: COD TA's of '27 graduating batch.

## How this repository works

- This repository defines the **architecture and module contracts** for the processor. It does not contain any RTL implementation.
- Every student forks this repository and implements every module themselves, entirely within their own fork.
- Students do not submit pull requests back to this repository. It is the shared specification, not a shared codebase.
- Each module's **name, port list, and port widths are a fixed contract**. Do not rename modules, add, remove, or reorder ports, or change port widths. Later modules and your evaluation both depend on these interfaces staying exact.

See [CONTRIBUTING.md](CONTRIBUTING.md) for the full student workflow.

## Baseline Instruction Set

The processor implements a fixed subset of RV32I. It does not implement the full ISA. The table below lists the required instructions:

| Category | Instructions |
|---|---|
| R-type | ADD, SUB, AND, OR, SLT |
| I-type ALU | ADDI, ANDI, ORI, SLTI |
| Memory | LW, SW |
| Branch | BEQ |
| Jump | JAL |

No other RV32I instructions are required or expected.

## Four-Week Progression

Students build the processor bottom-up across four weeks:

- [Week 1](docs/WEEK1.md): independent building blocks (multiplexers, adder, flip-flops, register file, sign extender, instruction/data memory)
- [Week 2](docs/WEEK2.md): ALU, decoders, and the control unit
- [Week 3](docs/WEEK3.md): datapath and the single-cycle processor core
- [Week 4](docs/WEEK4.md): full system integration (`Top`)

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

The diagram below shows how the modules connect to form the single-cycle processor. It is the architectural source of truth for how modules integrate with each other. Module interfaces should not be changed in ways that are inconsistent with it.

![RISC-V-Single-Cycle.png](https://i.postimg.cc/8C61F1RQ/RISC-V-Single-Cycle.png)

## Submission Workflow

Submit your repository URL for this checkpoint through the course Google Form. See [CONTRIBUTING.md](CONTRIBUTING.md) for details.
