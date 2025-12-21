// ============================================================================
// BASIC GATES
// ============================================================================

// Simple 2-input AND gate
module and_gate (
    input  logic a,
    input  logic b,
    output logic y
);
    assign y = a & b;
endmodule

// 2-input OR gate
module or_gate (
    input  logic a,
    input  logic b,
    output logic y
);
    assign y = a | b;
endmodule

// NOT gate (inverter)
module not_gate (
    input  logic a,
    output logic y
);
    assign y = ~a;
endmodule

// XOR gate
module xor_gate (
    input  logic a,
    input  logic b,
    output logic y
);
    assign y = a ^ b;
endmodule