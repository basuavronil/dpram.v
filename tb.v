`timescale 1ns/1ps
module tb_dpram () ;
    reg clk_a, clk_b, rst, we_a, we_b;
    reg  [3:0] addr_a, addr_b;
    reg  [7:0] din_a, din_b;
    wire [7:0] dout_a, dout_b;
    
    dpram d ( .clk_a(clk_a), .clk_b(clk_b), .rst(rst), .we_a(we_a), .we_b(we_b), .addr_a(addr_a), .addr_b(addr_b), .din_a(din_a), .din_b(din_b), .dout_a(dout_a), .dout_b(dout_b) );

    always #5 clk_a = ~clk_a;  
    always #7 clk_b = ~clk_b;   
    initial begin
        clk_a = 0;
        clk_b = 0;
        rst = 0;
        we_a = 0; 
        we_b = 0;
        addr_a = 0; 
        addr_b = 0;
        din_a = 0; 
        din_b = 0;

        
        #12 rst = 1;

       
        @(posedge clk_a);
        we_a = 1; addr_a = 4'd0; din_a = 8'hA1;

        @(posedge clk_a);
        we_a = 1; addr_a = 4'd1; din_a = 8'hB2;

        @(posedge clk_a);
        we_a = 1; addr_a = 4'd2; din_a = 8'hC3;

        we_a = 0;

       
        @(posedge clk_b);
        we_b = 1; addr_b = 4'd4; din_b = 8'hD4;

        @(posedge clk_b);
        we_b = 1; addr_b = 4'd5; din_b = 8'hE5;

        we_b = 0;

       
        @(posedge clk_a);
        we_a = 0; addr_a = 4'd0;

        @(posedge clk_b);
        we_b = 0; addr_b = 4'd4;

        @(posedge clk_a);
        addr_a = 4'd1;

        @(posedge clk_b);
        addr_b = 4'd5;

        @(posedge clk_a);
        addr_a = 4'd2;

        // -------- Simultaneous read/write --------
        @(posedge clk_a);
        we_a = 1; addr_a = 4'd3; din_a = 8'h55; // write
        addr_b = 4'd3; we_b = 0;               // read same addr

        @(posedge clk_b);
        we_b = 0; addr_b = 4'd3;

        // Finish
        #20 $finish;
    end

    // Monitor output
    initial begin
        $monitor("T=%0t | A: WE=%b Addr=%d Din=%h Dout=%h || B: WE=%b Addr=%d Din=%h Dout=%h",
                  $time, we_a, addr_a, din_a, dout_a,
                  we_b, addr_b, din_b, dout_b);
    end

endmodule
