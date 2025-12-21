// ============================================================================
// COMPARATOR
// ============================================================================

module comparator_8bit (
    input  logic [7:0] a,
    input  logic [7:0] b,
    output logic       equal,
    output logic       greater,
    output logic       less
);
    assign equal   = (a == b);
    assign greater = (a > b);
    assign less    = (a < b);
endmodule