// ============================================================================
// ADDERS
// ============================================================================

// Half Adder (adds 2 bits)
module half_adder (
    input  logic a,
    input  logic b,
    output logic sum,
    output logic carry
);
    assign sum = a ^ b;
    assign carry = a & b;
endmodule

// Full Adder (adds 3 bits: a, b, and carry_in)
module full_adder (
    input  logic a,
    input  logic b,
    input  logic cin,
    output logic sum,
    output logic cout
);
    assign sum = a ^ b ^ cin;
    assign cout = (a & b) | (cin & (a ^ b));
endmodule

// 4-bit Ripple Carry Adder
module adder_4bit (
    input  logic [3:0] a,
    input  logic [3:0] b,
    input  logic       cin,
    output logic [3:0] sum,
    output logic       cout
);
    logic [2:0] carry;  // internal carries
    
    full_adder fa0 (.a(a[0]), .b(b[0]), .cin(cin),      .sum(sum[0]), .cout(carry[0]));
    full_adder fa1 (.a(a[1]), .b(b[1]), .cin(carry[0]), .sum(sum[1]), .cout(carry[1]));
    full_adder fa2 (.a(a[2]), .b(b[2]), .cin(carry[1]), .sum(sum[2]), .cout(carry[2]));
    full_adder fa3 (.a(a[3]), .b(b[3]), .cin(carry[2]), .sum(sum[3]), .cout(cout));
endmodule

// 8-bit Adder (simple version using + operator)
module adder_8bit (
    input  logic [7:0] a,
    input  logic [7:0] b,
    output logic [7:0] sum,
    output logic       cout
);
    logic [8:0] temp;
    assign temp = a + b;
    assign sum = temp[7:0];
    assign cout = temp[8];
endmodule