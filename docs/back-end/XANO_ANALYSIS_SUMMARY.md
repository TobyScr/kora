# Xano API Analysis - Executive Summary

**Analysis Date:** 2026-02-12
**Repository:** Ronald-BM/cleaned-n8n
**Analyst:** Claude Code

---

## What Was Analyzed

I analyzed **72 N8N workflow JSON files** from the cleaned-n8n GitHub repository to extract all Xano API endpoint patterns, data models, and integration architecture.

---

## Key Findings

### 1. API Architecture

**Base URL:** `https://xyot-fwcy-i2yo.e2.xano.io/`

**Authentication:**
- Bearer token authentication
- Token stored in N8N Xano credentials
- All requests authenticated via Authorization header

**Data Routing:**
- **X-Data-Source header** routes requests to dev or live database
- Values: `dev` | `live`
- Passed from Bubble.io UI through N8N to Xano
- Enables testing in development without affecting production

### 2. Xano Data Model

**21 Primary Tables Identified:**

1. interventions (core entity)
2. personas
3. system_map
4. assumptions
5. research_questions
6. behavioural_objectives
7. strategies
8. territories
9. tfd (think-feel-do)
10. smp (strategic messaging platform)
11. cta (call to action)
12. key_messages
13. mrel (monitoring, research, evaluation & learning)
14. gwtb (get-who-to-by)
15. campaign_journey_map
16. narrative_framework
17. oasis_map
18. com_b_analysis
19. creative_brief
20. research_insights
21. error_logs

**Relationship Pattern:**
- All tables use `intervention_id` as foreign key
- One intervention has many of most entities
- Some tables are 1:1 with intervention (brief, OASIS, GWTB)

### 3. API Endpoint Patterns

**Total Operations Analyzed:** 195 HTTP Request nodes across 60+ workflows

**Common Operations:**

| Operation | Count | Purpose |
|-----------|-------|---------|
| Get Intervention Info | 37 | Fetch intervention context |
| Post [Entity] | 30+ | Create new records |
| Get [Entity] | 15+ | Fetch for regeneration |
| Get Selected [Entity] | 7 | Fetch user selections |

**HTTP Methods:**
- `GET` - Read operations (intervention context, entity retrieval)
- `POST` - Create operations (bulk and single generation)
- `PATCH` - Update operations (GWTB)

### 4. Generation Workflow Categories

**19 Functional Areas:**

1. Personas - User segments and profiles
2. System Map - Challenges and barriers
3. Brief - Campaign brief and overview
4. Assumptions - Testing hypotheses
5. Behavioural Objectives - Target behaviors
6. Research - Deep research questions and insights
7. Strategy - Campaign strategies
8. Territory - Creative territories
9. TFD - Think-Feel-Do framework
10. SMP - Strategic messaging platform
11. CTA - Call to action
12. Key Messages - Core narrative and messages
13. MREL - Monitoring and evaluation
14. GWTB - Get-Who-To-By framework
15. Campaign Journey - User journey mapping
16. Narrative Framework - Story structure
17. OASIS Map - Comprehensive strategy
18. COM-B Analysis - Capability-Opportunity-Motivation-Behavior
19. Error Logging - System monitoring

### 5. Data Fields by Table

#### Personas Table (23 fields)
- Demographics: name, age, gender, language, location, marital_status, children, education, employment
- Psychographics: values, aspirations, life_goals, concerns_challenges
- Behavior: social_influencer_network, media_consumption_habits, language_symbols
- Meta: persona_label, tagline, segment_description, quote, file (image)

#### System Map Table (3 fields)
- challenge, description, intervention_id

#### Assumptions Table (2 fields)
- assumption, intervention_id

#### Strategy Table (7 fields)
- strategy, type, description, pros, cons, selected, intervention_id

#### TFD Table (11 fields)
- com_b1_id, com_b2_id, current_think, current_feel, current_do
- future_think, future_feel, future_do, selected, created_at, intervention_id

#### Creative Brief Table (17 fields)
- target_profile, barriers, strategy, territory, cta, smp, key_messages
- tfd_shift, deliverables, timings, mandatories, budget, inspiration
- summary, context, problem, objectives, intervention_id

