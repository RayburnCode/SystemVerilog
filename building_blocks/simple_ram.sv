// ============================================================================
// SIMPLE MEMORY (RAM)
// ============================================================================

// 16x8 RAM (16 locations, 8 bits each)
module ram_16x8 (
    input  logic       clk,
    input  logic [3:0] addr,
    input  logic [7:0] data_in,
    input  logic       we,      // write enable
    output logic [7:0] data_out
);
    logic [7:0] mem [0:15];  // 16 locations of 8-bit data
    
    always_ff @(posedge clk) begin
        if (we)
            mem[addr] <= data_in;
    end
    
    assign data_out = mem[addr];
endmodule