# QA Contract — Authoritative Rules for Claude Code

> **Status:** AUTHORITATIVE
>
> This file defines the **governing rules** for QA behaviour in this repository.
> If there is any conflict between this file and examples, templates, or guides, **this file wins**.
>
> This document is **not human documentation**. It is a control surface for Claude Code.

---

## 0. Scope & Authority

This contract applies to **all Playwright + Claude Code QA activity** in this repository.

Claude must:
- Execute QA as a browser-controlling agent
- Validate **user-visible behaviour only**
- Treat all rules below as **non-negotiable**

Claude must **not**:
- Reason about platform-specific internals (see client-specific docs if applicable)
- Infer implementation details
- Invent new QA conventions

---

## 1. Core QA Philosophy

1. **Test flows, not pages**
   QA validates end-to-end user behaviour, not isolated UI components.

2. **Evidence before judgement**
   Evidence (observations, logs) must be captured before concluding outcomes.

3. **Signal over noise**
   Non-user-visible issues do not fail runs unless explicitly escalated by this contract.

---

## 2. QA Execution Modes

QA operates in two execution modes.

### Mode A — Interactivity Mode (Default)

**Interactivity Mode is the default QA mode** for:
- all new functionality
- partially built or unstable features
- features blocked by missing or unreliable test data
- exploratory and UX validation

Interactivity Mode runs are **first-class QA artifacts**, not provisional investigations.

### Mode B — Automated Test Specs (Opt-in)

Automated test specs are written **only when explicitly requested** or when a feature is:
- stable
- regression-critical
- supported by reliable test data

Automated specs exist to harden behaviour already validated interactively.

---

## 2A. Fast QA Mode (Default)

Fast QA Mode is the **default** for all QA runs.

**Fast QA Mode behaviour:**
- Skip pre-execution scope confirmation (start testing immediately)
- Desktop only (no mobile testing)
- Output is a `README.md` in `QA-Runs/[issue-number]/` listing what was tested and results
- Screenshots only for failures and unexpected findings (not passes)
- Comment on GitHub issue with findings for Dev Agent

**Standard QA is only used when explicitly requested** by the user saying "full QA" or "standard QA".

---

## 3. Access & Authentication

Authentication must always follow this order:
1. Staging gate (if present — see client-specific docs for URL pattern)
2. Application login (role-based)

Rules:
- Authentication state must never be assumed
- Credentials must never be hard-coded
- Credentials must be read from environment configuration

Abort rule:
- Authentication failure **aborts the run** after capturing debug evidence

---

## 4. Navigation & Interaction Guarantees

QA must interact only with **user-visible UI elements**, using only the methods a real user has: clicking, typing, scrolling, and navigating.

Hidden, implementation-derived, or non-visible selectors are forbidden.

### Prohibited Techniques (Non-Negotiable)

The following are **strictly forbidden** in all QA runs. Playwright must act purely as a user — no shortcuts, no injection, no backdoors.

| Prohibited | Why |
|---|---|
| `page.evaluate()` / `page.$eval()` / `page.evaluateHandle()` | Injects JavaScript — a user cannot do this |
| `page.route()` / `page.setExtraHTTPHeaders()` | Intercepts or modifies network traffic |
| `page.addScriptTag()` / `page.addStyleTag()` | Injects code into the page |
| Direct API calls (`fetch`, `curl`, HTTP requests) to check or modify state | A user interacts through the UI, not the API |
| Reading `localStorage`, `sessionStorage`, or cookies via JS | A user cannot inspect browser storage |
| DOM manipulation or reading DOM properties not visible on screen | A user sees rendered output, not the DOM tree |
| `page.setContent()` / `page.goto('javascript:...')` | Bypasses normal navigation |
| `page.dispatchEvent()` | Simulates events the user didn't trigger |
| Accessing `__NEXT_DATA__`, React internals, or framework state | Implementation details invisible to users |

### Allowed Playwright Methods

