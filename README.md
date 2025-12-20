<!-- @format -->

# SystemVerilog

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

iverilog -g2012 -o output counter.sv counter_tb.sv

### Run simulation

vvp output

### View waveform (optional)

gtkwave counter.vcd
