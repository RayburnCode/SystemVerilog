# ============================================================================
# MASTER MAKEFILE FOR ALL TESTBENCHES
# ============================================================================

VERILATOR = verilator
VERILATOR_FLAGS = -Wall --trace --cc --exe --build

# Color output
GREEN = \033[0;32m
YELLOW = \033[0;33m
NC = \033[0m # No Color

.PHONY: all basic_gates dff clean help list test_all

# Default: show available tests
all: help

# List all available tests
list:
	@echo "$(GREEN)Available Testbenches:$(NC)"
	@echo "  1. basic_gates - Test AND, OR, NOT, XOR gates"
	@echo "  2. dff         - Test D Flip-Flop"
	@echo ""
	@echo "Run a specific test with: make <test_name>"
	@echo "Run all tests with: make test_all"

# Run all tests
test_all: basic_gates dff
	@echo "$(GREEN)All tests completed!$(NC)"

# ===== BASIC GATES TEST =====
basic_gates: basic_gates_build
	@echo "$(GREEN)Running Basic Gates Test...$(NC)"
	@./obj_dir/Vbasic_gates_tb
	@echo ""

basic_gates_build: basic_gates_tb.sv basic_gates_tb.cpp ../basic_gates.sv
	@echo "$(YELLOW)Building basic_gates testbench...$(NC)"
	@$(VERILATOR) $(VERILATOR_FLAGS) \
		-Mdir obj_dir \
		-o Vbasic_gates_tb \
		../basic_gates.sv basic_gates_tb.sv basic_gates_tb.cpp

# ===== D FLIP-FLOP TEST =====
dff: dff_build
	@echo "$(GREEN)Running D Flip-Flop Test...$(NC)"
	@./obj_dir/Vdff_tb
	@echo ""

dff_build: dff_tb.sv dff_tb.cpp ../d_flip_flop.sv
	@echo "$(YELLOW)Building dff testbench...$(NC)"
	@$(VERILATOR) $(VERILATOR_FLAGS) \
		-Mdir obj_dir \
		-o Vdff_tb \
		../d_flip_flop.sv dff_tb.sv dff_tb.cpp

# ===== WAVEFORM VIEWING =====
wave_basic_gates:
	@if [ -f basic_gates.vcd ]; then \
		gtkwave basic_gates.vcd & \
	else \
		echo "No waveform file found. Run 'make basic_gates' first."; \
	fi

wave_dff:
	@if [ -f dff.vcd ]; then \
		gtkwave dff.vcd & \
	else \
		echo "No waveform file found. Run 'make dff' first."; \
	fi

# ===== CLEANUP =====
clean:
	@echo "$(YELLOW)Cleaning build artifacts...$(NC)"
	@rm -rf obj_dir *.vcd
	@echo "$(GREEN)Clean complete!$(NC)"

# ===== HELP =====
help:
	@echo "$(GREEN)Verilator Testbench Suite$(NC)"
	@echo "=========================="
	@echo ""
	@echo "$(YELLOW)Commands:$(NC)"
	@echo "  make list              - List all available tests"
	@echo "  make basic_gates       - Run basic gates test"
	@echo "  make dff               - Run D flip-flop test"
	@echo "  make test_all          - Run all tests"
	@echo ""
	@echo "  make wave_basic_gates  - View basic gates waveform"
	@echo "  make wave_dff          - View D flip-flop waveform"
	@echo ""
	@echo "  make clean             - Remove build artifacts"
	@echo "  make help              - Show this help"
	@echo ""
	@echo "$(YELLOW)Prerequisites:$(NC)"
	@echo "  brew install verilator"
	@echo "  brew install gtkwave (optional)"
	@echo ""
	@echo "$(YELLOW)Quick Start:$(NC)"
	@echo "  make list              # See available tests"
	@echo "  make basic_gates       # Run a specific test"
	@echo "  make test_all          # Run all tests"
