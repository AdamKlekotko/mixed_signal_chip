module clock_divider (
    input wire clk,               // Input clock
    input wire reset,             // Asynchronous reset
    output reg clk_div2,          // Divided clock (clk/2)
    output reg clk_div32          // Divided clock (clk/32)
);

    reg [4:0] count;              // 5-bit counter to divide the clock by 32

    // Generate clk/2
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            clk_div2 <= 1'b0;     // Reset clk/2
        end else begin
            clk_div2 <= ~clk_div2; // Toggle clk/2 every clock cycle
        end
    end

    // Generate clk/32
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            count <= 5'b0;         // Reset the counter
            clk_div32 <= 1'b0;     // Reset clk/32
        end else begin
            if (count == 5'd31) begin
                count <= 5'b0;     // Reset the counter after 32 cycles
                clk_div32 <= ~clk_div32; // Toggle clk/32
            end else begin
                count <= count + 1; // Increment the counter
            end
        end
    end

endmodule
