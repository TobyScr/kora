# Xano API Endpoints - Comprehensive Mapping from N8N Workflows

**Repository Analyzed:** Ronald-BM/cleaned-n8n
**Analysis Date:** 2026-02-12
**Xano Base URL:** `https://xyot-fwcy-i2yo.e2.xano.io/`

## Overview

All Xano API calls in the N8N workflows follow a consistent pattern:

### Authentication & Routing
- **Authentication:** Bearer token (configured in Xano credentials)
- **Data Source Routing Header:** `X-Data-Source`
  - Values: `dev` or `live`
  - Routes requests to development or production database
  - Passed from webhook request body: `data_source` parameter
- **Core Parameter:** `intervention_id` (required for most operations)

---

## Xano API Endpoints by Category

### 1. PERSONAS

#### Generate Multiple Personas
- **N8N Workflow:** `generatePersonas`
- **Webhook Endpoint:** `POST /generate_persona`
- **Xano Operations:**
  1. `GET` - Get Intervention Info
  2. `POST` - Create Personas (bulk)

**Request Body Fields:**
```json
{
  "intervention_id": integer,
  "data_source": "dev" | "live"
}
```

**Response Schema (Persona Table):**
```json
{
  "intervention_id": integer [REQUIRED],
  "persona_label": string [REQUIRED],
  "tagline": string [REQUIRED],
  "segment_description": string [REQUIRED],
  "name": string [REQUIRED],
  "age": string [REQUIRED],
  "gender": string [REQUIRED],
  "language": string [REQUIRED],
  "location": string [REQUIRED],
  "marital_status": string [REQUIRED],
  "children": string [REQUIRED],
  "education": string [REQUIRED],
  "employment": string [REQUIRED],
  "quote": string [REQUIRED],
  "file": string | null,
  "values": string [REQUIRED],
  "aspirations": string [REQUIRED],
  "life_goals": string [REQUIRED],
  "concerns_challenges": string [REQUIRED],
  "social_influencer_network": string [REQUIRED],
  "media_consumption_habits": string [REQUIRED],
  "language_symbols": string [REQUIRED]
}
```

#### Generate Single Persona
- **N8N Workflow:** `generateSinglePersona`
- **Webhook Endpoint:** `POST /generate_single_persona`
- Same schema as multiple personas

#### Generate Persona Picture
- **N8N Workflow:** `generatePersonaPicture`
- **Xano Operations:**
  1. `GET` - Get Persona Info
  2. `POST` - Update Persona with Image

---

### 2. SYSTEM MAP

#### Generate System Map
- **N8N Workflow:** `generateSystemMap`
- **Webhook Endpoint:** `POST /generate_system_map`
- **Xano Operations:**
  1. `GET` - Get Intervention Info
  2. `POST` - Create System Map entries

**Response Schema (System Map Table):**
```json
{
  "intervention_id": integer [REQUIRED],
  "challenge": string [REQUIRED],
  "description": string [REQUIRED]
}
```

#### Generate Single Challenge
- **N8N Workflow:** `generateSingleChallenge (System Map)`
- **Webhook Endpoint:** `POST /generate_single_challenge`
- **Xano Operations:**
  1. `GET` - Get Intervention Info
  2. `POST` - Create System Map entry
  3. `GET` - Get Challenge (verification)

---

### 3. BRIEF

#### Generate Creative Brief Development
- **N8N Workflow:** `generate Creative Brief Development - v2`
- **Webhook Endpoint:** `POST /generate_cbd`
- **Xano Operations:**
  1. `GET` - Get Intervention Info
  2. `POST` - Create Creative Brief

**Response Schema (Creative Brief Table):**
```json
{
  "intervention_id": integer [REQUIRED],
  "target_profile": string [REQUIRED],
  "barriers": string [REQUIRED],
  "strategy": string [REQUIRED],
  "territory": string [REQUIRED],
  "cta": string [REQUIRED],
  "smp": string [REQUIRED],
  "key_messages": string [REQUIRED],
  "tfd_shift": string [REQUIRED],
  "deliverables": string [REQUIRED],
  "timings": string [REQUIRED],
  "mandatories": string [REQUIRED],
  "budget": string [REQUIRED],
  "inspiration": string [REQUIRED],
  "summary": string [REQUIRED],
  "context": string [REQUIRED],
  "problem": string [REQUIRED],
  "objectives": string [REQUIRED]
}
```

