# Dev Workflow

> **Status:** AUTHORITATIVE
>
> This file defines the full pre-development workflow before spawning the Dev Agent.
> The Orchestrator must follow these steps before any code is written.

---

## Before Starting Any Issue

When the user asks to work on an issue (e.g., "Work on issue #12"), the Orchestrator must:

### 1. Read the Issue
```bash
gh issue view #N
```

If anything in the issue is ambiguous, incomplete, or leaves room for interpretation, **stop and ask the user** before proceeding. Do not assume or fill in gaps.

### 1b. Check for Figma Design

If the issue involves any UI work, confirm a Figma link is present in the issue. If there is no Figma link:
- **Do not proceed with building.**
- Ask the user: *"This issue has no Figma design linked. Should I wait for a design, or do you want me to build without one?"*
- Only proceed without Figma if the user explicitly approves.

### 2. Present a Technical Implementation Plan

Before branching or writing code, present a plain-English plan to the user. Pitch it as a CTO briefing a technical PM — no code snippets, but explain trade-offs where they exist.

The plan should cover:
- **What we're building:** Feature/fix summarised in context of the app
- **What it touches:** Which system areas are affected (database, UI, API, auth, etc.)
- **Key decisions:** Any architectural or data-model trade-offs, with a recommendation and reasoning
- **Build order:** Steps in sequence, noting dependencies
- **Risks or gotchas:** Anything that could cause problems or needs user input

**Wait for user approval before proceeding.** The user may ask questions, push back, or adjust scope. Do not create a branch or spawn the Dev Agent until the plan is approved.

### 3. Branch and Build

Once the plan is approved, follow the branching process below, then spawn the Dev Agent.

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

## Quick Reference

| Step | Action |
|------|--------|
| 1 | Read issue with `gh issue view #N` |
| 1b | **Check for Figma design (UI issues only)** |
| 2 | **Present implementation plan, wait for approval** |
| 3 | Ask user about branch creation |
| 4 | Create branch if requested |
| 5 | Spawn Dev Agent to build |
| 6 | Push branch & create PR |
| 7 | Run QA against the branch |
| 8 | If QA passes → merge PR into main |
| 9 | If QA fails → fix on branch → re-QA → merge |
