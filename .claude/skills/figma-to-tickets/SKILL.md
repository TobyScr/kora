---
name: figma-to-tickets
description: "Convert Figma designs into development-ready GitHub Issues. Extracts design context, asks comprehensive discovery questions, and creates issues directly in GitHub with descriptions, acceptance criteria, edge cases, labels, milestones, and dependencies."
---

# Figma to Development Tickets

## Keywords
figma to tickets, design to tickets, create tickets from figma, break down design, figma backlog, design to backlog, ticket from design, figma development tickets

## Overview

This skill takes one or more Figma design URLs, extracts their design context, and through a thorough discovery process creates development-ready GitHub Issues. Tickets are created directly in the repo using `gh issue create`.

## Workflow

### Phase 1: Design Extraction

When the user provides Figma URL(s):

1. For **each** Figma URL provided, extract context using the Figma MCP tools:
   - **Always use the Figma Desktop MCP tools** (`mcp__figma-desktop__*`), never the regular Figma MCP (`mcp__figma__*`). Figma Desktop must be running with Dev Mode enabled.
   - Use `mcp__figma-desktop__get_screenshot` to capture a visual of each design
   - Use `mcp__figma-desktop__get_design_context` to extract component structure, layout, typography, colours, spacing
   - Use `mcp__figma-desktop__get_metadata` if needed for node hierarchy

2. Extract the `fileKey` and `nodeId` from each URL:
   - URL format: `https://figma.com/design/:fileKey/:fileName?node-id=XX-XXXX`
   - `nodeId` = `XX:XXXX` (replace `-` with `:`)

3. Present a **brief summary** of what you see across all designs:
   - Number of screens/components identified
   - High-level description of what the designs depict
   - Any obvious relationships between screens (flows, states, etc.)

### Phase 2: Discovery (The Interrogation)

**This is the most important phase.** Before writing any tickets, ask the user comprehensive questions. Look at ALL designs first, then ask a single consolidated set of questions.

You MUST cover every category listed in `references/question-framework.md`. Do not skip categories. Ask questions that are **specific to what you see in the designs** — not generic boilerplate.

**How to ask:**
- Group questions by category with clear headers
- Use numbered questions so the user can respond by number
- Flag which questions are critical vs nice-to-have
- If a design implies something ambiguous, call it out explicitly ("I see X in the design — does this mean Y or Z?")
- Ask follow-up questions if answers reveal new ambiguities

**Keep asking until you have enough to write solid tickets.** Multiple rounds of questions are expected and encouraged. Tell the user: "I'll probably have follow-up questions after this round."

### Phase 3: Ticket Structure Decision

Before writing tickets, ask the user:

> "Based on the scope, I'd suggest [epic + subtasks / flat tickets / other]. What structure would you prefer?"

Explain your reasoning for the suggestion.

### Phase 4: Ticket Drafting

Draft tickets following the templates in `references/ticket-templates.md`.

**Display each ticket in the conversation with full formatting** so the user can review before anything is created. Do NOT create GitHub Issues yet.

Include the original Figma URL(s) as design references in each ticket body.

### Phase 5: GitHub Issue Metadata

Before creating issues, confirm the GitHub metadata for each ticket. First, fetch what's available in the repo:
- Run `gh label list` to see existing labels
- Run `gh api repos/:owner/:repo/milestones --jq '.[].title'` to see existing milestones

Then present a summary table and ask for confirmation/adjustments:

| Ticket | Labels | Milestone | Blocked By | Assignee |
|--------|--------|-----------|------------|----------|
| [title] | `frontend`, `enhancement` | v1.2 | — | — |
| [title] | `backend`, `api` | v1.2 | Ticket 1 | — |

**What to confirm:**

1. **Labels** — suggest appropriate labels per ticket based on the work involved. Use existing labels where possible. If needed labels don't exist, ask if the user wants them created.
2. **Milestone** — ask which milestone/sprint these belong to.
3. **Dependencies** — if tickets need to be done in a specific order, note which tickets block others. These become "Blocked by #X" references in the issue body once created.
4. **Assignment** — ask if any tickets should be assigned to specific people.

The user may adjust any of these. Update the drafts accordingly.

### Phase 6: Review & Approval

After confirming metadata, present the final drafts and ask:
- "Do any of these need adjustments?"
- "Are there tickets missing that you expected?"
- "Should I split or merge any of these?"
- **"Happy for me to create these as GitHub Issues?"**

Iterate until the user is satisfied and gives explicit approval to create.

### Phase 7: Issue Creation

Once the user approves, create the GitHub Issues:

1. **If using epic + subtasks structure:**
   - Create the parent/epic issue first using `gh issue create`
   - Capture its issue number
   - Create child issues, referencing the parent in their body (e.g. "Part of #X")
   - Add dependency references between issues where applicable (e.g. "Blocked by #Y")

2. **If using flat tickets:**
   - Create issues in dependency order (blockers first)
   - Add cross-references between related issues

3. **For each issue, use:**
   ```bash
   gh issue create --title "..." --body "..." --label "label1,label2" --milestone "..." --assignee "..."
   ```

4. **After all issues are created**, present a summary with links:
   | # | Title | Labels | Milestone | URL |
   |---|-------|--------|-----------|-----|
   | 42 | Implement user card | `frontend` | v1.2 | github.com/...issues/42 |

## Important Rules

- **Never assume** — if the design is ambiguous, ask. A question now saves a rewrite later.
- **Be specific** — "What happens when the list is empty?" is better than "What about edge cases?"
- **Reference the design** — when asking questions, point to specific elements you see ("The card component in the top-right — is that clickable?")
- **Think like a developer** — what would a dev need to know to build this without coming back with questions?
- **Think like a tester** — what edge cases and states need to be defined to write tests?
- **Never create issues without explicit user approval** — always draft first, confirm, then create.
