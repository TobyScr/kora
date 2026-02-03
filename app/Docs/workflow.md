# Dev Agent — Workflow

> **Status:** AUTHORITATIVE
>
> This file defines the full development workflow including design integration.
> The Orchestrator and Dev Agent must follow these steps.

---

## Before Starting Any Issue

When the user asks to work on an issue (e.g., "Work on issue #12"), the Orchestrator must:

### 1. Read the Issue
```bash
gh issue view #N
```

If anything in the issue is ambiguous, incomplete, or leaves room for interpretation, **stop and ask the user** before proceeding. Do not assume or fill in gaps.

### 2. Check for Figma Design

If the issue involves any UI work, confirm a Figma link is present in the issue. If there is no Figma link:
- **Do not proceed with building.**
- Ask the user: *"This issue has no Figma design linked. Should I wait for a design, or do you want me to build without one?"*
- Only proceed without Figma if the user explicitly approves.

### 3. Present a Technical Implementation Plan

Before branching or writing code, present a plain-English plan to the user. Pitch it as a CTO briefing a technical PM — no code snippets, but explain trade-offs where they exist.

The plan should cover:
- **What we're building:** Feature/fix summarised in context of the app
- **What it touches:** Which system areas are affected (database, UI, API, auth, etc.)
- **Key decisions:** Any architectural or data-model trade-offs, with a recommendation and reasoning
- **Build order:** Steps in sequence, noting dependencies
- **Risks or gotchas:** Anything that could cause problems or needs user input

**Wait for user approval before proceeding.** The user may ask questions, push back, or adjust scope. Do not create a branch or spawn the Dev Agent until the plan is approved.

### 4. Branch and Build

Once the plan is approved, follow the branching process below, then spawn the Dev Agent.

---

## Design Source of Truth

### Priority Order

| Priority | Source | Purpose |
|----------|--------|---------|
| 1 | **Figma (via MCP)** | Primary design reference |
| 2 | **User story descriptions** | Behavior when no design exists |

---

## Figma Integration

### Every GitHub Issue Must Have a Figma Link

GitHub issues should contain a "Design Reference" section with a Figma URL:

```markdown
## Design Reference
[Screen Name (Figma)](https://www.figma.com/design/FILE_KEY/FILE_NAME?node-id=XX-XXXX&m=dev)
```

### If No Figma Link Exists

**Stop and ask the user.**

Do not:
- Guess the design
- Build based only on text descriptions
- Proceed without visual reference

Instead:
1. Note that the issue is missing a Figma link
2. Ask the user to provide the correct Figma frame
3. Wait for the link before building UI

### Using the Figma MCP

> **Important:** Always use the **Figma Desktop MCP** tools (`mcp__figma-desktop__*`), not the regular Figma MCP. The desktop version provides better integration and more reliable results.

Once you have a Figma URL:

1. **Extract the node ID** from the URL
   - `node-id=57-2845` → `57:2845`

2. **Get the design screenshot:**
   ```
   mcp__figma-desktop__get_screenshot(nodeId: "57:2845")
   ```

3. **Get detailed design context** (layout, spacing, colors):
   ```
   mcp__figma-desktop__get_design_context(nodeId: "57:2845")
   ```

4. **Analyze the design thoroughly** (see checklist below)

5. **Build to match** the Figma design

### Design Analysis Checklist

When analyzing a Figma design, check ALL of the following — not just structure:

| Category | What to Look For |
|----------|------------------|
| **Layout & Structure** | Grid, columns, positioning, spacing between elements |
| **Content** | Text, icons, images, data displayed |
| **Backgrounds** | Section backgrounds, card backgrounds, container colors |
| **Borders & Dividers** | Border colors, widths, which elements have borders |
| **Shadows** | Drop shadows, inner shadows, elevation |
| **Border Radius** | Rounded corners on containers, buttons, cards |
| **Typography** | Font weights, sizes, colors, letter-spacing |
| **States** | Hover, active, disabled, loading states |

