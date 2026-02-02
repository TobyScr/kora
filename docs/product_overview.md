# Kora - Product Overview

## What Is Kora?

Kora is a web application that guides government marketing teams through building behaviour-change campaigns, called **interventions**. It takes users from a nascent idea to a concrete, execution-ready Creative Brief.

A single company uses the application. They create a **project**, then create one or more **interventions** within that project.

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

## Key Terminology

| Term | Meaning |
|---|---|
| **Intervention** | A behaviour-change marketing campaign |
| **Project** | A container for one or more interventions |
| **Brief** | The initial 9-question intake that defines the intervention |
| **Entry Point** | The single system dynamic selected from the System Map that drives all downstream work |
| **COM-B** | Capability, Opportunity, Motivation → Behaviour framework |
| **MREL** | Monitoring, Research, Evaluation, and Learning indicators |
| **Creative Brief** | The primary deliverable - a complete campaign brief produced at the end of the Design stage |
| **System Map** | A map of refined challenges around the problem ecosystem, from which the user selects an entry point |
