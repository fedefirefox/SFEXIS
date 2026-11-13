# Validation of the original-script workflow

Date: **13 November 2026**. Local runtime: MATLAB R2023b Update 5,
`23.2.0.2459199`, Windows x86-64, with Signal Processing Toolbox.

All four complete scripts ran successfully. The original-script suite passed
**5 tests, with 0 failed and 0 incomplete**:

| Execution | First recorded elapsed time | Output size |
| --- | --- | --- |
| `SFEXIS.m` | 8.27 s | 201 delays × 101 energies |
| `examples/SFEXIS_rabbitt.m` | 3.00 s | 201 × 101 |
| `examples/SFEXIS_streaking.m` | 1.68 s | 51 × 101 |
| `examples/SFEXIS_field_free.m` | 1.40 s | 51 × 101 |

These times include script execution, plots and file saving, but exclude MATLAB
startup. The first run initializes graphics and helper functions. They are not
a controlled speed comparison with the old script.

The direct comparison with the original full matrix formula gave relative
complex-amplitude errors of `3.49e-15`, `3.49e-15`, `2.72e-16` and `8.46e-17`,
respectively (acceptance limit `1e-12`). This comparison uses the same generated
fields, labelled delays and selected energy samples to isolate the phase-reuse
optimization. It does not include the old delay-label offset or wraparound bug.

The root and RABBITT example produced identical `WE` arrays. The field-free
trace's relative delay-invariance error was `9.39e-13` (limit `1e-8`). The
streaking energy centroid varies by more than 2 eV across delay. All outputs
were finite and nonnegative; normalized maxima were one. MAT, FIG and PNG
outputs were created, and the train/streaking previews were visually inspected.

The Python checks passed: all three example bodies match the main script
outside settings, all eight helpers match their documented source edits, and
all 18 archived files retain their original Git blob hashes. Citation validation
passed against the official CFF 1.2.0 schema and the expected article metadata.

After moving the companion, the combined command in `ENVIRONMENT.md` completed
successfully: **16 passed, 0 failed, 0 incomplete** (five original-script tests
and eleven companion tests). The companion's numerical results remained the
same as its [detailed record](../ai_companion/docs/VALIDATION.md). The first
combined command used vertical concatenation for differently sized result rows;
that reporting error was corrected to horizontal concatenation and rerun with
exit status zero. CI runs the same combined command.

Remaining limits: the optional dipole branches, nonzero dispersion, `odd=0`
train branch, custom fields and arbitrary user parameter choices are not
covered by the provided script runs. No new ensemble or inverse-retrieval
calculation was added. Numerical consistency does not establish independent
physical accuracy of the SFA or unresolved tabulated atomic phases.
