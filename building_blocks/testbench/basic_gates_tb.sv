// ============================================================================
// TESTBENCH FOR BASIC GATES
// ============================================================================

module basic_gates_tb;
    // Testbench signals
    logic a, b;
    logic and_out, or_out, not_out, xor_out;
    
    // Instantiate all gate modules
    and_gate u_and (
        .a(a),
        .b(b),
        .y(and_out)
    );
    
    or_gate u_or (
        .a(a),
        .b(b),
        .y(or_out)
    );
    
    not_gate u_not (
        .a(a),
        .y(not_out)
    );
    
    xor_gate u_xor (
        .a(a),
        .b(b),
        .y(xor_out)
    );
    
    // Test stimulus
    initial begin
        $display("Starting Basic Gates Test");
        $display("========================");
        $display("Time\t a b | AND OR NOT XOR");
        $display("-----------------------------------");
        
        // Test all input combinations
        a = 0; b = 0;
        #10;
        $display("%0t\t %b %b |  %b   %b   %b   %b", $time, a, b, and_out, or_out, not_out, xor_out);
        
        a = 0; b = 1;
        #10;
        $display("%0t\t %b %b |  %b   %b   %b   %b", $time, a, b, and_out, or_out, not_out, xor_out);
        
        a = 1; b = 0;
        #10;
        $display("%0t\t %b %b |  %b   %b   %b   %b", $time, a, b, and_out, or_out, not_out, xor_out);
        
        a = 1; b = 1;
        #10;
        $display("%0t\t %b %b |  %b   %b   %b   %b", $time, a, b, and_out, or_out, not_out, xor_out);
        
        $display("========================");
        $display("Test Complete!");
        $finish;
    end
    
    // Optional: Generate VCD file for waveform viewing
    initial begin
        $dumpfile("basic_gates.vcd");
        $dumpvars(0, basic_gates_tb);
    end
    
endmodule
