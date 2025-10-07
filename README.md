# RISC-n-Roll
RISC-n-Roll is a Single Cycle RISC-V Processor built from modular components for Hacknight 7.0

## Modules

Click on a module name to see its folder and instructions:

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

## Contribution Guidelines

1. Fork the repo and work on **one module at a time**.
2. Follow the **README inside each module folder** for detailed instructions.
3. Submit a Pull Request (PR) with:
   - `rtl.sv` (module implementation)
   - `tb.sv` (testbench)
   - Waveform screenshot showing correctness
4. PRs will be **manually reviewed**. Incomplete submissions may be closed.

## Tools / Recommendations

- Recommended simulators: **Vivado, Quartus Lite, Verilator**
- Windows users: Vivado / Quartus Lite preferred
- Follow **naming conventions** strictly for smooth evaluation

> [!TIP]
> Contributors are encouraged to take a look at the processor diagram below to understand how the modules connect and interact within the single-cycle design.
> ![RISC-V-Single-Cycle.png](https://i.postimg.cc/8C61F1RQ/RISC-V-Single-Cycle.png)