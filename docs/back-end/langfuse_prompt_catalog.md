# Kora AI - Langfuse Prompt Catalog

**Generated:** 2026-02-12
**Total Prompts:** 26
**Langfuse Instance:** https://cloud.langfuse.com

---

## Overview

This document catalogs all AI prompts stored in Langfuse for the Kora behavior-change campaign design system. Prompts are organized by stage and workflow step, with details on purpose, variables, and likely N8N workflow usage.

---

## Stage 1: Understand (Research & Diagnosis)

### 1.1 stage1/research
- **Purpose:** Initial research collection and DeepResearch question generation
- **Latest Version:** 6
- **Total Versions:** 6
- **Labels:** latest, production
- **Description:** Collects research related to the brief's problem and target audience. Provides tailored DeepResearch prompts across 7 key areas and produces 3-8 key insights.
- **Key Variables:**
  - `{BRIEF_OUTPUT}` - Brief details
  - `{INSIGHTS}` - Provided research insights
- **Output Format:** JSON with DeepResearch prompts and insights
- **Tools Available:** `queryForResearch` (RAG tool)
- **N8N Workflow:** Likely `generateResearch` or initial research workflow
- **Key Rules:**
  - Generate 3-8 key insights from research
  - Cover 7 research areas: brief background, problem validation, TA understanding, narratives/norms, actors, policy/institutions, past interventions
  - 3-5 prompts per area
  - Use `queryForResearch` when gaps exist

---

### 1.2a stage1/deepResearchQuestions
- **Purpose:** Generate research questions to guide additional evidence gathering
- **Latest Version:** 2
- **Total Versions:** 2
- **Labels:** latest, production
- **Description:** Retrieves existing research, identifies gaps, and generates targeted DeepResearch questions across 7 key areas.
- **Key Variables:**
  - `{BRIEF_OUTPUT}` - Brief details including problem, location, target audience
- **Output Format:** Markdown with Context, Research Gaps, and DeepResearch Questions
- **Tools Available:** `queryForResearch` (RAG tool)
- **N8N Workflow:** `generateDeepResearchQuestions`
- **Key Rules:**
  - Cover 7 research areas with 3-5 questions each
  - Use `queryForResearch` before generating questions
  - Omit gaps section if RAG returns no results
  - Questions must be specific to brief context

---

### 1.2b stage1/insightsExtraction
- **Purpose:** Extract insights from uploaded research documents
- **Latest Version:** 14
- **Total Versions:** 14
- **Labels:** latest, production
- **Description:** Extracts deep, evidence-based insights that explain WHY people think, feel, or behave in certain ways. Goes beyond describing WHAT to explain underlying drivers.
- **Key Variables:**
  - `{{source}}` - Document source
- **Output Format:** JSON with insights array containing insight, description, source, page, sectionTitle, keywords, importance
- **Tools Available:** None
- **N8N Workflow:** `extractInsights` or document processing workflow
- **Key Rules:**
  - Extract every insight present in the document
  - Insights must be surprising/reframing, empathetic, useful, and memorable
  - Include 2-3 sentence descriptions with evidence and strategic implication
  - Rate importance as high/medium/low

---

### 1.2c stage1/researchInsights
- **Purpose:** Synthesize and consolidate research insights from multiple sources
- **Latest Version:** 12
- **Total Versions:** 12
- **Labels:** latest, production
- **Description:** Collates all research and produces 3-8 key insights. Merges overlapping insights from multiple documents into stronger, unified insights.
- **Key Variables:**
  - `{BRIEF_OUTPUT}` - Brief details
  - `{DOCUMENT_INSIGHTS}` - Insights extracted from documents
- **Output Format:** JSON with 3-8 final insights
- **Tools Available:** `queryForResearch` (RAG tool)
- **N8N Workflow:** `synthesizeInsights` or insight consolidation workflow
- **Character Constraints:** Must follow character limitations from `{XANO_DATABASE_SCHEMA}`
- **Key Rules:**
  - Generate exactly 3-8 insights (no more, no fewer)
  - Merge and deduplicate insights from multiple sources
  - Each insight must explain "why" not just "what"
  - Attribute sources: existing research, DeepResearch, or mixed
  - Use RAG if DOCUMENT_INSIGHTS are empty

---

