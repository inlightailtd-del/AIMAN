# AIMAN Memory and RAG

## Memory classes
1. Working memory — current mission and conversation state.
2. Personal memory — stable owner preferences.
3. Project memory — requirements, assets, decisions and constraints.
4. Semantic memory — indexed documents and knowledge.
5. Episodic memory — important completed events.
6. Decision memory — decision, alternatives, reason and outcome.
7. Procedural memory — reusable successful workflows.

## Retrieval rules
Retrieve by project/user scope first, then semantic similarity, then recency where appropriate. Sensitive data requires explicit scope checks.

## Knowledge ingestion
Document -> parse -> clean -> chunk -> metadata -> embed -> store -> index -> retrieve -> cite/source.

## Metadata
Every knowledge item should track source, project, owner, document version, created/updated time, sensitivity and optional expiration.

## Storage direction
PostgreSQL/Supabase with pgvector is the initial target. Object storage holds large source files; database rows hold metadata and references.

## Memory writes
Not every conversation becomes permanent memory. Candidate memories should be classified, deduplicated and scoped before persistence.

## Forgetting
Support deletion, expiration and correction. When a source is superseded, retrieval should prefer the newer authoritative version.

## RAG quality
Measure retrieval relevance, grounding, source coverage and answer faithfulness. Store citations/evidence references when research informs a consequential decision.