#### Generate Brief Output
- **N8N Workflow:** `generateBriefOutput`
- **Xano Operations:**
  1. `POST` - Save Brief data

**Response Schema (Brief Output Table):**
```json
{
  "intervention_id": integer,
  "client": string,
  "location": string,
  "budget_currency": string,
  "budget_min": integer,
  "budget_max": integer,
  "timeline_unit": string,
  "timeline_min": integer,
  "timeline_max": integer,
  "problem_definition": string,
  "high_level_objective": string,
  "is_confirmed": boolean,
  "section_stage_id": integer,
  "expected_deliverables": string,
  "ta_profile": array,
  "dos": array,
  "donts": array
}
```

#### Generate Brief Overview
- **N8N Workflow:** `generateBriefOverview`
- **Xano Operations:**
  1. `POST` - Save Brief Chat Content

**Response Schema:**
```json
{
  "intervention_id": integer,
  "client_funder": string,
  "core_challenge": string,
  "initial_objective": string,
  "initial_target_audience": string,
  "location": string,
  "dos": array,
  "donts": array,
  "budget_amount": integer,
  "budget_currency": string,
  "timeline_end_date": string,
  "expected_outputs": string,
  "suggested_intervention_type": string
}
```

---

### 4. ASSUMPTIONS

#### Generate Assumptions
- **N8N Workflow:** `generateAssumptions`
- **Webhook Endpoint:** `POST /generate_assumption`
- **Xano Operations:**
  1. `GET` - Get Intervention Info
  2. `GET` - Get Selected Objective
  3. `POST` - Create Assumptions

**Response Schema (Assumptions Table):**
```json
{
  "intervention_id": integer [REQUIRED],
  "assumption": string [REQUIRED]
}
```

#### Generate Single Assumption
- **N8N Workflow:** `generateSingleAssumption`
- **Webhook Endpoint:** `POST /generate_single_assumption`
- Same schema as multiple assumptions

#### Generate Assumption Research Questions
- **N8N Workflow:** `generateAssumptionResearchQuestions`
- **Webhook Endpoint:** `POST /generate_research_questions`
- **Xano Operations:**
  1. `GET` - Get Intervention Info
  2. `GET` - Get Selected Objective
  3. `POST` - Create Assumption Research Questions

**Response Schema (Research Questions Table):**
```json
{
  "intervention_id": integer [REQUIRED],
  "question": string [REQUIRED]
}
```

#### Generate Single Assumption Question
- **N8N Workflow:** `generateSingleAssumptionQuestion`
- **Webhook Endpoint:** `POST /generate_single_assumption_question`

#### Generate Assumption Testing
- **N8N Workflow:** `generateAssumptionTesting`
- **Webhook Endpoint:** `POST /generate_assumption`
- **Xano Operations:**
  1. `GET` - Get Intervention Info
  2. `GET` - Get Selected Objective
  3. `POST` - Create Assumption Testing entry

---

### 5. BEHAVIOURAL OBJECTIVES

#### Generate Behavioural Objective
- **N8N Workflow:** `generateBehaviouralObjectiveSetting`
- **Webhook Endpoint:** `POST /behavior_objective`
- **Xano Operations:**
  1. `GET` - Get Intervention Info
  2. `GET` - Get Selected Entry Point
  3. `POST` - Create Behavioural Objective

**Response Schema (Behavioural Objectives Table):**
```json
{
  "intervention_id": integer [REQUIRED],
  "objective": string [REQUIRED]
}
```

#### Generate Single Objective
- **N8N Workflow:** `generateSingleObjective (Behavioral Objective )`
- **Webhook Endpoint:** `POST /generate_single_objective`
- Same schema

---

### 6. RESEARCH

#### Generate Deep Research Questions
- **N8N Workflow:** `Generate Deep Research Questions`
- **Webhook Endpoint:** `POST /generate_deep_research_old`
- **Xano Operations:**
  1. `GET` - Brief data
  2. `GET` - Check if research available
  3. `POST` - Save research questions

