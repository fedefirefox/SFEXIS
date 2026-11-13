# Running and understanding the original SFEXIS scripts

The main project keeps Federico Vismarra's script workflow and calculation
structure. Open `SFEXIS.m` or an example, edit its settings and press **Run**.
The separate [AI companion guide](../ai_companion/docs/GUIDE.md) documents the
alternative function-based implementation; its new field definitions and
trapezoidal integration do not describe these primary scripts.

Credit Federico Vismarra and cite F. Vismarra, R. Borrego-Varillas, Y. Wu,
D. Mocci, M. Nisoli and M. Lucchini, *Journal of Physics: Photonics* **4**,
034006 (2022), [doi:10.1088/2515-7647/ac7991](https://doi.org/10.1088/2515-7647/ac7991).

## 1. Script layout

The original sequence is retained in every full script:

1. Startup and atomic-unit conversion constants.
2. IR, XUV, pulse-train, delay, atomic and energy settings.
3. Output directory and original colormaps.
4. IR field generation, time-window selection and XUV generation.
5. Field plots and the original atomic/dipole branches.
6. Delayed XUV matrix construction.
7. The original final-energy/velocity scan and strong-field integral.
8. Spectrogram plots and MATLAB data saving.

`SFEXIS.m` and the three `examples/SFEXIS_*.m` files contain the full
calculation. No example delegates to `run_sfexis` or hides its body in another
solver. The examples have identical code outside their selected settings;
`tests/verify_script_copies.py` checks that property.

The eight original helper files are copied into `helpers/`. All are unchanged
except the declared name in `DipolestatCalculation1D.m`, which now matches its
filename. Original MAT tables and colormaps are loaded from `legacy/` without
modifying them. The original main script and backup remain there unchanged too.

The complete inventory of the ten original MATLAB files and eight data/output
files is in the [source audit](../ai_companion/docs/GUIDE.md#5-complete-source-and-dependency-audit).

## 2. Settings and examples

| Setting | Main / RABBITT | Streaking | Field-free |
| --- | --- | --- | --- |
| `dt` | 0.01 fs | 0.01 fs | 0.01 fs |
| `FWHM_IR` | 20 fs | 5 fs | 5 fs (grid setting) |
| `lambda_IR` | 800 nm | 800 nm | 800 nm |
| `Ipeak` | 1e11 W/cm² | 1e12 W/cm² | 0 |
| `FWHM_XUV` | 0.1 fs | 0.25 fs | 0.25 fs |
| `xuvHH` | 21 | 33 | 33 |
| `TrainFlag` | 1 | 0 | 0 |
| `Extrapulses`, `odd` | 5, 1 | unused, retained | unused, retained |
| `FACTOR` | 20 (`dtau=0.2 fs`) | 20 | 20 |
| `EnergeticRange` | [5,30] eV | [15,65] eV | [15,65] eV |
| `ResE` | 0.25 eV | 0.5 eV | 0.5 eV |
| `Atomic`, `flagdipole` | 1 (Ar), 0 | 1, 0 | 1, 0 |

The main retains the original physical pulse settings and atomic selection.
Only `FACTOR` and `ResE` use faster first-run sampling (the archived values are
10 and 0.05 eV). Set them back in the visible settings block when needed.
This coarse grid is an example, not a converged production calculation.

`GDD_IR`, `TOD_IR`, `IR_CEP`, `GDD_XUV`, `TOD_XUV` and `XUV_CEP` remain in the
same places and are passed to the same original helpers. Dispersion controls
are retained; the supplied tests use zero dispersion. Custom field loading was
never implemented in the original placeholders: selecting `CustomIR=1` or
`CustomXUV=1` now stops with a clear message.

The original field generator constructs a Gaussian vector-potential spectrum,
inverse-transforms it, and obtains the electric field by a forward difference.
It normalizes both using the positive maximum of the electric field. Its
frequency grid, dispersion signs and normalization are preserved. Consequently,
the `FWHM` inputs should not be reinterpreted as the exact electric-field
intensity-envelope widths used by the AI companion. The original auxiliary
time span of ±5500 fs is also retained.

`EField1D_train` constructs the half-cycle-separated train using the original
Fourier shifts and alternating signs. It and the main script call `envelope`,
so the pulse-train examples require Signal Processing Toolbox. The original
approximate odd-train shaping is retained. The tested selection is `odd=1`;
the old `odd=0` branch, including its unpaired `toc`, is not newly validated.

## 3. The original integral

The code converts input times and energies using
`timeau = 0.02418884326505 fs` and `EAu = 27.21138624 eV`.
It uses the original field scaling `E0=sqrt(Ipeak/(3.51e16))`.
For final energy `E_fin(m)`, `v_au(m)=sqrt(2*E_fin(m)/EAu)`.

The original reverse cumulative action remains:

```matlab
tempIR2=(-tempIR(:,k)+tempIR); % k=1 here, as in the original
Saux=tempIR2+v_au(m);
Saux=0.5*flip(cumsum(flip(Saux.^2,2),2),2)*dt/timeau;
```

It is the rectangular discrete approximation to

```math
S_p(t)=\int_t^{t_f}\frac{[p+A(s)-A(t_0)]^2}{2}\,ds.
```

The original amplitude and spectrum expressions remain:

```matlab
arg=dip.*exp(-1i*Saux).*exp(1i*Ip/EAu*(T-tmin/timeau)).*EXUVfin;
av(:,m)=-1i*sum(arg,2)*dt/timeau;
WE(:,m)=abs(av(:,m)).^2*v_au(m);
```

No new field model, action sign, dipole phase or quadrature rule is substituted.
For the examples `dip=1`. `WE` is an arbitrarily scaled, momentum-weighted
signal; `fp=WE/max(WE(:))` normalizes the entire trace once. It is not an
absolute ionization probability. The retained factor `p` is consistent with
converting a directional 3D momentum density to energy per solid angle;
it is not the inverse-momentum Jacobian of a strictly 1D momentum density.

Positive labelled delay shifts the XUV later on the time grid. The script
still uses integer `circshift` operations and removes wrapped samples. The
delay labels now match the actual shifts. Choose delay steps and endpoints
that are multiples of `dt`; an assertion catches inconsistent settings.

## 4. Small changes to the script

The complete diff can be inspected against `legacy/SFEXIS.m`.

- **Memory and speed:** remove the unused `EatomicReal` tensor and per-energy
  `whos` call. Keep the common IR field, time and action as one row and let
  MATLAB reuse that phase across the delayed XUV rows. Keep the outer velocity
  loop, `cumsum` action and `sum` integration. Use `clearvars` so compiled
  helper functions can remain cached. Reduce progress-print frequency.
- **Automatic startup and paths:** remove the keyboard pause, find helpers/data
  relative to the script, use `fullfile`, and save without changing the working
  directory. The script still clears its workspace and closes figures, as the
  original did. Data are saved under a new timestamp to preserve earlier runs.
- **Delay correction:** replace the row-index-dependent shift with
  `round(delay(k)/dt)`, center the labelled axis, and clear exactly the number
  of wrapped samples at negative shifts. This corrects the old offset and one
  boundary index; it can change traces relative to the mislabeled old grid.
- **Window diagnostic:** use `trapz(tSim/timeau,Asim_IR)` and its absolute value
  instead of testing a signed, unscaled sum. This can select a different window
  for other settings. It is still a diagnostic, not a general convergence proof.
- **Small runtime fixes:** permit a zero-IR plot, define `UR` inside the
  hydrogenic branch, and match the dipole helper's declared function name to
  its file. The last two fixes do not establish physical validity of that branch.
- **Outputs:** keep `WE`, `fp`, `delay`, `E_fin` and the original FIG outputs;
  also save `av`, fields, settings, runtime and citation, plus a PNG preview.

Seven of the eight helpers are byte-identical to their originals. The eighth
differs only in the function-name correction. All 18 archive files are still
byte-identical to the original bundle. Repeating the same script body across
examples is intentional: it preserves the requested editing and Run workflow.

## 5. Validation and remaining limits

The tests run all four complete scripts, compare their complex amplitudes with
the original unoptimized matrix formula on shared fields and delay samples,
check the field-free control, compare the two identical train configurations,
and verify saved files. This tests the phase-reuse optimization directly.
It does not claim byte-identical output to the old mislabeled delay grid or
validate every optional branch. See [VALIDATION.md](VALIDATION.md).

The hydrogenic and tabulated dipole code is retained in place. The custom
branch still reads argon data and retains its original phase conversion;
`dipoleShift` retains its existing interpolation, smoothing and sign convention.
Those conventions and the data provenance need separate scientific verification
before quantitative atomic-delay use. Curve Fitting Toolbox is needed for the
branches that use `smooth`. `plotPsi` still lacks `autoThreshold` for its
automatic-threshold mode; the main script supplies explicit thresholds.

The model is single-point SFA with the original atomic approximations. The
default constant dipole carries no atomic phase. Ensemble averaging, ePIE and
photoemission-delay retrieval are not present in this source bundle. Production
use requires sampling, window, dipole and physical-model checks appropriate to
the intended experiment.
