// ============================================================================
// MULTIPLEXERS
// ============================================================================

// 2-to-1 Multiplexer
module mux2to1 (
    input  logic a,
    input  logic b,
    input  logic sel,
    output logic y
);
    assign y = sel ? b : a;  // if sel=1, output b; else output a
endmodule

// 4-to-1 Multiplexer
module mux4to1 (
    input  logic [3:0] data,  // 4 input lines
    input  logic [1:0] sel,   // 2-bit selector
    output logic       y
);
    assign y = data[sel];
endmodule

// 8-bit 2-to-1 Multiplexer
module mux2to1_8bit (
    input  logic [7:0] a,
    input  logic [7:0] b,
    input  logic       sel,
    output logic [7:0] y
);
    assign y = sel ? b : a;
endmodule