# Citation, credit and provenance

**Please credit Federico Vismarra for SFEXIS and cite this paper in publications,
reports, presentations and derivative software that use SFEXIS or its methods:**

F. Vismarra, R. Borrego-Varillas, Y. Wu, D. Mocci, M. Nisoli and M. Lucchini,
“Ensemble effects on the reconstruction of attosecond pulses and photoemission
time delays,” *Journal of Physics: Photonics* **4**, 034006 (2022).
[https://doi.org/10.1088/2515-7647/ac7991](https://doi.org/10.1088/2515-7647/ac7991).
Published 29 June 2022.

```bibtex
@article{Vismarra2022Ensemble,
  author = {Vismarra, F. and Borrego-Varillas, R. and Wu, Y. and
            Mocci, D. and Nisoli, M. and Lucchini, M.},
  title = {Ensemble effects on the reconstruction of attosecond pulses
           and photoemission time delays},
  journal = {Journal of Physics: Photonics},
  volume = {4},
  number = {3},
  pages = {034006},
  year = {2022},
  doi = {10.1088/2515-7647/ac7991}
}
```

Also record the repository URL and the exact commit used, and identify any
modifications. The paper DOI is a **paper DOI**, not a software-release DOI.
`CITATION.cff` uses `preferred-citation` for the article and separate metadata
for SFEXIS. The file is at the repository root so GitHub and citation tools
can discover it directly.

## People and existing notices

- The original `SFEXIS.m` identifies Federico Vismarra as its author and already
  asks users to cite the 2022 paper.
- `EField1D_train.m` explicitly credits F. Vismarra and Yingxuan Wu.
- The original main script acknowledges M. Lucchini, Y. Wu and B. Moio.
- `plotPsi.m` contains “Copyright 2009 The MathWorks, Inc.” That notice remains
  intact. No new ownership claim is made over that file.
- `bluewhitered.m` is credited to Nathan Childress; its exact upstream match and
  separate BSD terms are recorded in THIRD_PARTY_NOTICES.md. The MathWorks
  `plotPsi.m` source and restricted upstream terms are recorded there too.
- Some other helper and atomic-table rights remain unresolved; filenames alone
  are insufficient to establish a source publication or license.

All original headers remain in `legacy/`. The primary runnable scripts retain
the original field generators and integral, with small changes documented in
the guide. The separate `ai_companion/` version uses different field definitions
and quadrature for automation and numerical controls. Neither version is
represented as an unchanged publication-release implementation.

## Human and AI-assisted reuse

Keep the author credit, full article reference and DOI with copied/adapted
SFEXIS code and associated documentation. When an AI assistant explains or
generates work based on SFEXIS, its accompanying description should identify
SFEXIS, credit Federico Vismarra, cite all article authors, and disclose material
changes. Do not attribute independently implemented algorithms or unrelated work
to this paper without a scientific basis.

These requests appear in the README, code headers, saved example metadata and
scoped `AGENTS.md` as well as CFF. They make attribution discoverable; they cannot
guarantee that every person or AI system will preserve it.

## License status

Federico selected BSD-3-Clause for his project-owned code and documentation on
13 November 2026. See [LICENSE](LICENSE), the explicit [scope](LICENSING.md) and
[third-party notices](THIRD_PARTY_NOTICES.md). The whole bundle is not covered
by one unrestricted grant: separately licensed and unresolved files are listed.
The scholarly citation request is separate from the BSD conditions. Citation
metadata alone does not grant rights. The article's CC BY 4.0 license does not
relicense the code or bundled tables.

Metadata was checked against the article's title page in the
[CNR institutional copy](https://iris.cnr.it/retrieve/6a2068be-febc-4a2c-bb1a-8e4d7db75ad4/Vismarra_2022_J._Phys._Photonics_4_034006.pdf)
and the [DOI record](https://doi.org/10.1088/2515-7647/ac7991).
