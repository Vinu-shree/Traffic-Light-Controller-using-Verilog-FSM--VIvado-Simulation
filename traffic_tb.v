`timescale 1ns/1ps

module traffic_tb();

    reg clk;
    reg rst;
    wire [2:0] light;
    traffic_light dut (
        .clk(clk),
        .rst(rst),
        .light(light)
    );

    // Clock generation (10 ns period -> 100 MHz)
    initial clk = 0;
    always #5 clk = ~clk;

    initial begin
        // apply reset
        rst = 1;
        #50;      // hold reset for 50 ns
        rst = 0;

        // run long enough to see several state changes
        #5000;
        $finish;
    end

endmodule
