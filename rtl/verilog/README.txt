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
 * spwstream, generic RX/TX path only

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

Fast-mode note
--------------

The generic-clock path is available in this first pass. The `spwstream`
wrapper currently instantiates `spwxmit` and `spwrecvfront_generic`;
`spwxmit_fast` and `spwrecvfront_fast` remain to be translated.

License
-------

This translation is a modified form of SpaceWire Light. Keep the original
copyright and license terms from the repository root when distributing it.
