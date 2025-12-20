<!-- @format -->

# SystemVerilog

Tiny Tapeout
NandLand

## External Tools

1. Simulator: [Verilator](https://verilator.org/guide/latest/overview.html)

   ```brew
   brew install verilator
   ```

2. Waveform Viewer: GTKWave.

   ```brew
   brew install --cask gtkwave
   ```

### Compile

Verilator:

```bash
# 1. Convert Verilog to C++ and compile
verilator --binary -j 0 --trace alu.sv alu_test.sv --top-module alu_test

# 2. Run the simulation
./obj_dir/Valu_test

# 3. View waveform (if you added trace code)
gtkwave alu.vcd
```

Universal Verification Methodology (UVM)

### View waveform (optional)

gtkwave counter.vcd

## FPGA vs ASIC

LibreLane = ASIC implementation flow infrastructure
a: Performs synthesis (converts HDL to gates)
b: Does place and route (physical layout)
c: Generates GDSII files (ready for chip fabrication)

SKY130nm
GTKWave

```

```
