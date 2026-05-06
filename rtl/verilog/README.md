SpaceWire Light Verilog 2001 RTL
=================================

This directory contains an in-progress Verilog 2001 translation of the
standalone SpaceWire Light core.

Scope
-----

Translated here:
 * spwram
 * syncdff
 * spwlink
 * spwxmit
 * spwrecv
 * spwrecvfront_generic
 * spwrecvfront_fast
 * spwxmit_fast
 * spwstream

Intentionally not translated here:
 * spwamba
 * spwambapkg
 * spwahbmst
 * LEON3/GRLIB-dependent synthesis and simulation wrappers

Interface note
--------------

The original VHDL uses package record types for link, receiver and
transmitter buses. Verilog 2001 has no equivalent struct type, so the
translated modules use flattened ports with names matching the original
record fields.

The VHDL top-level generics `sysfreq` and `txclkfreq` are real-valued.
The Verilog 2001 translation uses precomputed integer parameters instead:
`RESET_TIME`, `DISCONNECT_TIME` and `DEFAULT_DIVCNT`.

License
-------

The translated standalone Verilog RTL and benches carry:

 * `SPDX-License-Identifier: LGPL-2.1-or-later`
 * Original copyright: `Copyright (C) 2009-2013 Joris van Rantwijk`
 * Translation copyright: `Copyright (C) 2026 Leonardo Capossio - bard0 design`

Author: Leonardo Capossio - bard0 design - hello@bard0.com.

This translation is a modified form of SpaceWire Light. Keep the original
copyright and license terms from the repository root when distributing it.
