<!-- @format -->

# Modules

**Module:** This is a reserved word within the program used to refer to things with inputs, outputs, and internal logic workings; they're the rough equivalents of functions with returns in other programming languages.

```verilog
 1 module arbiter (
  2 // Two slashes make a comment line.
  3 clock      , // clock
  4 reset      , // Active high, syn reset
  5 req_0      , // Request 0
  6 req_1      , // Request 1
  7 gnt_0      , // Grant 0
  8 gnt_1        // Grant 1
  9 );
 10 //-------------Input Ports-----------------------------
 11 // Note : all commands are semicolon-delimited
 12 input           clock               ;
 13 input           reset               ;
 14 input           req_0               ;
 15 input           req_1               ;
 16 //-------------Output Ports----------------------------
 17 output        gnt_0                 ;
 18 output        gnt_1                 ;
```
