"""Keep every example's original-script body and helper provenance aligned."""
from pathlib import Path
import re

ROOT = Path(__file__).resolve().parents[1]
names = ['ExampleName','FWHM_IR','Ipeak','FWHM_XUV','xuvHH','TrainFlag','EnergeticRange','ResE']
settings = re.compile(r'^('+'|'.join(names)+r')=[^;\n]+;',re.M)
canonical = settings.sub(r'\1=<example setting>;', (ROOT/'SFEXIS.m').read_text())
examples = sorted((ROOT/'examples').glob('SFEXIS_*.m'))
helpers = sorted((ROOT/'helpers').glob('*.m'))
if len(examples) != 3 or len(helpers) != 8:
    raise SystemExit('Expected three complete examples and eight original helpers.')
for file in examples:
    if settings.sub(r'\1=<example setting>;',file.read_text()) != canonical:
        raise SystemExit(f'Example calculation differs from SFEXIS.m: {file.name}')
for file in helpers:
    original = (ROOT/'legacy'/file.name).read_bytes()
    if file.name=='DipolestatCalculation1D.m':
        original=original.replace(b'function dipolestat1D=DipoleCalculation1D(',
                                  b'function dipolestat1D=DipolestatCalculation1D(')
    if file.read_bytes()!=original:
        raise SystemExit(f'Undocumented helper change: {file.name}')
print('PASS: all three example scripts share the full main-script body; all eight helpers preserve their source.')