Only use Playwright's **user-simulation layer**:
- `page.goto(url)` — navigate like typing a URL
- `page.click()` / `page.fill()` / `page.type()` — interact like a user
- `page.keyboard.*` / `page.mouse.*` — physical input simulation
- `page.waitForSelector()` / `page.waitForURL()` — wait for visible changes
- `page.screenshot()` — capture what the user sees
- `page.textContent()` / `page.isVisible()` / `page.isEnabled()` — read visible state
- `expect()` assertions on visible text, element state, and URLs
- `page.console` — passively listen to console output (telemetry only, per Section 6)

**Rule of thumb:** If a real user sitting at the keyboard cannot do it, Playwright must not do it.

If an interaction fails:
- Capture evidence
- Record the failure
- Continue where possible

---

## 5. Validation & Failure Semantics

### Validation Rules

- Validation must not rely solely on button enabled/disabled state
- User-visible validation behaviour is authoritative

### Failure Rules

- Individual item failures do **not** abort a run
- Failures must be recorded with evidence

### Abort Conditions (Only)

- Authentication failure
- Total navigation failure

---

## 5A. Unexpected Findings & Demo-Readiness

QA must flag **ambiguous product decisions**, not just defects.

### Core Principle

Better to flag and be told "this is intended" than to miss a product decision that needs validation.

### What to Flag

- UX patterns without clear specification (accordion vs stack, confirmation patterns)
- Role-based controls visible in wrong context (click them to document what they expose)
- Visual/layout issues affecting usability (image sizing, overflow, scalability)
- Demo-readiness issues (test data, placeholders, poor content quality)
- Data patterns revealing system gaps (no validation, no ordering, no workflows)

### Reporting

Each finding must include:
1. What was observed
2. Why it matters
3. PM action required

---

## 6. Console Errors & Telemetry

Console errors are **telemetry by default**.

A run fails due to console errors **only if**:
- a user-visible requirement fails **and**
- relevant console errors occur in the same interaction window

---

## 7. Blocked vs Failed Tests

A test is **Blocked** when progress is prevented by:
- missing test data
- environment issues
- unmet external dependencies

Blocked ≠ Failed.

Rules:
- Blocked tests must never be marked as failed
- Evidence of the blocker must be captured
- What *was* successfully tested must be documented
- Clear PM action must be recorded

---

## 8. Mandatory Reporting

Every QA run must produce:
- a definitive status (Pass / Fail / Blocked)
- a `README.md` in `QA-Runs/[issue-number]/` documenting what was tested
- evidence supporting that status (screenshots only when they help explain a problem)

GitHub is the source of truth. Results are reported via:
- Issue comment (summary + fixes required)
- New issues for actionable findings (if needed)

---

## 8A. GitHub Integration (Mandatory)

QA results must be visible in GitHub, not just local files.

### After Every QA Run, Claude Must:

**1. Post summary comment to the GitHub issue**

The comment must include:
- Pass/Fail/Blocked status
- What was tested
- Any fixes required (actionable for Dev Agent)
- Reference to local evidence folder

**2. Create new GitHub issues for:**

| Finding Type | Action |
|--------------|--------|
| Bugs found | Create bug issue with evidence |
| Unexpected findings | Create issue for PM review |

**3. Update issue labels**

| QA Result | Label Action |
|-----------|--------------|
| Pass | Remove `in-qa`, add `done` |
| Fail | Remove `in-qa`, add `needs-fixes` |
| Blocked | Keep `in-qa`, link to blocker issue |

---

## 9. Filesystem Authority

All QA artifacts must live under `QA-Runs/`.

The primary artifact for each run is:
```
QA-Runs/[issue-number]/README.md
```

Screenshots (when needed) go in the same folder.

---

## 10. Reuse & Change Control

Before writing or modifying QA logic, Claude must:
1. Look for existing tests
2. Look for reusable helpers
3. Look for reusable patterns

Rules:
- Claude may **propose** shared changes
- Claude must **not implement** shared changes without explicit approval

---

## 11. Authority & Precedence

Claude must read this file **first**.

If any guide, example, or prior test conflicts with this contract:
- **This contract wins**.

Do not reinterpret rules.
Obey literally.
Capture evidence.
Continue where possible.
