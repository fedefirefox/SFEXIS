# Source provenance and standalone migration

SFEXIS originated in
[`fedefirefox/Physics-and-Attosecond-Science`](https://github.com/fedefirefox/Physics-and-Attosecond-Science)
under `Basic_SFEXIS_SourceCode`. This standalone repository carries the complete
original bundle and the maintained example, tests and documentation prepared
from it. The original repository and its default branch were not rewritten.

## Original history

The source snapshot was inspected at
[`c85764f07abc484900e5aa2499e3e163d941b3a2`](https://github.com/fedefirefox/Physics-and-Attosecond-Science/tree/c85764f07abc484900e5aa2499e3e163d941b3a2/Basic_SFEXIS_SourceCode).
The two commits affecting the original SFEXIS directory were extracted with
`git subtree split --prefix=Basic_SFEXIS_SourceCode` at that snapshot. Author,
author date, committer, commit date and message are retained. Commit IDs change
because each extracted tree has SFEXIS at its root and excludes unrelated
projects.

| Original commit | Standalone history commit | Original date and message |
| --- | --- | --- |
| `8fdd3302ba474da809c52beaf60419a2376ba177` | `1abebc553a2b1fa43c6b68f5a2b210f12eb5c751` | 7 July 2021 — Add files via upload |
| `ed95d212088d82f46cb4a39830d983980a2ba7d5` | `feb1116f66e33472837d694bd075f5bfbeed8982` | 18 November 2022 — Update SFEXIS.m |

The extracted tip tree and the original directory tree are both
`f93edbc296fdb6bcf5087ab2e392d0e3a5bd3a81`. Moving that tree into `legacy/`
preserves all 18 original blob identities, including original line endings
and archived simulation files. `legacy-manifest.json` records their hashes and
original source repository; `tests/verify_legacy.py` checks the actual bytes.

## Maintained example and documentation

The initial tested reorganization was prepared in
[upstream PR #3](https://github.com/fedefirefox/Physics-and-Attosecond-Science/pull/3),
at commit `0104a9af7bcc585329a2d9e829d365f95ef97e32`. The standalone import moves
those maintained files from `SFEXIS/` to the repository root and adjusts paths,
repository links, the CI default branch, and citation validation for one root
`CITATION.cff`. The three numerical runtime files are unchanged. The example's
header comment is updated for the new layout.

At Federico's request, the primary workflow now restores the original full
script structure in `SFEXIS.m`, with complete same-body scripts in `examples/`
and the original helpers in `helpers/`. The original archive stays unchanged.
The function-based implementation described above has moved to `ai_companion/`
with its own example, tests and documentation. Its three numerical runtime
files are unchanged by that move. The primary guide lists every intentional
change to the runnable original-script copies.

The new repository does not import the other electromagnetism, HHG, TDSE or
historical thesis projects from the upstream repository. Their code is not a
dependency of the maintained SFEXIS example.

See the [original source audit](../ai_companion/docs/GUIDE.md#5-complete-source-and-dependency-audit),
[GUIDE.md](GUIDE.md) for the primary script, [VALIDATION.md](VALIDATION.md) for
tests and limits, and [CITATION.md](../CITATION.md) for Federico Vismarra's credit,
the complete 2022 article citation and preserved contributor notices.
