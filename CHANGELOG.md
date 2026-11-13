# SFEXIS release notes

This log records repository releases and the earlier source milestones. Release
numbers describe this standalone distribution; the original script's historical
`ALPHA 1.0` banner is retained and is not a tag for this release series.

## 0.1.0 — 13 November 2026

Initial documented standalone research release. SFEXIS is Federico Vismarra's
MATLAB **Strong Field Electron XUV Interaction Simulator**, a single-point
strong-field-approximation forward model for XUV photoemission in an IR field.

### Original script workflow

- Open `SFEXIS.m`, edit its visible settings and press Run. Preserve original
  section order, variable names, field helpers, velocity scan, reverse
  cumulative action and rectangular summation.
- Include complete same-body examples for an attosecond pulse train/RABBITT,
  isolated-pulse streaking and a field-free control. Only example settings differ.
- Reduce memory by removing an unused delay × time × energy allocation and
  reusing the common IR phase across delays. Keep the original integral.
- Resolve paths relative to the script, remove its keyboard pause, and save
  MAT/FIG/PNG results in unique folders without overwriting previous runs.
- Correct delay labels, one wrapped-sample boundary, the signed window
  diagnostic, zero-field plotting, a helper's declared name and a branch-local
  initialization. These explicit corrections can change results relative to
  the old mislabeled delay grid; see [the implementation guide](docs/GUIDE.md).
- Use coarser first-run energy/delay grids. Original settings remain editable;
  this is not a production convergence claim.

### AI companion, documentation and preservation

- Keep the alternative function-based implementation under `ai_companion/`,
  with its own example, eleven tests, environment and physics guide. It uses
  different Gaussian field definitions and trapezoidal quadrature.
- Preserve all 18 original files and import the two historical SFEXIS commits
  with their author information, dates and messages. No archived result is regenerated.
- Add README, physics/usage documentation, reproducible-environment instructions,
  archive hashes, citation metadata, CodeMeta and a short `llms.txt` discovery index.
- Adopt BSD-3-Clause for the identified project-owned material. Preserve verified
  third-party licenses and record unresolved permissions in
  [LICENSING.md](LICENSING.md) and [THIRD_PARTY_NOTICES.md](THIRD_PARTY_NOTICES.md).

### Validation and requirements

The numerical revision in [PR #2](https://github.com/fedefirefox/SFEXIS/pull/2)
passed **16 tests, 0 failed, 0 incomplete** on Windows MATLAB R2023b Update 5
and Ubuntu 22.04 MATLAB R2023b Update 11. All four full scripts ran and saved
outputs. Phase-reuse errors against the original dense matrix formula were
at most `3.49e-15`; field-free delay variation was `9.39e-13`. All 18 original
archive hashes, example-body/helper checks and CFF validation passed.
[Recorded numerical workflow](https://github.com/fedefirefox/SFEXIS/actions/runs/43477969769).

Base MATLAB runs the isolated-pulse and field-free examples and the companion.
The original pulse-train examples require Signal Processing Toolbox. Optional
smoothing branches require Curve Fitting Toolbox. GNU Octave is not tested.
See [ENVIRONMENT.md](ENVIRONMENT.md) and [validation details](docs/VALIDATION.md).

### Scope and known limitations

This release is a research forward simulator, not the complete ensemble
averaging/ePIE/pulse-and-delay retrieval pipeline from the associated paper.
Optional dipole branches, nonzero dispersion and the even-train branch are not
validated by the supplied examples. Atomic-table phase/source conventions and
some bundled-file permissions remain unresolved. Numerical agreement tests
the implementation within its stated model, not quantitative atomic accuracy.

### Citation

F. Vismarra, R. Borrego-Varillas, Y. Wu, D. Mocci, M. Nisoli and M. Lucchini,
“Ensemble effects on the reconstruction of attosecond pulses and photoemission
time delays,” *Journal of Physics: Photonics* **4**, 034006 (2022),
[doi:10.1088/2515-7647/ac7991](https://doi.org/10.1088/2515-7647/ac7991).
Also record the software tag and commit. The DOI belongs to the paper.

## Earlier source milestones — not tagged software releases

- **13 November 2026:** standalone migration ([PR #1](https://github.com/fedefirefox/SFEXIS/pull/1))
  and restoration of the primary script workflow ([PR #2](https://github.com/fedefirefox/SFEXIS/pull/2)).
- **18 November 2022:** original `SFEXIS.m` update in the upstream repository.
- **7 July 2021:** original source bundle uploaded upstream.
- **12 May 2020:** author date in the original script header; no release is
  inferred from that header alone.

The exact commit mapping is in [PROVENANCE.md](docs/PROVENANCE.md).
