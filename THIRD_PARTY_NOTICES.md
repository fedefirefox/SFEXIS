# Third-party notices and provenance

Audit date: **13 November 2026**. Original files remain byte-identical in
`legacy/`; working helper copies retain their existing source notices.
The project BSD-3-Clause grant is scoped in [LICENSING.md](LICENSING.md).

## bluewhitered

- Author/copyright holder: **Nathan Childress**, copyright 2009.
- Source: [MATLAB Central submission 4058](https://www.mathworks.com/matlabcentral/fileexchange/4058-bluewhitered), version 1, published 14 October 2003.
- The official downloaded `bluewhitered.m` is **byte-identical** to both bundled copies.
- Preserve [licenses/bluewhitered.txt](licenses/bluewhitered.txt), copied from the
  downloaded package's `license.txt`, with redistribution. These are the
  upstream two-condition BSD terms (BSD-2-Clause), not Federico's BSD-3-Clause.
- [Audited archive](https://www.mathworks.com/matlabcentral/mlc-downloads/downloads/submissions/4058/versions/1/download/zip)
  SHA-256: `7b2430141fdcd6a3e2f6aa9dee46b02e43e103ceca16a304c09715d089fe618f`.

## plotPsi

- Existing source notice: **Copyright 2009 The MathWorks, Inc.**
- Source: [Hydrogenic Wavefunction Visulization Tool, submission 26218](https://www.mathworks.com/matlabcentral/fileexchange/26218-hydrogenic-wavefunction-visulization-tool),
  upstream version 1.3.0.1 (download version 5), updated 1 September 2016.
  The submission is published by Jos Martin and credits code written by
  Chris Ballance during a MathWorks internship, developed with Oxford Physics.
- After ignoring line-ending differences, the bundled file differs only in
  two `patch` calls: its outer surface is blue and inner surface red; the
  upstream colors are reversed. No other source changes were found.
- Preserve [licenses/plotPsi.txt](licenses/plotPsi.txt), copied from the package.
  Its notice is copyright 2016 The MathWorks, Inc.; the original file's 2009
  notice is also retained. The license permits redistribution subject to its
  conditions and restricts use and derivatives to MathWorks products and
  service offerings. It is **not the project BSD-3-Clause license**.
- [Audited archive](https://www.mathworks.com/matlabcentral/mlc-downloads/downloads/submissions/26218/versions/5/download/zip)
  SHA-256: `84ef4fe2d1e50bf59dc282b8b84c7c06691236341d99b99fec915e226e9d6f36`.

## Other original contributions and assets

`EField1D_train.m` credits Federico Vismarra and Yingxuan Wu. The original main
script acknowledges M. Lucchini, Y. Wu and B. Moio. These credits remain intact.
Joint-helper licensing is not resolved by Federico licensing his own work.

`AssociatedLaguerre.m`, `AssociatedLegendre.m` and `dipoleShift.m` do not provide
a complete authorship and redistribution record. No source publication or
license is inferred from their names or mathematical formulas.

The original atomic tables (`Ar_DipoleT_Khe.mat`, `Ar_DipoleT_Transition_Mixed.mat`,
`Ne_DipoleT_Khe.mat`), colormaps (`jet_white.mat`, `ePie_map.mat`) and three
historical simulation files have no established separate redistribution terms
in the inspected bundle. Their inclusion does not imply permission from all
rights holders. They are outside the project license grant. The exact inventory
and hashes remain in [docs/legacy-manifest.json](docs/legacy-manifest.json).

No archive file is rewritten to add these notices. Keep this document and the
`licenses/` directory with copies of the affected files. Further verified
provenance can be added without rewriting the research record.
