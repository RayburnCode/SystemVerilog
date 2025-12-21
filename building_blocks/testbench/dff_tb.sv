// ============================================================================
// TESTBENCH FOR D FLIP-FLOP
// ============================================================================

module dff_tb;
    // Clock and reset
    logic clk;
    logic rst_n;
    
    // Test signals
    logic d;
    logic q;
    
    // Instantiate DUT (Device Under Test)
    dff u_dff (
        .clk(clk),
        .rst_n(rst_n),
        .d(d),
        .q(q)
    );
    
    // Clock generation - 10ns period (100MHz)
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end
    
    // Test stimulus
    initial begin
        $display("Starting D Flip-Flop Test");
        $display("=========================");
        $display("Time\t RST CLK D | Q");
        $display("---------------------------");
        
        // Initialize
        rst_n = 0;
        d = 0;
        
        // Test reset
        #10;
        $display("%0t\t  %b   %b  %b | %b  (Reset)", $time, rst_n, clk, d, q);
        
        // Release reset
        rst_n = 1;
        #10;
        $display("%0t\t  %b   %b  %b | %b  (Reset released)", $time, rst_n, clk, d, q);
        
        // Test D=0 -> Q=0
        d = 0;
        #10;
        $display("%0t\t  %b   %b  %b | %b  (D=0, should latch 0)", $time, rst_n, clk, d, q);
        
        // Test D=1 -> Q=1
        d = 1;
        #10;
        $display("%0t\t  %b   %b  %b | %b  (D=1, should latch 1)", $time, rst_n, clk, d, q);
        
        // Test D=0 -> Q=0
        d = 0;
        #10;
        $display("%0t\t  %b   %b  %b | %b  (D=0, should latch 0)", $time, rst_n, clk, d, q);
        
        // Test D=1 -> Q=1 again
        d = 1;
        #10;
        $display("%0t\t  %b   %b  %b | %b  (D=1, should latch 1)", $time, rst_n, clk, d, q);
        
        // Test reset during operation
        #5 rst_n = 0;
        #10;
        $display("%0t\t  %b   %b  %b | %b  (Reset asserted, Q should be 0)", $time, rst_n, clk, d, q);
        
        rst_n = 1;
        #10;
        $display("%0t\t  %b   %b  %b | %b  (Reset released)", $time, rst_n, clk, d, q);
        
        $display("=========================");
        $display("Test Complete!");
        $finish;
    end
    
    // Waveform dump
    initial begin
        $dumpfile("dff.vcd");
        $dumpvars(0, dff_tb);
    end
    
    // Monitor for debugging
    initial begin
        $monitor("Time=%0t rst_n=%b clk=%b d=%b q=%b", 
                 $time, rst_n, clk, d, q);
    end
    
endmodule
