# Xano System Architecture Visualization

**Analysis Date:** 2026-02-12

---

## Current Architecture (N8N + Xano)

```
┌─────────────────────────────────────────────────────────────────────────┐
│                           Bubble.io Frontend                             │
│                                                                          │
│  ┌──────────────┐  ┌──────────────┐  ┌──────────────┐                 │
│  │  Intervention│  │   Generate   │  │    View      │                 │
│  │    Setup     │  │   Personas   │  │   Results    │                 │
│  └──────┬───────┘  └──────┬───────┘  └──────────────┘                 │
│         │                  │                                            │
└─────────┼──────────────────┼────────────────────────────────────────────┘
          │                  │
          │ POST {           │ POST {
          │   intervention_id│   intervention_id,
          │   data_source    │   data_source
          │ }                │ }
          ▼                  ▼
┌─────────────────────────────────────────────────────────────────────────┐
│                              N8N Platform                                │
│                                                                          │
│  ┌──────────────────────────────────────────────────────────────────┐  │
│  │                      Webhook Endpoints                           │  │
│  │                                                                  │  │
│  │  /generate_persona    /generate_strategy    /generate_brief    │  │
│  │  /generate_system_map /generate_territory   /generate_cta      │  │
│  │  /behavior_objective  /generate_assumption  ... (19 total)     │  │
│  └──────────────────────┬───────────────────────────────────────────┘  │
│                         │                                               │
│  ┌──────────────────────▼───────────────────────────────────────────┐  │
│  │                    Workflow Orchestration                        │  │
│  │                                                                  │  │
│  │  1. Receive webhook request                                     │  │
│  │  2. Extract intervention_id & data_source                       │  │
│  │  3. GET intervention context from Xano ──────────┐             │  │
│  │  4. GET prompts from Langfuse ────────┐          │             │  │
│  │  5. Generate content via OpenAI/Claude│          │             │  │
│  │  6. POST results back to Xano ────────┼──────────┤             │  │
│  │  7. Notify Bubble.io completion       │          │             │  │
│  └───────────────────────────────────────┼──────────┼─────────────┘  │
│                                           │          │                  │
└───────────────────────────────────────────┼──────────┼──────────────────┘
                                            │          │
                    ┌───────────────────────┘          │
                    │                                  │
                    ▼                                  ▼
        ┌───────────────────────┐        ┌─────────────────────────┐
        │   Langfuse Platform   │        │     Xano Database       │
        │                       │        │                         │
        │  - Prompt Management  │        │  ┌─────────────────┐   │
        │  - Version Control    │        │  │  X-Data-Source  │   │
        │  - Prompt Templates   │        │  │     Router      │   │
        │                       │        │  └────────┬────────┘   │
        │  /stage1/personas     │        │           │             │
        │  /stage2/strategy     │        │     ┌─────▼──────┐     │
        │  /stage2/brief        │        │     │   dev DB   │     │
        │  ... etc              │        │     │            │     │
        └───────────────────────┘        │     │ interventions│   │
                                         │     │ personas    │   │
                    ┌────────────────────┤     │ strategies  │   │
                    │                    │     │ ... (21)    │   │
                    ▼                    │     └─────────────┘   │
        ┌───────────────────────┐        │                       │
        │  OpenAI / Claude API  │        │     ┌────────────┐   │
        │                       │        │     │  live DB   │   │
        │  - GPT-4              │        │     │            │   │
        │  - Claude 3.5         │        │     │ interventions│ │
        │  - Structured Output  │        │     │ personas    │   │
        │  - Function Calling   │        │     │ strategies  │   │
        │                       │        │     │ ... (21)    │   │
        └───────────────────────┘        │     └────────────┘   │
                                         │                       │
                                         │  Base URL:            │
                                         │  xyot-fwcy-i2yo.      │
                                         │  e2.xano.io           │
                                         └───────────────────────┘
```

---

## Data Flow: Generate Personas Example

