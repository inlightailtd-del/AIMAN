# AIMAN Brain Specification

## Purpose
The Brain coordinates understanding, reasoning, planning, decisions and delegation. It is a system layer, not one LLM.

## Pipeline
1. Parse user intent.
2. Identify desired outcome.
3. Extract constraints and permissions.
4. Load relevant memory and project context.
5. Detect missing knowledge.
6. Decide whether research is required.
7. Build a task graph.
8. Select agents and tools.
9. Execute under policy.
10. Verify outputs.
11. Recover or escalate failures.
12. Return a concise result plus evidence when useful.

## Core modules
- Intent parser
- Context builder
- Reasoning engine
- Planner
- Decision engine
- Delegation engine
- Model router interface
- Verification engine
- Recovery engine
- Policy engine

## Planning output
Every mission plan should contain objective, assumptions, constraints, dependencies, tasks, agent assignments, tools, acceptance criteria, risk level and completion conditions.

## Decision classes
`answer` = respond directly.
`research` = gather evidence first.
`execute` = perform authorized work.
`clarify` = ask when ambiguity materially changes the result.
`approve` = pause for owner approval.
`escalate` = stop safely when the system cannot verify or recover.

## Context discipline
The Brain should retrieve only relevant context and should identify source/scope for important facts. Project context outranks generic assumptions when the project specification is authoritative.

## Reasoning quality
AIMAN should separate known facts, assumptions, hypotheses, alternatives and decisions. It should expose uncertainty instead of inventing confidence.

## Recovery
Failures follow: observe -> diagnose -> choose safe fix -> execute -> retest -> verify -> escalate if unresolved.
