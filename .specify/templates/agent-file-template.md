# [PROJECT NAME] Development Guidelines

Auto-generated from all feature plans. Last updated: [DATE]

## Active Technologies

[EXTRACTED FROM ALL PLAN.MD FILES]

## Project Structure

```text
[ACTUAL STRUCTURE FROM PLANS]
```

## Context Compaction Practices

- Every document begins with the ADMS header + TL;DR (≤200 words) and links to deeper context.
- Keep artifact lengths within the Constitution context budgets; cite `.specify/short-term-memory/` digests for lengthy reasoning and retire them once merged.
- Use the risk tier recorded in plan.md (and, once ratified, the Risk-Tier Reference Matrix (RTRM)) to decide which optional artifacts to materialize.
- Register new prefixes (e.g., `GSFD`) in `.specify/memory/crossref_prefixes.md` before use to keep shorthand consistent.

## Commands

[ONLY COMMANDS FOR ACTIVE TECHNOLOGIES]

## Code Style

[LANGUAGE-SPECIFIC, ONLY FOR LANGUAGES IN USE]

## Recent Changes

[LAST 3 FEATURES AND WHAT THEY ADDED]

## Evidence & Observability Expectations

- Tier 0 work: include contract/unit/integration/concurrency/sanitizer/fuzz runs with log links.
- Tier 1 work: tailor the matrix but document every omission inside plan.md and tasks.md.
- Tier 2 work: at minimum, add regression or smoke coverage and note the command + output location.
- All tiers: define observability hooks (metrics/logging/tracing) before implementation per Principle 8.

<!-- MANUAL ADDITIONS START -->
<!-- MANUAL ADDITIONS END -->
