<!-- @format -->

# SystemVerilog Building Blocks - Project Structure

## Directory Organization

```
SystemVerilog/
├── building_blocks/           # RTL design files
│   ├── basic_gates.sv
│   ├── d_flip_flop.sv
│   ├── adders.sv
│   ├── multiplexers.sv
│   └── ...
│   └── testbench/            # All testbenches in one place
│       ├── Makefile          # Master build system
│       ├── README.md         # This file
│       ├── basic_gates_tb.sv
│       ├── basic_gates_tb.cpp
│       ├── dff_tb.sv
│       ├── dff_tb.cpp
│       └── obj_dir/          # Build artifacts (auto-generated)
├── notes/                    # Documentation
└── simple_calculator/        # Project examples
```

## Design Philosophy

### Clean Structure Principles:

1. **RTL files** stay in `building_blocks/` - one module per file
2. **All testbenches** go in `building_blocks/testbench/`
3. **One Makefile** to rule them all - master Makefile manages all tests
4. **Naming convention**: `<module>_tb.sv` and `<module>_tb.cpp`
5. **Build artifacts** isolated in `obj_dir/` (git-ignored)

## Quick Start

### Install Prerequisites

```bash
brew install verilator        # Required
brew install gtkwave          # Optional, for waveforms
```

### See Available Tests

```bash
cd building_blocks/testbench
make list
```

### Run a Specific Test

```bash
make basic_gates              # Test basic gates
make dff                      # Test D flip-flop
```

### Run All Tests

```bash
make test_all
```

### View Waveforms

```bash
make wave_basic_gates
make wave_dff
```

### Clean Up

```bash
make clean
```

## Adding New Testbenches

To add a testbench for a new module (e.g., `adder.sv`):

### 1. Create the testbench files:

```bash
# Create SystemVerilog testbench
touch testbench/adder_tb.sv

# Create C++ wrapper
touch testbench/adder_tb.cpp
```

### 2. Add to Makefile:

```makefile
# Add to list target
list:
    @echo "  3. adder - Test adder module"

# Add build and run targets
adder: adder_build
    @echo "Running Adder Test..."
    @./obj_dir/Vadder_tb

adder_build: adder_tb.sv adder_tb.cpp ../adder.sv
    @$(VERILATOR) $(VERILATOR_FLAGS) \
        -Mdir obj_dir \
        -o Vadder_tb \
        ../adder.sv adder_tb.sv adder_tb.cpp

# Add waveform target
wave_adder:
    @if [ -f adder.vcd ]; then \
        gtkwave adder.vcd & \
    fi
```

### 3. Update test_all:

```makefile
test_all: basic_gates dff adder
```

## Testbench Template Structure

### SystemVerilog Testbench (.sv)

```systemverilog
module <module>_tb;
    // 1. Declare signals
    // 2. Instantiate DUT
    // 3. Generate clock (if needed)
    // 4. Apply stimulus
    // 5. Display results
    // 6. Generate VCD
endmodule
```

### C++ Wrapper (.cpp)

```cpp
#include <verilated.h>
#include <verilated_vcd_c.h>
#include "V<module>_tb.h"

int main(int argc, char** argv) {
    // 1. Initialize Verilator
    // 2. Create testbench instance
    // 3. Enable tracing
    // 4. Run simulation loop
    // 5. Cleanup
}
```

## Best Practices

### ✅ DO:

- Keep one module per RTL file
- Name testbenches with `_tb` suffix
- Use consistent file naming
- Generate VCD files for debugging
- Use meaningful signal names
- Add comments to testbenches
- Use the master Makefile

### ❌ DON'T:

- Mix RTL and testbench in same directory at different levels
- Hardcode paths in testbenches
- Commit build artifacts (obj_dir/, \*.vcd)
- Skip clock generation for sequential logic
- Forget to call $finish in testbenches

## Git Configuration

Add to `.gitignore`:

```
# Verilator build artifacts
building_blocks/testbench/obj_dir/
building_blocks/testbench/*.vcd

# Or more generally:
obj_dir/
*.vcd
```

## Troubleshooting

**"verilator: command not found"**

```bash
brew install verilator
```

**"No such file or directory" when building**

- Check you're in `building_blocks/testbench/` directory
- Verify RTL files exist in parent directory (`../`)

**Simulation doesn't finish**

- Ensure testbench calls `$finish`
- Check for infinite loops in stimulus

**No waveform output**

- Verify `$dumpfile()` and `$dumpvars()` are called
- Check that VCD file is created after running

## Example Workflow

```bash
# 1. Navigate to testbench directory
cd building_blocks/testbench

# 2. See what tests are available
make list

# 3. Run a test
make dff

# 4. View waveform
make wave_dff

# 5. Clean up
make clean
```

## Advanced: Multiple Module Dependencies

If a testbench needs multiple RTL files:

```makefile
complex_module: complex_module_tb.sv complex_module_tb.cpp \
                ../complex_module.sv ../dependency1.sv ../dependency2.sv
    @$(VERILATOR) $(VERILATOR_FLAGS) \
        -Mdir obj_dir \
        -o Vcomplex_module_tb \
        ../complex_module.sv \
        ../dependency1.sv \
        ../dependency2.sv \
        complex_module_tb.sv \
        complex_module_tb.cpp
```

## Resources

- Verilator Manual: https://verilator.org/guide/latest/
- SystemVerilog Reference: IEEE 1800-2017
- GTKWave: http://gtkwave.sourceforge.net/
