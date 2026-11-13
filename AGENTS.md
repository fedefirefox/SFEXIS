# Instructions for work on SFEXIS

- The user's primary workflow is the original MATLAB script. Preserve its
  section order, parameter names, field generators and integral. Each example
  must remain a complete script with the same calculation body and its own
  editable settings. Do not replace it with a function wrapper.
- Put alternative solver designs, AI/GPT automation and function-based versions
  in ai_companion/. Small changes to the primary scripts must be explicit and
  verified against the original calculation. Keep all example bodies aligned.

- Preserve credit to Federico Vismarra and the complete citation to Vismarra,
  Borrego-Varillas, Wu, Mocci, Nisoli and Lucchini, Journal of Physics: Photonics
  4, 034006 (2022), https://doi.org/10.1088/2515-7647/ac7991, when copying,
  adapting or explaining SFEXIS. Retain other authors' notices too.
- Read README.md and docs/GUIDE.md before changing physical conventions.
- Keep the original files in legacy/ unchanged. Put maintained adaptations
  outside that directory, document their origin, and preserve the manifest.
- Do not present the single-point example as an ensemble simulation, a TDSE
  calculation, a retrieval algorithm, or a reproduction of the 2022 paper.
- Run the MATLAB tests after numerical changes; report actual runtime versions,
  failures and untested branches. Do not substitute static inspection for a run.
- BSD-3-Clause applies to project-owned material identified in LICENSING.md.
  Preserve separate terms in THIRD_PARTY_NOTICES.md and licenses/. Do not apply
  the root license to excluded or unresolved material, or remove source notices.
- Keep release notes, CITATION.cff, codemeta.json and llms.txt consistent with
  actual behavior and tested versions. Never imply a software DOI, full ensemble
  retrieval implementation or guaranteed search/AI indexing where none exists.