### 1.3 stage1/systemsMapping
- **Purpose:** Identify refined challenges (entry points) from research and insights
- **Latest Version:** 11
- **Total Versions:** 11
- **Labels:** latest, production
- **Description:** Uses research and insights to identify 5-8 individually distinct and collectively whole refined versions of the challenge that serve as entry points for the campaign.
- **Key Variables:**
  - `{BRIEF_OUTPUT}` - Brief details
  - `{INSIGHTS}` - Research insights
  - `{XANO_DATABASE_SCHEMA}` - Database schema with character constraints
- **Output Format:** JSON array with 5-8 objects containing intervention_id, challenge, description
- **Tools Available:** `queryForResearch` (RAG tool)
- **N8N Workflow:** `generateSystemMap`
- **Character Constraints:** Must follow character limitations from `{XANO_DATABASE_SCHEMA}`
- **Key Rules:**
  - Generate 5-8 refined challenges
  - Each must be individually distinct and actionable
  - Collectively whole (cover problem space comprehensively)
  - No narrative, bullets, diagrams, or commentary beyond JSON output

---

### 1.4 stage1/behaviouralObjectiveSetting
- **Purpose:** Create clear behavioral objectives defining specific actions
- **Latest Version:** 17
- **Total Versions:** 17
- **Labels:** latest, production
- **Description:** Creates a clear behavioral objective defining the specific action or behavior you want a particular audience to do (or stop doing) without referencing channels, tone, or tactics.
- **Key Variables:**
  - `{BRIEF_OUTPUT}` - Problem definition, high-level objective, TA profile, location
  - `{RESEARCH_INSIGHTS}` - Research insights
  - `{SELECTED_ENTRY_POINT}` - Challenge and description
  - `{XANO_DATABASE_SCHEMA}` - Database schema with character constraints
- **Output Format:** JSON with 3 behavioral objective candidates
- **Tools Available:** `queryForResearch` (RAG tool)
- **N8N Workflow:** `generateBehavioralObjectives`
- **Character Constraints:** Must follow character limitations from `{XANO_DATABASE_SCHEMA}`
- **Key Rules:**
  - Format: [Verb] [Behavior] among [Audience]
  - Produce 3 distinct behavioral objective candidates
  - Observable and specific, not vague concepts
  - One behavior per objective
  - Strip out channels, tactics, strategy references
  - Banned phrases: "Via...", "By...", "Through...", "To promote...", "To empower...", "To raise awareness...", "To educate..."

---

### 1.5a stage1/assumptionTesting
- **Purpose:** Develop testable assumptions around behavioral objective
- **Latest Version:** 14
- **Total Versions:** 14
- **Labels:** latest, production
- **Description:** Develops testable assumptions that can be used to create surveys, focus group guides, or interview questionnaires to inform COM-B and persona development.
- **Key Variables:**
  - `{BRIEF_OUTPUT}` - Brief details
  - `{BEHAVIORAL_OBJECTIVE}` - Chosen behavioral objective
  - `{ENTRY_POINT}` - Selected entry point
  - `{INSIGHTS}` - Research insights
  - `{XANO_DATABASE_SCHEMA}` - Database schema with character constraints
