# Xano API Endpoints - Quick Reference Table

**Base URL:** `https://xyot-fwcy-i2yo.e2.xano.io/`
**Auth:** Bearer Token
**Routing:** X-Data-Source header (dev/live)

## Master Endpoint Reference

| Category | N8N Workflow | Webhook Endpoint | HTTP Method | Xano Operations | Key Fields |
|----------|--------------|------------------|-------------|-----------------|------------|
| **PERSONAS** | generatePersonas | POST /generate_persona | GET, POST | 1. Get Intervention<br>2. Create Personas | persona_label, name, age, gender, demographics, psychographics |
| | generateSinglePersona | POST /generate_single_persona | GET, POST | 1. Get Intervention<br>2. Create Persona | Same as above |
| | generatePersonaPicture | - | GET, POST | 1. Get Persona Info<br>2. Update Persona Image | file (image URL) |
| **SYSTEM MAP** | generateSystemMap | POST /generate_system_map | GET, POST | 1. Get Intervention<br>2. Create System Map | challenge, description |
| | generateSingleChallenge | POST /generate_single_challenge | GET, POST, GET | 1. Get Intervention<br>2. Create Entry<br>3. Get Challenge | challenge, description |
| **BRIEF** | generate Creative Brief Development | POST /generate_cbd | GET, POST | 1. Get Intervention<br>2. Create Brief | 14 comprehensive brief fields |
| | generateBriefOutput | - | POST | Save Brief | client, budget, timeline, deliverables |
| | generateBriefOverview | - | POST | Save Chat Content | client_funder, core_challenge, dos/donts |
| **ASSUMPTIONS** | generateAssumptions | POST /generate_assumption | GET, GET, POST | 1. Get Intervention<br>2. Get Objective<br>3. Create Assumptions | assumption |
| | generateSingleAssumption | POST /generate_single_assumption | GET, GET, POST | Same as above | assumption |
| | generateAssumptionResearchQuestions | POST /generate_research_questions | GET, GET, POST | 1. Get Intervention<br>2. Get Objective<br>3. Create Questions | question |
| | generateSingleAssumptionQuestion | POST /generate_single_assumption_question | GET, GET, POST | Same as above | question |
| | generateAssumptionTesting | POST /generate_assumption | GET, GET, POST | 1. Get Intervention<br>2. Get Objective<br>3. Create Test | assumption |
| **BEHAVIOURAL OBJECTIVES** | generateBehaviouralObjectiveSetting | POST /behavior_objective | GET, GET, POST | 1. Get Intervention<br>2. Get Entry Point<br>3. Create Objective | objective |
| | generateSingleObjective | POST /generate_single_objective | GET, GET, POST | Same as above | objective |
| **RESEARCH** | Generate Deep Research Questions | POST /generate_deep_research_old | GET, GET, POST | 1. Get Brief<br>2. Check Research<br>3. Save Questions | prompt (object) |
| | generateDeepResearchPrompts | POST /generate_deep_research | GET, GET, POST | 1. Get Intervention<br>2. Check Research<br>3. Save Prompts | prompt (object) |
| | generateResearchInsights | POST /generate_insights | GET, POST | 1. Get Intervention<br>2. Save Insights | insights (array) |
| | generateSingleResearchInsights | POST /generate_single_insight | GET, POST | Same as above | insights (array) |
| **STRATEGY** | generate Strategy | POST /generate_strategy | GET, POST | 1. Get Intervention<br>2. Create Strategies | strategy, type, description, pros, cons, selected |
| | generate Single Strategy | POST /generate_single_strategy | GET, GET, POST | 1. Get Intervention<br>2. Get Strategy<br>3. Update | Same as above |
| **TERRITORY** | generate Territory | POST /generate_territory | GET, POST | 1. Get Intervention<br>2. Create Territories | title, description, credibility |
| | generateSingleTerritory | POST /generate_single_territory | GET, GET, POST | 1. Get Intervention<br>2. Get Territory<br>3. Update | Same as above |
| **TFD** | generate TFD | POST /generate_tfd | GET, POST | 1. Get Intervention<br>2. Create TFD | com_b1_id, com_b2_id, current/future think/feel/do |
| | generateSingleTFD | POST /generate_single_tfd | GET, GET, POST | 1. Get Intervention<br>2. Get TFD<br>3. Update | Same as above |
| **SMP** | generate SMP | POST /generate_smp | GET, POST | 1. Get Intervention<br>2. Create SMP | output (array) |
| | generate Single SMP | POST /generate_single_smp | GET, GET, POST | 1. Get Intervention<br>2. Get SMP<br>3. Update | output (array) |
| **CTA** | generate CTA | POST /generate_cta | GET, POST | 1. Get Intervention<br>2. Create CTAs | title, validations |
| | generate Single CTA | POST /generate_single_cta | GET, GET, POST | 1. Get Intervention<br>2. Get CTA<br>3. Update | Same as above |
| **KEY MESSAGES** | generate Single Key Message | POST /generate_single_key_messages | GET, GET, POST | 1. Get Intervention<br>2. Get Messages<br>3. Update | core_narrative (object), key_messages (array) |
| **MREL** | generate MREL | POST /generate_mrel | GET, POST | 1. Get Intervention<br>2. Create MREL | indicator_type, indicator, target, data_source |
| | generate Single MREL | POST /generate_single_mrel | GET, POST | Same as above | Same as above |
| **GWTB** | generate GWTB | POST /generate_gwtb | GET, PATCH | 1. Get Intervention<br>2. Update GWTB | get, who, to, by |
| **CAMPAIGN JOURNEY** | generate Campaign Journey Map | POST /generate_cjm | GET, POST | 1. Get Intervention<br>2. Create Journey | journey_phase_id, key_moments, key_messages, key_mechanism |
| **NARRATIVE** | generate Narrative Framework | POST /generate_narrative | GET, POST, POST | 1. Get Intervention<br>2. Create Core Narrative<br>3. Create Messages | core_narrative (object), key_messages (array) |
| **OASIS** | generate OASIS Map | POST /generate_oasis | GET, POST | 1. Get Intervention<br>2. Create OASIS | 14 comprehensive strategy fields |
| **COM-B** | generateComBAnalysis | POST /generate_comb | GET, POST | 1. Get Intervention<br>2. Create COM-B | results (array) |
| | generateSingleComB | POST /generate_single_comb | GET, POST | Same as above | results (array) |
| **UTILITIES** | Kora Generic Error Workflow | - | POST | Log Error | workflow_name, error_message, execution_id |
| | chunkDocument | POST /chunk_document | POST | Status Update | result, uuid, file_id |
| | scrapeUrl | POST /scrape_url | POST | Save URL Data | - |
| | getFIle Xano Connected | POST /996fe58c-... | POST | File Response | - |

