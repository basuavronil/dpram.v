`timescale 1ns / 1ps

module dpram_tb;

    // Testbench Signals
    reg clk_a;
    reg clk_b;
    reg we_a;
    reg we_b;
    reg [3:0] addr_a;
    reg [3:0] addr_b;
    reg [7:0] din_a;
    reg [7:0] din_b;

    wire [7:0] dout_a;
    wire [7:0] dout_b;

    // Instantiate Device Under Test (DUT)
    dpram uut (
        .clk_a(clk_a),
        .clk_b(clk_b),
        .we_a(we_a),
        .we_b(we_b),
        .addr_a(addr_a),
        .addr_b(addr_b),
        .din_a(din_a),
        .din_b(din_b),
        .dout_a(dout_a),
        .dout_b(dout_b)
    );

    // Clock Generation (clk_a = 10ns period, clk_b = 14ns period to simulate dual independent clocks)
    always #5  clk_a = ~clk_a;
    always #7  clk_b = ~clk_b;

    // VCD Dump and Monitor Setup
    initial begin
        // Generate waveform file for GTKWave / EDA Playground
        $dumpfile("dpram_waveform.vcd");
        $dumpvars(0, dpram_tb);

        // Continuous monitoring of bus values in the terminal
        $monitor("Time=%0tns | PORT A: WE=%b Addr=0x%h Din=0x%h Dout=0x%h | PORT B: WE=%b Addr=0x%h Din=0x%h Dout=0x%h",
                 $time, we_a, addr_a, din_a, dout_a, we_b, addr_b, din_b, dout_b);
    end

    // Test Stimulus
    initial begin
        // Initialize Signals
        clk_a  = 0;
        clk_b  = 0;
        we_a   = 0;
        we_b   = 0;
        addr_a = 0;
        addr_b = 0;
        din_a  = 0;
        din_b  = 0;

        #10;

        // Step 1: Write data via Port A and Port B simultaneously
        @(posedge clk_a);
        we_a   = 1;
        addr_a = 4'h2;
        din_a  = 8'hA5; // Write 0xA5 to Address 2 via Port A

        @(posedge clk_b);
        we_b   = 1;
        addr_b = 4'h7;
        din_b  = 8'h5C; // Write 0x5C to Address 7 via Port B

        #10;
        // Step 2: Disable writes on both ports
        @(posedge clk_a) we_a = 0;
        @(posedge clk_b) we_b = 0;

        #10;
        // Step 3: Read back values across ports (Port A reads Port B's write, Port B reads Port A's write)
        @(posedge clk_a);
        addr_a = 4'h7; // Should output 0x5C on next cycle

        @(posedge clk_b);
        addr_b = 4'h2; // Should output 0xA5 on next cycle

        #30;
        $display("Simulation completed successfully.");
        $finish;
    end

endmodule
