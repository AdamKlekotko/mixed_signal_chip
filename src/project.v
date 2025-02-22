`timescale 1 ns / 100 ps
/*
 * Copyright (c) 2024 Your Name
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none

module tt_um_analog_analog_test_chip (
    input  wire       VGND,
    input  wire       VDPWR,    // 1.8v power supply
//    input  wire       VAPWR,    // 3.3v power supply
    input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs
    input  wire [7:0] uio_in,   // IOs: Input path
    output wire [7:0] uio_out,  // IOs: Output path
    output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
    inout  wire [7:0] ua,       // Analog pins, only ua[5:0] can be used
    input  wire       ena,      // always 1 when the design is powered, so you can ignore it
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);
wire clk_by_2;
wire clk_by_32;
wire [63:0] prbs_data;

clock_divider clk_div (.clk(clk),.reset(~rst_n),.clk_div2(clk_by_2),.clk_div32(clk_by_32));
prbs_generator prbs_gen (.clk(clk_by_32),.rst_n(rst_n),.prbs_out(prbs_data));
serializer_32to1_sr sr_ser (.clk(clk),.reset(~rst_n),.load(clk_by_32),.data_in(prbs_data),.data_out(uo_out[0]));

endmodule