```
Step 1: User Clicks "Generate Personas" in Bubble.io
│
▼
┌─────────────────────────────────────────────────────┐
│ POST to N8N Webhook                                 │
│ URL: /webhook/generate_persona                      │
│                                                     │
│ Body: {                                             │
│   "intervention_id": 123,                           │
│   "data_source": "dev"                              │
│ }                                                   │
└──────────────────┬──────────────────────────────────┘
                   │
Step 2: N8N Receives Request
│                  │
▼                  │
┌──────────────────▼──────────────────────────────────┐
│ GET Intervention Info from Xano                     │
│                                                     │
│ Request:                                            │
│   GET /api/intervention/123                         │
│   Headers:                                          │
│     X-Data-Source: dev                              │
│     Authorization: Bearer {token}                   │
│                                                     │
│ Response:                                           │
│   {                                                 │
│     "intervention_id": 123,                         │
│     "client": "Save the Children",                  │
│     "location": "Kenya",                            │
│     "core_challenge": "Low vaccination rates",      │
│     "high_level_objective": "Increase by 30%",      │
│     ... other context                               │
│   }                                                 │
└──────────────────┬──────────────────────────────────┘
                   │
Step 3: Fetch AI Prompt
│                  │
▼                  │
┌──────────────────▼──────────────────────────────────┐
│ GET Prompt from Langfuse                            │
│                                                     │
│ Request:                                            │
│   GET /api/public/v2/prompts/                       │
│       stage1%2Fpersonas?label=latest                │
│                                                     │
│ Response:                                           │
│   {                                                 │
│     "prompt": "Generate 3-5 distinct personas...",  │
│     "config": {...},                                │
│     "version": "v1.2.3"                             │
│   }                                                 │
└──────────────────┬──────────────────────────────────┘
                   │
Step 4: Generate with AI
│                  │
▼                  │
┌──────────────────▼──────────────────────────────────┐
│ POST to OpenAI/Claude                               │
│                                                     │
│ Request:                                            │
│   {                                                 │
│     "model": "gpt-4",                               │
│     "messages": [                                   │
│       {                                             │
│         "role": "system",                           │
│         "content": "{prompt from Langfuse}"         │
│       },                                            │
│       {                                             │
│         "role": "user",                             │
│         "content": "{intervention context}"         │
│       }                                             │
│     ],                                              │
│     "response_format": {                            │
│       "type": "json_schema",                        │
│       "schema": {...persona schema...}              │
│     }                                               │
│   }                                                 │
│                                                     │
│ Response:                                           │
│   [                                                 │
│     {                                               │
│       "intervention_id": 123,                       │
│       "persona_label": "Urban Mother",              │
│       "name": "Amina",                              │
│       "age": "32",                                  │
│       ... 20 more fields                            │
│     },                                              │
│     {...persona 2...},                              │
│     {...persona 3...}                               │
│   ]                                                 │
└──────────────────┬──────────────────────────────────┘
                   │
Step 5: Save to Xano
│                  │
▼                  │
┌──────────────────▼──────────────────────────────────┐
│ POST Personas to Xano                               │
│                                                     │
│ Request:                                            │
│   POST /api/personas (bulk)                         │
│   Headers:                                          │
│     X-Data-Source: dev                              │
│     Authorization: Bearer {token}                   │
│   Body: [                                           │
│     {...persona 1...},                              │
│     {...persona 2...},                              │
│     {...persona 3...}                               │
│   ]                                                 │
│                                                     │
│ Xano Router:                                        │
│   1. Checks X-Data-Source header → "dev"            │
│   2. Routes to dev database                         │
│   3. Inserts personas into dev.personas table       │
│                                                     │
│ Response:                                           │
│   {                                                 │
│     "success": true,                                │
│     "inserted": 3,                                  │
│     "ids": [456, 457, 458]                          │
│   }                                                 │
└──────────────────┬──────────────────────────────────┘
                   │
Step 6: Notify Bubble.io
│                  │
▼                  │
┌──────────────────▼──────────────────────────────────┐
│ POST to Bubble.io Workflow Completion Webhook       │
│                                                     │
│ Request:                                            │
│   POST https://project-kora.bubbleapps.io/          │
│        version-32zru/api/1.1/wf/                    │
│        workflow_completed                           │
│                                                     │
│   Body: {                                           │
│     "event_type": "generate_persona",               │
│     "record_id": null,                              │
│     "intervention_id": 123                          │
│   }                                                 │
│                                                     │
│ Bubble.io:                                          │
│   - Refreshes persona list in UI                    │
│   - Shows success notification                      │
│   - Enables next step in workflow                   │
└─────────────────────────────────────────────────────┘
```

---

## Xano Database Structure