**Response Schema:**
```json
{
  "prompt": object
}
```

#### Generate Deep Research Prompts
- **N8N Workflow:** `generateDeepResearchPrompts`
- **Webhook Endpoint:** `POST /generate_deep_research`
- **Xano Operations:**
  1. `GET` - Get Intervention Info
  2. `GET` - Research availability check
  3. `POST` - Save research prompts

**Response Schema:**
```json
{
  "prompt": object
}
```

#### Generate Research Insights
- **N8N Workflow:** `generateResearchInsights`
- **Webhook Endpoint:** `POST /generate_insights`
- **Xano Operations:**
  1. `GET` - Get Intervention Info
  2. `POST` - Save Research Insights

**Response Schema (Research Insights Table):**
```json
{
  "insights": array [REQUIRED]
}
```

#### Generate Single Research Insight
- **N8N Workflow:** `generateSingleResearchInsights`
- **Webhook Endpoint:** `POST /generate_single_insight`

---

### 7. STRATEGY

#### Generate Strategy
- **N8N Workflow:** `generate Strategy - v2`
- **Webhook Endpoint:** `POST /generate_strategy`
- **Xano Operations:**
  1. `GET` - Get Intervention Info
  2. `POST` - Create Strategy entries

**Response Schema (Strategy Table):**
```json
{
  "intervention_id": number [REQUIRED],
  "strategy": string [REQUIRED],
  "type": string [REQUIRED],
  "description": string [REQUIRED],
  "pros": string [REQUIRED],
  "cons": string [REQUIRED],
  "selected": boolean [REQUIRED]
}
```

#### Generate Single Strategy
- **N8N Workflow:** `generate Single Strategy - v2`
- **Webhook Endpoint:** `POST /generate_single_strategy`
- **Xano Operations:**
  1. `GET` - Get Intervention Info
  2. `GET` - Get Strategy (for regeneration)
  3. `POST` - Update Strategy

---

### 8. TERRITORY

#### Generate Territory
- **N8N Workflow:** `generate Territory - v2`
- **Webhook Endpoint:** `POST /generate_territory`
- **Xano Operations:**
  1. `GET` - Get Intervention Info
  2. `POST` - Create Territory entries

**Response Schema (Territory Table):**
```json
{
  "intervention_id": integer [REQUIRED],
  "title": string [REQUIRED],
  "description": string [REQUIRED],
  "credibility": string [REQUIRED]
}
```

#### Generate Single Territory
- **N8N Workflow:** `generateSingleTerritory - v2`
- **Webhook Endpoint:** `POST /generate_single_territory`
- **Xano Operations:**
  1. `GET` - Get Intervention Info
  2. `GET` - Get Territory
  3. `POST` - Update Territory

---

### 9. TFD (Think-Feel-Do)

#### Generate TFD
- **N8N Workflow:** `generate TFD - v2`
- **Webhook Endpoint:** `POST /generate_tfd`
- **Xano Operations:**
  1. `GET` - Get Intervention Info
  2. `POST` - Create TFD entries

**Response Schema (TFD Table):**
```json
{
  "com_b1_id": string [REQUIRED],
  "com_b2_id": string [REQUIRED],
  "intervention_id": number [REQUIRED],
  "created_at": number [REQUIRED],
  "current_think": string [REQUIRED],
  "current_feel": string [REQUIRED],
  "current_do": string [REQUIRED],
  "future_think": string [REQUIRED],
  "future_feel": string [REQUIRED],
  "future_do": string [REQUIRED],
  "selected": boolean [REQUIRED]
}
```

#### Generate Single TFD
- **N8N Workflow:** `generateSingleTFD - v2`
- **Webhook Endpoint:** `POST /generatesinlgetfd` or `POST /generate_single_tfd`
- **Xano Operations:**
  1. `GET` - Get Intervention Info
  2. `GET` - Get TFD (optional, for regeneration)
  3. `POST` - Update TFD

---

### 10. SMP (Strategic Messaging Platform)

#### Generate SMP
- **N8N Workflow:** `generate SMP - v2`
- **Webhook Endpoint:** `POST /generate_smp`
- **Xano Operations:**
  1. `GET` - Get Intervention Info
  2. `POST` - Create SMP entries

