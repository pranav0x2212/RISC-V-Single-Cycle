# Student Project Workflow

This document explains how to work with RISC-n-Roll as your course project. This repository is the official project specification for the processor. It is not a shared codebase, and it does not accept pull requests from students.

## Workflow

1. **Fork this repository.** All of your implementation work happens in your own fork.
2. **Work entirely within your own fork.** You are building your own complete single-cycle RISC-V processor, not contributing a piece to a shared one.
3. **Implement all required modules across the four weeks**, following the weekly assignment documents:
   - [Week 1](docs/WEEK1.md)
   - [Week 2](docs/WEEK2.md)
   - [Week 3](docs/WEEK3.md)
   - [Week 4](docs/WEEK4.md)
4. **Do not change the specified module interfaces.** Each module's README defines a fixed contract: module name, port list, and port widths. Later modules and your TAs' evaluation both depend on these staying exact.
5. **Do not submit pull requests to the official project repository.** All of your work stays in your own fork.
6. **Keep your repository accessible to the course TAs** so it can be reviewed at each checkpoint.

## Weekly Checkpoints

Submit your repository URL for this checkpoint through the course Google Form.

Deadlines, late policy, grading breakdown, and the submission form itself will be communicated separately by course staff.

## Getting Help

Refer to each module's README for its exact interface and behavioral requirements. If a module's specification is unclear, raise it with your TAs instead of guessing. These interfaces are fixed contracts, so an incorrect assumption early on can cause integration problems in later weeks.
