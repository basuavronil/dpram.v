module dpram (
    input wire clk_a, 
    input wire clk_b,
    input wire we_a, 
    input wire we_b,
    input wire [3:0] addr_a, 
    input wire [3:0] addr_b,
    input wire [7:0] din_a, 
    input wire [7:0] din_b,
    output reg [7:0] dout_a, 
    output reg [7:0] dout_b
);

    // 16 x 8-bit Memory Array
    reg [7:0] mem [0:15];

    // Port A Access (Synchronous Read-First / Read-Before-Write)
    always @(posedge clk_a) begin
        if (we_a) begin
            mem[addr_a] <= din_a;
        end
        dout_a <= mem[addr_a];
    end

    // Port B Access (Synchronous Read-First / Read-Before-Write)
    always @(posedge clk_b) begin
        if (we_b) begin
            mem[addr_b] <= din_b;
        end
        dout_b <= mem[addr_b];
    end

endmodule
