module div_by_two(
    input wire clk,       // Input clock signal
    input wire reset,     // Asynchronous reset signal
    output reg clk_out    // Output clock signal (divided by 2)
);

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            clk_out <= 1'b0; 
        end else begin
            clk_out <= ~clk_out;  // Toggle the output clock
        end
    end

endmodule