> **Common Mistake:** Focusing only on layout and content while missing visual styling like backgrounds, borders, and shadows. Always check container styling, not just the content inside.

---

## Desktop-First Development

### Build for Desktop

All development should target desktop viewport first. This is the primary experience.

### Build Order

1. **Build desktop first** — Match Figma exactly
2. **Desktop is the priority** — Ensure full functionality and visual fidelity on desktop

---

## Branching

### Prompt for Branch Creation

**Always ask the user:**

> "Would you like me to create a new branch for this work?"
>
> Options:
> 1. **Yes, create branch** - I'll create `feature/issue-N-short-description`
> 2. **No, work on current branch** - Continue on `{current_branch}`

### If Creating a Branch

Use this naming convention:
```
feature/issue-{N}-{short-description}
```

Examples:
- `feature/issue-12-account-setup`
- `feature/issue-50-email-invitations`
- `fix/issue-51-session-validation`

Prefixes:
- `feature/` - New functionality
- `fix/` - Bug fixes
- `chore/` - Config, docs, maintenance

Commands to run:
```bash
# Ensure we're on main and up to date
git checkout main
git pull origin main

# Create and switch to new branch
git checkout -b feature/issue-{N}-{short-description}
```

### Then Proceed with Dev Agent

Only after branch decision is resolved, spawn the Dev Agent to build the feature.

---

## After Dev is Complete — Push & Create PR

When the Dev Agent finishes building, push the branch and open a PR **before** running QA.

```bash
# Push branch
git push -u origin feature/issue-{N}-{short-description}

# Create PR targeting main
gh pr create --title "Issue #N: Short description" --body "Closes #N"
```

**Do not merge yet.** The PR stays open while QA runs against the branch.

---

## QA Runs Against the Open PR

The Orchestrator spawns the QA Agent to test the feature on the running branch.

- QA runs against the dev server (which is serving the feature branch code)
- QA results are posted as a comment on the GitHub issue
- See root `CLAUDE.md` for full QA instructions

---

## After QA — Merge or Fix

### If QA Passes → Merge the PR

```bash
gh pr merge {PR-number} --merge --delete-branch
```

Then update labels:
```bash
gh issue edit #N --remove-label "in-qa" --add-label "done"
```

### If QA Fails → Fix on the Branch, Re-run QA

1. Dev Agent fixes issues on the same feature branch
2. Push fixes (the PR updates automatically)
3. Re-run QA (Fast QA mode is fine for fix verification)
4. Repeat until QA passes
5. Then merge the PR

```bash
# After fixes are pushed and QA passes:
gh pr merge {PR-number} --merge --delete-branch
```

### Key Rule: Main Must Always Be Stable

**Never merge a PR that hasn't passed QA.** Main is what gets deployed to production. Merging untested code means bugs go live.

---

## Checklists

### Before Building UI

- [ ] GitHub issue has Figma link in "Design Reference" section
- [ ] If no Figma link → **ask user before proceeding**
- [ ] Retrieved design via Figma MCP
- [ ] Analyzed design for ALL visual details (see Design Analysis Checklist above)
- [ ] Have a plan for implementation

### When Done

- [ ] Desktop matches Figma design
- [ ] No TypeScript errors
- [ ] No console errors
- [ ] Dev notes added to GitHub issue

---

## Quick Reference

| Step | Action |
|------|--------|
| 1 | Read issue with `gh issue view #N` |
| 2 | **Check for Figma design (UI issues only)** |
| 3 | **Present implementation plan, wait for approval** |
| 4 | Ask user about branch creation |
| 5 | Create branch if requested |
| 6 | Spawn Dev Agent to build |
| 7 | Push branch & create PR |
| 8 | Run QA against the branch |
| 9 | If QA passes → merge PR into main |
| 10 | If QA fails → fix on branch → re-QA → merge |
