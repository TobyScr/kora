# Kora System Map - Complete Architecture

**Date:** 2026-02-12
**Purpose:** Map everything that exists across all services before any implementation work begins.

---

## The Big Picture (Plain English)

Kora is a tool that helps campaign designers create behavioral change campaigns. Think of it as a step-by-step wizard:

1. **Understand** - Collect a brief, research the problem, identify challenges, set objectives, test assumptions, analyse barriers, build personas
2. **Design** - Frame the behavior shift, pick strategies, create messaging, plan the campaign journey
3. **Activate** - Launch the campaign (not yet built)
4. **Evaluate** - Measure results (not yet built)

At each step, AI generates content (personas, strategies, messages, etc.) that the user reviews, edits, and confirms before moving to the next step.

---

## How The Current System Works

```
YOUR FRONT-END (Next.js)          XANO (Database + API)           N8N (AI Brain)
========================          ====================           ==============

User clicks "Generate"  ───────>  Xano receives request  ──────>  N8N webhook fires
                                  stores basic info
                                                                  1. Fetches context from Xano
                                                                  2. Fetches prompt from Langfuse
                                                                  3. Queries RAG (Supabase) for research
                                                                  4. Calls OpenAI/Claude to generate
                                                                  5. POSTs results back to Xano

User sees results       <───────  Xano serves results    <──────  Done
User edits/confirms     ───────>  Xano saves edits
```

### Services Involved

| Service | Role | Your Instance | Status |
|---------|------|---------------|--------|
| **Next.js App** | Front-end UI | localhost:3000 | Built (mock data only) |
| **Xano** | Database + REST API | Kora_Toby workspace | Empty, needs setup |
| **N8N** | AI workflow orchestration | https://n8n-toby.sliplane.app/ | Empty, needs setup |
| **Langfuse** | Prompt versioning & observability | cloud.langfuse.com (shared) | READ-ONLY access |
| **Supabase** | Vector DB for RAG | https://sjwzqprnglxdozdcsytj.supabase.co | Empty, needs schema |
| **OpenAI** | LLM for generation | Via N8N | Needs API key in N8N |

---

## What Exists In Each Service

### 1. YOUR FRONT-END (5 sections built)

| Section | Data Shape | Mock API Calls Needed | Xano Table |
|---------|------------|----------------------|------------|
| **Brief Overview** | clientName, location, budget, timeline, deliverables, problemDefinition, initialObjective, taProfile, dos, donts | GET/POST brief | interventions |
| **Research Insights** | insights (id, text, description, sources, color), files, links | GET/POST insights, file upload | research_insights |
| **System Map** | challenges (id, title, description, color) + selected entry point | GET/POST challenges, confirm entry point | system_map |
| **Behavioural Objective** | objectives (id, title, color) | GET/POST objectives | behavioural_objectives |
| **Assumption Testing** | assumptions (id, title, color) + research questions (id, text) + files | GET/POST assumptions & questions | assumptions, research_questions |

**Key front-end patterns:**
- All sections use `useState` with mock data and `setTimeout` to simulate loading
- Each section has CRUD modals (Add, Edit, Delete)
- AI generation is simulated with a 4-second progress bar
- Sections unlock sequentially: Brief -> Research -> System Map -> Objectives -> Assumptions
- No API service layer exists yet - needs to be built from scratch

### 2. XANO (21 tables needed)

**Your Xano workspace (Kora_Toby) is currently empty.** Here's what needs to exist based on the N8N workflows:

#### Core Table: `interventions`
The central entity. Every other table links to it via `intervention_id`.

#### Stage 1 Tables (Understand):
| Table | Key Fields | Relationship |
|-------|-----------|--------------|
| `interventions` | id, client, problem, objective, ta_profile, location, budget, timeline, deliverables, dos, donts | Central entity |
| `research_insights` | id, intervention_id, insight, description, source, importance | Many per intervention |
| `system_map` | id, intervention_id, challenge, description | Many per intervention |
| `behavioural_objectives` | id, intervention_id, objective | Many per intervention |
| `assumptions` | id, intervention_id, assumption | Many per intervention |
| `research_questions` | id, intervention_id, question, assumption_id | Many per intervention |
| `com_b_analysis` | id, intervention_id, domain, statement, description, is_primary | Many per intervention |
| `personas` | id, intervention_id, persona_label, name, age, gender, tagline, segment_description, quote, demographics (13+ fields) | Many per intervention |

