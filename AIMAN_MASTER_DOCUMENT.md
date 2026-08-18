# AIMAN — Complete Build Master Document
**Shuru se end tak: Vision, Architecture, Saari Functionalities, Phases, aur Har Phase ke Build Prompts**

---

# PART 1: VISION & MISSION

## Vision
Aiman ek Generic Business Operating System hai — kisi bhi business (real estate, agency, restaurant, retail) ko chalane ke liye ek complete AI-powered team. Ek insaan, poori company ke barabar operate kar sake.

## Mission
1. Solo founders ko team ke barabar power dena
2. Memory jo kabhi na bhoole — permanent business context
3. Voice + text dono se natural interaction
4. Har business type ke liye adapt ho (generic core + vertical packs)
5. Progressively autonomous, hamesha auditable
6. 20 saal chale — modular, upgradable, provider-agnostic

## Reference Point
Zoey OS (zoeyos.com) jaisa multi-companion system, lekin Pakistan/WhatsApp-native, PKR pricing, Urdu/Hinglish support — niche-specific advantage ke sath.

---

# PART 2: SYSTEM ARCHITECTURE

```
+-----------------------------------------------+
|  LAYER 6: PLATFORM (multi-tenant, billing)     |
+-------------------------------------------------+
|  LAYER 5: INTERFACE                            |
|  WhatsApp / Voice / Web Dashboard / Mobile     |
+-------------------------------------------------+
|  LAYER 4: PERSONALITY ENGINE                   |
|  Dost / CEO / Strategist / Research modes      |
+-------------------------------------------------+
|  LAYER 3: ORCHESTRATOR (Aiman's Brain)         |
|  Intent routing, reasoning, risk-check         |
+-------------------------------------------------+
|  LAYER 2: COMPANIONS (specialized agents)      |
|  CEO | Client Intel | Content | Sales |        |
|  Marketing | Finance | Support | Research      |
+-------------------------------------------------+
|  LAYER 1: MEMORY & DATA                        |
|  Supabase (Postgres + pgvector)                |
+-----------------------------------------------+
```

**Tech stack:** FastAPI, Supabase (Postgres+pgvector), Claude API, WhatsApp Business API, n8n (automation), Next.js (dashboard, later)

**Core design principles:**
- Provider-agnostic (LLM swappable — Claude/GPT/Ollama)
- Plugin-based companions (add/remove without breaking core)
- Risk-based autonomy (low=auto, medium/high=approval needed)
- Self-improvement via decisions_log pattern analysis (not self-rewriting code)
- Documentation-first (every agent has a spec)

---

# PART 3: COMPLETE FEATURE LIST (46 Categories)

1. Personal Assistant (tasks, calendar, reminders, notes, email, files)
2. CEO/Strategist (briefings, decisions, risk flags, goal tracking)
3. Client & CRM Intelligence
4. Lead Generation & Sales (real estate pack: instant response, qualification, seller-signals, CMA)
5. Marketing & Content (calendar, captions, visuals, campaign analysis)
6. Finance (invoicing, revenue reports, forecasting)
7. Research & Intelligence (web research, document analysis, trends)
8. Automation & Workflows (n8n, trigger-based, approval flow)
9. Software/Dev Capability (advanced — requirements to code)
10. Communication Layer (WhatsApp, Voice, Dashboard, multi-language)
11. Memory & Learning (permanent context, pattern detection, self-tuning)
12. Team/Agent Management (multi-agent coordination)
13. Security & Access (risk approval, audit trail, RBAC)
14. Reporting & Analytics (KPI dashboard, auto-reports)
15. Customer Support (24/7 chatbot, ticket triage)
16. HR & Team Management (resume screening, onboarding)
17. Legal & Compliance (contract review, templates, reminders)
18. Meetings & Communication (transcription, action items)
19. Brand & Reputation Monitoring
20. E-commerce/Website Ops
21. Personal Growth Layer (habits, learning, journaling)
22. Visual/Creative Generation (images, video scripts, decks)
23. Data & Forecasting (sales prediction, dynamic pricing)
24. Integration Layer (Google, Slack, accounting, payment gateways)
25. Proactive Intelligence (unprompted alerts, opportunity spotting)
26. Multi-Business Support (INLIGHT + Lumapix + future, context-aware)
27. Multi-Tenancy & Business Accounts
28. App/Skill Marketplace
29. Developer Platform (API/SDK)
30. Billing & Subscription Engine
31. Admin Control Panel
32. Security & Compliance (encryption, GDPR, audit logs)
33. Notification System (push, email, SMS)
34. Cross-Platform Presence (mobile app, browser extension, widget)
35. Reliability & Scaling Infrastructure
36. Data & File Management (storage, versioning, e-signature)
37. White-Label Capability
38. Feature Flags & Versioning
39. Analytics & Telemetry (platform-level)
40. Digital Twin/Simulation
41. AI-to-AI Negotiation
42. IoT/Physical Integration
43. Cross-Business Benchmarking
44. Sustainability/ESG Tracking
45. Autonomous Outreach (voice calls, rebuttals)
46. AI Avatar Meetings
47. Niche Discovery & Outreach Engine (market/niche scraping, real-time analytics, automated prospect outreach, auto-generated demo websites)