```
┌─────────────────────────────────────────────────────┐
│                  Xano Instance                      │
│             xyot-fwcy-i2yo.e2.xano.io              │
│                                                     │
│  ┌─────────────────────────────────────────────┐   │
│  │          X-Data-Source Router               │   │
│  │                                             │   │
│  │  if (header === 'dev')  → dev_database     │   │
│  │  if (header === 'live') → live_database    │   │
│  └──────────────┬──────────────────────────────┘   │
│                 │                                   │
│        ┌────────┴────────┐                          │
│        ▼                 ▼                          │
│  ┌──────────┐      ┌──────────┐                    │
│  │  dev DB  │      │ live DB  │                    │
│  └──────────┘      └──────────┘                    │
│                                                     │
│  Each database contains:                           │
│                                                     │
│  ┌─────────────────────────────────────────────┐   │
│  │ interventions (core table)                  │   │
│  │ ├─ intervention_id (PK)                     │   │
│  │ ├─ client                                   │   │
│  │ ├─ location                                 │   │
│  │ ├─ core_challenge                           │   │
│  │ └─ ... (15+ fields)                         │   │
│  └─────────────────────────────────────────────┘   │
│         │                                           │
│         │ 1:many relationships                      │
│         ▼                                           │
│  ┌─────────────────────────────────────────────┐   │
│  │ Related Tables (all FK to intervention_id)  │   │
│  │                                             │   │
│  │ ├─ personas (23 fields)                     │   │
│  │ ├─ system_map (3 fields)                    │   │
│  │ ├─ assumptions (2 fields)                   │   │
│  │ ├─ research_questions (2 fields)            │   │
│  │ ├─ behavioural_objectives (2 fields)        │   │
│  │ ├─ strategies (7 fields)                    │   │
│  │ ├─ territories (4 fields)                   │   │
│  │ ├─ tfd (11 fields)                          │   │
│  │ ├─ cta (3 fields)                           │   │
│  │ ├─ key_messages (3 fields)                  │   │
│  │ ├─ mrel (5 fields)                          │   │
│  │ ├─ campaign_journey_map (5 fields)          │   │
│  │ ├─ com_b_analysis (2 fields)                │   │
│  │ ├─ research_insights (2 fields)             │   │
│  │ └─ ... (21 tables total)                    │   │
│  │                                             │   │
│  │ 1:1 relationships                           │   │
│  │                                             │   │
│  │ ├─ creative_brief (17 fields)               │   │
│  │ ├─ oasis_map (14 fields)                    │   │
│  │ ├─ gwtb (5 fields)                          │   │
│  │ └─ narrative_framework (3 fields)           │   │
│  └─────────────────────────────────────────────┘   │
│                                                     │
│  Utility Tables:                                    │
│  ┌─────────────────────────────────────────────┐   │
│  │ error_logs                                  │   │
│  │ ├─ workflow_name                            │   │
│  │ ├─ error_message                            │   │
│  │ ├─ execution_id                             │   │
│  │ └─ data_source                              │   │
│  └─────────────────────────────────────────────┘   │
└─────────────────────────────────────────────────────┘
```

---

## Future Architecture (Next.js + Supabase)

