<!-- @format -->

# Notes

## 4 States

| value  | State                                                                                    |
| ------ | ---------------------------------------------------------------------------------------- |
| 0      | Logic state 0 - variable/net is at 0 volts                                               |
| 1      | Logic state 1 - variable/net is at some value > 0.7 volts                                |
| x or X | Logic state X - variable/net has either 0/1 - we just don't know                         |
| z or Z | Logic state Z - net has high impedence - maybe the wire is not connected and is floating |

## Structures

A structure represents a collection of data-types that are stored together and be referenced via the structure variable.

```sv
// Create a structure to store "int" and "real" variables
// A name is given to the structure and declared to be a data type so
// that this name "s_money" can be used to create structure variables
typedef struct {
    int    coins;
    real   dollars;
} s_money;

// Create a structure variable of type s_money
s_money wallet;

wallet = '{5, 19.75};                       // Assign direct values to a structure variable
wallet = '{coins:5, dollars:19.75};         // Assign values using member names
wallet = '{default:0};                      // Assign all elements of structure to 0
wallet = s_money'{int:1, dollars:2};        // Assign default values to all members of that type

// Create a structure that can hold 3 variables and initialize them with 1
struct {
    int  A, B, C;
} ABC = '{3{1}};      // A = B = C = 1

// Assigning an array of structures
s_money purse [1:0] = '{'{2, 4.25}, '{7,1.5}};
```

## Void

The void data-type represents non-existing data, and can be specified as the return type of functions and tasks to indicate no return value.

## Little vs Big Endian

English written left-to-right (big-endian) versus others like Arabic written right-to-left (little-endian).

[7:0] means we're using the little-endian convention - you start with 0 at the rightmost bit to begin the vector, then move to the left.

[0:7], we would be using the big-endian convention and moving from left to right

## Driver

A driver is a data type which can drive a load. Basically, in a physical circuit, a driver would be anything that electrons can move through/into.

1. Driver that can store a value (example: flip-flop).
2. Driver that can not store value, but connects two points (example: wire).

### Registers and Wires

Wire data type is used for connecting two points.
Reg data type is used for storing values.

##

2 state value integer data types are:

- shortint : 16-bit signed integer.
- int : 32-bit signed integer.
- longint : 64-bit signed integer.
- byte : 8-bit signed integer, can be used for storing ASCII charater.
- bit : User defined vector types.

4-state value integers data types are:

- logic : User defined vector types.
- reg : User defined vector types.
- wire : User defined vector types.
- integer : 32-bit signed integer.
- time : 64-bit unsigned integer.
