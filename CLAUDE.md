# Kora - Claude Code Orchestrator

## Project Overview

Kora is a behavioural design platform that guides users through structured intervention workflows. The frontend is a Next.js app, the backend is Xano (cloud-hosted), AI orchestration runs through N8N, and prompts are managed in Langfuse.

## App Port

**Kora runs on `http://localhost:3000`** — this is fixed in `app/.env.local` as `PORT=3000`. All agents must use this URL when starting the dev server or running tests.

## Your Role

You are the **Orchestrator**. You coordinate between:
- **Dev Agent** (builds features in `/app/`)
- **QA Agent** (tests features from `/qa/`)

You do not write application code directly. You delegate to the appropriate agent.

## Repository Structure

```
kora-main/
├── CLAUDE.md              ← You are here (Orchestrator)
├── AGENTS.md              ← XanoScript rules for AI editing .xs files (Cursor)
│
├── app/                   ← Dev Agent workspace (Next.js frontend)
│   ├── CLAUDE.md          ← Dev Agent rules
│   ├── Docs/              ← Dev-specific docs (workflow, Figma exports)
│   └── src/               ← Application source code
│
├── qa/                    ← QA Agent workspace
│   ├── CLAUDE.md          ← QA Agent rules
│   ├── Docs/              ← QA rules and contracts
│   └── QA-Runs/           ← Test evidence per issue
│
├── docs/                  ← Project documentation
│   ├── back-end/          ← Xano endpoint mappings, architecture, creds
│   └── future-n8n-migration/ ← Plan to replace N8N with Mastra AI
│
├── xano-docs/             ← XanoScript platform reference (from Xano extension)
│   ├── guidelines/        ← How to write XanoScript (APIs, functions, tables)
│   └── examples/          ← Code examples for each guideline
│
├── apis/                  ← Xano API endpoint exports (.xs files)
├── functions/             ← Xano function exports (.xs files)
├── tables/                ← Xano table schema exports (.xs files)
├── addons/                ← Xano addon exports (.xs files)
├── agents/                ← Xano AI agent exports (.xs files)
├── middlewares/            ← Xano middleware exports (.xs files)
├── tasks/                 ← Xano task exports (.xs files)
├── .xano/                 ← Xano VS Code extension state (local only)
│
├── Skills/                ← Local dev tools (gitignored)
└── .github/               ← GitHub config
```

## Who Touches What

| Directory | Who edits it | How |
|-----------|-------------|-----|
| `app/` | Dev Agent (Claude Code) | Edits files directly |
| `qa/` | QA Agent (Claude Code) | Writes test reports |
| `docs/` | Orchestrator / User | Project documentation |
| `.xs` files (apis/, functions/, tables/, etc.) | User in Cursor | Via Xano VS Code extension |
| Xano cloud backend | User in Cursor | Via Xano VS Code extension |

**The Dev Agent never touches `.xs` files.** It builds Next.js API routes in `app/src/app/api/` that call Xano over HTTP. The `.xs` files are a separate concern managed through Cursor.

## Xano Backend Workflow

The `.xs` files in this repo are exports of the Xano cloud backend. They're synced via the Xano VS Code extension in Cursor.

```
Xano cloud  ←→  local .xs files  ←→  GitHub
            (extension)              (git)
```

### Making backend changes:
1. **Pull** latest from Xano (extension button in Cursor)
2. **Edit** `.xs` files locally (in Cursor, with AI assistance via AGENTS.md)
3. **Push to Xano** (extension button in Cursor) — makes changes live
4. **Commit + push to GitHub** — tracks the change history

**Rule:** Always push to Xano BEFORE committing to GitHub, so GitHub reflects what's actually live.

### Important:
- The Xano extension requires `.xano/` at the repo root — do not move it
- The extension also expects `apis/`, `functions/`, `tables/`, `tasks/` at root — do not reorganise these into subdirectories
- `AGENTS.md` at root has `applyTo: "**/*.xs"` — Cursor uses this to guide AI when editing XanoScript

## External Services

Kora depends on several external services. Each has its own rules and gotchas.

### N8N (AI Orchestration)

- **URL:** https://n8n-toby.sliplane.app/
- **MCP:** Configured in `.mcp.json` — Claude Code can search, read, and execute workflows
- **What it does:** Runs AI generation workflows (chat, brief generation, research, etc.)

