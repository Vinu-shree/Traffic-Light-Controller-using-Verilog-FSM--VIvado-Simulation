module traffic_light #(
    parameter integer RED_TIME   = 50, // cycles
    parameter integer GREEN_TIME = 45,
    parameter integer YELLOW_TIME= 15,
    parameter integer CNT_WIDTH  = 8   // must hold max(RED_TIME,GREEN_TIME,YELLOW_TIME)
)(
    input  wire clk,
    input  wire rst,      // active-high reset
    output reg  [2:0] light  // {red, yellow, green}
);

    // One-hot state encoding
    localparam [2:0] S_RED    = 3'b001;
    localparam [2:0] S_GREEN  = 3'b010;
    localparam [2:0] S_YELLOW = 3'b100;

    reg [2:0] state;
    reg [CNT_WIDTH-1:0] counter;

    // Synchronous FSM with asynchronous reset on posedge rst (keeps tb simple)
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            state   <= S_RED;
            counter <= RED_TIME;
            light   <= 3'b100; // {red,yellow,green} => red ON
        end else begin
            case (state)
                S_RED: begin
                    light <= 3'b100;
                    if (counter == 0) begin
                        state   <= S_GREEN;
                        counter <= GREEN_TIME;
                    end else begin
                        counter <= counter - 1;
                    end
                end

                S_GREEN: begin
                    light <= 3'b001; // green ON
                    if (counter == 0) begin
                        state   <= S_YELLOW;
                        counter <= YELLOW_TIME;
                    end else begin
                        counter <= counter - 1;
                    end
                end

                S_YELLOW: begin
                    light <= 3'b010; // yellow ON
                    if (counter == 0) begin
                        state   <= S_RED;
                        counter <= RED_TIME;
                    end else begin
                        counter <= counter - 1;
                    end