#### OASIS Map Table (14 fields)
- core_challenge, outcome, campaign_objectives, demographics
- attitudes_behaviors, barriers, selected_strategy, key_messages
- core_cta, creative_territory, user_journey, timings, metrics, intervention_id

*(Full field lists for all tables available in comprehensive mapping document)*

---

## Integration Architecture

### Current Flow (N8N + Xano)

```
Bubble.io UI
    ↓
    POST to N8N Webhook
    {intervention_id, data_source}
    ↓
    N8N Workflow:
    1. GET Intervention Info from Xano
    2. Fetch AI prompts from Langfuse
    3. Generate content with OpenAI/Claude
    4. POST results to Xano
    ↓
    Notify Bubble.io (completion webhook)
```

### Headers Pattern

```
Authorization: Bearer {xano_token}
X-Data-Source: dev | live
Content-Type: application/json
```

### Request Body Pattern

```json
{
  "intervention_id": integer,
  "data_source": "dev" | "live",
  // ... entity-specific fields
}
```

---

## Migration Implications for Kora App

### 1. Database Migration: Xano → Supabase

**Recommended Approach:**
- Single Supabase database
- Add `data_source` column to all tables
- Use PostgreSQL Row-Level Security (RLS) policies
- Replace X-Data-Source header with RLS context

**Alternative:**
- Separate dev/production databases
- More complex but clearer separation

### 2. API Migration: N8N Webhooks → Next.js API Routes

**Pattern:**
```
N8N: POST /webhook/generate_persona
  ↓
Next.js: POST /api/generate/persona
```

**Each API route should:**
1. Validate authentication (Supabase Auth)
2. Extract intervention_id and data_source
3. Set RLS context
4. Fetch intervention context from Supabase
5. Generate content using AI (OpenAI/Claude)
6. Save to Supabase
7. Return result

### 3. Required API Routes

Create Next.js API routes for all 19 functional areas:

- `/api/generate/persona`
- `/api/generate/system-map`
- `/api/generate/brief`
- `/api/generate/assumptions`
- `/api/generate/objectives`
- `/api/generate/research`
- `/api/generate/strategy`
- `/api/generate/territory`
- `/api/generate/tfd`
- `/api/generate/smp`
- `/api/generate/cta`
- `/api/generate/key-messages`
- `/api/generate/mrel`
- `/api/generate/gwtb`
- `/api/generate/campaign-journey`
- `/api/generate/narrative`
- `/api/generate/oasis`
- `/api/generate/comb`
- `/api/error/log`

Plus "single" variants for regeneration:
- `/api/generate/persona/single`
- `/api/generate/strategy/single`
- etc.

### 4. Authentication Strategy

**Current:** Bearer token (Xano)

**Recommended:** Supabase Auth
- User-based authentication
- RLS policies enforce data access
- Automatic audit trails
- Session management

### 5. AI Integration

**Current:** Langfuse (prompts) + OpenAI/Claude (generation)

**Keep:**
- Langfuse for prompt versioning and management
- OpenAI/Claude for generation

**Update:**
- Move AI calls from N8N to Next.js Server Actions
- Use Vercel AI SDK for streaming responses
- Implement rate limiting and error handling

### 6. Data Source Routing

**Supabase RLS Implementation:**

```sql
-- Add to all tables
ALTER TABLE personas
ADD COLUMN data_source TEXT DEFAULT 'live';

-- Create policy
CREATE POLICY data_source_isolation ON personas
USING (
  data_source = current_setting('app.data_source')::TEXT
);

-- Set in API route
await supabase.rpc('set_config', {
  setting: 'app.data_source',
  value: req.body.data_source
});
```

---

## Documents Created

I've generated 4 comprehensive documentation files:

1. **xano_api_endpoints_comprehensive_mapping.md**
   - Full endpoint documentation
   - Complete data model schemas
   - Request/response examples for all 19 categories
   - Migration recommendations

2. **xano_endpoints_quick_reference.md**
   - Master table of all endpoints
   - Quick lookup reference
   - Entity relationships diagram
   - Migration checklist

3. **xano_authentication_and_routing.md**
   - Authentication patterns
   - Data routing architecture
   - Migration strategies for Supabase
   - Code examples for Next.js implementation