```
┌─────────────────────────────────────────────────────────────────────────┐
│                         Kora App Frontend (Next.js)                      │
│                                                                          │
│  ┌──────────────┐  ┌──────────────┐  ┌──────────────┐                 │
│  │  Intervention│  │   Generate   │  │    View      │                 │
│  │    Setup     │  │   Personas   │  │   Results    │                 │
│  └──────┬───────┘  └──────┬───────┘  └──────────────┘                 │
│         │                  │                                            │
│         │ Client Component │ Client Component                           │
│         │ onClick handler  │ onClick handler                            │
└─────────┼──────────────────┼────────────────────────────────────────────┘
          │                  │
          │ POST {           │ POST {
          │   intervention_id│   intervention_id,
          │   data_source    │   data_source
          │ }                │ }
          ▼                  ▼
┌─────────────────────────────────────────────────────────────────────────┐
│                       Next.js API Routes                                 │
│                                                                          │
│  /api/generate/persona     /api/generate/strategy                       │
│  /api/generate/system-map  /api/generate/territory                      │
│  /api/generate/brief       /api/generate/cta                            │
│  ... (19 total endpoints)                                                │
│                                                                          │
│  ┌──────────────────────────────────────────────────────────────────┐  │
│  │ Example: /api/generate/persona/route.ts                          │  │
│  │                                                                  │  │
│  │ export async function POST(request) {                           │  │
│  │   // 1. Extract request data                                    │  │
│  │   const { intervention_id, data_source } = await request.json()│  │
│  │                                                                  │  │
│  │   // 2. Create Supabase client with auth                        │  │
│  │   const supabase = createRouteHandlerClient({cookies})         │  │
│  │                                                                  │  │
│  │   // 3. Set RLS context for dev/live routing                   │  │
│  │   await supabase.rpc('set_data_source', {                      │  │
│  │     source: data_source                                         │  │
│  │   })                                                            │  │
│  │                                                                  │  │
│  │   // 4. Get intervention context ──────────────┐                │  │
│  │   const intervention = await supabase          │                │  │
│  │     .from('interventions')                     │                │  │
│  │     .select('*')                               │                │  │
│  │     .eq('intervention_id', intervention_id)    │                │  │
│  │                                                │                │  │
│  │   // 5. Get AI prompt ────────────┐           │                │  │
│  │   const prompt = await            │           │                │  │
│  │     getLangfusePrompt(            │           │                │  │
│  │       'stage1/personas'           │           │                │  │
│  │     )                             │           │                │  │
│  │                                   │           │                │  │
│  │   // 6. Generate personas         │           │                │  │
│  │   const personas = await          │           │                │  │
│  │     generateWithOpenAI(           │           │                │  │
│  │       prompt,                     │           │                │  │
│  │       intervention                │           │                │  │
│  │     )                             │           │                │  │
│  │                                   │           │                │  │
│  │   // 7. Save to Supabase ─────────┼───────────┤                │  │
│  │   const result = await supabase   │           │                │  │
│  │     .from('personas')             │           │                │  │
│  │     .insert(personas)             │           │                │  │
│  │                                   │           │                │  │
│  │   return Response.json(result)    │           │                │  │
│  │ }                                 │           │                │  │
│  └───────────────────────────────────┼───────────┼────────────────┘  │
└───────────────────────────────────────┼───────────┼──────────────────────┘
                                        │           │
                    ┌───────────────────┘           │
                    │                               │
                    ▼                               ▼
        ┌───────────────────────┐     ┌─────────────────────────────┐
        │   Langfuse Platform   │     │    Supabase Database        │
        │   (unchanged)         │     │    (PostgreSQL)             │
        │                       │     │                             │
        │  - Prompt Management  │     │  ┌────────────────────────┐ │
        │  - Version Control    │     │  │  RLS Policies          │ │
        │                       │     │  │                        │ │
        │  stage1/personas      │     │  │  CREATE POLICY         │ │
        │  stage2/strategy      │     │  │  data_source_isolation │ │
        │  ... etc              │     │  │  ON personas           │ │
        └───────────────────────┘     │  │  USING (               │ │
                                      │  │    data_source =       │ │
                    ┌─────────────────┤  │    current_setting(    │ │
                    │                 │  │      'app.data_source' │ │
                    ▼                 │  │    )::TEXT             │ │
        ┌───────────────────────┐     │  │  )                     │ │
        │  OpenAI / Claude API  │     │  └─────────┬──────────────┘ │
        │   (unchanged)         │     │            │                │
        │                       │     │            ▼                │
        │  - GPT-4              │     │  ┌────────────────────────┐ │
        │  - Claude 3.5         │     │  │  Tables (21 total)     │ │
        │  - Structured Output  │     │  │                        │ │
        │                       │     │  │  interventions         │ │
        └───────────────────────┘     │  │  personas              │ │
                                      │  │  system_map            │ │
                                      │  │  assumptions           │ │
                                      │  │  strategies            │ │
                                      │  │  territories           │ │
                                      │  │  tfd                   │ │
                                      │  │  ... etc               │ │
                                      │  │                        │ │
                                      │  │  All tables have:      │ │
                                      │  │  - intervention_id (FK)│ │
                                      │  │  - data_source column  │ │
                                      │  │  - created_at          │ │
                                      │  │  - updated_at          │ │
                                      │  └────────────────────────┘ │
                                      └─────────────────────────────┘
```

---

## Authentication Flow Comparison

### Current (Xano)
```
N8N Workflow
    │
    ├─ Uses Xano credential (stored in N8N)
    │  └─ Contains: baseUrl + accessToken
    │
    ▼
Xano API
    │
    └─ Validates Bearer token
       └─ No user context, just API auth
```