- **Output Format:** JSON following enforced schema
- **Tools Available:** `queryForResearch` (RAG tool)
- **N8N Workflow:** `generateAssumptions`
- **Character Constraints:** Must follow character limitations from `{XANO_DATABASE_SCHEMA}`
- **Key Rules:**
  - Generate 5-8 testable assumptions
  - Structure: "We assume that [specific audience segment] [does/does not] [specific behavior or belief] because [specific reason or barrier]"
  - Must be falsifiable
  - Connected to behavioral objective and COM-B domains (but don't mention COM-B in output)
  - Use queryForResearch when context is limited

---

### 1.5b stage1/assumptionResearchQuestions
- **Purpose:** Generate research questions to test assumptions
- **Latest Version:** 7
- **Total Versions:** 7
- **Labels:** latest, production
- **Description:** Generates research questions that can be used to create surveys, focus group guides, or interview questionnaires to test assumptions and inform COM-B and persona development.
- **Key Variables:**
  - `{BRIEF_OUTPUT}` - Brief details
  - `{BEHAVIORAL_OBJECTIVE}` - Behavioral objective
  - `{SYSTEM_MAP.challenge}` - Entry point dynamic
  - `{INSIGHTS}` - Research insights
  - `{ASSUMPTIONS}` - Generated assumptions
  - `{XANO_DATABASE_SCHEMA}` - Database schema with character constraints
- **Output Format:** JSON with linking table format
- **Tools Available:** `queryForResearch` (RAG tool)
- **N8N Workflow:** `generateResearchQuestions`
- **Character Constraints:** Must follow character limitations from `{XANO_DATABASE_SCHEMA}`
- **Key Rules:**
  - Generate no more than 10 final research questions
  - Each must link directly to a specific assumption
  - Written in simple, conversational language
  - Phrased as third-person research inquiries
  - Each must probe the entry point dynamic
  - Create linking table: Assumption | Linked Research Question(s)

---

### 1.6a stage1/comBAnalysis
- **Purpose:** Analyze barriers using COM-B framework (all domains)
- **Latest Version:** 7
- **Total Versions:** 7
- **Labels:** latest, production
- **Description:** Analyzes key barriers for target audience using COM-B framework (Capability, Opportunity, Motivation). Generates 3-6 barriers per domain type with 3 primary barriers suggested.
- **Key Variables:**
  - `{BRIEF_OUTPUT}` - Brief details
  - `{BEHAVIORAL_OBJECTIVE}` - Behavioral objective
  - `{INSIGHTS}` - Research insights
  - `{ASSUMPTIONS}` - Generated assumptions
  - `{XANO_DATABASE_SCHEMA}` - Database schema with character constraints
- **Output Format:** JSON with barriers for all 3 domain types
- **Tools Available:** `queryForResearch` (RAG tool)
- **N8N Workflow:** `generateCOMBAnalysis`
- **Character Constraints:** Must follow character limitations from `{XANO_DATABASE_SCHEMA}`
- **Key Rules:**
  - Cover all 3 domain types: Capability, Opportunity, Motivation
  - 3-6 barriers per type
  - Each barrier: type, statement, evidence-grounded description
  - Suggest exactly 3 primary barriers (put first in each domain)
  - CRITICAL: DO NOT mark as primary, just put those barriers first
  - No duplicate barrier statements

---

### 1.6b stage1/singleComB
- **Purpose:** Analyze barriers for a single COM-B domain
- **Latest Version:** 2
- **Total Versions:** 2
- **Labels:** latest, production
- **Description:** Generates a single COM-B barrier for a predetermined domain type. Used when adding individual barriers.
- **Key Variables:**
  - `{BRIEF_OUTPUT}` - Brief details
  - `{BEHAVIORAL_OBJECTIVE}` - Behavioral objective
  - `{INSIGHTS}` - Research insights
  - `{ASSUMPTIONS}` - Generated assumptions
  - `{XANO_DATABASE_SCHEMA.comb_type}` - Predetermined COM-B domain
  - `{XANO_DATABASE_SCHEMA}` - Database schema with character constraints
- **Output Format:** JSON with single barrier
- **Tools Available:** `queryForResearch` (RAG tool)
- **N8N Workflow:** `generateSingleCOMBBarrier`
- **Character Constraints:** Must follow character limitations from `{XANO_DATABASE_SCHEMA}`
- **Key Rules:**
  - Provide ONLY ONE barrier for the specified domain
  - Barrier requires: domain, statement, evidence-grounded description
  - No duplicate barrier statements
  - Query RAG for predetermined domain if needed

---

### 1.7 stage1/personas
- **Purpose:** Build three rich, human-centered personas
- **Latest Version:** 3
- **Total Versions:** 3
- **Labels:** latest, production
- **Description:** Builds three rich, human-centered personas representing core target audience segments. Each persona grounded in cultural and contextual authenticity, capturing diversity within TA.
- **Key Variables:**
  - `{BRIEF_OUTPUT}` - Brief details
  - `{BEHAVIORAL_OBJECTIVE}` - Behavioral objective
  - `{INSIGHTS}` - Research insights
  - `{COMB_BARRIERS}` - COM-B barriers
  - `{XANO_DATABASE_SCHEMA}` - Database schema with character constraints
- **Output Format:** JSON following enforced schema
- **Tools Available:** `queryForResearch` (RAG tool)
- **N8N Workflow:** `generatePersonas`
- **Character Constraints:** Must follow character limitations from `{XANO_DATABASE_SCHEMA}`
- **Key Rules:**
  - Produce exactly 3 personas
  - Each persona: descriptive only, avoid strategy/channel/COM-B language
  - Use two-column table format: Dimension | Example from the TA
  - Internally coherent, culturally authentic
  - Avoid uncertainty language ("maybe", "often", "varies")
  - Total length max 1200 words across all 3
  - Differentiation: Persona A (engaged/high-risk), Persona B (passive/undecided), Persona C (resistant/peripheral)
  - Sections: Demographics, Psychographics (values, aspirations, lifegoals, concerns), Context & Media (social network, media habits, language/symbols)

---

## Stage 2: Design (Strategy & Creative)

### 2.1 stage2/brief
- **Purpose:** Creative brief development
- **Latest Version:** 1
- **Total Versions:** 1
- **Labels:** latest, production
- **Description:** Simple brief structure capturing target profile, barriers, strategy, summary, context, problem, and objectives.
- **Key Variables:**
  - `{intervention_id}` - Intervention ID (integer)
  - `{target_profile}` - Target audience profile (text)
  - `{barriers}` - Key barriers (text)
  - `{strategy}` - Campaign strategy (text)
  - `{summary}` - Brief summary (text)
  - `{context}` - Context information (text)
  - `{problem}` - Problem statement (text)
  - `{objectives}` - Campaign objectives (text)
- **Output Format:** JSON with brief fields
- **Tools Available:** None
- **N8N Workflow:** `generateBrief`
- **Note:** This is a minimal prompt, likely a template or data structure definition rather than full AI generation prompt.

---

### 2.2 stage2/tfd
- **Purpose:** Think/Feel/Do (TFD) current and future state frames
- **Latest Version:** 11
- **Total Versions:** 11
- **Labels:** latest, production
- **Description:** Translates Stage 1 diagnosis into current-state and future-state TFD frames that show the journey of mindset, emotional, and behavioral shifts.
- **Key Variables:**
  - TA Persona
  - COM-B drivers and barriers
  - COM-B driver types: Psychological Capability, Physical Capability, Physical Opportunity, Social Opportunity, Reflective Motivation, Automatic Motivation
  - Style Modes (14 different modes available)
- **Output Format:** Table with Current State and Future State columns
- **Tools Available:** None specified
- **N8N Workflow:** `generateTFD`
- **Key Rules:**
  - Always produce paired Current-State and Future-State TFD
  - Human, everyday language (not jargon)
  - "Think" = beliefs, assumptions, perceived truths
  - "Feel" = emotional states, motivations, anxieties
  - "Do" = observable behaviors, choices, actions
  - Connect to 2 prioritized COM-B drivers and linked barriers
  - Generate 1 hybrid TFD table by default (combining 2 COM-B drivers)
  - If user wants more, create 3 TFD tables (1 per COM-B driver)
  - Apply 2-4 Style Modes to guide tone and framing

**Style Modes Available:**
1. Centered & Reframing (Low-awareness TA)
2. Direct & Disruptive (High-harm/urgent)
3. Subtle & Self-Revealing (Resistant/ironic TA)
4. Aspirational & Identity-Building (Status-driven TA)
5. Questioning & Intriguing (Edge of reflection)
6. Peer-to-Peer & Relational (Low-trust)
7. Emotional Contrast (Passive/numb TA)
8. Meta-Awareness & Decoding (Autonomy-seeking TA)
9. Cultural Anchoring (Tradition/moral-based TA)
10. Slow Burn Realization (Identity crisis)
11. Stability & Safety-First (Seeking calm)
12. Competence & Mastery (Logic/control-oriented)
13. Creative Rebellion (Creators/subcultures/youth)
14. Consequences & Legacy (Regret/legacy-sensitive)

---

### 2.3 stage2/strategy
- **Purpose:** Campaign strategy selection (5 options)
- **Latest Version:** 5
- **Total Versions:** 5
- **Labels:** latest, production
- **Description:** Identifies the most appropriate campaign strategy to connect behavioral diagnosis (TFDs, objectives, COM-B drivers) to the "By" in the GWTB statement.
- **Key Variables:**
  - TFDs (Think/Feel/Do frames)
  - Objectives
  - COM-B drivers
- **Output Format:** Table with columns: Strategy | Description | Pros & Cons
- **Tools Available:** None
- **N8N Workflow:** `generateStrategy`
- **Key Rules:**
  - Present 5 strategy options
  - Mix: 2 obvious, 2 innovative/outside-the-box, 1 hybrid
  - Each option 2-3 sentences including mechanism of change
  - In "Pros" section, clearly state which 1-2 core values the strategy activates
  - Strategies feasible given audience, context, entry point
  - Reference frameworks: Behavior Change Wheel, Make It toolkit, Narrative/Cultural strategies

**Strategy Categories:**
- **Behavioral Intervention (Behavior Change Wheel + Make It toolkit):**
  - Capability: Make it Intriguing, Make it Unexpected
  - Opportunity: Make it Easy, Make it Obvious, Make it Timely, Make it Difficult
  - Motivation: Make it Meaningful, Make it Empowering, Make it Tangible, Make it Social, Make it Attractive, Make it Goal-oriented, Make it Aversive
- **Narrative & Cultural Influence:**
  - Narrative Substitution, Narrative Sabotage, Cultural Reframing, Aspirational Repositioning, Dilemma Actions, Seeding Uncertainty, Silent Shifts, Contrast & Fast-Forwarding, Platform Hacking, Reframing core values, Metaphor shifts, Projection, Source Undermining, Obfuscate/Distract, Cultural Trojan Horse, Re-Mapping Identity, Temporal Reframing

**Core Values:**
Strength, Family, Fairness, Tradition, Honesty, Security/Safety, Prosperity, Freedom/Independence, Representation, Responsibility, Belonging, Achievement

---

### 2.3b stage2/singleStrategy
- **Purpose:** Generate a single strategy option (avoid repeats)
- **Latest Version:** 2
- **Total Versions:** 2
- **Labels:** latest, production
- **Description:** Generates a single strategy option while avoiding repetition of already-generated strategies. Uses same strategy frameworks as main strategy prompt.
- **Key Variables:**
  - List of already generated strategies (to avoid)
  - TFDs, objectives, COM-B drivers
- **Output Format:** Single strategy with description and pros/cons
- **Tools Available:** None
- **N8N Workflow:** `generateSingleStrategy`
- **Resolution Graph:** Links to stage2/strategy version 1
- **Key Rules:**
  - Generate only one strategy
  - Avoid repeating provided strategies
  - Follow same frameworks as stage2/strategy
  - Always include hybrid strategy option as 4th option when generating longlist
  - Clearly state 1-2 core values activated

---

### 2.4 stage2/gwtb
- **Purpose:** Get-Who-To-By (GWTB) statement creation
- **Latest Version:** 2
- **Total Versions:** 2
- **Labels:** latest, production
- **Description:** Distills the Behavioral Objective into a clear GWTB that aligns audience, action, and strategic pathway. Frames the intervention memorably.
- **Key Variables:**
  - Target Audience (TA Profile)
  - Current TFD
  - Behavioral Objective
  - Selected Strategy
- **Output Format:** JSON with intervention_id, get, who, to, by fields
- **Tools Available:** None
- **N8N Workflow:** `generateGWTB`
- **Key Rules:**
  - Formula: "Get [Target Audience] Who [Experience a current TFD state] To [Behavioral Objective] By [Selected Strategy]"
  - "By" must directly reflect chosen strategy
  - Concise, human, campaign-ready language
  - Generate 1 GWTB option

---

### 2.5 stage2/territory
- **Purpose:** Creative territory selection (5 options)
- **Latest Version:** 3
- **Total Versions:** 3
- **Labels:** latest, production
- **Description:** Defines the creative "territory" (broad thematic space) to anchor messaging and content development. Opens a story world with mood, tone, visuals, and identity implied.
- **Key Variables:**
  - Strategy
  - TFD shifts
  - Target audience emotional tension
- **Output Format:** Table with columns: Territory | Description | Audience Credibility
- **Tools Available:** None
- **N8N Workflow:** `generateTerritories`
- **Key Rules:**
  - Generate 5 potential territories
  - Each territory: distinct worldview or emotional space
  - Avoid repeating tone, values, or narrative stance
  - Think atmosphere, not lines (avoid "clever" copywriting/slogans)
  - Titles sound like places or frames (e.g., "The Quiet Win", "Escape the Trap")
  - At least one unexpected, creative option
  - Description: 3-4 sentences explaining i) emotional feel, ii) story/invitation offered, iii) how it delivers strategy
  - Language: direct, evocative, grounded in lived reality