**Voice + Text duo-mode** aur **"High IQ"** (= context + memory + judgment quality, not custom ML) yeh sab Category 10-11 mein already cover hain.

---

# PART 4: DATABASE SCHEMA (Phase 0 core tables)

```sql
-- Core tables
clients (id, name, business_type, contact_info jsonb, status, created_at, updated_at)
projects (id, client_id FK, title, description, status, deadline, created_at, updated_at)
tasks (id, project_id FK nullable, title, description, owner, priority, status, due_date, created_at)
conversations (id, source, message, response, agent_used, timestamp)
memory_embeddings (id, content, embedding vector(1536), source_type, source_id, created_at)
content_calendar (id, brand, platform, content_type, caption, scheduled_date, status)
invoices (id, client_id FK, amount, currency, status, due_date, created_at)
decisions_log (id, decision_type, context jsonb, suggestion, outcome, created_at)
pending_approvals (id, action, risk_level, status, created_at, resolved_at)

-- Phase 5+ (multi-tenancy) adds:
businesses (id, name, business_type, owner_id, subscription_tier, created_at)
users (id, business_id FK, role, email, created_at)
```

pgvector extension enabled, `match_memory()` similarity search function, RLS policies per table.

---

# PART 5: PHASED ROADMAP + BUILD PROMPTS

## PHASE 0 — Foundation (Week 1)
**Goal:** Project skeleton, database, memory system working.

**Prompt 0.1 — Project Setup**
```
Create a FastAPI project called "aiman" with structure:
/agents, /orchestrator, /memory, /interface, /docs, /tests, main.py,
requirements.txt, .env.example. Python 3.11+, async where possible.
Include supabase-py, anthropic, fastapi, uvicorn, python-dotenv,
pgvector in requirements. Add a /health endpoint.
```

**Prompt 0.2 — Database Schema**
```
Write complete Supabase Postgres SQL migration for these tables:
clients, projects, tasks, conversations, memory_embeddings (pgvector,
vector(1536)), content_calendar, invoices, decisions_log,
pending_approvals. Include foreign keys, indexes, created_at/updated_at
triggers, basic RLS policies, and a match_memory(query_embedding,
match_count) cosine similarity function.
```

**Prompt 0.3 — Memory Layer**
```
Build /aiman/memory/ module with: store_memory(content, source_type,
source_id) — embed text and save to memory_embeddings;
retrieve_relevant_memory(query, top_k=5) — embed query, pgvector
search, return top matches; log_conversation(message, response,
agent_used) — save to conversations + store_memory. Use Supabase
Python client, env vars for credentials, <500ms retrieval target.
```

**Testing (Phase 0):** Unit test each memory function with mock data. Verify pgvector similarity search returns sensible results with a known test embedding set. Verify schema migrations run cleanly on a fresh Supabase instance.

---

## PHASE 1 — Core Brain + First 3 Companions (Week 2-3)
**Goal:** Aiman can hold WhatsApp conversations with real context and 3 working companions.

**Prompt 1.1 — Orchestrator**
```
Build /aiman/orchestrator/ with: route_intent(message) -> agent type
via Claude API classification; build_context(message, client_name) ->
combines relevant_memory + client data; generate_response(message,
context, agent_type) -> Claude call with Aiman's system prompt
[insert personality prompt from Part 6]; process_message(message,
source) -> full pipeline + logging. Include graceful fallback if
Claude API or memory retrieval fails.
```

