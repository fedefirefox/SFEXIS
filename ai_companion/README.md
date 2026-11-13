# SFEXIS AI companion

This folder holds the alternative function-based implementation for AI/GPT
assistance, parameter sweeps and numerical controls. Federico Vismarra's
original script workflow is the [main project](../README.md). The companion
uses explicitly defined Gaussian fields and trapezoidal quadrature; it is not
an identical copy of the original pulse generators or rectangular integration.

**Credit Federico Vismarra and cite** F. Vismarra, R. Borrego-Varillas, Y. Wu,
D. Mocci, M. Nisoli and M. Lucchini, “Ensemble effects on the reconstruction of
attosecond pulses and photoemission time delays,” *Journal of Physics: Photonics*
**4**, 034006 (2022), [doi:10.1088/2515-7647/ac7991](https://doi.org/10.1088/2515-7647/ac7991).
Keep the root [CITATION.md](../CITATION.md) and [CITATION.cff](../CITATION.cff)
with derivative work.

## Run from this folder

Set MATLAB's current folder to `ai_companion`, then:

```matlab
addpath(pwd,'examples');
result = minimal_streaking();
```

The example uses base MATLAB R2023b and writes `streaking.mat` and
`streaking.png` under `ai_companion/results/minimal_streaking/`. It refuses to
overwrite existing outputs; choose another directory for a saved rerun:

```matlab
result = minimal_streaking(fullfile('results','my_second_run'));
```

For in-memory calculations without figures or file writes:

```matlab
result = run_sfexis();
field_free = run_sfexis(struct('ir_intensity_Wcm2',0));
custom = run_sfexis(struct('delay_fs',-2:0.1:2,'energy_eV',20:0.25:55));
```

The default is a 25-delay × 101-energy constant-dipole example with a 250 as
XUV pulse centered at 50 eV, a 5 fs IR vector-potential envelope at 800 nm,
and peak IR intensity 10^12 W/cm². It uses the Ar threshold, not a quantitative
argon atomic dipole. `signal` and `normalized_signal` are delay × energy arrays.
Positive delay places the XUV later than the IR. Signal scale is arbitrary.

## Files and tests

| Path | Purpose |
| --- | --- |
| `run_sfexis.m` | Inputs, fields, units and output metadata |
| `sfexis_defaults.m` | Reference parameters |
| `sfexis_spectrum.m` | Constant-dipole SFA integral |
| `examples/minimal_streaking.m` | Saved example and preview |
| `tests/test_sfexis.m` | Eleven numerical and output tests |
| [docs/GUIDE.md](docs/GUIDE.md) | Equations, conventions, usage and original source audit |
| [docs/VALIDATION.md](docs/VALIDATION.md) | Actual results and limits |
| [ENVIRONMENT.md](ENVIRONMENT.md) | Environment and commands |

From `ai_companion`:

```matlab
results = runtests(fullfile(pwd,'tests'));
assertSuccess(results);
```

Add this directory and its `examples` only when using the companion. Avoid
adding the whole repository recursively. The primary scripts resolve their
own original helpers separately. Further AI/GPT automation and alternative
solver designs belong here, while the main workflow retains the user's script.

This is a single-point forward model. It does not implement ensemble averaging,
ePIE or photoemission-delay retrieval from the cited paper. The [original archive](../legacy/)
and [history record](../docs/PROVENANCE.md) remain at the repository root.