---

### 2.5b stage2/singleTerritory
- **Purpose:** Generate a single creative territory
- **Latest Version:** 3
- **Total Versions:** 3
- **Labels:** latest, production
- **Description:** Generates a single creative territory option. Simpler version of territory prompt for individual territory generation.
- **Key Variables:**
  - Strategy
  - TFD shifts
  - Target audience emotional tension
- **Output Format:** Table with Territory | Description | Audience Credibility
- **Tools Available:** None
- **N8N Workflow:** `generateSingleTerritory`
- **Key Rules:**
  - Generate 1 potential territory
  - Same quality rules as full territory prompt
  - Must express distinct worldview or emotional space
  - Avoid "clever" copywriting; think atmosphere
  - Description: 3-4 sentences

---

### 2.6 stage2/smp
- **Purpose:** Single-Minded Proposition (SMP) selection (3 options)
- **Latest Version:** 2
- **Total Versions:** 2
- **Labels:** latest, production
- **Description:** Distills chosen creative territory into crisp, emotionally resonant, strategically grounded SMP. Acts as campaign's creative north star - the belief the campaign wants audience to hold.
- **Key Variables:**
  - Chosen territory
  - TFD shifts
- **Output Format:** 3 SMP options
- **Tools Available:** None
- **N8N Workflow:** `generateSMP`
- **Key Rules:**
  - Draft 3 SMP options under chosen territory
  - 1 sentence max each
  - Clearly link to TFD shifts
  - Creative leap from strategy (sounds like first line of campaign copy)
  - One powerful idea (not multiple messages)
  - Strategically grounded (audience insight + product truth + emotional payoff)
  - Emotionally resonant (human truth, not just attributes)
  - Declarative (clear POV, not descriptive)
  - Memorable (short, sticky, repeatable)
  - Tension-resolving (answers frustration/hesitation/desire)
  - Campaignable (anchors tone, story, creative)
  - Bar-test approved (sounds like something person would say)
  - **NOT:** tagline, paragraph, compound sentence, list of features/benefits, generic statement, marketing buzzwords