**Prompt 1.2 — WhatsApp Interface**
```
Build /aiman/interface/whatsapp.py: POST /webhook/whatsapp (receive
messages, Meta format), GET /webhook/whatsapp (verification handshake),
parse incoming message, call orchestrator.process_message(), send
reply via Meta Graph API. Env vars: WHATSAPP_TOKEN,
WHATSAPP_PHONE_NUMBER_ID, WHATSAPP_VERIFY_TOKEN. Add basic rate
limiting and logging.
```

**Prompt 1.3 — CEO/Ops Agent**
```
Build /aiman/agents/ceo_agent/: get_daily_priorities() -> top 3-5
tasks/deadlines with reasoning; get_weekly_review() -> Claude-generated
summary; suggest_decision(context, options) -> recommendation +
reasoning + risk level; flag_risks() -> overdue tasks, near deadlines,
overdue invoices.
```

**Prompt 1.4 — Client Intelligence Agent**
```
Build /aiman/agents/client_intel_agent/: get_client_status(client_name)
-> fuzzy-matched summary; get_client_history(client_name) ->
chronological conversations+projects; get_communication_gaps(days=7)
-> stale clients list; prep_meeting_brief(client_name) -> Claude-
generated briefing.
```

**Prompt 1.5 — Content Agent**
```
Build /aiman/agents/content_agent/ for Lumapix (German, dark cinematic,
#D3D92A brand) and INLIGHT (English/Hinglish, professional):
get_content_calendar(brand, days), generate_caption(brand, topic,
platform), get_content_gaps(brand, days_ahead), save_content_draft(...).
```

**Testing (Phase 1):** Integration test — send a mock WhatsApp message end-to-end, verify correct agent routing, verify response references stored memory correctly. Manual test: real WhatsApp number, 10 varied real queries, verify sensible responses.

---

## PHASE 2 — Risk System + Daily Briefing (Week 4)
**Goal:** Aiman proactively reaches out, and asks approval before risky actions.

**Prompt 2.1 — Risk/Approval System**
```
Build /aiman/orchestrator/risk.py: assess_risk(action_type, details)
-> low/medium/high; request_approval(action, risk_level) -> sends
WhatsApp confirmation, saves to pending_approvals; handle_approval_
response(pending_id, approved) -> executes/cancels, logs to
decisions_log. Integrate into orchestrator's process_message flow.
```

**Prompt 2.2 — Daily Briefing (Scheduled)**
```
Add APScheduler job, 8 AM Pakistan time (UTC+5): generate_daily_
briefing() combines CEO Agent priorities+risks, Client Intel
communication gaps, Content Agent content gaps -> Claude-generated
Hinglish "Good morning" summary -> auto-sent via WhatsApp.
```

**Testing (Phase 2):** Verify a simulated high-risk action correctly pauses for approval and doesn't execute without confirmation. Verify briefing generates correctly at scheduled time across a few test days, handles empty-data edge cases gracefully.

---

## PHASE 3 — Finance, Support, Self-Improvement (Month 2)
**Goal:** Full back-office coverage + system starts learning from outcomes.

**Prompt 3.1 — Finance Agent**
```
Build /aiman/agents/finance_agent/: get_pending_invoices(),
get_overdue_payments(), convert_currency(amount, from, to),
get_monthly_revenue_summary(), flag_payment_risk(client_name).
```

**Prompt 3.2 — Support Agent**
```
Build /aiman/agents/support_agent/: handle_faq(query) -> answer from
a knowledge base table; triage_ticket(message) -> categorize +
urgency; escalate_if_needed(ticket) -> flags for human review.
```

**Prompt 3.3 — Self-Improvement Loop**
```
Build /aiman/orchestrator/self_improve.py: weekly job that queries
decisions_log, analyzes accept/reject patterns via Claude, generates
a report of suggested prompt/config tweaks, sends to Hamza for review
(does NOT auto-apply — human approves changes).
```

**Testing (Phase 3):** Verify finance calculations (currency conversion, overdue detection) against manual spreadsheet check. Verify self-improvement report surfaces at least one real pattern from test data.

---

## PHASE 4 — Voice, Research, Sales/Marketing, Integrations (Month 3-4)
**Goal:** Full companion roster + voice interaction + external tool connections.

