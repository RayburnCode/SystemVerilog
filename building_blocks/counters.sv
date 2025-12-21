// ============================================================================
// COUNTERS
// ============================================================================

// 4-bit Up Counter
module counter_4bit (
    input  logic       clk,
    input  logic       rst_n,
    input  logic       en,
    output logic [3:0] count
);
    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            count <= 4'b0;
        else if (en)
            count <= count + 1;
    end
endmodule