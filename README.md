# SFEXIS — Strong Field Electron XUV Interaction Simulator

SFEXIS is Federico Vismarra's MATLAB code for XUV photoemission in an IR field.
The main workflow follows the original script: edit the parameters near the
top, press **Run**, and inspect the fields and photoelectron spectrogram.

**Credit Federico Vismarra and cite:** F. Vismarra, R. Borrego-Varillas, Y. Wu,
D. Mocci, M. Nisoli and M. Lucchini, “Ensemble effects on the reconstruction
of attosecond pulses and photoemission time delays,” *Journal of Physics:
Photonics* **4**, 034006 (2022),
[doi:10.1088/2515-7647/ac7991](https://doi.org/10.1088/2515-7647/ac7991).
See [CITATION.md](CITATION.md) and [CITATION.cff](CITATION.cff).

## Open a script and run it

Download or clone the **whole repository**, open [SFEXIS.m](SFEXIS.m) in MATLAB,
and press **Run**. It finds the bundled helpers and data automatically, keeps
the original section layout and leaves `WE`, `fp`, `av`, `delay`, `E_fin` and
the fields in the workspace. No function arguments or configuration object
are required.

Each example is a full copy of that same script, with different parameter
values. The actual calculation is visible in every file:

| Script | Example | MATLAB requirements |
| --- | --- | --- |
| [SFEXIS.m](SFEXIS.m) | Original pulse-train configuration, faster sampling for a first run | MATLAB + Signal Processing Toolbox |
| [examples/SFEXIS_rabbitt.m](examples/SFEXIS_rabbitt.m) | The same pulse-train example | MATLAB + Signal Processing Toolbox |
| [examples/SFEXIS_streaking.m](examples/SFEXIS_streaking.m) | Isolated XUV pulse with IR streaking | Base MATLAB |
| [examples/SFEXIS_field_free.m](examples/SFEXIS_field_free.m) | The same isolated pulse with the IR turned off | Base MATLAB |

The scripts use the original `EField1D`/`EField1D_train` helpers, reverse
cumulative action and rectangular summation. They do not call the alternative
function-based solver. The default examples use `flagdipole=0`.

From the repository root, the command-line equivalents are:

```matlab
SFEXIS
run('examples/SFEXIS_streaking.m')
run('examples/SFEXIS_field_free.m')
```

Each run writes to `results/<example>/<timestamp>/`: `Wetot.mat`,
`XUVIRField.fig`, `WeFINALE.fig` and `WeFINALE.png`. The MAT file retains the
original output names and also records the input settings, fields, complex
amplitudes, MATLAB version and citation. Like the original script, a run clears
its workspace and closes existing figures. The `.m` file needs the bundled
`helpers/` and `legacy/` directories; it is not a single-file download.

## What was kept and what changed

The original comments, section order, parameter names, atomic selector,
field-generation code, dipole branches, velocity scan and plotting structure
are retained. Small changes remove an unused large allocation, reuse the
delay-independent phase, resolve paths automatically and fix delay labeling,
one wraparound index, a zero-field plot limit and two naming/initialization
issues. The initial energy/delay sampling is coarser for a quick run; it is
editable in the same settings block. The full list is in
[docs/GUIDE.md](docs/GUIDE.md).

The unedited original bundle remains in [legacy/](legacy/), including all 18
source/data/output files and their historical Git commits. Working helpers
are in [helpers/](helpers/). [PROVENANCE.md](docs/PROVENANCE.md) records the import.

## AI companion and automation

The separate [ai_companion/](ai_companion/README.md) folder contains the
function-based version for AI/GPT assistance, automated parameter sweeps and
numerical controls. Its field definitions and quadrature differ from the
original scripts. Its implementation, examples, tests and documentation live
inside that folder; it does not replace the primary script workflow.

## Tests and scope

On MATLAB R2023b, run both suites from the repository root:

```matlab
results = [runtests(fullfile(pwd,'tests')), ...
           runtests(fullfile(pwd,'ai_companion','tests'))];
assertSuccess(results);
```

The script suite executes all four complete scripts and compares the optimized
calculation with the original matrix formula. Additional checks ensure the
example bodies stay identical, helper edits are documented, and the original
archive and citation remain intact. See [ENVIRONMENT.md](ENVIRONMENT.md) and
[VALIDATION.md](docs/VALIDATION.md) for requirements and actual results.

These are single-point forward simulations. The full ensemble averaging and
pulse/delay retrieval from the cited paper are not included. Optional dipole
branches retain unresolved phase/provenance questions and are not validated by
the constant-dipole example tests. The existing license status and contributor
notices are preserved; see [CITATION.md](CITATION.md).
