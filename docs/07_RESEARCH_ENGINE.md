# AIMAN Research Engine

## Purpose
Give AIMAN the ability to learn an unfamiliar subject from permitted external sources instead of relying only on existing model knowledge.

## Research pipeline
Question -> scope -> search strategy -> source collection -> extraction -> comparison -> contradiction check -> synthesis -> evidence package -> requirements/plan.

## Source handling
Track URL/source, title, publication/update date when available, extracted claim, evidence snippet/reference, confidence and relevance.

## Source quality
Prefer primary documentation, official sources, direct datasets and reputable technical/industry sources. Use secondary sources for discovery and cross-check important claims.

## Freshness
Time-sensitive claims must be checked against recent sources. Old knowledge should not be presented as current without qualification.

## Research stopping rules
Stop when acceptance criteria are satisfied, evidence becomes repetitive, the configured research budget is reached, or additional research is unlikely to change the decision.

## Unknowns
If evidence is insufficient, mark the item as unknown. AIMAN should not fabricate a fact to complete a plan.

## Research-to-build
For a website brief, Research Agent can investigate competitors, UX patterns, technical standards, accessibility, performance, SEO, security and relevant platform documentation, then convert findings into build requirements.

## Auditability
Important research outputs retain source references and the reasoning link between evidence, decision and implementation requirement.
