# AIMAN Database Specification

## Core entities
Owners/users, businesses, projects, missions, tasks, agents, agent_versions, agent_executions, tools, tool_permissions, model_providers, model_configs, conversations, memories, memory_embeddings, documents, decisions, approvals, audit_events, integrations, devices and workflows.

## Mission entities
`missions` owns objective, state, risk, plan and acceptance criteria. `tasks` stores executable units. `agent_executions` stores each agent run and verification status.

## Memory entities
`memories` stores classified/scoped memories. `memory_embeddings` stores vectors and metadata. Source documents remain linked so knowledge can be corrected or removed.

## Security entities
`tool_permissions`, `approvals` and `audit_events` enforce and explain authority decisions.

## Project isolation
Every business/project-scoped record must carry a scope reference or be reachable through an ownership relationship. Queries must enforce scope before retrieval.

## Indexing
Index foreign keys, status/state, timestamps and frequent lookup keys. Add vector indexes after representative data exists and retrieval behavior is measured.

## Migrations
Use incremental versioned migrations. Never depend on manual production edits.

## Existing repository
The current project already has a Phase-0 `docs/schema.sql`. It should be audited against this specification before adding new migrations.

## Compatibility
Existing tables should be migrated rather than casually renamed or deleted. Preserve data and create compatibility migrations where needed.
