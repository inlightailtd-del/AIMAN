# Aiman

AI Business Operating System for INLIGHT AI Agency + Lumapix GmbH.
Jarvis-style assistant: CEO, strategist, dost — sab ek jagah.

## Status: Phase 0 (Foundation)

See `/docs/AIMAN_MASTER_DOCUMENT.md` for full vision, architecture,
46-category feature list, and phase-by-phase build prompts.

## Quick Start

```bash
python -m venv venv
source venv/bin/activate  # or venv\Scripts\activate on Windows
pip install -r requirements.txt
cp .env.example .env      # then fill in your actual keys
python main.py
```

Visit `http://localhost:8000/health` to confirm it's running.

## Structure

```
/agents         — each companion (CEO, Client Intel, Content, etc.)
/orchestrator   — core routing/reasoning logic (Aiman's "brain")
/memory         — pgvector embedding + retrieval logic
/interface      — WhatsApp webhook handler
/docs           — architecture docs, agent specs, decision log
/tests
```

## Build Order

Follow the master document's phase order. Don't skip ahead — each
prompt depends on the previous one working. Phase 0 = this skeleton +
database schema (docs/schema.sql) + memory layer. Phase 1 = orchestrator
+ WhatsApp + first 3 agents.
