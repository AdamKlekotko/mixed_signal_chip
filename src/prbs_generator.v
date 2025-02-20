module prbs_generator (
    // Clock and reset inputs:
    input clk,
    input reset,

    // Output data:
    output reg [31:0] prbs_out
);

  // Parameters:
  localparam RawFrameSize = 32;
  localparam StateWidth = 7; // Width of the PRBS state

  // Internal signals:
  reg [StateWidth-1:0] state_q; // Current state
  reg [StateWidth-1:0] state_d; // Next state
  reg [RawFrameSize-1:0] prbs_xor_a; // XOR result for PRBS calculation
  integer i;

  // Sequential logic for state update:
  always @(posedge clk or posedge reset) begin
    if (reset) begin
      state_q <= {StateWidth{1'b1}}; // Initialize state to all 1s on reset
      prbs_out <= 32'b0; // Initialize output to 0 on reset
    end else begin
      state_q <= state_d; // Update state on clock edge
    end
  end

  // Combinational logic for PRBS calculation:
  always @* begin
    prbs_xor_a = 32'b0; // Initialize XOR result
    state_d = state_q; // Default next state is current state

    // Generate PRBS output:
    for (i = 0; i < RawFrameSize; i = i + 1) begin
      prbs_xor_a[i] = state_q[6] ^ state_q[5]; // XOR taps for PRBS
      state_d = {state_q[5:0], prbs_xor_a[i]}; // Shift and update state
      prbs_out[RawFrameSize-i-1] = prbs_xor_a[i]; // Assign PRBS output
    end
  end

endmodule
























































