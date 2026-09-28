# AIMAN Agent Architecture

## Agent contract
Each agent declares identity, purpose, inputs, outputs, tools, permissions, model requirements, success criteria, failure policy, version and evaluation tests.

## Core agents
- Research Agent — discovery, evidence and source comparison.
- Developer Agent — code, debugging and implementation.
- Designer Agent — UX/UI and visual specifications.
- QA Agent — tests, inspection and acceptance verification.

## Business agents
CEO/Strategy, Sales, Marketing/Content, CRM Intelligence, Finance, Support, HR, Legal/Compliance and Analytics.

## Operations agents
DevOps, Automation/n8n, Browser/Computer Operator and Security/Audit.

## Delegation
Brain creates a task graph and Agent Manager assigns the smallest suitable agent with the least privilege needed.

## Agent communication
Prefer structured task contracts over free-form agent-to-agent chat. Every handoff contains objective, context, constraints, expected output and verification criteria.

## Agent creation
Future AIMAN versions may generate an agent specification from a missing capability, evaluate it in a sandbox, and register it only after policy and tests pass.

## Isolation
Agents receive only required project context and tool permissions. One agent's credentials or unrestricted context must not automatically become available to another.

## Evaluation
Track task success, verification pass rate, correction rate, latency, tool errors and owner feedback.
