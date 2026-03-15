module dpram (
    input clk_a, clk_b, rst, we_a, we_b, input  [3:0] addr_a, addr_b, input  [7:0] din_a, din_b, 
    output reg [7:0] dout_a, dout_b
);
    reg [7:0] mem [0:15];  integer i; 
    
    
    always @(posedge clk_a or negedge rst) begin
        if (!rst) begin
            for (i = 0; i < 16; i = i +1)
            mem[i] <= 8'd0;
            dout_a <= 8'd0;
        end 
        else begin
            if (we_a)
                mem[addr_a] <= din_a;   
            else 
            dout_a <= mem[addr_a]; 
        end
    end
    always @(posedge clk_b or negedge rst) begin
        if (!rst) begin
            dout_b <= 8'd0;
            for (i = 0; i < 16; i = i +1)
            mem[i] <= 8'd0;
        end 
        else begin
            if (we_b)
                mem[addr_b] <= din_b;   
            dout_b <= mem[addr_b];
        end
    end

endmodule
