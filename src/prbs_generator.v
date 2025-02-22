module prbs_generator (
    // Clocks inputs:
    input clk,
    input rst_n,
    // output data:
    output reg [63:0] prbs_out
);
    localparam RawFrameSize = 64;
    reg [6:0] lfsr; // 7-bitowy rejestr przesuwający
    integer i;

    always @(posedge clk or negedge rst_n) begin
	if (!rst_n) begin
            lfsr <= 7'b0000001; // Reset na domyślną wartość (nie może być 0!)
	end else begin
            	// PRBS7: sprężenie zwrotne z bitów 6 i 5 (XOR)
		for (i = 0; i < RawFrameSize; i = i + 1) begin
            		lfsr = {lfsr[5:0], lfsr[6] ^ lfsr[5]};
			prbs_out[i] = lfsr[6];
        	end
    	end
    end

endmodule




































































































































































