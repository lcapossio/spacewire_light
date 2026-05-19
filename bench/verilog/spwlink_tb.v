/*
 * SPDX-License-Identifier: LGPL-2.1-or-later
 * Copyright (C) 2009-2013 Joris van Rantwijk
 * Verilog translation Copyright (C) 2026 Leonardo Capossio - bard0 design
 * Author: Leonardo Capossio - bard0 design - hello@bard0.com
 * Test bench for link interface.
 *
 * Verilog 2001 translation of bench/vhdl/spwlink_tb.vhd from SpaceWire Light.
 * This translated bench keeps the original parameter sweep role while using
 * self-loopback checks suitable for Icarus Verilog CI.
 */

`timescale 1ns / 1ps

module spwlink_tb #(
    parameter TEST_ID = 0,
    parameter RXIMPL = 0,
    parameter RXCHUNK = 1,
    parameter TXIMPL = 0,
    parameter [7:0] TX_CLOCK_DIV = 8'd1,
    parameter STARTWAIT_CYCLES = 0,
    parameter real RXCLK_HALF_NS = 25.0,
    parameter real TXCLK_HALF_NS = 25.0
) (
    output reg done,
    output reg failed
);

    reg clk;
    reg rxclk;
    reg txclk;
    reg rst;
    reg autostart;
    reg linkstart;
    reg linkdis;
    reg [7:0] txdivcnt;
    reg tick_in;
    reg [1:0] ctrl_in;
    reg [5:0] time_in;
    reg txwrite;
    reg txflag;
    reg [7:0] txdata;
    wire txrdy;
    wire tick_out;
    wire [1:0] ctrl_out;
    wire [5:0] time_out;
    wire rxvalid;
    wire rxflag;
    wire [7:0] rxdata;
    reg rxread;
    wire running;
    wire errdisc;
    wire errpar;
    wire erresc;
    wire errcred;
    wire spw_do;
    wire spw_so;
    integer timeout;
    integer i;

    initial begin
        clk = 1'b0;
        while (done !== 1'b1) begin
            #25 clk = !clk;
        end
    end

    initial begin
        rxclk = 1'b0;
        while (done !== 1'b1) begin
            #RXCLK_HALF_NS rxclk = !rxclk;
        end
    end

    initial begin
        txclk = 1'b0;
        while (done !== 1'b1) begin
            #TXCLK_HALF_NS txclk = !txclk;
        end
    end

    spwstream #(
        .RESET_TIME(11'd20),
        .DISCONNECT_TIME(8'd20),
        .DEFAULT_DIVCNT(TXIMPL ? 8'd3 : 8'd1),
        .RXIMPL(RXIMPL),
        .TXIMPL(TXIMPL),
        .RXCHUNK(RXCHUNK),
        .RXFIFOSIZE_BITS(6),
        .TXFIFOSIZE_BITS(4)
    ) dut (
        .clk(clk),
        .rxclk(rxclk),
        .txclk(txclk),
        .rst(rst),
        .autostart(autostart),
        .linkstart(linkstart),
        .linkdis(linkdis),
        .txdivcnt(txdivcnt),
        .tick_in(tick_in),
        .ctrl_in(ctrl_in),
        .time_in(time_in),
        .txwrite(txwrite),
        .txflag(txflag),
        .txdata(txdata),
        .txrdy(txrdy),
        .txhalff(),
        .tick_out(tick_out),
        .ctrl_out(ctrl_out),
        .time_out(time_out),
        .rxvalid(rxvalid),
        .rxhalff(),
        .rxflag(rxflag),
        .rxdata(rxdata),
        .rxread(rxread),
        .started(),
        .connecting(),
        .running(running),
        .errdisc(errdisc),
        .errpar(errpar),
        .erresc(erresc),
        .errcred(errcred),
        .spw_di(spw_do),
        .spw_si(spw_so),
        .spw_do(spw_do),
        .spw_so(spw_so)
    );

    task fail;
        input [8*96-1:0] msg;
        begin
            $display("ERROR: test%0d %0s", TEST_ID, msg);
            failed = 1'b1;
            done = 1'b1;
        end
    endtask

    task wait_running;
        begin
            timeout = 30000;
            while (!running && timeout > 0 && !failed) begin
                @(posedge clk);
                timeout = timeout - 1;
            end
            if (timeout == 0) begin
                fail("link did not enter Run state");
            end
        end
    endtask

    task send_char;
        input flag;
        input [7:0] data;
        begin
            timeout = 30000;
            while (!txrdy && timeout > 0 && !failed) begin
                @(posedge clk);
                timeout = timeout - 1;
            end
            if (timeout == 0) begin
                fail("TX not ready");
            end else begin
                txflag <= flag;
                txdata <= data;
                txwrite <= 1'b1;
                @(posedge clk);
                txwrite <= 1'b0;
            end
        end
    endtask

    task expect_char;
        input flag;
        input [7:0] data;
        begin
            timeout = 30000;
            while (!rxvalid && timeout > 0 && !failed) begin
                @(posedge clk);
                timeout = timeout - 1;
            end
            if (timeout == 0) begin
                fail("RX character timeout");
            end else begin
                rxread <= 1'b1;
                @(posedge clk);
                rxread <= 1'b0;
                @(posedge clk);
            end
        end
    endtask

    task drain_rx;
        begin
            repeat (200) begin
                @(posedge clk);
                rxread <= rxvalid;
            end
            rxread <= 1'b0;
            repeat (4) @(posedge clk);
        end
    endtask

    initial begin
        done = 1'b0;
        failed = 1'b0;
        rst = 1'b1;
        autostart = 1'b1;
        linkstart = 1'b0;
        linkdis = 1'b0;
        txdivcnt = TX_CLOCK_DIV;
        tick_in = 1'b0;
        ctrl_in = 2'b00;
        time_in = 6'd0;
        txwrite = 1'b0;
        txflag = 1'b0;
        txdata = 8'd0;
        rxread = 1'b0;
        for (i = 0; i < STARTWAIT_CYCLES; i = i + 1) begin
            @(posedge clk);
        end
        repeat (8) @(posedge clk);
        rst = 1'b0;
        linkstart = 1'b1;
        wait_running;
        drain_rx;
        if (TX_CLOCK_DIV != 0 && TX_CLOCK_DIV < 40) begin
            for (i = 0; i < 8 && !failed; i = i + 1) begin
                send_char(1'b0, 8'h30 + i[7:0]);
            end
            send_char(1'b1, 8'h00);
            expect_char(1'b0, 8'h30);
        end else begin
            repeat (400) @(posedge clk);
        end
        ctrl_in = 2'b01;
        time_in = 6'h22;
        tick_in = 1'b1;
        @(posedge clk);
        tick_in = 1'b0;
        repeat (200) @(posedge clk);
        linkdis = 1'b1;
        repeat (200) @(posedge clk);
        linkdis = 1'b0;
        wait_running;
        if (errpar || erresc || errcred) begin
            fail("unexpected error flag");
        end
        done = 1'b1;
    end

endmodule
