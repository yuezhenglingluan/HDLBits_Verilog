module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    input ground,
    input dig,
    output walk_left,
    output walk_right,
    output aaah,
    output digging ); 

    reg [2:0] state, next_state;
    parameter LEFT = 0, RIGHT = 1, FALL_LEFT = 2, FALL_RIGHT = 3, DIG_LEFT = 4, DIG_RIGHT = 5, DEAD = 6;
    reg [63:0] count;
    always @(posedge clk, posedge areset) begin
        if (areset) begin 
            state <= LEFT;
            count <= 0;
        end
        else begin 
            state <= next_state;
            if (state == FALL_LEFT || state == FALL_RIGHT) count <= count + 1;
            else count <= 0;
        end
    end

    always @(*) begin
        // State transition logic
        case (state)
            LEFT: next_state = (ground & ~dig) ? ((bump_left) ? RIGHT : LEFT) :  ((ground & dig) ? DIG_LEFT : FALL_LEFT);
            RIGHT: next_state = (ground & ~dig) ? ((bump_right) ? LEFT : RIGHT) : ((ground & dig) ? DIG_RIGHT : FALL_RIGHT);
            FALL_LEFT: next_state = ground ? ((count > 63'd19) ? DEAD : LEFT) : FALL_LEFT;
            FALL_RIGHT: next_state = ground ? ((count > 63'd19) ? DEAD : RIGHT) : FALL_RIGHT;
            DIG_LEFT: next_state = ground ? DIG_LEFT : FALL_LEFT;
            DIG_RIGHT: next_state = ground ? DIG_RIGHT : FALL_RIGHT;
            DEAD: next_state = DEAD;
        endcase
    end

    assign walk_left = (state == LEFT);
    assign walk_right = (state == RIGHT);
    assign aaah = (state == FALL_LEFT || state == FALL_RIGHT);
    assign digging = (state == DIG_LEFT || state == DIG_RIGHT);
endmodule
