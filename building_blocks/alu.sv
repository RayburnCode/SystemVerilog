// ============================================================================
// ARITHMETIC LOGIC UNIT (ALU)
// ============================================================================

module alu_8bit (
    input  logic [7:0] a,
    input  logic [7:0] b,
    input  logic [2:0] op,    // operation selector
    output logic [7:0] result,
    output logic       zero,
    output logic       carry,
    output logic       overflow
);
    logic [8:0] temp;
    
    always_comb begin
        temp = 9'b0;
        carry = 1'b0;
        overflow = 1'b0;
        
        case (op)
            3'b000: result = a & b;           // AND
            3'b001: result = a | b;           // OR
            3'b010: begin                     // ADD
                temp = a + b;
                result = temp[7:0];
                carry = temp[8];
                overflow = (a[7] == b[7]) && (result[7] != a[7]);
            end
            3'b011: result = a ^ b;           // XOR
            3'b100: result = ~a;              // NOT a
            3'b101: begin                     // SUB (a - b)
                temp = a - b;
                result = temp[7:0];
                carry = temp[8];
                overflow = (a[7] != b[7]) && (result[7] != a[7]);
            end
            3'b110: result = a << 1;          // Shift left
            3'b111: result = a >> 1;          // Shift right
            default: result = 8'b0;
        endcase
    end
    
    assign zero = (result == 8'b0);
endmodule
