# Kora - Product & Architecture Overview

## What Is Kora?

Kora is a web application that guides government marketing teams through building behaviour-change campaigns, called **interventions**. It takes users from a nascent idea to a concrete, execution-ready Creative Brief.

A single company uses the application. They create a **project**, then create one or more **interventions** within that project.

---

## Core Flow

### 1. Intervention Creation

The user creates a new intervention within a project. Kora's chatbot asks **9 brief questions** to establish the foundation:

1. Who is the client or funder?
2. What's the core challenge or problem?
3. What is the initial objective?
4. Who is the target audience?
5. Where is the location of the challenge?
6. What are the do's and don'ts?
7. What's the available budget?
8. What's the available timeline?
9. What are the expected deliverables?

### 2. Understand Stage

The chatbot responses are processed into a structured **Brief Overview** with editable cards (client name, location, budget, timeline, deliverables, problem definition, initial objective, target audience profile, do's/don'ts).

The user then progresses through the Understand sub-sections:

| Sub-section | Purpose |
|---|---|
| **Brief Overview** | Structured summary of the brief answers. User reviews, edits, and confirms. |
| **Research Insights** | User uploads existing research (text, PDFs, links). A DeepResearch prompt is generated for the user to run externally and upload results. AI generates 3-8 key insights. |
| **System Map** | AI generates refined challenges from the research. User selects **one entry point** - a single system dynamic that drives everything downstream. |
| **Behavioural Objective** | AI-generated from previous inputs. User reviews, edits, confirms. |
| **Assumption Testing** | AI-generated from previous inputs. User reviews, edits, confirms. |
| **COM-B & Personas** | AI-generated using the COM-B behavioural framework (Capability, Opportunity, Motivation → Behaviour). User reviews, edits, confirms. |

### 3. Design Stage

Design follows the same pattern as Understand, building toward a concrete campaign plan:

| Sub-section | Purpose |
|---|---|
| **Behavioural Framing** | Frames the campaign approach based on the behavioural analysis from Understand. |
| **Creative Strategy** | Develops the creative direction for the campaign. |
| **Campaign Journey** | Maps out the campaign touchpoints and flow. |
| **MREL Indicators** | Defines Monitoring, Research, Evaluation, and Learning indicators - how success will be measured. Defined before activation by design. |
| **Documentation** | Compiles all decisions into a **Creative Brief** - the primary deliverable. |
| **Schedule** | Campaign timeline and scheduling. |

### 4. Activate Stage (Future)

Not yet designed. Will handle campaign activation.

### 5. Evaluate Stage (Future)

Not yet designed. Will handle campaign evaluation against MREL indicators.

## Current Build Scope

**Understand + Design stages only.** The application ends with the Creative Brief as the primary output.

---

## Key Patterns

### AI-Generate → Review → Confirm → Lock

Every sub-section follows the same pattern:

1. AI generates content from all previous inputs
2. User reviews and edits the generated content
3. User confirms the section
4. Section becomes read-only (one-way lock for now; unlocking is planned for the future)
5. Confirmed content feeds into the next section

Each block is used to inform future blocks. The single entry point selected in the System Map drives all downstream content generation.

### Kora Chatbot Panel

A right-side panel that:
- Guides the user through each step with contextual instructions
- Tracks section status (in progress / complete)
- Explains the purpose of each section and what to do next
- Currently passive/coach role only; interactive Q&A planned for the future

### Progress Tracking

A percentage indicator at the top of the left navigation tracks completion across all stages (Understand, Design, Activate, Evaluate).

---

## System Architecture

```
FRONT-END (Next.js)              XANO (Database + API)           N8N (AI Orchestration)
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

### Services

| Service | Role | Instance |
|---------|------|----------|
| **Next.js App** | Front-end UI | localhost:3000 |
| **Xano** | Database + REST API | Kora_Toby workspace (xyot-fwcy-i2yo.e2.xano.io) |
| **N8N** | AI workflow orchestration | https://n8n-toby.sliplane.app/ |
| **Langfuse** | Prompt versioning & observability | cloud.langfuse.com (READ-ONLY) |
| **Supabase** | Vector DB for RAG | https://sjwzqprnglxdozdcsytj.supabase.co (not yet set up) |
| **OpenAI** | LLM for generation | Via N8N |

For full details on each service (gotchas, credentials, best practices), see the root `CLAUDE.md`.

---

## Data Flow Per Section

### Brief Overview
```
User answers 9 chat questions → N8N processes into structured brief
                              → Xano stores BRIEF_OUTPUT record
                              → Front-end displays editable cards
User edits/confirms           → PATCH to Xano
```

### Research Insights
```
User uploads files → POST to N8N (chunk & store in Supabase RAG)
User clicks "Generate Insights" → POST to N8N /generate_insights
                                → N8N: Xano context + Langfuse prompt + RAG query + OpenAI
                                → Results POST'd to Xano
                                → Front-end fetches from Xano
```

### System Map
```
User clicks "Generate" → POST to N8N /generate_system_map
                       → N8N generates 5-8 challenges
                       → POST'd to Xano SYSTEM_MAP table
                       → Front-end fetches & displays
User selects entry point → PATCH to Xano (mark selected)
User clicks "Add one more" → POST to N8N /generate_single_challenge
```

### Behavioural Objective
```
User clicks "Generate" → POST to N8N /behavior_objective
                       → N8N fetches: intervention + selected entry point from Xano
                       → Generates 3 objectives
                       → POST'd to Xano BEHAVIOURAL_OBJECTIVE_NEW table
User selects one → PATCH to Xano (mark selected)
```

### Assumption Testing
```
User clicks "Generate Assumptions" → POST to N8N /generate_assumption
                                   → Generates 5-8 assumptions
                                   → POST'd to Xano ASSUMPTION table