**Prompt 4.1 — Voice Interface**
```
Add voice support to WhatsApp interface: incoming voice notes ->
Whisper (or similar STT) transcription -> existing text pipeline;
outgoing responses -> optional TTS voice note reply. Add a toggle
for voice vs text-only response preference per conversation.
```

**Prompt 4.2 — Research Agent**
```
Build /aiman/agents/research_agent/: web_research(query) -> uses
search API, summarizes findings; analyze_document(file) -> extracts
key points from PDF/doc; compare_data(sources) -> structured
comparison output.
```

**Prompt 4.3 — Sales & Marketing Agents**
```
Build /aiman/agents/sales_agent/: lead follow-up scheduling, pipeline
status tracking, outreach draft generation.
Build /aiman/agents/marketing_agent/: campaign performance pull,
audience insight summaries, A/B test suggestion generation.
```

**Prompt 4.4 — Integrations Layer**
```
Build /aiman/integrations/: Google Calendar sync, Gmail read/draft,
n8n webhook triggers for custom workflows, Slack notification option.
Each integration behind a feature flag, config per business.
```

**Prompt 4.5 — Niche Discovery & Outreach Engine**
```
Build /aiman/agents/outreach_engine/ (extends Research + Sales + Content
agents): find_ai_service_niches() -> scrape web/trend sources for
in-demand AI-service niches; scrape_market_data(niche) -> prospect +
competitor data collection; real_time_analytics(niche) -> demand trend
dashboard data; generate_prospect_list(niche) -> targeted prospect list
with contact info + pain points; approach_prospect(prospect) -> drafts
personalized outreach message, routes through existing risk/approval
system (medium risk — requires confirmation before sending);
generate_demo_website(niche, prospect_name) -> auto-builds a
personalized one-page demo site (reuse Content Agent's site-generation
capability) showcasing Aiman for that prospect's business type;
track_demo_engagement(demo_url) -> basic analytics, triggers follow-up
suggestion to CEO Agent.
```

**Testing (4.5):** Verify scraping respects rate limits/robots.txt on target sites. Verify no outreach message sends without approval confirmation. Manual review of 5 generated demo sites for quality before any real prospect sees one.

---

## PHASE 5 — Sellable Product: Multi-Tenancy & Vertical Packs (Month 5-6)
**Goal:** Aiman becomes a product other businesses can subscribe to.

**Prompt 5.1 — Multi-Tenancy**
```
Add businesses and users tables. Refactor all agent queries to filter
by business_id. Add auth middleware (JWT-based), role-based access
(owner/manager/staff). Migrate existing INLIGHT/Lumapix data into
the multi-tenant structure as the first two tenants.
```

**Prompt 5.2 — Business Onboarding**
```
Build onboarding flow: signup -> free-text "what's your business"
(Claude classifies business_type) + dropdown override -> auto-suggest
relevant companions based on business_type -> user confirms/edits ->
vertical pack config loads (see 5.3).
```

**Prompt 5.3 — Vertical Packs (starting with Real Estate)**
```
Build /aiman/packs/real_estate/: Lead Response Agent
(respond_to_lead_instantly, qualify_lead, detect_seller_signals,
generate_cma, schedule_showing). Design pack system so packs are
config+prompt overlays on existing companions, not separate codebases.
```

**Prompt 5.4 — Billing Engine**
```
Build subscription tiers (Explorer/Builder/Architect style — free
trial, mid-tier N companions, top-tier all companions). Integrate
Stripe or local PK gateway (JazzCash/Easypaisa) for PKR billing.
Usage tracking per business for tier limits.
```

**Testing (Phase 5):** Multi-tenant data isolation test — verify Business A cannot see Business B's data under any query path. Full onboarding flow test with 3 different fake business types. Billing flow test with test-mode payment gateway.

---

## PHASE 6 — Platform Maturity (Month 6+, ongoing)
**Goal:** Everything else — added incrementally based on real demand, not upfront.

Remaining categories from Part 3 (Admin Panel, Marketplace, Developer API/SDK, Mobile App, White-Label, AI Avatar Meetings, Autonomous Voice Outreach, Digital Twin, Cross-Business Benchmarking, ESG Tracking, IoT) each get their own prompt set **written when that phase actually starts** — writing them now would be speculative since Phase 0-5 usage data should inform priority order within Phase 6.