4. **XANO_ANALYSIS_SUMMARY.md** (this document)
   - Executive overview
   - Key findings
   - Integration architecture
   - Migration implications

---

## Next Steps

### Immediate Actions

1. **Review Documentation**
   - Read all 4 documents
   - Verify data model matches your understanding
   - Identify any missing endpoints or fields

2. **Supabase Schema Design**
   - Create all 21 tables in Supabase
   - Add RLS policies for data_source routing
   - Set up foreign key relationships
   - Add indexes for performance

3. **Authentication Setup**
   - Configure Supabase Auth
   - Implement user login/signup
   - Set up RLS policies for user access
   - Test dev/live routing

4. **API Route Development**
   - Start with one entity (e.g., personas)
   - Build POST /api/generate/persona
   - Test end-to-end flow
   - Replicate pattern for other entities

5. **AI Integration**
   - Set up Langfuse integration
   - Configure OpenAI/Claude API keys
   - Test prompt retrieval and generation
   - Implement error handling

### Development Priorities

**Phase 1:** Core Infrastructure
- Supabase schema
- Authentication
- RLS policies
- Basic API routes

**Phase 2:** Generation Features
- Personas
- System Map
- Brief
- Assumptions

**Phase 3:** Advanced Features
- Strategy
- Territory
- TFD
- Narrative

**Phase 4:** Polish
- Error handling
- Rate limiting
- Monitoring
- Testing

---

## Key Insights

1. **intervention_id is everything** - Every operation requires it
2. **Get Intervention Info first** - Almost always the first API call
3. **Consistent patterns** - Bulk and single generation follow same structure
4. **Simple authentication** - Bearer token is straightforward to replicate
5. **Clean data model** - Clear relationships and well-structured schemas
6. **Dev/live isolation** - Critical for safe development
7. **AI-driven architecture** - Generation workflows are core to the platform
8. **Dependency chains** - Some entities require others (assumptions need objectives)

---

## Questions to Address

1. **Xano API Endpoints:** The exact endpoint paths are abstracted by N8N credentials. We inferred the data structure but not the exact URL paths. You may want to:
   - Check Xano API documentation
   - Inspect network requests from Bubble.io
   - Contact Xano support for endpoint list

2. **Field Validations:** What validation rules exist on Xano fields?
   - Required fields
   - String length limits
   - Enum values
   - Relationship constraints

3. **User Permissions:** How does Xano handle user permissions?
   - Who can access which interventions?
   - Role-based access control?
   - Team/organization structure?

4. **Rate Limiting:** Are there Xano rate limits to be aware of?

5. **File Storage:** Where are persona images stored?
   - Xano file storage?
   - External CDN?
   - Migration strategy for files?

---

## Conclusion

The N8N + Xano architecture is well-structured and follows consistent patterns. Migration to Next.js + Supabase is very feasible:

**Strengths:**
- ✅ Clear data model
- ✅ Consistent API patterns
- ✅ Simple authentication
- ✅ Well-documented via N8N workflows
- ✅ Logical entity relationships

**Challenges:**
- ⚠️ Exact endpoint paths need verification
- ⚠️ Field validations need documentation
- ⚠️ File storage migration strategy needed
- ⚠️ User permission model needs definition

**Overall:** Migration complexity is **MEDIUM**. The architecture is clean and migration-friendly. Most complexity is in reimplementing the AI generation logic in Next.js, not in the API structure itself.

---

**Files Location:**
- /Users/tobyscregg/Documents/Projects/kora-main/docs/xano_api_endpoints_comprehensive_mapping.md
- /Users/tobyscregg/Documents/Projects/kora-main/docs/xano_endpoints_quick_reference.md
- /Users/tobyscregg/Documents/Projects/kora-main/docs/xano_authentication_and_routing.md
- /Users/tobyscregg/Documents/Projects/kora-main/docs/XANO_ANALYSIS_SUMMARY.md

---

*Analysis completed: 2026-02-12*
*Total workflows analyzed: 72*
*Total HTTP nodes examined: 195*
*Repository: Ronald-BM/cleaned-n8n*
