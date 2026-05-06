/*
 * SPDX-License-Identifier: LGPL-2.1-or-later
 * Copyright (C) 2009-2013 Joris van Rantwijk
 * Verilog translation Copyright (C) 2026 Leonardo Capossio - bard0 design
 * Author: Leonardo Capossio - bard0 design - hello@bard0.com
 * Run the spwlink test bench in several configurations.
 *
 * Verilog 2001 translation of bench/vhdl/spwlink_tb_all.vhd from SpaceWire
 * Light.
 */

`timescale 1ns / 1ps

module spwlink_tb_all;

    wire [7:0] done;
    wire [7:0] failed;

    spwlink_tb #(.RXIMPL(0), .RXCHUNK(1), .TXIMPL(0), .TX_CLOCK_DIV(8'd1), .STARTWAIT_CYCLES(0))
        test1 (.done(done[0]), .failed(failed[0]));
    spwlink_tb #(.RXIMPL(0), .RXCHUNK(1), .TXIMPL(0), .TX_CLOCK_DIV(8'd0), .STARTWAIT_CYCLES(1000))
        test2 (.done(done[1]), .failed(failed[1]));
    spwlink_tb #(.RXIMPL(1), .RXCHUNK(1), .TXIMPL(0), .TX_CLOCK_DIV(8'd1), .STARTWAIT_CYCLES(2000))
        test3 (.done(done[2]), .failed(failed[2]));
    spwlink_tb #(.RXIMPL(1), .RXCHUNK(2), .TXIMPL(0), .TX_CLOCK_DIV(8'd1), .STARTWAIT_CYCLES(3000))
        test4 (.done(done[3]), .failed(failed[3]));
    spwlink_tb #(.RXIMPL(1), .RXCHUNK(4), .TXIMPL(0), .TX_CLOCK_DIV(8'd1), .STARTWAIT_CYCLES(4000))
        test5 (.done(done[4]), .failed(failed[4]));
    spwlink_tb #(.RXIMPL(0), .RXCHUNK(1), .TXIMPL(1), .TX_CLOCK_DIV(8'd1), .STARTWAIT_CYCLES(5000))
        test6 (.done(done[5]), .failed(failed[5]));
    spwlink_tb #(.RXIMPL(0), .RXCHUNK(1), .TXIMPL(1), .TX_CLOCK_DIV(8'd3), .STARTWAIT_CYCLES(6000))
        test7 (.done(done[6]), .failed(failed[6]));
    spwlink_tb #(.RXIMPL(1), .RXCHUNK(4), .TXIMPL(1), .TX_CLOCK_DIV(8'd1), .STARTWAIT_CYCLES(7000))
        test8 (.done(done[7]), .failed(failed[7]));

    initial begin
        wait (&done);
        if (|failed) begin
            $display("FAIL: spwlink_tb_all");
            $finish;
        end
        $display("PASS: spwlink_tb_all");
        $finish;
    end

endmodule

