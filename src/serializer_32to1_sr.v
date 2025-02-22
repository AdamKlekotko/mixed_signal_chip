module serializer_32to1_sr (
    input wire clk,               // Clock signal
    input wire reset,              // Asynchronous reset
    input wire load,               // Load signal to load parallel data
    input wire [63:0] data_in,     // 32-bit parallel input data
    output reg data_out          // Serial output data
);

    reg [63:0] shift_reg;          // Shift register to hold the data

    always @(posedge load) begin
	shift_reg <= data_in;
	data_out <= 1'b0;
    end 
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            shift_reg <= 64'b0;    // Clear the shift register on reset
            data_out <= 1'b0;      // Clear the output
        end else begin
            data_out <= shift_reg[63]; // Output the MSB
            shift_reg <= shift_reg << 1; // Shift left by 1
            data_out <= shift_reg[63]; // Output the last bit
        end
    end

endmodule
