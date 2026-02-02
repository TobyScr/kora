# Interactive QA Rules — Claude Control Guide

> **Status:** PROCEDURAL (Claude-facing)
>
> This file defines **how Claude executes Interactivity Mode QA**.
> It does **not** define authority. If anything here conflicts with `qa_contract_authoritative_rules_for_claude_code.md`, the contract wins.
>
> This document is **not human documentation**. It is an execution playbook for Claude.

---

## When to Use This File

Claude must use this guide **only when running QA in Interactivity Mode**.

Interactivity Mode is the default for:
- new functionality
- incomplete or unstable features
- features blocked by missing test data
- exploratory and UX validation

---

## Core Principles (Interactivity Mode)

1. **Behave like a real user**
   Navigate and interact exactly as a human would, using visible UI only.

2. **Explore deliberately, not exhaustively**
   Follow the defined story requirements. Do not wander beyond confirmed scope.

3. **Narrate what happens**
   Every meaningful action must be explainable after the fact.

4. **Stop when blocked**
   Do not invent data or assumptions to push past blockers.

---

## Pre-Execution Scope Confirmation

### Fast QA (Default)

Scope confirmation is **skipped**. Proceed directly to testing based on issue requirements.

### Standard QA (Only When Requested)

When explicitly requested ("full QA", "standard QA"), Claude must:

1. **Restate the interpreted test goal** in one sentence
2. **List the user role(s)** that will be tested
3. **List each requirement** Claude intends to verify (as a checklist)
4. **Explicitly list what is out of scope**

Claude must then ask for confirmation:
> "Here is what I will test. Does this look correct before I begin?"

Claude must **not begin testing** until the user explicitly confirms or corrects the scope.

---

## Requirement Translation Rules

Claude must translate story requirements into **observable user outcomes**.

Rules:
- Validate **what the user can see or do**, not internal state
- Treat UI structure, copy, and behaviour as primary signals
- Do not infer backend success without visible confirmation

Each requirement must end in one of:
- ✓ Pass
- ✗ Fail
- ⛔ Blocked

---

## Navigation & Interaction Strategy

### Interaction Rules

- Interact only with visible UI elements
- Never target hidden or implementation-derived controls
- Prefer text and accessible roles over structural selectors

### If an interaction fails:
1. Capture evidence
2. Record what was attempted
3. Continue to the next requirement if possible

Do not retry indefinitely.

---

## Evidence Capture Rules

Evidence supports QA outcomes. The primary output is a `README.md`.

### Default (Fast QA)

Only capture screenshots for:

1. **Failures** — Any requirement that fails
2. **Blockers** — Anything preventing progress
3. **Unexpected findings** — UX issues, bugs, concerns for PM/Dev

**Do not screenshot passing requirements.** If it works, move on.

### Standard QA (When Requested)

Capture screenshots at:
1. Authentication success
2. Entry state
3. Per requirement verification
4. State transitions
5. Unexpected behaviour or errors
6. Blockers

### Active Investigation of Unexpected Elements

When UI elements appear that are marked "out of scope" for workflow testing, Claude must still investigate their presence:

- Note their presence
- Click/tap them to see what they expose
- Document the exposed options
- Flag if they create role boundary or UX concerns

---

## Multi-Viewport Testing

All interactive QA runs test **mobile-first** (matching Figma designs).

### Viewport Definitions

| Viewport | Resolution | Description |
|----------|------------|-------------|
| Mobile   | 390×844    | Mobile device (iPhone 14 equivalent) — **Primary** |
| Desktop  | 1920×1080  | Standard desktop/laptop |

### Fast QA (Default)

1. **Mobile pass** — Complete all requirements on mobile viewport
2. **Desktop spot-check** — Quick layout sanity check

### Standard QA (When Requested)

1. **Mobile pass first** — Complete all requirements on mobile viewport
2. **Desktop full pass** — Test all requirements on desktop viewport

---

## Handling Blockers

A test is **Blocked** when progress is prevented by missing data, environment issues, or unmet dependencies.

When blocked:
- Capture clear evidence of the blocker
- Note which requirements could not be tested
- Do **not** invent data or assumptions
- Do **not** mark the test as Failed

Even when blocked, Claude must still test and document **everything that is observable**.

---

## README.md Requirements (Fast QA — Default)

Each run must produce a `README.md` in `QA-Runs/[issue-number]/` containing:

```markdown
## QA Result: [PASS | FAIL | BLOCKED]

**Issue:** #N - [Title]
**Mode:** Fast QA (mobile-first, desktop spot-check)
**Date:** YYYY-MM-DD

### Fixes Required
> List each failure with enough detail for Dev Agent to reproduce and fix.

1. [What's broken - specific and actionable]
2. [What's broken - specific and actionable]

### Unexpected Findings
> UX/product concerns for PM review. Skip if none.

- [Finding and why it matters]

### Passed
- [Requirement 1]
- [Requirement 2]

### Not Tested
> Only include if something was skipped.

- [What and why]
```

**Goal:** Dev Agent can read "Fixes Required" and immediately start fixing without human interpretation.

---

## TEST_REPORT.md Requirements (Standard QA — Only When Requested)

A full narrative report with per-requirement evidence, viewport results table, unexpected findings, console error summary, and final verdict.

---

## Unexpected Findings (Both Modes)

Document behavior that worked but requires product validation.

Claude must actively hunt for:
- UX pattern ambiguities
- Role-based visibility issues
- Visual & layout concerns
- Demo-readiness red flags
- Data quality signals

For each finding:
1. Describe what was observed
2. Explain why it matters
3. State required PM action

---

## GitHub Integration

After completing the test run, Claude must:

### Step 1: Post Summary Comment to Issue

Comment on the GitHub issue with QA results, what was tested, and any fixes required.

### Step 2: Create Issues for Findings

For bugs or unexpected findings that require tracking, create new GitHub issues.

### Step 3: Update Issue Labels

| QA Result | Label Action |
|-----------|--------------|
| Pass | Remove `in-qa`, add `done` |
| Fail | Remove `in-qa`, add `needs-fixes` |
| Blocked | Keep `in-qa`, link to blocker issue |

---

## Final Instruction

Execute Interactivity Mode deliberately.

Stay within scope.
Capture evidence only when it serves a purpose.
Narrate behaviour.
Stop when blocked.
Post results to GitHub.

If unsure, re-read `qa_contract_authoritative_rules_for_claude_code.md`.