---

### 2.6b stage2/singleSmp
- **Purpose:** Generate a single SMP option
- **Latest Version:** 1
- **Total Versions:** 1
- **Labels:** latest, production
- **Description:** Generates a single SMP option under chosen territory. Same rules as full SMP prompt.
- **Key Variables:**
  - Chosen territory
  - TFD shifts
- **Output Format:** Single SMP
- **Tools Available:** None
- **N8N Workflow:** `generateSingleSMP`
- **Key Rules:**
  - Draft 1 SMP under chosen territory
  - 1 sentence max
  - Clearly link to TFD shifts
  - Not repeat existing SMPs
  - All same quality rules as stage2/smp

---

### 2.7 stage2/narrative
- **Purpose:** Story/Narratives and Key Messages
- **Latest Version:** 4
- **Total Versions:** 4
- **Labels:** latest, production
- **Description:** Builds narrative architecture underpinning campaign messaging. Creates core narrative (beginning, tension, resolution) and 3 key messages with proof points.
- **Key Variables:**
  - Validated SMP (if full concept path) OR GWTB + Strategy (if condensed messaging path)
  - `{intervention_id}` - Intervention ID
- **Output Format:** JSON with two arrays: "narrative" (core narrative) and "messages" (key messages)
- **Tools Available:** `queryForResearch` (RAG to find proof points)
- **N8N Workflow:** `generateNarrative`
- **Key Rules:**
  - Core Narrative: situation → conflict/tension → resolution (1 sentence each phase)
  - Audience facing (as if for TA to read, not strategist)
  - 3 Key Messages: one sentence max each, must contain all info to understand without context
  - Proof points: hard data (numbers, percentages, case studies from research)
  - If no hard data relates, leave proof points blank
  - Must tie back to SMP and TFD shifts