#### Stage 2 Tables (Design):
| Table | Key Fields | Relationship |
|-------|-----------|--------------|
| `tfd` | id, intervention_id, com_b1_id, com_b2_id, current_think/feel/do, future_think/feel/do, selected | Many per intervention |
| `strategies` | id, intervention_id, strategy, type, description, pros, cons, selected | Many per intervention |
| `gwtb` | id, intervention_id, get, who, to, by | One per intervention |
| `territories` | id, intervention_id, title, description, credibility | Many per intervention |
| `smp` | id, intervention_id, output | Many per intervention |
| `narrative_framework` | id, intervention_id, beginning, tension, resolution | One per intervention |
| `key_messages` | id, intervention_id, message, proof_points | Many per intervention |
| `cta` | id, intervention_id, title, validations | Many per intervention |
| `campaign_journey_map` | id, intervention_id, journey_phase_id, key_moments, key_messages, key_mechanism | Many per intervention |
| `mrel` | id, intervention_id, indicator_type, indicator, target, data_source | Many per intervention |
| `oasis_map` | id, intervention_id, core_challenge, outcome, campaign_objectives, demographics, attitudes_behaviors, barriers, selected_strategy, key_messages, core_cta, creative_territory, user_journey, timings, metrics | One per intervention |
| `creative_brief` | id, intervention_id, target_profile, barriers, strategy, territory, cta, smp, key_messages, tfd_shift, deliverables, timings, mandatories, budget, inspiration, summary, context, problem, objectives | One per intervention |
| `error_logs` | id, workflow_name, error_message, execution_id | System table |

### 3. N8N (72 workflows to import)

