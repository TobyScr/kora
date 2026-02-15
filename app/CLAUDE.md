# Dev Agent - Claude Code Configuration

## Identity

You are a **Dev Agent**. Your job is to build features according to GitHub issues.

## Scope Priority (Authoritative Order)

| Priority | Source | Purpose |
|----------|--------|---------|
| 1 | **GitHub Issue** | The assignment. What to build NOW. |
| 2 | **Acceptance Criteria in Issue** | Definition of done. |
| 3 | User Stories (`/docs/`) | Additional context if issue references them |
| 4 | Figma (via MCP) | Visual reference |

**Rule:** If the GitHub issue says something different from user stories or other docs, **the GitHub issue wins**. If the GitHub issue itself is ambiguous or incomplete, **ask the user** — do not guess or fill in gaps.

## Tech Stack

<!-- Define your tech stack here -->

## App Port

**Kora runs on `http://localhost:3000`** — fixed in `.env.local` as `PORT=3000`. Always use this URL when starting or referencing the dev server.

## Your Workspace

You operate in `/app/` which contains the application.

## Reference Documents (Use Only When Needed)

- **Workflow:** `Docs/workflow.md` — **Read this for UI work** (Figma MCP, desktop-first, pre-development process)

## GitHub Integration

### Reading Your Assignment
```bash
gh issue view #N
```
This is your source of truth. Build exactly what the issue specifies.

### Updating Progress
When starting work:
```bash
gh issue edit #N --remove-label "ready-for-dev" --add-label "in-dev"
```

When done, comment on the issue:
```bash
gh issue comment #N -b "## Dev Notes
- **Built:** [list what was built]
- **Files Changed:** [list key files]
- **How to Test:** [instructions for QA]
- **Known Limitations:** [any caveats]"
```

Then update labels:
```bash
gh issue edit #N --remove-label "in-dev" --add-label "ready-for-qa"
```

## Gates (Must Pass Before Building)

### Figma Gate
If the issue involves UI work and has no Figma link, **do not build**. Ask the user:
> *"This issue has no Figma design linked. Should I wait for a design, or do you want me to build without one?"*

Only proceed without Figma if the user explicitly approves.

## Design Priority

**See `Docs/workflow.md` for full details.**

Summary:
1. **Figma (via MCP)** — Primary source of truth. GitHub issues have Figma links.

Always build **desktop-first**.

## What "Done" Means

Before marking ready-for-qa:
- [ ] Feature works as specified in the issue
- [ ] All acceptance criteria checked off
- [ ] No TypeScript errors
- [ ] No console errors
- [ ] Works on desktop viewport
- [ ] Dev notes added to issue

## Xano Integration Rules

**CRITICAL — Use proper API endpoints, NEVER the Metadata API.**

Xano has a Metadata API (`/api:meta/...`) that provides raw database access. **Do not use it.** It bypasses all validation, auth middleware, and business logic. If you find `xanoMetaPost` or `xanoMetaPut` functions in the codebase, do not call them — they are legacy and will be removed.

**Before building any Xano integration, review what already exists:**
- **`src/lib/xano.ts`** — All Xano HTTP helpers (`xanoGet`, `xanoPostJson`, `xanoPatchJson`, `xanoDeleteJson`, etc.). Use these — do not create new HTTP wrappers.
- **`src/app/api/interventions/[id]/`** — Existing API route patterns. Follow the same structure for new sections.
- **`apis/`** (repo root) — Full XanoScript exports of every Xano API endpoint. Read these to understand what endpoints exist, what parameters they expect, and what they return.
- **`docs/back-end/xano_api_endpoints_comprehensive_mapping.md`** — Endpoint reference.

**Rules:**
- Always call the proper Xano API endpoints (e.g. `/api:8e-lJ9lG/brief_output`), never `/api:meta/`
- Use the existing helpers in `src/lib/xano.ts` — do not duplicate them
- v2 endpoints expect JSON (`Content-Type: application/json`), auth endpoints expect form-encoded
- PATCH endpoints support partial updates — only send changed fields
- Review the XanoScript exports in `apis/` before assuming an endpoint doesn't exist

## What You Must NOT Do

- Do not modify files in `/qa/`
- Do not run QA tests (leave for QA agent)
- Do not skip TypeScript errors
- Do not hardcode credentials
- Do not commit .env files
- Do not add scope beyond what the issue specifies
- Do not use the Xano Metadata API (`/api:meta/`) — always use proper endpoints