**Output Structure:**
```json
{
  "narrative": [
    {
      "intervention_id": integer,
      "beginning": text,
      "tension": text,
      "resolution": text
    }
  ],
  "messages": [
    {
      "intervention_id": integer,
      "message": text,
      "proof_points": text
    }
  ]
}
```

---

### 2.8 stage2/cta
- **Purpose:** Call to Action (CTA) selection
- **Latest Version:** 2
- **Total Versions:** 2
- **Labels:** latest, production
- **Description:** Develops central call to action defining specific action target audience should take. Must contain specific action rather than vague concept.
- **Key Variables:**
  - Objectives
  - Audience
  - Strategy
- **Output Format:** 3 CTA options with 2 reasons each why it will work
- **Tools Available:** None
- **N8N Workflow:** `generateCTA`
- **Key Rules:**
  - Develop 3 options for central CTA
  - CTAs must contain specific action (not vague)
  - Present 3 options with 2 reasons why each CTA will work

**CTA Categories with Examples:**
- **Knowledge & Awareness:** Learn symptoms at [site], Check eligibility, Read guide
- **Personal Behaviour Change:** Wash hands for 20 seconds, Use condoms, Replace sugary drinks with water
- **Safety & Protection:** Check smoke alarms, Store medicines safely, Enable 2FA
- **Support-Seeking:** Call helpline, Book GP appointment, Visit support centre
- **Community Participation:** Volunteer 1hr/week, Attend neighborhood meeting, Join workshop, Report hate crime
- **Environmental & Sustainability:** Recycle electronics, Bring reusable bag, Sort waste, Plant tree
- **Civic & Policy Engagement:** Sign petition, Contact representative, Attend consultation, Submit views
- **Digital Engagement:** Download app, Take training module, Share verified info, Reset privacy settings
- **Peer/Social Norm:** Take pledge + invite friend, Share story, Encourage friends, Post challenge