---

# PART 6: AIMAN'S CORE PERSONALITY PROMPT (used across all phases)

```
Tum Aiman ho — Hamza ki AI business assistant, jo INLIGHT AI Agency,
Lumapix GmbH, aur Visticle ke operations mein help karti ho. Tum dost
ki tarah baat karti ho, Hinglish/Roman Urdu mein comfortable ho, lekin
jab business decisions ki baat ho to CEO ki tarah direct aur data-driven
ho jati ho. Tum kabhi vague advice nahi deti — hamesha concrete,
actionable suggestions deti ho. Agar koi high-stakes action hai (paisa,
client-facing commitment), to pehle confirm karti ho, khud se execute
nahi karti.
```

---

# PART 7: DEPLOYMENT CHECKLIST (Phase 0, repeat/expand each phase)

- Dockerfile + docker-compose.yml for local dev
- Deploy backend: Railway or Render
- Supabase project provisioned, migrations run
- WhatsApp Business API webhook URL configured in Meta dashboard
- Environment variables set: ANTHROPIC_API_KEY, SUPABASE_URL,
  SUPABASE_KEY, WHATSAPP_TOKEN, WHATSAPP_PHONE_NUMBER_ID,
  WHATSAPP_VERIFY_TOKEN
- Basic test suite passing before each phase's deployment
- Rollback plan: keep previous phase's deployment tagged in git

---

# PART 8: MONETIZATION — BUILD WHILE EARNING

**Principle:** Har phase khatam hote hi ek real test hona chahiye — internal use ya pilot client. Koi phase sirf "building" nahi hoti.

| Phase | Builds | Starts Working / Earning |
|---|---|---|
| 0 (Wk 1) | Schema, memory, skeleton | Nothing yet — keep short |
| 1 (Wk 2-3) | WhatsApp + CEO/Client Intel/Content agents | Internal daily use begins — time savings (Model: internal cost savings) |
| 2 (Wk 4) | Risk system, daily briefing | Measurable metrics start (time saved, risks caught) — future sales proof |
| 3 (Mo 2) | Finance agent, self-improvement | First pilot: wrap Client Intel + briefing as paid service for 1 real estate client (Model: done-for-you) |
| 4 (Mo 3-4) | Voice, Lead Response groundwork, integrations | Lead Response deployed to pilot clients, outcome-based pricing tested (Model: outcome-based). Target: 1st paying external client |
| 5 (Mo 5-6) | Multi-tenancy, billing, vertical packs | Formal onboarding, hybrid pricing live. Target: 5-10 paying clients, real MRR |
| 6 (Mo 6+) | Advanced features by demand | Recurring revenue base — expand to white-label/marketplace |

## Monetization Models Reference
1. **Internal cost savings** — Aiman replaces tasks you'd hire for
2. **Outcome-based** — charge per qualified lead / per showing booked (e.g. 10% of incremental revenue, like Cresta)
3. **Hybrid subscription** — base fee + usage credits (2026 market standard, 43% of SaaS use this, 38% higher revenue growth than pure subscription)
4. **Done-for-you service** — client pays retainer, never sees the software
5. **White-label reseller** — license Aiman to other agencies
6. **Setup/implementation fees** — one-time onboarding charge
7. **Vertical premium tiers** — Real Estate pack, Agency pack, Retail pack priced separately

**Recommended starting model:** Hybrid (low-friction base + usage-linked expansion) — lowest risk, matches 2026 market data on what performs best for early-stage products.

---

1. Phase 0 se shuru karo, sequence follow karo — har prompt ek AI dev tool (Claude Code, Cursor) mein paste karo
2. Har prompt ke baad "Testing" section ke checks run karo before agle prompt pe jana
3. Phase 5 se pehle (multi-tenancy), system sirf INLIGHT/Lumapix ke internal use ke liye hai — yeh sahi hai, dogfooding zaroori hai
4. Phase 6 ke prompts jaanbujh kar abhi nahi likhe — jab wahan pahunchoge, us waqt ke real usage data se decide hoga kaunsa feature pehle chahiye
5. Yeh document hi tumhara single source of truth hai — naya idea aaye to yahan uska phase dhundo, current phase ka scope mat badlo