User clicks "Generate Questions" → POST to N8N /generate_research_questions
                                 → Generates up to 10 questions
                                 → POST'd to Xano RESEARCH_QUESTION table
```

---

## N8N Workflow Catalog

### Stage 1 Generation Workflows

| Workflow | Webhook | What It Generates | Depends On |
|----------|---------|-------------------|------------|
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
| generatePersonaPicture | — | Persona image | Persona data |

### Stage 2 Generation Workflows

| Workflow | Webhook | What It Generates |
|----------|---------|-------------------|
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

### Common Workflow Pattern

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

### RAG Pipelines

- Document ingestion (PDF → chunk → enhance with LLM context → vectorize → store in Supabase)
- Query interface (semantic search with Cohere reranking)
- File scraping (Firecrawl for URLs)

---

## Langfuse Prompt Catalog

All 26 prompts used by N8N workflows. Access is **READ-ONLY**.

### Stage 1 Prompts

| Prompt Name | Purpose | Key Variables |
|-------------|---------|---------------|
| stage1/research | Initial research + DeepResearch questions | BRIEF_OUTPUT, INSIGHTS |
| stage1/deepResearchQuestions | Targeted research question generation | BRIEF_OUTPUT |
| stage1/insightsExtraction | Extract insights from documents | source |
| stage1/researchInsights | Synthesize 3-8 key insights | BRIEF_OUTPUT, DOCUMENT_INSIGHTS |
| stage1/systemsMapping | 5-8 refined challenges (entry points) | BRIEF_OUTPUT, INSIGHTS, XANO_DATABASE_SCHEMA |
| stage1/behaviouralObjectiveSetting | 3 behavioral objectives | BRIEF_OUTPUT, RESEARCH_INSIGHTS, SELECTED_ENTRY_POINT |
| stage1/assumptionTesting | 5-8 testable assumptions | BRIEF_OUTPUT, BEHAVIORAL_OBJECTIVE, ENTRY_POINT, INSIGHTS |
| stage1/assumptionResearchQuestions | Up to 10 research questions | BRIEF_OUTPUT, BEHAVIORAL_OBJECTIVE, ASSUMPTIONS |
| stage1/comBAnalysis | COM-B barrier analysis (3 domains) | BRIEF_OUTPUT, BEHAVIORAL_OBJECTIVE, INSIGHTS, ASSUMPTIONS |
| stage1/singleComB | Single COM-B barrier | Same + comb_type |
| stage1/personas | 3 rich personas | BRIEF_OUTPUT, BEHAVIORAL_OBJECTIVE, INSIGHTS, COMB_BARRIERS |

### Stage 2 Prompts

| Prompt Name | Purpose | Key Variables |
|-------------|---------|---------------|
| stage2/brief | Creative brief structure | All Stage 1 outputs |
| stage2/tfd | Think/Feel/Do frames (14 style modes) | Persona, COM-B drivers |
| stage2/strategy | 5 campaign strategies | TFDs, Objectives, COM-B |
| stage2/singleStrategy | 1 strategy (no repeats) | Same + existing strategies |
| stage2/gwtb | Get-Who-To-By statement | TA, TFD, Objective, Strategy |
| stage2/territory | 5 creative territories | Strategy, TFD shifts |
| stage2/singleTerritory | 1 territory | Same |
| stage2/smp | 3 Single-Minded Propositions | Territory, TFD shifts |
| stage2/singleSmp | 1 SMP | Same |
| stage2/narrative | Core narrative + 3 key messages | SMP or GWTB + Strategy |
| stage2/cta | 3 Call-to-Actions | Objectives, Audience, Strategy |
| stage2/campaignJourney | 4-phase journey map | CTA, TFD phases |
| stage2/mrel | MREL indicators (3 levels) | intervention_id, indicator_type |
| stage2/singleMrel | 1 MREL indicator | Same |
| stage2/oasis | Final OASIS plan | All validated Stage 1+2 inputs |

For the full prompt catalog with version counts, see `docs/back-end/langfuse_prompt_catalog.md`.

---

## Behavioural Science Framework

Kora is opinionated about using **COM-B** (Capability, Opportunity, Motivation → Behaviour) as the primary behavioural framework. Some other frameworks are supported. The framework logic is handled in the AI prompts.

## Research Integration

There is no formal integration with external AI tools. The flow is:

1. Kora generates a DeepResearch prompt based on the brief
2. The user copies the prompt and runs it externally (e.g. in ChatGPT's DeepResearch)
3. The user uploads the results back into Kora as a PDF
4. Kora's AI processes the research and generates insights

Users can also upload their own existing research (text, PDFs, links).

## Multi-User

Multiple users within the same company can collaborate on interventions. Details of the multi-user experience are not in scope for the current build.

---

## Key Terminology

| Term | Meaning |
|---|---|
| **Intervention** | A behaviour-change marketing campaign |
| **Project** | A container for one or more interventions |
| **Brief** | The initial 9-question intake that defines the intervention |
| **Entry Point** | The single system dynamic selected from the System Map that drives all downstream work |
| **COM-B** | Capability, Opportunity, Motivation → Behaviour framework |
| **TFD** | Think/Feel/Do — frames current vs desired behaviour states |
| **GWTB** | Get-Who-To-By — campaign targeting statement |
| **SMP** | Single-Minded Proposition — core creative message |
| **MREL** | Monitoring, Research, Evaluation, and Learning indicators |
| **OASIS** | Final campaign plan format |
| **Creative Brief** | The primary deliverable - a complete campaign brief produced at the end of the Design stage |
| **System Map** | A map of refined challenges around the problem ecosystem, from which the user selects an entry point |