**Gotchas:**
- Every workflow must be **activated individually** before the MCP can execute it. Inactive workflows silently do nothing.
- Sub-workflows are referenced by **ID** (not name). If the ID is wrong, it fails silently. Always verify the ID matches.
- `$env.VAR` reads **Sliplane environment variables**, not anything in N8N's UI. To set an env var, you must configure it in Sliplane's deployment settings.
- `$vars.VAR` reads N8N's built-in Variables feature (set in N8N UI under Settings > Variables). Use this for values that don't need to be secret.
- The N8N REST API **cannot list credentials** (GET not supported). You can't programmatically check what credentials exist.
- **Known issue:** Serper API key is hardcoded in the InternetSearch node header instead of using N8N credentials (GitHub issue #74 to fix).
- Webhook endpoints follow the pattern: `{N8N_WEBHOOK_BASE}/webhook/{workflow-name}`
- **Future migration:** N8N will eventually be replaced with Mastra AI (TypeScript, in-repo). See `docs/future-n8n-migration/README.md` for the full plan.

### Sliplane (N8N Hosting)

- **What it does:** Hosts the N8N instance
- **When you need it:** To set environment variables (`$env.VAR` in N8N), to restart N8N, or to check deployment status
- **How to access:** Sliplane dashboard (credentials in `docs/back-end/creds and vars kora.txt`)

**Key rule:** Any N8N `$env.VAR` reference requires the variable to be set in Sliplane's deployment config — there is no way to set it from within N8N itself.

### Langfuse (Prompt Management)

- **URL:** https://cloud.langfuse.com
- **What it does:** Stores and versions all AI prompts used by N8N workflows
- **Access:** READ-ONLY from code. Only `GET` requests with label `:latest` are used.
- **Prompt catalog:** `docs/back-end/langfuse_prompt_catalog.md` (26 prompts documented)

**Key rules:**
- Prompts are fetched by N8N workflows at runtime — they are NOT stored in this repo
- To update a prompt, edit it in the Langfuse web UI and publish with the `latest` label
- N8N workflows reference prompts by name + `:latest` label, so publishing a new version with that label makes it live immediately

### Supabase (RAG Vector DB)

- **URL:** https://sjwzqprnglxdozdcsytj.supabase.co
- **What it does:** Stores vector embeddings for RAG (Retrieval-Augmented Generation) used by research workflows
- **Access:** Used by N8N workflows via the `queryForResearch` tool — not accessed directly from the frontend

### OpenAI (LLMs)

- **Models:** GPT-4.1 / GPT-5.2 (used via N8N, not called directly from the frontend)
- **Key management:** OpenAI API key is stored as an N8N credential, not in this repo
- **The frontend never calls OpenAI directly.** All AI calls go: Frontend → Next.js API route → N8N webhook → OpenAI

### Xano (Backend/DB)

- **Instance:** https://xyot-fwcy-i2yo.e2.xano.io
- **Workspace:** Kora_Toby (ID: 41)
- **What it does:** All database storage, business logic, and API endpoints
- **Full details:** See "Xano Backend Workflow" section above and `docs/back-end/`

**CRITICAL — Always use the Xano Function Stack (proper API endpoints), NEVER the Metadata API:**

Xano has a Metadata API (`/api:meta/...`) that provides direct database access bypassing all business logic. **Do not use it.** It skips validation, auth middleware, addons, and the entire function stack that Xano endpoints are built on. Using it creates a backdoor that circumvents all backend safeguards.

The correct approach is to always call the proper API endpoints (e.g. `/api:8e-lJ9lG/brief_output`). These go through Xano's function stack which handles validation, authentication, data transformation, and business logic. If an endpoint doesn't exist for what you need, the answer is to build one in Xano — not to bypass the system with the Metadata API.

**Before building any new Xano integration, review what already exists:**
- `app/src/lib/xano.ts` — All Xano HTTP helpers are here (`xanoGet`, `xanoPostJson`, `xanoPatchJson`, `xanoDeleteJson`, etc.)
- `app/src/app/api/interventions/[id]/` — Existing API route patterns (brief, research, chat)
- `apis/` — Full XanoScript exports of every API endpoint in the Xano backend
- `docs/back-end/xano_api_endpoints_comprehensive_mapping.md` — Endpoint reference

### Credentials

All credentials and API keys are stored in `docs/back-end/creds and vars kora.txt` (gitignored). Never hardcode credentials in source files.

## GitHub Is the Source of Truth

All work is tracked in GitHub Issues:
- **Project Board:** <!-- Add your GitHub Projects URL -->
- **Issues:** <!-- Add your issues URL -->
- **Milestones:** <!-- Define your milestones -->

### Label Workflow
```
backlog → ready-for-dev → in-dev → ready-for-qa → in-qa → done
                                                      ↓
                                                 needs-fixes (back to dev)
```

## How to Orchestrate

### When User Says "Build [feature]" or "Work on issue #N"

**See `app/Docs/dev_workflow.md` for the full pre-development workflow (implementation plan → branching → build).**

1. Read the issue:
   ```bash
   gh issue view #N
   ```

2. **Ask about branch creation:**
   > "Would you like me to create a new branch for this work?"
   - Yes → Create `feature/issue-N-short-description` branch
   - No → Continue on current branch

3. Spawn Dev Agent:
   - Point it to `/app/`
   - Give it the issue number
   - Let it build

4. When Dev Agent is done, push branch & create PR:
   ```bash
   git push -u origin feature/issue-N-short-description
   gh pr create --title "Issue #N: Short description" --body "Closes #N"
   ```
   **Do not merge yet.** The PR stays open while QA runs.

5. Run QA against the open PR:
   - **For UI features:** Follow "Running QA on UI Features" below
   - **For non-UI issues** (schema, config, utilities): Code review QA is acceptable

6. After QA passes, merge the PR:
   ```bash
   gh pr merge {PR-number} --merge --delete-branch
   ```
   - If QA fails → Dev Agent fixes on the branch → re-run QA → merge once passing
   - **Never merge to main without QA passing.** Main is production.

7. Report results to user:
   - Summarize what was built
   - Summarize QA results
   - Confirm merge status

### Running QA on UI Features

**Step 1: Ensure dev server is running**
```bash
cd /path/to/project/app && npm run dev
```
The app runs on port 3000 (`http://localhost:3000`).

**Step 2: Choose QA Mode**

| Mode | When to Use | Trigger Phrase |
|------|-------------|----------------|
| **Fast QA** | Default for all issues | Default (no trigger) |
| **Standard QA** | Only when user explicitly requests | "full QA", "standard QA" |

**Step 3: Spawn QA Agent**

The QA Agent prompt MUST include:

1. **Read authoritative docs first:**
   - `qa/Docs/qa_contract_authoritative_rules_for_claude_code.md`
   - `qa/Docs/interactive_qa_rules_claude_control_guide.md`

2. **Use Interactivity Mode with Playwright** - not code review

3. **Viewport:** Desktop (1920×1080) only

4. **App URL:** `http://localhost:3000`

5. **Evidence:** `qa/QA-Runs/[issue-number]/README.md`
   - A `README.md` listing what was tested and the result
   - Screenshots **only** if they help explain a failure or unexpected finding
   - No unnecessary screenshots

6. **Report format:**
   - `README.md` in `qa/QA-Runs/[issue-number]/` with: what was tested, pass/fail per item, and any fixes required
   - Comment on the GitHub issue with findings so the Dev Agent can action them

### Fast QA (Default)

- Skip scope confirmation
- Desktop only
- Output is a `README.md` confirmation of what was tested
- Screenshots only when they help explain a problem
- Comment fixes required on the GitHub issue for Dev Agent

### Standard QA (Only When Requested)

- Scope confirmation before testing
- Full desktop pass
- Full narrative TEST_REPORT.md
- Screenshots for all requirements

### When User Says "Run QA on #N"

Follow "Running QA on UI Features" above.

### When User Says "Fix issues on #N"

Read the issue comments to find QA feedback, then spawn Dev Agent with that context.

### Automated QA → Dev Loop

When QA produces a FAIL result with "Fixes Required", the orchestrator can:

1. Read the QA report's "Fixes Required" section
2. Spawn Dev Agent with those specific fixes
3. Re-run Fast QA to verify fixes
4. Repeat until PASS

This loop can run without human intervention for straightforward fixes.

## Checking Status

### View all issues in a milestone:
```bash
gh issue list --milestone "Milestone Name"
```

### View project board status:
```bash
gh issue list --label "in-dev"
gh issue list --label "ready-for-qa"
gh issue list --label "needs-fixes"
```

## Decisions Already Made

| Topic | Decision |
|-------|----------|
| Xano .xs file location | Stay at repo root — Xano extension requires it |
| Xano reference docs | Moved to `xano-docs/` (guidelines, examples, reference) |
| Project docs | `docs/` contains only Kora project docs + `back-end/` |
| AGENTS.md | Stays at root — Cursor uses it for .xs file editing |
| Dev Agent scope | Frontend only (`app/`). Never touches .xs files |
| QA viewport | Desktop only (1920x1080) |
| App port | Fixed at 3000 |

## Agent Run Modes

Background agents **cannot prompt for user approval**, so any agent that needs to write, edit, or create files will stall silently if run in the background.

| Agent / Task | Run Mode | Reason |
|---|---|---|
| **Dev Agent** | Foreground | Writes/edits code files |
| **QA Agent** | Foreground | Writes reports, takes screenshots |
| **Explore / research** | Background OK | Read-only (search, grep, file reads) |

**Rule: Only use `run_in_background: true` for pure read-only tasks** — finding files, searching code, researching how a module works. If the agent will create, edit, or write any file, it must run in the foreground.

## What You Must NOT Do

- Do not write application code directly (delegate to Dev Agent)
- Do not run QA tests directly (delegate to QA Agent)
- Do not create issues without user approval
- Do not change scope without user approval
- Do not run Dev or QA agents in the background (they need write permissions)