**Your N8N instance (https://n8n-toby.sliplane.app/) is empty.** Here's what exists in Ronald's repo:

#### AI Generation Workflows (38 total):

**Stage 1 generators:**
| Workflow | N8N Webhook | What It Generates | Depends On |
|----------|------------|-------------------|------------|
| generateBriefOutput | POST /brief_output | Structured brief from chat | Chat messages |
| generateBriefOverview | POST /brief_overview | Brief summary | Brief data |
| generateResearchInsights | POST /generate_insights | 3-8 key insights | Brief + RAG |
| generateSingleResearchInsights | POST /generate_single_insight | 1 insight | Brief + RAG |
| generateSystemMap | POST /generate_system_map | 5-8 challenges | Brief + Insights |
| generateSingleChallenge | POST /generate_single_challenge | 1 challenge | Brief + Insights |
| generateBehaviouralObjectiveSetting | POST /behavior_objective | 3 objectives | Entry point |
| generateSingleObjective | POST /generate_single_objective | 1 objective | Entry point |
| generateAssumptions | POST /generate_assumption | 5-8 assumptions | Objective |
| generateSingleAssumption | POST /generate_single_assumption | 1 assumption | Objective |
| generateAssumptionResearchQuestions | POST /generate_research_questions | Up to 10 questions | Assumptions |
| generateSingleAssumptionQuestion | POST /generate_single_assumption_question | 1 question | Assumptions |
| generateComBAnalysis | POST /generate_comb | COM-B barriers (3 domains) | Objective + Insights + Assumptions |
| generateSingleComB | POST /generate_single_comb | 1 barrier | Same |
| generatePersonas | POST /generate_persona | 3 personas | Objective + Insights + COM-B |
| generateSinglePersona | POST /generate_single_persona | 1 persona | Same |
| generatePersonaPicture | - | Persona image | Persona data |

**Stage 2 generators:**
| Workflow | N8N Webhook | What It Generates |
|----------|------------|-------------------|
| generate TFD | POST /generate_tfd | Think/Feel/Do frames |
| generate Strategy | POST /generate_strategy | 5 strategies |
| generate GWTB | POST /generate_gwtb | Get-Who-To-By statement |
| generate Territory | POST /generate_territory | 5 creative territories |
| generate SMP | POST /generate_smp | 3 Single-Minded Propositions |
| generate Narrative | POST /generate_narrative | Core narrative + 3 key messages |
| generate CTA | POST /generate_cta | 3 Call-to-Actions |
| generate Campaign Journey | POST /generate_cjm | 4-phase journey map |
| generate MREL | POST /generate_mrel | Monitoring indicators |
| generate OASIS | POST /generate_oasis | Final OASIS plan |
| generate Creative Brief | POST /generate_cbd | Creative brief |
| + single-item variants for most of the above |

#### Common N8N Workflow Pattern:
```
1. Webhook receives: { intervention_id, data_source }
2. GET Xano → /api:GROUP/interventions/{id} (fetch context)
3. GET Langfuse → /api/public/v2/prompts/{name}?label=latest (fetch prompt)
4. AI Agent → OpenAI GPT-4.1/5.2 with:
   - System prompt from Langfuse
   - Intervention context from Xano
   - RAG results from Supabase (queryForResearch tool)
   - Structured output parser (JSON schema)
5. POST Xano → /api:GROUP/{entity} (save results)
6. Return success to caller
```

#### RAG Pipelines (7 workflows):
- Document ingestion (PDF → chunk → enhance with LLM context → vectorize → store in Supabase)
- Query interface (semantic search with Cohere reranking)
- File scraping (Firecrawl for URLs)

#### Utility Workflows:
- Error logging
- Backup to GitHub
- Queue management

### 4. LANGFUSE (26 prompts - READ ONLY)

You have read-only access to the shared Langfuse instance. **Never write to it.**

| Prompt Name | Purpose | Key Variables | Versions |
|-------------|---------|---------------|----------|
| stage1/research | Initial research + DeepResearch questions | BRIEF_OUTPUT, INSIGHTS | 6 |
| stage1/deepResearchQuestions | Targeted research question generation | BRIEF_OUTPUT | 2 |
| stage1/insightsExtraction | Extract insights from documents | source | 14 |
| stage1/researchInsights | Synthesize 3-8 key insights | BRIEF_OUTPUT, DOCUMENT_INSIGHTS | 12 |
| stage1/systemsMapping | 5-8 refined challenges (entry points) | BRIEF_OUTPUT, INSIGHTS, XANO_DATABASE_SCHEMA | 11 |
| stage1/behaviouralObjectiveSetting | 3 behavioral objectives | BRIEF_OUTPUT, RESEARCH_INSIGHTS, SELECTED_ENTRY_POINT | 17 |
| stage1/assumptionTesting | 5-8 testable assumptions | BRIEF_OUTPUT, BEHAVIORAL_OBJECTIVE, ENTRY_POINT, INSIGHTS | 14 |
| stage1/assumptionResearchQuestions | Up to 10 research questions | BRIEF_OUTPUT, BEHAVIORAL_OBJECTIVE, ASSUMPTIONS | 7 |
| stage1/comBAnalysis | COM-B barrier analysis (3 domains) | BRIEF_OUTPUT, BEHAVIORAL_OBJECTIVE, INSIGHTS, ASSUMPTIONS | 7 |
| stage1/singleComB | Single COM-B barrier | Same + comb_type | 2 |
| stage1/personas | 3 rich personas | BRIEF_OUTPUT, BEHAVIORAL_OBJECTIVE, INSIGHTS, COMB_BARRIERS | 3 |
| stage2/brief | Creative brief structure | All Stage 1 outputs | 1 |
| stage2/tfd | Think/Feel/Do frames (14 style modes) | Persona, COM-B drivers | 11 |
| stage2/strategy | 5 campaign strategies | TFDs, Objectives, COM-B | 5 |
| stage2/singleStrategy | 1 strategy (no repeats) | Same + existing strategies | 2 |
| stage2/gwtb | Get-Who-To-By statement | TA, TFD, Objective, Strategy | 2 |
| stage2/territory | 5 creative territories | Strategy, TFD shifts | 3 |
| stage2/singleTerritory | 1 territory | Same | 3 |
| stage2/smp | 3 Single-Minded Propositions | Territory, TFD shifts | 2 |
| stage2/singleSmp | 1 SMP | Same | 1 |
| stage2/narrative | Core narrative + 3 key messages | SMP or GWTB + Strategy | 4 |
| stage2/cta | 3 Call-to-Actions | Objectives, Audience, Strategy | 2 |
| stage2/campaignJourney | 4-phase journey map | CTA, TFD phases | 4 |
| stage2/mrel | MREL indicators (3 levels) | intervention_id, indicator_type | 4 |
| stage2/singleMrel | 1 MREL indicator | Same | 2 |
| stage2/oasis | Final OASIS plan | All validated Stage 1+2 inputs | 1 |

### 5. SUPABASE (RAG Vector DB)

**Your instance (https://sjwzqprnglxdozdcsytj.supabase.co) is empty.**

It needs:
- A `documents` table with pgvector extension for embeddings
- An Edge Function at `/functions/v1/query` for semantic search
- Metadata fields: file_name, file_url, intervention_id, chunk_context
- OpenAI embeddings (or Voyage AI as alternative)

---

## Data Flow Per Section (Front-End → Backend → AI → Back)

### Brief Overview
```
User fills brief cards → POST to Xano /interventions
                       → Xano stores intervention record
                       → Returns intervention_id (used everywhere after)
```

### Research Insights
```
User uploads files → POST to N8N /scrape_url or /chunk_document
                   → N8N chunks & stores in Supabase RAG
User clicks "Generate Insights" → POST to N8N /generate_insights
                                → N8N: Xano context + Langfuse prompt + RAG query + OpenAI
                                → Results POST'd to Xano
                                → Front-end fetches from Xano
```

### System Map
```
User clicks "Generate" → POST to N8N /generate_system_map
                       → N8N generates 5-8 challenges
                       → POST'd to Xano system_map table
                       → Front-end fetches & displays
User selects entry point → PATCH to Xano (mark selected)
User clicks "Add one more" → POST to N8N /generate_single_challenge
```

### Behavioural Objective
```
User clicks "Generate" → POST to N8N /behavior_objective
                       → N8N fetches: intervention + selected entry point from Xano
                       → Generates 3 objectives
                       → POST'd to Xano behavioural_objectives table
User selects one → PATCH to Xano (mark selected)
```

### Assumption Testing
```
User clicks "Generate Assumptions" → POST to N8N /generate_assumption
                                   → N8N fetches: intervention + selected objective
                                   → Generates 5-8 assumptions
                                   → POST'd to Xano assumptions table
User clicks "Generate Questions" → POST to N8N /generate_research_questions
                                 → N8N fetches: intervention + assumptions
                                 → Generates up to 10 questions
                                 → POST'd to Xano research_questions table
```

---

## Credentials & Access

> Full credentials are in `docs/back-end/creds and vars kora.txt` (gitignored — never commit).

| Service | Instance | What You Have | What You Still Need | Status |
|---------|----------|--------------|--------------------|---------|
| **Xano** | Workspace: Kora_Toby | Invite sent to toby@bluemongoose.io | Log in, create Metadata API token | Not started |
| **N8N** | https://n8n-toby.sliplane.app/ | Encryption key, runner auth token, env vars | Create your user account | Not started |
| **Langfuse** | https://cloud.langfuse.com | Public key, secret key | Nothing — READ-ONLY, never write | Ready |
| **Supabase** | https://sjwzqprnglxdozdcsytj.supabase.co | URL, password | Set up pgvector schema | Not started |
| **Serper** | Search API | API key (probably not needed) | Nothing | Optional |
| **OpenAI** | Via N8N | Nothing yet | API key for N8N credentials | Missing |
| **N8N Workflows** | https://github.com/Ronald-BM/cleaned-n8n | Repo access | Import into your N8N instance | Not started |

### N8N Docker Environment (Sliplane)
These are already configured on the Sliplane hosting:
- Timezone: Europe/Lisbon
- Encryption key: set
- Runner mode: external (port 5679)
- Webhook URL: auto from Sliplane domain
- Supabase URL: configured
- Serper API key: configured

---

## What Needs To Happen (High Level)

### Phase 0: Setup (Before Any Code)

**You need to do (requires browser login):**
1. Log into Xano (check toby@bluemongoose.io for invite) — share workspace URL with me
2. In Xano: Settings > Metadata API > Generate Access Token (Read + Create + Update scopes) — share token with me
3. Log into N8N at https://n8n-toby.sliplane.app/ and create your account
4. Get an OpenAI API key (or confirm if Ronald provides one)

**I can then do:**
5. Set up Xano MCP so Claude Code can inspect/build Xano tables directly
6. Import N8N workflows from Ronald's repo via the N8N API
7. Configure N8N credentials (Langfuse keys, Supabase URL, Serper key are already in env)
8. Set up Supabase pgvector schema via the Supabase API

### Phase 1: Connect Front-End to Xano (CRUD)
1. Create API service layer in Next.js (`/app/src/lib/xano.ts`)
2. Replace mock data with real Xano API calls for each section
3. Wire up Create, Read, Update, Delete operations
4. Handle authentication (Xano login → Bearer token)
5. Persist section state (confirmed/locked) in Xano

### Phase 2: Connect AI Generation via N8N
1. Wire "Generate" buttons to N8N webhook endpoints
2. Handle async responses (N8N generates → saves to Xano → front-end polls/refetches)
3. Wire single-item generation ("Add one more") buttons
4. Handle loading states and error cases

### Phase 3: Build Remaining Sections
- COM-B & Personas (Stage 1)
- All Stage 2 sections (TFD through OASIS)
- Follow same pattern: mock first, then wire to Xano + N8N

---

## Reference Documents

All in `docs/back-end/`:

| Document | Purpose |
|----------|---------|
| `SYSTEM_MAP_COMPLETE.md` | This file — master system map |
| `creds and vars kora.txt` | All credentials & env vars (GITIGNORED) |
| `XANO_ANALYSIS_SUMMARY.md` | Executive summary of Xano analysis |
| `xano_api_endpoints_comprehensive_mapping.md` | Every Xano endpoint extracted from N8N |
| `xano_endpoints_quick_reference.md` | Quick lookup table |
| `xano_authentication_and_routing.md` | Auth patterns & data routing |
| `xano_system_architecture.md` | Architecture diagrams |
| `langfuse_prompt_catalog.md` | All 26 Langfuse prompts documented |
