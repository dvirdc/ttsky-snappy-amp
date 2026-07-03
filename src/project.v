/*
 * Copyright (c) 2026 Dvir
 * SPDX-License-Identifier: Apache-2.0
 *
 * Snappy common-source amplifier (analog).
 * The actual circuit is a hardened GDS/LEF macro (gds/, lef/); this Verilog is the
 * black-box wrapper the Tiny Tapeout harness sees. Only the analog pins are used:
 *   ua[0] = vin  (amplifier input, AC-coupled through the Snappy-logo MiM cap)
 *   ua[1] = vout (amplifier output)
 * vdda is tied to VDPWR (1.8 V) and the ground/bulk to VGND inside the macro.
 */

`default_nettype none

module tt_um_dvirdc_snappy_amp (
    input  wire       VGND,     // ground
    input  wire       VDPWR,    // 1.8 V power supply (amplifier VDDA)
    input  wire [7:0] ui_in,    // Dedicated inputs (unused)
    output wire [7:0] uo_out,   // Dedicated outputs (unused)
    input  wire [7:0] uio_in,   // IOs: Input path (unused)
    output wire [7:0] uio_out,  // IOs: Output path (unused)
    output wire [7:0] uio_oe,   // IOs: Enable path (unused)
    inout  wire [7:0] ua,       // Analog pins: ua[0]=vin, ua[1]=vout
    input  wire       ena,      // always 1 when powered
    input  wire       clk,      // clock (unused)
    input  wire       rst_n     // reset_n (unused)
);

  // Purely analog design -- drive all digital outputs to a defined state.
  assign uo_out  = 8'b0;
  assign uio_out = 8'b0;
  assign uio_oe  = 8'b0;

  // Prevent unused-signal warnings.
  wire _unused = &{ena, clk, rst_n, ui_in, uio_in, ua[7:2], 1'b0};

endmodule

`default_nettype wire
