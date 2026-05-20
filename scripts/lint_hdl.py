#!/usr/bin/env python3
# SPDX-License-Identifier: LGPL-2.1-or-later
# Copyright (C) 2026 Leonardo Capossio - bard0 design
# Author: Leonardo Capossio - bard0 design - hello@bard0.com
"""Lint the self-contained Verilog and VHDL sources.

The legacy AMBA/LEON3 files depend on external GRLIB/techmap libraries and are
not included here. This script covers the standalone RTL, translated Verilog
benches, VHDL benches, and the VHDL synthesis wrappers used by CI.
"""

from __future__ import annotations

import shutil
import subprocess
import sys
from dataclasses import dataclass
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]

VERILOG_SOURCES = [
    "bench/verilog/spwstream_smoke_tb.v",
    "bench/verilog/spwstream_fast_smoke_tb.v",
    "bench/verilog/spwstream_loopback_tb.v",
    "bench/verilog/spwlink_tb.v",
    "bench/verilog/spwlink_tb_all.v",
    "bench/verilog/streamtest_tb.v",
    "bench/verilog/streamtest_trace_tb.v",
    "rtl/verilog/syncdff.v",
    "rtl/verilog/spwram.v",
    "rtl/verilog/spwlink.v",
    "rtl/verilog/spwxmit.v",
    "rtl/verilog/spwxmit_fast.v",
    "rtl/verilog/spwrecv.v",
    "rtl/verilog/spwrecvfront_generic.v",
    "rtl/verilog/spwrecvfront_fast.v",
    "rtl/verilog/spwstream.v",
    "rtl/verilog/streamtest.v",
]

VERILOG_RTL_SOURCES = [
    "rtl/verilog/syncdff.v",
    "rtl/verilog/spwram.v",
    "rtl/verilog/spwlink.v",
    "rtl/verilog/spwxmit.v",
    "rtl/verilog/spwxmit_fast.v",
    "rtl/verilog/spwrecv.v",
    "rtl/verilog/spwrecvfront_generic.v",
    "rtl/verilog/spwrecvfront_fast.v",
    "rtl/verilog/spwstream.v",
    "rtl/verilog/streamtest.v",
]


@dataclass(frozen=True)
class YosysTop:
    label: str
    top: str
    chparams: tuple[tuple[str, str], ...] = ()


YOSYS_TOPS = [
    YosysTop("spwlink controller", "spwlink"),
    YosysTop("spwstream generic", "spwstream"),
    YosysTop(
        "spwstream fast",
        "spwstream",
        (("RXIMPL", "1"), ("TXIMPL", "1"), ("RXCHUNK", "4")),
    ),
    YosysTop("streamtest generic", "streamtest"),
    YosysTop(
        "streamtest fast",
        "streamtest",
        (("RXIMPL", "1"), ("TXIMPL", "1"), ("RXCHUNK", "4")),
    ),
]

VHDL_COMMON = [
    "rtl/vhdl/spwpkg.vhd",
    "rtl/vhdl/spwlink.vhd",
    "rtl/vhdl/spwrecv.vhd",
    "rtl/vhdl/spwxmit.vhd",
    "rtl/vhdl/spwxmit_fast.vhd",
    "rtl/vhdl/spwrecvfront_generic.vhd",
    "rtl/vhdl/spwrecvfront_fast.vhd",
    "rtl/vhdl/syncdff.vhd",
    "rtl/vhdl/spwram.vhd",
]

VHDL_GROUPS = [
    (
        "standalone VHDL RTL",
        VHDL_COMMON + ["rtl/vhdl/spwstream.vhd", "rtl/vhdl/streamtest.vhd"],
    ),
    (
        "VHDL spwlink benches",
        VHDL_COMMON + ["bench/vhdl/spwlink_tb.vhd", "bench/vhdl/spwlink_tb_all.vhd"],
    ),
    (
        "VHDL stream benches",
        VHDL_COMMON
        + [
            "rtl/vhdl/spwstream.vhd",
            "rtl/vhdl/streamtest.vhd",
            "bench/vhdl/streamtest_tb.vhd",
            "bench/vhdl/streamtest_trace_tb.vhd",
        ],
    ),
    (
        "VHDL synthesis wrappers",
        VHDL_COMMON + ["rtl/vhdl/spwstream.vhd", "syn/vhdl/spwstream_synth_wrappers.vhd"],
    ),
]


def require_tool(name: str) -> None:
    if shutil.which(name) is None:
        raise SystemExit(f"ERROR: required tool not found on PATH: {name}")


def run(args: list[str], *, quiet: bool = False, input_text: str | None = None) -> None:
    print("+ " + " ".join(args), flush=True)
    result = subprocess.run(
        args,
        cwd=ROOT,
        text=True,
        input=input_text,
        capture_output=quiet,
    )
    if result.returncode != 0:
        if quiet:
            if result.stdout:
                print(result.stdout, end="")
            if result.stderr:
                print(result.stderr, end="", file=sys.stderr)
        raise SystemExit(result.returncode)


def ghdl_clean() -> None:
    run(["ghdl", "--remove"])
    for path in ROOT.glob("work-obj*.cf"):
        path.unlink()


def ghdl_analyze(label: str, sources: list[str]) -> None:
    print(f"\n== {label} ==")
    ghdl_clean()
    run(["ghdl", "-a", "--std=08", "-fsynopsys", *sources])


def yosys_check(top: YosysTop) -> None:
    print(f"\n== Verilog structural check: {top.label} ==")
    commands = [f"read_verilog {' '.join(VERILOG_RTL_SOURCES)}"]
    for name, value in top.chparams:
        commands.append(f"chparam -set {name} {value} {top.top}")
    commands += [
        f"hierarchy -check -top {top.top}",
        "proc",
        "check -assert",
    ]
    run(["yosys", "-q", "-"], input_text="\n".join(commands) + "\n")


def main() -> int:
    skip_yosys = "--skip-yosys" in sys.argv[1:]
    unknown = [arg for arg in sys.argv[1:] if arg != "--skip-yosys"]
    if unknown:
        raise SystemExit(f"ERROR: unknown arguments: {' '.join(unknown)}")

    require_tool("iverilog")
    require_tool("ghdl")
    if not skip_yosys:
        require_tool("yosys")

    print("== Verilog 2001 lint ==")
    run(["iverilog", "-g2001", "-Wall", "-tnull", *VERILOG_SOURCES])

    if skip_yosys:
        print("\nSKIP: Verilog structural multi-driver checks (--skip-yosys)")
    else:
        for top in YOSYS_TOPS:
            yosys_check(top)

    for label, sources in VHDL_GROUPS:
        ghdl_analyze(label, sources)

    print("\n== VHDL synthesis elaboration ==")
    ghdl_clean()
    run(["ghdl", "-a", "--std=08", "-fsynopsys", *VHDL_GROUPS[-1][1]])
    run(
        ["ghdl", "--synth", "--std=08", "-fsynopsys", "spwstream_synth_generic"],
        quiet=True,
    )
    run(
        ["ghdl", "--synth", "--std=08", "-fsynopsys", "spwstream_synth_fast"],
        quiet=True,
    )

    ghdl_clean()
    print("\nPASS: HDL lint completed")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
