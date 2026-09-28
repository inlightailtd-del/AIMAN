# AIMAN Documentation Index

## Purpose
This folder is the source-of-truth specification for AIMAN. Code should follow these contracts.

## Documentation map
1. `01_MASTER_BLUEPRINT.md` — complete system vision and boundaries.
2. `02_BRAIN_SPECIFICATION.md` — reasoning, planning and decision architecture.
3. `03_MODEL_ROUTER.md` — model/provider abstraction and routing policy.
4. `04_MEMORY_RAG.md` — memory classes, retrieval and knowledge ingestion.
5. `05_MISSION_ENGINE.md` — goal-to-outcome execution state machine.
6. `06_AGENT_ARCHITECTURE.md` — agent contracts, workforce and delegation.
7. `07_RESEARCH_ENGINE.md` — zero-to-research discovery and evidence pipeline.
8. `08_AUTONOMOUS_EXECUTION.md` — zero-to-final-output build loop.
9. `09_TOOL_ENGINE.md` — tools, adapters, permissions and execution.
10. `10_SECURITY_APPROVALS.md` — risk, approvals, secrets and audit.
11. `11_DATABASE_SPECIFICATION.md` — canonical entities and relationships.
12. `12_VERIFICATION_QA.md` — verification, testing and recovery.
13. `13_COMMAND_CENTER.md` — operator dashboard requirements.
14. `14_ORACLE_ARCHITECTURE.md` — local/cloud deployment boundary.
15. `15_AI_CIVILIZATION.md` — isolated simulation architecture.
16. `16_IMPLEMENTATION_ROADMAP.md` — implementation sequence and gates.

## Documentation rule
Every feature must define purpose, inputs, outputs, dependencies, permissions, failure modes, tests, observability, and rollback/disable behavior.

## Naming
The product name is exactly `AIMAN`. Do not expand it into an acronym and do not rename it to Amon/Aman in technical documentation.

## Current implementation reference
The existing GitHub repository contains a Phase-0 FastAPI skeleton, a master build document, environment example, requirements, and a schema document. The new documentation extends that foundation rather than deleting it.

## Build rule
Do not implement large autonomous capabilities directly from chat. First update the relevant specification, then implement, test, verify, and record the result.