---

### 2.9 stage2/campaignJourney
- **Purpose:** Campaign Journey & Touchpoints
- **Latest Version:** 4
- **Total Versions:** 4
- **Labels:** latest, production
- **Description:** Maps how TA moves from current to future-state TFDs and defines touchpoints that move them along journey.
- **Key Variables:**
  - Chosen CTA
  - Journey phases: Grab Attention, Learn More, Drive Action, Champion
- **Output Format:** Table with columns: Journey Phase | Key Message | Key Mechanisms | Key Moment
- **Tools Available:** None
- **N8N Workflow:** `generateCampaignJourney`
- **Key Rules:**
  - Only create after CTA chosen
  - 4 journey phases: 1) Grab Attention, 2) Learn More, 3) Drive Action, 4) Champion
  - Each phase: one key message (1 sentence max), 2-3 Key Mechanisms, 2-3 Key Moments
  - Mechanisms must be clear channels (examples provided for each phase)

**Example Mechanisms by Phase:**
- **Grab Attention:** Main campaign film, social media assets, billboards, PR stunts, guerilla marketing, hyper-short vertical videos, reactive content, interactive OOH, AR "sightings", flash mobs, ambient marketing, unexpected partnerships, found footage teasers, op-eds, TV/radio news, print ads
- **Learn More:** Informational films, influencer films, games, resources, events, interactive explainers, mini-documentaries, podcasts, TV/podcast appearances, chatbots, interactive maps, quizzes, UGC challenges, livestreams, craft activities, micro-games, toolkits, long-form interviews, documentary placements
- **Drive Action:** Landing pages, CTAs, petitions, pledges, action plans, micro-tasks, localized pages, action trackers, commitment cards, SMS/WhatsApp nudges, community challenges, referral rewards, action kits, mini events, newspaper CTA boxes, radio mentions, advertorials, magazine partnerships
- **Champion:** Digital CTAs, story sharing mechanisms, digital masks/AR filters, submission portals, branded frames, micro-toolkits, challenge prompts, community spotlights, ambassador programmes, volunteer toolkits, peer-to-peer scripts, leaderboards, templates, supporter takeovers, digital postcards, op-eds, letters to editor, spotlight articles, radio guest spots, TV segments, partner newsletters

---

### 2.10a stage2/mrel
- **Purpose:** MREL Indicator Selection (full framework)
- **Latest Version:** 4
- **Total Versions:** 4
- **Labels:** latest, production
- **Description:** Defines how success will be monitored and measured across MREL chain. Generates multiple indicators across outcomes, outtakes, and outputs.
- **Key Variables:**
  - `{intervention_id}` - Intervention ID
  - `{indicator_type}` - Level (1=Outcome, 2=Outtake, 3=Output)
- **Output Format:** JSON array with indicator_type, intervention_id, indicator, target, data_source
- **Tools Available:** `queryForResearch` (to find data sources)
- **N8N Workflow:** `generateMREL`
- **Key Rules:**
  - 3 levels: Outcomes (behavioral/attitudinal shifts), Outtakes (engagement/awareness), Outputs (delivery)
  - At least 3 outcome, 5 outtake, 3 output indicators
  - Use # or % instead of 'number' or 'per cent'
  - Ensure at least one indicator each for: awareness/perception change, belief/knowledge change, behavioral change
  - Suggest feasible data sources (look up in research)
  - Suggest targets: numbers for numerical/average, percentages for rates/recall, increases from baseline for attitude/behavior shifts

**Indicator Types:**
- **Level 1 - Outcomes:** % who start/stop/maintain behavior, % intention to complete, % ability/confidence/knowledge, % attitude/belief shifts, % who completed CTA
- **Level 2 - Outtakes:** Views, view completions, engagements, clicks, rates (CTR/engagement/view-through), % positive sentiment, dwell time, % recall, % agree with messaging, % awareness/knowledge increase
- **Level 3 - Outputs:** Total reach, total impressions, earned media coverage, # digital outputs, # non-digital outputs, # partner/influencer activations

---