**Response Schema (SMP Table):**
```json
{
  "output": array [REQUIRED]
}
```

#### Generate Single SMP
- **N8N Workflow:** `generate Single SMP - v2`
- **Webhook Endpoint:** `POST /generate_single_smp`
- **Xano Operations:**
  1. `GET` - Get Intervention Info
  2. `GET` - Get SMP
  3. `POST` - Update SMP

---

### 11. CTA (Call to Action)

#### Generate CTA
- **N8N Workflow:** `generate CTA - v2`
- **Webhook Endpoint:** `POST /generate_cta`
- **Xano Operations:**
  1. `GET` - Get Intervention Info
  2. `POST` - Create CTA entries

**Response Schema (CTA Table):**
```json
{
  "intervention_id": integer [REQUIRED],
  "title": string [REQUIRED],
  "validations": string [REQUIRED]
}
```

#### Generate Single CTA
- **N8N Workflow:** `generate Single CTA - v2`
- **Webhook Endpoint:** `POST /generate_single_cta`
- **Xano Operations:**
  1. `GET` - Get Intervention Info
  2. `GET` - Get CTA
  3. `POST` - Update CTA

---

### 12. KEY MESSAGES

#### Generate Key Messages
- **N8N Workflow:** `generate Single Key Message - v2`
- **Webhook Endpoint:** `POST /generate_single_key_messages`
- **Xano Operations:**
  1. `GET` - Get Intervention Info
  2. `GET` - Get Key Messages (optional)
  3. `POST` - Create/Update Key Messages

**Response Schema (Key Messages Table):**
```json
{
  "core_narrative": object [REQUIRED],
  "key_messages": array [REQUIRED]
}
```

---

### 13. MREL (Monitoring, Research, Evaluation & Learning)

#### Generate MREL
- **N8N Workflow:** `generate MREL - v2`
- **Webhook Endpoint:** `POST /generate_mrel`
- **Xano Operations:**
  1. `GET` - Get Intervention Info
  2. `POST` - Create MREL entries

**Response Schema (MREL Table):**
```json
{
  "indicator_type": integer [REQUIRED],
  "intervention_id": integer [REQUIRED],
  "indicator": string [REQUIRED],
  "target": string [REQUIRED],
  "data_source": string [REQUIRED]
}
```

#### Generate Single MREL
- **N8N Workflow:** `generate Single MREL - v2`
- **Webhook Endpoint:** `POST /generate_single_mrel`

---

### 14. GWTB (Get-Who-To-By)

#### Generate GWTB
- **N8N Workflow:** `generate GWTB - v2`
- **Webhook Endpoint:** `POST /generate_gwtb`
- **Xano Operations:**
  1. `GET` - Get Intervention Info
  2. `PATCH` - Update GWTB

**Response Schema (GWTB Table):**
```json
{
  "intervention_id": number [REQUIRED],
  "get": string [REQUIRED],
  "who": string [REQUIRED],
  "to": string [REQUIRED],
  "by": string [REQUIRED]
}
```

---

### 15. CAMPAIGN JOURNEY MAP

#### Generate Campaign Journey Map
- **N8N Workflow:** `generate Campaign Journey Map - v2`
- **Webhook Endpoint:** `POST /generate_cjm`
- **Xano Operations:**
  1. `GET` - Get Intervention Info
  2. `POST` - Create Campaign Journey Map entries

**Response Schema (Campaign Journey Map Table):**
```json
{
  "journey_phase_id": integer [REQUIRED],
  "intervention_id": integer [REQUIRED],
  "key_moments": string [REQUIRED],
  "key_messages": string [REQUIRED],
  "key_mechanism": string [REQUIRED]
}
```

---

### 16. NARRATIVE FRAMEWORK

#### Generate Narrative Framework
- **N8N Workflow:** `generate Narrative Framework - v2`
- **Webhook Endpoint:** `POST /generate_narrative`
- **Xano Operations:**
  1. `GET` - Get Intervention Info
  2. `POST` - Create Core Narrative
  3. `POST` - Create Key Messages

**Response Schema (Narrative Table):**
```json
{
  "core_narrative": object [REQUIRED],
  "key_messages": array [REQUIRED]
}
```

