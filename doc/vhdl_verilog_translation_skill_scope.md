# VHDL-to-Verilog Translation Skill Scope

This repo exposed the workflow a reusable skill should encode: translate a
standalone VHDL RTL subset to Verilog 2001, then prove the result with layered
parity checks instead of relying on syntax and smoke tests.

## Skill Goal

Create a Codex skill, tentatively named `vhdl-to-verilog-parity`, for requests
such as:

* "translate this VHDL core to Verilog 2001"
* "port this HDL while preserving behavior"
* "add VHDL/Verilog parity checks"
* "compare GHDL and Icarus waveforms"

## Required Workflow

1. Identify the translatable RTL boundary.
2. Exclude vendor, bus-fabric, debug, and project-specific integration files
   unless the user explicitly asks to include them.
3. Translate leaf modules first, then controllers/wrappers, preserving reset
   semantics, clock domains, parameter ranges, and public interfaces.
4. Add translated test benches or matched parity benches for every translated
   behavioral surface.
5. Add CI gates in this order:
   * Verilog 2001 syntax/lint with Icarus.
   * Original VHDL regressions with GHDL.
   * Translated Verilog regressions with Icarus.
   * Deterministic trace comparison for matched benches.
   * Normalized VCD waveform comparison for selected public observables.
   * Synthesis/resource comparison for representative configurations.
6. State clearly which benches are exact parity benches and which are extra
   one-language coverage.

## Bundled Scripts

The skill should include reusable scripts rather than rewriting these each time:

* `compare_traces.py`: run paired benches and compare normalized `TRACE` lines.
* `compare_vcd_observables.py`: parse VCD from GHDL/Icarus, normalize timescale,
  map signal names, and compare selected observable signals over a common active
  window.
* `synth_resource_compare.py`: emit VHDL-derived Verilog with GHDL, synthesize
  both implementations with Yosys, and compare resource classes within declared
  tolerances.
* `bench_manifest.py` or a YAML schema: declare source lists, tops, waveform
  signal maps, expected exclusions, and simulator commands.

## References

Include short references for:

* VHDL-to-Verilog translation gotchas: delta cycles, enum encoding, record
  flattening, unresolved vs resolved signals, integer ranges, async resets,
  RAM inference, and generated clocks.
* VCD comparison limits: initial delta mismatches, simulator stop-time
  differences, hierarchy/name normalization, and when full internal waveform
  identity is unrealistic.
* CI templates for GHDL, Icarus Verilog, and Yosys.

## Current Repo Gap

This repository now has exact normalized waveform comparison for the matched
`streamtest_trace_tb` observables. It does not yet prove every signal in every
bench is waveform-identical. `spwlink_tb_all` is also not structurally identical:
the VHDL bench runs 23 configurations while the Verilog bench currently runs 8
shortened configurations. True all-bench waveform identity requires making each
translated bench isomorphic first, then adding a waveform manifest for each
matched pair.
