<!-- @format -->

# Testbench Suite with Verilator

This directory contains all testbenches for the SystemVerilog building blocks using Verilator.

## 📋 Available Tests

- **basic_gates** - Test AND, OR, NOT, XOR gates
- **dff** - Test D Flip-Flop with reset

## Prerequisites

Install Verilator on macOS:

```bash
brew install verilator
```

Optional (for waveform viewing):

```bash
brew install gtkwave
```

## 🚀 Quick Start

### See All Available Tests

```bash
cd building_blocks/testbench
make list
```

### Run a Specific Test

```bash
make basic_gates        # Test basic gates
make dff                # Test D flip-flop
```

### Run All Tests

```bash
make test_all
```

### View Waveforms

```bash
make wave_basic_gates   # View basic gates waveform
make wave_dff           # View D flip-flop waveform
```

### Clean Build Artifacts

```bash
make clean
```

## What Happens?

1. **Verilator** compiles your SystemVerilog files into C++
2. The C++ is compiled into an executable
3. The executable runs your testbench
4. Results are displayed in the terminal
5. A `.vcd` waveform file is generated

## Manual Commands

If you prefer to run commands manually:

```bash
# Compile with Verilator
verilator -Wall --trace --cc --exe --build \
  -Mdir obj_dir \
  -o Vbasic_gates_tb \
  ../basic_gates.sv basic_gates_tb.sv basic_gates_tb.cpp

# Run simulation
./obj_dir/Vbasic_gates_tb

# View waveforms
gtkwave basic_gates.vcd
```

## Expected Output

```
Starting Basic Gates Test
========================
Time     a b | AND OR NOT XOR
-----------------------------------
10       0 0 |  0   0   1   0
20       0 1 |  0   1   1   1
30       1 0 |  0   1   0   1
40       1 1 |  1   1   0   0
========================
Test Complete!
```

## Understanding the Files

- **basic_gates_tb.sv** - SystemVerilog testbench that instantiates and tests all gates
- **basic_gates_tb.cpp** - C++ wrapper for Verilator integration
- **Makefile** - Automates the build and run process
- **basic_gates.vcd** - Generated waveform file (after running)

## Troubleshooting

**Problem:** `verilator: command not found`
**Solution:** Install with `brew install verilator`

**Problem:** Compilation errors
**Solution:** Make sure you're in the `building_blocks/testbench` directory

**Problem:** Can't view waveforms
**Solution:** Install GTKWave with `brew install gtkwave`
