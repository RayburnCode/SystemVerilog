// ============================================================================
// 8. SIMPLE STATE MACHINE (Traffic Light Example)
// ============================================================================

module traffic_light (
    input  logic clk,
    input  logic rst_n,
    output logic red,
    output logic yellow,
    output logic green
);
    typedef enum logic [1:0] {
        RED    = 2'b00,
        YELLOW = 2'b01,
        GREEN  = 2'b10
    } state_t;
    
    state_t state, next_state;
    logic [3:0] counter;
    
    // State register
    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            state <= RED;
            counter <= 4'b0;
        end else begin
            if (counter == 4'd15) begin
                state <= next_state;
                counter <= 4'b0;
            end else begin
                counter <= counter + 1;
            end
        end
    end
    
    // Next state logic
    always_comb begin
        case (state)
            RED:    next_state = GREEN;
            GREEN:  next_state = YELLOW;
            YELLOW: next_state = RED;
            default: next_state = RED;
        endcase
    end
    
    // Output logic
    assign red    = (state == RED);
    assign yellow = (state == YELLOW);
    assign green  = (state == GREEN);
endmodule
