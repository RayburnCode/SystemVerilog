// ============================================================================
// SHIFT REGISTER
// ============================================================================

module shift_register_8bit (
    input  logic       clk,
    input  logic       rst_n,
    input  logic       load,      // parallel load
    input  logic       shift_en,  // shift enable
    input  logic       serial_in,
    input  logic [7:0] parallel_in,
    output logic [7:0] q,
    output logic       serial_out
);
    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            q <= 8'b0;
        else if (load)
            q <= parallel_in;
        else if (shift_en)
            q <= {q[6:0], serial_in};  // shift left
    end
    
    assign serial_out = q[7];
endmodule
