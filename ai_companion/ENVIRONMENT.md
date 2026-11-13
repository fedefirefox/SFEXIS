# AI companion environment

Base **MATLAB R2023b** is sufficient for this folder's numerical functions,
graphics export and eleven `matlab.unittest` tests. Local validation used
R2023b Update 5 (`23.2.0.2459199`) on Windows x86-64. The dependency analyzer
reports only MATLAB for `run_sfexis.m`. No external dataset, MEX library,
parallel pool, Python runtime or additional MATLAB toolbox is needed here.

Set the terminal's current directory to `ai_companion`, then:

```text
matlab -batch "addpath(pwd,'examples'); minimal_streaking();"
matlab -batch "results=runtests(fullfile(pwd,'tests')); assertSuccess(results);"
```

Alternatively, from the repository root, run just the companion tests with:

```text
matlab -batch "results=runtests(fullfile(pwd,'ai_companion','tests')); assertSuccess(results);"
```

The root [environment document](../ENVIRONMENT.md) covers both workflows,
the original script's toolbox requirements, archive/citation checks and CI.
Signal Processing Toolbox is installed in CI for the primary pulse-train
scripts; this companion does not use it. MATLAB must be installed and licensed.
GNU Octave and older MATLAB releases have not been tested.
