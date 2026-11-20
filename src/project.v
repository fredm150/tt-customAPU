/*
 * Copyright (c) 2026 Frederick Mensah
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none

module tt_um_adder_fredm (
    input  wire [7:0] ui_in,    // inputs of num_1
    output wire [7:0] uo_out,   // Dedicated outputs (stores sum of num_1 and num_2)
    input  wire [7:0] uio_in,   // bidirectional (can be set to anything), so I set to inputs of num_2
    output wire [7:0] uio_out,  // IOs: Output path
    output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // always 1 when the design is powered, so you can ignore it
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);

  assign uo_out  = ui_in + uio_in;  // ou_out is the sum of ui_in and uio_in
  assign uio_out = 0;
  assign uio_oe  = 0;

  // List all unused inputs to prevent warnings
  wire _unused = &{ena, clk, rst_n, 1'b0};

endmodule
