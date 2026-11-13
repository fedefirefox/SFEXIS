# MATLAB environment

Reference local runtime: **MATLAB R2023b Update 5**
(`23.2.0.2459199`) on Windows x86-64.

| Workflow | Required products |
| --- | --- |
| `SFEXIS.m` and `examples/SFEXIS_rabbitt.m` | MATLAB and Signal Processing Toolbox (`envelope`) |
| `examples/SFEXIS_streaking.m`, `examples/SFEXIS_field_free.m` | Base MATLAB |
| Optional tabulated/dynamic dipole branches | Curve Fitting Toolbox (`smooth`), plus the bundled tables/helpers; these branches remain unvalidated |
| `ai_companion/` | Base MATLAB; see its [environment document](ai_companion/ENVIRONMENT.md) |

Keep the repository together. The scripts find `helpers/` and the original
MAT files in `legacy/` relative to their own location, then restore the prior
MATLAB path after a successful run. Do not add the whole repository recursively
to the MATLAB path: there are deliberately separate original and companion
implementations.

To run a script from a terminal at the repository root:

```text
matlab -batch "SFEXIS"
matlab -batch "run('examples/SFEXIS_streaking.m')"
```

For all MATLAB tests:

```text
matlab -batch "results=[runtests(fullfile(pwd,'tests')),runtests(fullfile(pwd,'ai_companion','tests'))]; assertSuccess(results);"
```

The default scripts open figures; the automated script tests temporarily hide
figures and still save FIG/PNG outputs. MATLAB must be licensed. GNU Octave and
other MATLAB releases are not claimed as tested.

Python 3.12 or newer and Git support the archive and example consistency checks:

```text
python tests/verify_legacy.py
python tests/verify_script_copies.py
```

For citation validation, install PyYAML 6.0.3 and jsonschema 4.25.1 in an isolated
Python environment, then run `python tests/validate_citation.py`. An optional
argument supplies a local copy of the official CFF 1.2.0 schema for offline use.
Python is not required to run the MATLAB examples.

GitHub CI requests MATLAB R2023b with Signal Processing Toolbox on Ubuntu 22.04,
runs both MATLAB suites and all three Python checks, and retains the saved
example outputs. The workflow log records the exact MATLAB update installed.
