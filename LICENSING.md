# Licensing and reuse

Federico Vismarra selected **BSD-3-Clause** on 13 November 2026 for the SFEXIS
code and project material he owns. The standard terms are in [LICENSE](LICENSE).
This document defines their scope. The repository is a **mixed-license bundle**;
the root license is not a grant over every imported file.

## Files covered by the project license

The BSD-3-Clause grant covers Federico's original SFEXIS code and the maintained
project additions in these paths:

- `SFEXIS.m` and `examples/SFEXIS_*.m`.
- `helpers/EField1D.m` and `helpers/DipolestatCalculation1D.m`.
- `legacy/SFEXIS.m`, `legacy/backup30Ottobre.m`, `legacy/EField1D.m` and
  `legacy/DipolestatCalculation1D.m`. Licensing is recorded here without changing
  their archived bytes or historical commits.
- `ai_companion/`, `tests/`, `.github/`, and project-authored documentation and
  metadata at the root and under `docs/`, excluding copied third-party notices
  and third-party content identified below.

Existing third-party rights and notices take precedence for their material.
Authorship credit to collaborators does not transfer their copyright.

## Other bundled material

| Paths (both `helpers/` and `legacy/`, where present) | Terms / status |
| --- | --- |
| `bluewhitered.m` | Nathan Childress, copyright 2009; upstream two-condition BSD terms in [the preserved license](licenses/bluewhitered.txt) |
| `plotPsi.m` | The MathWorks, Inc.; [upstream license](licenses/plotPsi.txt) restricts use, including modifications, to MathWorks products and service offerings |
| `EField1D_train.m` | Jointly credited to Federico Vismarra and Yingxuan Wu. The root license does not establish permission for another author's contribution; full-file licensing remains unresolved |
| `AssociatedLaguerre.m`, `AssociatedLegendre.m`, `dipoleShift.m` | No full authorship/license record was supplied; excluded from the project grant pending provenance confirmation |
| All original MAT and FIG files under `legacy/` | Table, colormap and historical-output rights are not established by the code license; excluded pending confirmation |

[THIRD_PARTY_NOTICES.md](THIRD_PARTY_NOTICES.md) records the source comparisons,
copyright holders, exact upstream license files and remaining gaps. Do not infer
that an unresolved file is public domain or covered by BSD because it is bundled.
The original-script examples load bundled colormaps; the train example also uses
the jointly credited train helper. The independent `ai_companion/` example does
not load those legacy assets. MATLAB and its toolboxes have their own vendor
licenses, which this repository does not supply.

## Credit and citation

For licensed project code, retain the copyright notice, license conditions and
disclaimer; do not imply endorsement. Please also credit Federico Vismarra and
cite the complete six-author article in [CITATION.md](CITATION.md) when using
SFEXIS in research, derived software, teaching or AI-assisted explanations.
The scholarly citation request is separate from the BSD license conditions;
it is not an extra license restriction. The same distinction applies to AI use.

The article DOI identifies the publication, not a software release. The paper's
CC BY 4.0 license does not relicense this software or the atomic tables. For an
exact software version, record the repository URL, release tag and commit.

For unresolved permissions, contact the relevant rights holder. The repository's
[issue tracker](https://github.com/fedefirefox/SFEXIS/issues) can track provenance
corrections; opening an issue does not itself grant permission.