---

### 17. OASIS MAP

#### Generate OASIS Map
- **N8N Workflow:** `generate OASIS Map - v2`
- **Webhook Endpoint:** `POST /generate_oasis`
- **Xano Operations:**
  1. `GET` - Get Intervention Info
  2. `POST` - Create OASIS Map

**Response Schema (OASIS Map Table):**
```json
{
  "intervention_id": integer [REQUIRED],
  "core_challenge": string [REQUIRED],
  "outcome": string [REQUIRED],
  "campaign_objectives": string [REQUIRED],
  "demographics": string [REQUIRED],
  "attitudes_behaviors": string [REQUIRED],
  "barriers": string [REQUIRED],
  "selected_strategy": string [REQUIRED],
  "key_messages": string [REQUIRED],
  "core_cta": string [REQUIRED],
  "creative_territory": string [REQUIRED],
  "user_journey": string [REQUIRED],
  "timings": string [REQUIRED],
  "metrics": string [REQUIRED]
}
```

---

### 18. COM-B ANALYSIS

#### Generate COM-B Analysis
- **N8N Workflow:** `generateComBAnalysis`
- **Webhook Endpoint:** `POST /generate_comb`
- **Xano Operations:**
  1. `GET` - Get Intervention Info
  2. `POST` - Create COM-B entries

**Response Schema (COM-B Table):**
```json
{
  "results": array [REQUIRED]
}
```

#### Generate Single COM-B
- **N8N Workflow:** `generateSingleComB`
- **Webhook Endpoint:** `POST /generate_single_comb`

---

### 19. UTILITY ENDPOINTS

#### Error Logging
- **N8N Workflow:** `Kora Generic Error Workflow`
- **Xano Operations:**
  1. `POST` - Create Error Log

**Request Body:**
```json
{
  "workflow_name": string,
  "error_message": string,
  "execution_id": string,
  "data_source": "dev" | "live"
}
```

#### Document Chunking
- **N8N Workflow:** `chunkDocument`
- **Webhook Endpoint:** `POST /chunk_document`
- **Xano Operations:**
  1. `POST` - Respond to Xano with status

**Request Body:**
```json
{
  "result": "started",
  "uuid": string,
  "file_id": string,
  "data_source": "dev" | "live"
}
```

#### Scrape URL
- **N8N Workflow:** `scrapeUrl`
- **Webhook Endpoint:** `POST /scrape_url`

#### Get File
- **N8N Workflow:** `getFIle Xano Connected`
- **Webhook Endpoint:** `POST /996fe58c-461f-4667-aace-56555a482b4c`

---

## Xano Data Model Summary

Based on the structured outputs from all workflows, the Xano database contains these primary tables:

### Core Tables

1. **interventions** - Main intervention records
   - `intervention_id` (primary key)
   - `client`
   - `location`
   - `budget_*` fields
   - `timeline_*` fields
   - `problem_definition`
   - `high_level_objective`

2. **personas**
   - `intervention_id` (foreign key)
   - Demographics: `name`, `age`, `gender`, `language`, `location`, `marital_status`, `children`, `education`, `employment`
   - Psychographics: `values`, `aspirations`, `life_goals`, `concerns_challenges`
   - Behavior: `social_influencer_network`, `media_consumption_habits`, `language_symbols`
   - `persona_label`, `tagline`, `segment_description`, `quote`
   - `file` (persona image)

3. **system_map**
   - `intervention_id` (foreign key)
   - `challenge`
   - `description`

4. **assumptions**
   - `intervention_id` (foreign key)
   - `assumption`

5. **research_questions**
   - `intervention_id` (foreign key)
   - `question`

6. **behavioural_objectives**
   - `intervention_id` (foreign key)
   - `objective`

7. **strategies**
   - `intervention_id` (foreign key)
   - `strategy`, `type`, `description`, `pros`, `cons`
   - `selected` (boolean)

8. **territories**
   - `intervention_id` (foreign key)
   - `title`, `description`, `credibility`

9. **tfd** (Think-Feel-Do)
   - `intervention_id` (foreign key)
   - `com_b1_id`, `com_b2_id`
   - `current_think`, `current_feel`, `current_do`
   - `future_think`, `future_feel`, `future_do`
   - `selected` (boolean)
   - `created_at`