## Common Request Patterns

### Standard Request Body
```json
{
  "intervention_id": integer,
  "data_source": "dev" | "live"
}
```

### Standard Headers
```
X-Data-Source: dev | live
Authorization: Bearer {token}
Content-Type: application/json
```

## Xano Tables Inferred

1. interventions
2. personas
3. system_map
4. assumptions
5. research_questions
6. behavioural_objectives
7. strategies
8. territories
9. tfd (think_feel_do)
10. smp (strategic_messaging_platform)
11. cta (call_to_action)
12. key_messages
13. mrel (monitoring_research_evaluation_learning)
14. gwtb (get_who_to_by)
15. campaign_journey_map
16. narrative_framework
17. oasis_map
18. com_b_analysis
19. creative_brief
20. research_insights
21. error_logs

## Entity Relationships

```
intervention (1) ─── (many) personas
                 ├── (many) system_map
                 ├── (many) assumptions
                 ├── (many) research_questions
                 ├── (many) behavioural_objectives
                 ├── (many) strategies
                 ├── (many) territories
                 ├── (many) tfd
                 ├── (many) cta
                 ├── (1) creative_brief
                 ├── (1) oasis_map
                 ├── (1) gwtb
                 └── (many) research_insights
```

## Generation Workflow Patterns

### Pattern 1: Bulk Generation
1. GET intervention context
2. AI generates multiple items
3. POST all items to Xano

**Examples:** Personas, System Map, Strategies, Territories, CTAs

### Pattern 2: Single Item Generation/Regeneration
1. GET intervention context
2. GET existing item (if regenerating)
3. AI generates one item
4. POST/PATCH to update

**Examples:** Single Persona, Single Strategy, Single CTA

### Pattern 3: Dependent Generation
1. GET intervention context
2. GET prerequisite data (e.g., selected objective)
3. AI generates based on prerequisite
4. POST new items

**Examples:** Assumptions (require objective), Behavioural Objectives (require entry point)

## Migration Checklist

- [ ] Map all 21 Xano tables to Supabase schema
- [ ] Preserve field names and types
- [ ] Implement foreign key relationships via intervention_id
- [ ] Create RLS policies to replace X-Data-Source routing
- [ ] Build Next.js API routes matching N8N webhook endpoints
- [ ] Configure authentication (Bearer token equivalent)
- [ ] Migrate AI generation logic to server actions
- [ ] Test data flow: UI → API → Database → Response
- [ ] Implement error logging equivalent
- [ ] Set up Langfuse integration for prompts

---

*Generated from Ronald-BM/cleaned-n8n repository analysis (2026-02-12)*
