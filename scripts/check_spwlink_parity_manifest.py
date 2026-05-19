#!/usr/bin/env python3
# SPDX-License-Identifier: LGPL-2.1-or-later
# Copyright (C) 2026 Leonardo Capossio - bard0 design
# Author: Leonardo Capossio - bard0 design - hello@bard0.com

"""Check the spwlink parity manifest against the current bench sources."""

from __future__ import annotations

import re
import sys
from pathlib import Path


ROOT = Path.cwd()
MANIFEST = ROOT / "parity" / "spwlink_manifest.yml"
VERILOG_TB_ALL = ROOT / "bench" / "verilog" / "spwlink_tb_all.v"


def scalar(value: str) -> str:
    value = value.strip()
    if value.startswith("8'd"):
        return value[3:]
    if value.endswith(".0"):
        return value[:-2]
    return value


def manifest_cases(text: str) -> list[tuple[str, str, str, str, str]]:
    cases: list[tuple[str, str, str, str, str]] = []
    in_cases = False
    for line in text.splitlines():
        stripped = line.strip()
        if stripped == "cases:":
            in_cases = True
            continue
        if in_cases and stripped and not stripped.startswith("- ["):
            break
        if in_cases and stripped.startswith("- ["):
            fields = [field.strip() for field in stripped[3:-1].split(",")]
            case, rximpl, rxchunk, tximpl, txdiv = fields[:5]
            cases.append((case, rximpl, rxchunk, tximpl, txdiv))
    return cases


def verilog_cases(text: str) -> list[tuple[str, str, str, str, str]]:
    cases: list[tuple[str, str, str, str, str]] = []
    pattern = re.compile(
        r"\.TEST_ID\((?P<case>\d+)\).*?"
        r"\.RXIMPL\((?P<rximpl>\d+)\).*?"
        r"\.RXCHUNK\((?P<rxchunk>\d+)\).*?"
        r"\.TXIMPL\((?P<tximpl>\d+)\).*?"
        r"\.TX_CLOCK_DIV\((?P<txdiv>[^)]+)\)",
    )
    for match in pattern.finditer(text):
        rximpl = "fast" if match.group("rximpl") == "1" else "generic"
        tximpl = "fast" if match.group("tximpl") == "1" else "generic"
        cases.append((
            match.group("case"),
            rximpl,
            match.group("rxchunk"),
            tximpl,
            scalar(match.group("txdiv")),
        ))
    return cases


def main() -> int:
    manifest = MANIFEST.read_text()
    tb_all = VERILOG_TB_ALL.read_text()
    expected = manifest_cases(manifest)
    actual = verilog_cases(tb_all)

    ok = True
    if expected != actual:
        ok = False
        print("ERROR: Verilog spwlink_tb_all case matrix does not match manifest", file=sys.stderr)
        print(f"expected {len(expected)} cases: {expected}", file=sys.stderr)
        print(f"actual   {len(actual)} cases: {actual}", file=sys.stderr)

    required_markers = [
        "reset_idle_assertions",
        "started_null_generation",
        "started_timeout",
        "connecting_fct_generation",
        "connecting_timeout",
        "autostart_to_run",
        "link_disable",
        "running_disconnect_error",
        "junk_signal_filtering",
        "unexpected_eop_reset",
        "timecode_and_data_receive",
        "double_escape_error",
        "eop_eep_receive",
        "credit_error",
        "parity_error",
        "inverted_strobe_start",
        "data_strobe_both_high",
    ]
    missing = [marker for marker in required_markers if marker not in manifest]
    if missing:
        ok = False
        print(f"ERROR: manifest missing stimulus markers: {missing}", file=sys.stderr)

    waiver_present = "verilog_spwlink_lightweight_stimulus" in manifest
    if not waiver_present:
        ok = False
        print("ERROR: missing waiver for non-stimulus-isomorphic Verilog bench", file=sys.stderr)

    if not ok:
        return 1

    print(f"PASS: spwlink parity manifest matches Verilog {len(actual)}-case configuration sweep")
    if waiver_present:
        print("NOTE: spwlink stimulus equivalence is still waived; full VHDL stimulus translation remains open")
    return 0


if __name__ == "__main__":
    sys.exit(main())