10. **cta** (Call to Action)
    - `intervention_id` (foreign key)
    - `title`, `validations`

11. **key_messages**
    - `intervention_id` (foreign key)
    - `core_narrative` (object)
    - `key_messages` (array)

12. **mrel** (Monitoring, Research, Evaluation & Learning)
    - `intervention_id` (foreign key)
    - `indicator_type`, `indicator`, `target`, `data_source`

13. **gwtb** (Get-Who-To-By)
    - `intervention_id` (foreign key)
    - `get`, `who`, `to`, `by`

14. **campaign_journey_map**
    - `intervention_id` (foreign key)
    - `journey_phase_id`
    - `key_moments`, `key_messages`, `key_mechanism`

15. **oasis_map**
    - `intervention_id` (foreign key)
    - Comprehensive strategy fields

16. **com_b_analysis**
    - `intervention_id` (foreign key)
    - `results` (array)

17. **creative_brief**
    - `intervention_id` (foreign key)
    - Comprehensive brief fields

18. **research_insights**
    - `intervention_id` (foreign key)
    - `insights` (array)

19. **error_logs**
    - `workflow_name`, `error_message`, `execution_id`
    - `data_source`

---

## API Call Patterns

### Common GET Operations

All GET operations follow this pattern:

1. **Get Intervention Info**
   - Fetches core intervention data
   - Used at the start of most workflows
   - Required for context in AI generation

2. **Get [Entity]**
   - Fetches specific entity for regeneration
   - Used in "single" generation workflows
   - Examples: Get CTA, Get Strategy, Get Territory

3. **Get Selected [Entity]**
   - Fetches user-selected items
   - Examples: Get Selected Objective, Get Selected Entry Point

### Common POST Operations

1. **Bulk Generation** - Array of generated items
2. **Single Generation** - One item, often updating existing
3. **Status Updates** - Workflow completion notifications

### HTTP Methods Used

- **GET**: Read operations, fetching intervention/entity data
- **POST**: Create new records (bulk or single)
- **PATCH**: Update existing records (e.g., GWTB)

---

## Integration Notes

### For Backend Migration to Supabase

1. Each Xano table maps to a Supabase table
2. All tables use `intervention_id` as foreign key relationship
3. Authentication will need to be reconfigured for Supabase
4. X-Data-Source header routing can be replaced with Supabase policies or separate databases

### API Endpoint Structure

Since N8N workflows use Xano credentials with empty URLs, the actual endpoint structure is:

```
Base: https://xyot-fwcy-i2yo.e2.xano.io/
Auth: Bearer {token}
Headers: X-Data-Source: {dev|live}

Implied endpoints (to be verified with Xano API):
- GET /api/intervention/{intervention_id}
- POST /api/personas
- POST /api/system_map
- GET /api/strategies/{id}
- etc.
```

### Critical Dependencies

1. **Langfuse Integration** - For prompt management
2. **OpenAI API** - For AI generation
3. **Supabase** - For RAG document storage
4. **Bubble.io** - For workflow completion notifications

---

## Recommendations

### For Kora App Migration

1. **Map Each Xano Table** to Supabase equivalent
2. **Preserve Field Names** for easier migration
3. **Implement Row-Level Security** in Supabase to replace X-Data-Source routing
4. **Create API Routes** in Next.js to match N8N webhook patterns
5. **Maintain intervention_id** as core relationship key
6. **Consider GraphQL** for complex queries with joins

### Data Model Insights

- Most entities are **intervention-scoped** (tied to intervention_id)
- Many entities support **regeneration** (fetching existing before updating)
- **Selection state** is tracked (e.g., `selected` boolean in strategies, TFD)
- **Array fields** are common (insights, key_messages, results)
- **Timestamps** tracked minimally (mainly created_at where present)

---

## Total Endpoint Count

- **37** "Get Intervention Info" calls across workflows
- **60+** distinct Xano operations across all workflows
- **19** major functional categories
- **195** total HTTP Request nodes analyzed

---

*This mapping was generated by analyzing all JSON workflow files in the Ronald-BM/cleaned-n8n repository.*
