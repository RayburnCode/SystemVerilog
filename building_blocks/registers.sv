// ============================================================================
// REGISTERS
// ============================================================================

// 8-bit Register with enable
module register_8bit (
    input  logic       clk,
    input  logic       rst_n,
    input  logic       en,      // enable
    input  logic [7:0] d,
    output logic [7:0] q
);
    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            q <= 8'b0;
        else if (en)
            q <= d;
    end
endmodule