### Future (Supabase)
```
Next.js Client
    │
    ├─ User logs in via Supabase Auth
    │  └─ Gets JWT token (stored in cookie)
    │
    ▼
Next.js API Route
    │
    ├─ createRouteHandlerClient({cookies})
    │  └─ Reads JWT from cookie
    │
    ▼
Supabase Database
    │
    └─ RLS policies enforce:
       ├─ User can only access their interventions
       ├─ User can only see their org's data
       └─ data_source isolation (dev/live)
```

---

## Data Routing Comparison

### Current (X-Data-Source Header)
```
Request
    │
    ├─ Header: X-Data-Source: dev
    │
    ▼
Xano Router
    │
    ├─ if (header === 'dev')  → dev_database
    └─ if (header === 'live') → live_database
```

### Future (Supabase RLS)
```
Request
    │
    ├─ Body: { data_source: 'dev' }
    │
    ▼
API Route
    │
    ├─ await supabase.rpc('set_config', {
    │    setting: 'app.data_source',
    │    value: data_source
    │  })
    │
    ▼
Supabase
    │
    ├─ RLS Policy checks:
    │  WHERE data_source = current_setting('app.data_source')::TEXT
    │
    └─ Returns only matching rows
```

---

## Entity Dependency Graph

```
intervention
    │
    ├─ personas (independent)
    │
    ├─ system_map (independent)
    │      │
    │      └─ behavioural_objectives
    │             │
    │             └─ assumptions
    │                    │
    │                    └─ research_questions
    │
    ├─ research_insights (independent)
    │
    ├─ com_b_analysis (independent)
    │      │
    │      └─ tfd (requires com_b)
    │
    ├─ strategies (independent)
    │      │
    │      └─ territory (requires strategy)
    │             │
    │             ├─ cta (requires territory)
    │             │
    │             ├─ key_messages (requires territory)
    │             │
    │             └─ smp (requires territory)
    │
    ├─ campaign_journey_map (requires multiple)
    │
    ├─ narrative_framework (requires multiple)
    │
    ├─ creative_brief (final compilation)
    │
    ├─ oasis_map (final strategy doc)
    │
    ├─ gwtb (final framework)
    │
    └─ mrel (evaluation framework)
```

**Legend:**
- `(independent)` - Can be generated immediately after intervention setup
- `(requires X)` - Depends on X being completed first
- `(requires multiple)` - Depends on several entities being complete
- `(final X)` - Comprehensive document compiling multiple entities

---

## Migration Roadmap Visualization

```
Phase 1: Foundation
┌─────────────────────────────────────┐
│ ✓ Supabase project setup            │
│ ✓ Schema design (21 tables)         │
│ ✓ RLS policies                      │
│ ✓ Authentication setup              │
└─────────────────────────────────────┘
         │
         ▼
Phase 2: Core Generation (Independent Entities)
┌─────────────────────────────────────┐
│ ✓ /api/generate/persona             │
│ ✓ /api/generate/system-map          │
│ ✓ /api/generate/research-insights   │
│ ✓ /api/generate/comb                │
└─────────────────────────────────────┘
         │
         ▼
Phase 3: Dependent Entities
┌─────────────────────────────────────┐
│ ✓ /api/generate/objectives          │
│ ✓ /api/generate/assumptions         │
│ ✓ /api/generate/research-questions  │
│ ✓ /api/generate/tfd                 │
└─────────────────────────────────────┘
         │
         ▼
Phase 4: Strategy Layer
┌─────────────────────────────────────┐
│ ✓ /api/generate/strategy            │
│ ✓ /api/generate/territory           │
│ ✓ /api/generate/cta                 │
│ ✓ /api/generate/smp                 │
│ ✓ /api/generate/key-messages        │
└─────────────────────────────────────┘
         │
         ▼
Phase 5: Compilation Documents
┌─────────────────────────────────────┐
│ ✓ /api/generate/campaign-journey    │
│ ✓ /api/generate/narrative           │
│ ✓ /api/generate/brief               │
│ ✓ /api/generate/oasis               │
│ ✓ /api/generate/gwtb                │
│ ✓ /api/generate/mrel                │
└─────────────────────────────────────┘
         │
         ▼
Phase 6: Polish & Optimization
┌─────────────────────────────────────┐
│ ✓ Error handling                    │
│ ✓ Rate limiting                     │
│ ✓ Caching                           │
│ ✓ Streaming responses               │
│ ✓ Testing                           │
│ ✓ Monitoring                        │
└─────────────────────────────────────┘
```

---

*Architecture analysis completed: 2026-02-12*
