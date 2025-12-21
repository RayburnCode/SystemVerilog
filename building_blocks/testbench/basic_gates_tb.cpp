// ============================================================================
// C++ TESTBENCH WRAPPER FOR VERILATOR
// ============================================================================

#include <verilated.h>
#include <verilated_vcd_c.h>
#include "Vbasic_gates_tb.h"

int main(int argc, char** argv) {
    // Initialize Verilator
    Contextp contextp = new VerilatedContext;
    contextp->commandArgs(argc, argv);
    contextp->traceEverOn(true);
    
    // Create an instance of the testbench
    Vbasic_gates_tb* tb = new Vbasic_gates_tb{contextp};
    
    // Optional: Enable waveform tracing
    VerilatedVcdC* tfp = new VerilatedVcdC;
    tb->trace(tfp, 99);
    tfp->open("basic_gates.vcd");
    
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