### 2.10b stage2/singleMrel
- **Purpose:** Generate a single MREL indicator
- **Latest Version:** 2
- **Total Versions:** 2
- **Labels:** latest, production
- **Description:** Generates a single MREL indicator of a specific type. Same rules as full MREL prompt but for individual indicator generation.
- **Key Variables:**
  - `{intervention_id}` - Intervention ID
  - `{indicator_type}` - Level (1=Outcome, 2=Outtake, 3=Output)
- **Output Format:** JSON with single indicator
- **Tools Available:** `queryForResearch` (to find data sources)
- **N8N Workflow:** `generateSingleMRELIndicator`
- **Key Rules:**
  - Draft single MREL indicator of proposed type
  - Same quality and formatting rules as stage2/mrel
  - Use # or % notation
  - Suggest feasible data source
  - Suggest appropriate target

---

### 2.11 stage2/oasis
- **Purpose:** Summary & OASIS Plan
- **Latest Version:** 1
- **Total Versions:** 1
- **Labels:** latest, production
- **Description:** Consolidates all Stage 2 Design elements into OASIS plan (Objective, Audience, Strategy, Implementation, Scoring). Final campaign plan document.
- **Key Variables:**
  - All Stage 1 and Stage 2 validated inputs
  - GWTB statement
- **Output Format:** Structured OASIS document with 6 sections
- **Tools Available:** None
- **N8N Workflow:** `generateOASIS`
- **Key Rules:**
  - Integrate validated inputs from all earlier steps
  - Concise, campaign-ready language
  - Write as if briefing someone who knows nothing about campaign
  - Read like consistent narrative flowing paragraph to paragraph
  - Avoid awkward phrases: "in relation to the problem", "within this system map", "The key tension is:", "client objective is"
  - No long sentences, dashes (---), or colons (:) that break flow

**OASIS Sections:**
1. **Background** (1-2 paragraphs): Core challenge/problem with data, aspect focused on from systems map, opportunity to tackle it
2. **Objectives** (1 paragraph with bullets): Initial client objective (overarching outcome), then campaign objectives (awareness, attitudinal, behavioral)
3. **Audience** (1-2 paragraphs): Demographics, attitudes/behaviors, barriers (NOT in persona format)
4. **Strategy** (1-2 paragraphs): GWTB statement (GET/WHO/TO/BY in bold caps), strategy explanation, 3 key messages with proof points, core CTA (2 sentences)
5. **Implementation** (1-2 paragraphs): Creative territory (2-3 sentences), user journey (4 stages with indicative outputs), timings (Creative Dev, Production, Dissemination, Evaluation)
6. **Scoring** (1 paragraph + bullets): State more detailed MREL exists, list 5 most important metrics: total reach, engagement, awareness shifts, attitude/knowledge shifts, behavior shifts

---

## Additional Notes

### Common Variables Across Prompts
- `{BRIEF_OUTPUT}` - Initial brief details (problem, objective, TA profile, location, etc.)
- `{INSIGHTS}` - Research insights from Stage 1
- `{BEHAVIORAL_OBJECTIVE}` - Chosen behavioral objective
- `{XANO_DATABASE_SCHEMA}` - Database schema with field validation rules
- `{intervention_id}` - Unique intervention identifier

### Common Tools
- **queryForResearch:** RAG tool to retrieve additional context from uploaded research documents. Used when prompts need to fill gaps in provided inputs or when more evidence is needed.

### Character Constraints
Many prompts enforce character limitations from `{XANO_DATABASE_SCHEMA}`. These are specified in validator format:
```
"validators": {"trim": true, "max": "100"}
```
This means outputs must be under 100 characters. This is marked as **ABSOLUTE PRIORITY** across multiple prompts.

### Workflow Patterns
- **Stage 1 (Understand):** Research → Insights → System Map → Behavioral Objectives → Assumptions → COM-B → Personas
- **Stage 2 (Design):** TFD → Strategy → GWTB → Territory → SMP → Narrative → CTA → Journey → MREL → OASIS

### Prompt Versioning
- Most prompts have multiple versions (up to 17 for behavioral objectives)
- All are labeled "production" and "latest"
- Versions track refinements to prompt quality and output structure

---

## API Access Details

**Base URL:** https://cloud.langfuse.com/api/public/v2/prompts
**Authentication:** Basic Auth with Public Key as username and Secret Key as password
**List Prompts:** `GET /api/public/v2/prompts?page={page_number}`
**Get Prompt:** `GET /api/public/v2/prompts/{prompt_name}?label=latest`

---

**End of Catalog**
