// ============================================================================
// C++ TESTBENCH WRAPPER FOR D FLIP-FLOP
// ============================================================================

#include <verilated.h>
#include <verilated_vcd_c.h>
#include "Vdff_tb.h"

int main(int argc, char** argv) {
    // Initialize Verilator
    Contextp contextp = new VerilatedContext;
    contextp->commandArgs(argc, argv);
    contextp->traceEverOn(true);
    
    // Create an instance of the testbench
    Vdff_tb* tb = new Vdff_tb{contextp};
    
    // Enable waveform tracing
    VerilatedVcdC* tfp = new VerilatedVcdC;
    tb->trace(tfp, 99);
    tfp->open("dff.vcd");
    
    // Run simulation
    while (!contextp->gotFinish()) {
        tb->eval();
        tfp->dump(contextp->time());
        contextp->timeInc(1);
    }
    
    // Cleanup
    tfp->close();
    delete tb;
    delete contextp;
    
    return 0;
}
