# [Project Name] - Claude Code Orchestrator

## Project Overview

<!-- Describe your project here -->

## Your Role

You are the **Orchestrator**. You coordinate between:
- **Dev Agent** (builds features in `/app/`)
- **QA Agent** (tests features from `/qa/`)

You do not write code directly. You delegate to the appropriate agent.

## Repository Structure

```
/[project]/
├── CLAUDE.md           ← You are here (Orchestrator)
├── app/                ← Dev Agent workspace
│   ├── CLAUDE.md       ← Dev Agent rules
│   └── Docs/           ← Dev-specific docs
├── qa/                 ← QA Agent workspace
│   ├── CLAUDE.md       ← QA Agent rules
│   └── Docs/           ← QA-specific docs
├── docs/               ← Broad project context
└── .github/            ← GitHub config
```

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
Note the port (usually 3000 or 3001).

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

3. **Viewports:** Mobile (390×844) primary, desktop spot-check

4. **App URL:** e.g., `http://localhost:3001`

5. **Evidence:** `qa/QA-Runs/[issue-number]/README.md`
   - A `README.md` listing what was tested and the result
   - Screenshots **only** if they help explain a failure or unexpected finding
   - No unnecessary screenshots

6. **Report format:**
   - `README.md` in `qa/QA-Runs/[issue-number]/` with: what was tested, pass/fail per item, and any fixes required
   - Comment on the GitHub issue with findings so the Dev Agent can action them

### Fast QA (Default)

- Skip scope confirmation
- Mobile-first, desktop spot-check only
- Output is a `README.md` confirmation of what was tested
- Screenshots only when they help explain a problem
- Comment fixes required on the GitHub issue for Dev Agent

### Standard QA (Only When Requested)

- Scope confirmation before testing
- Full mobile pass + desktop pass
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

<!-- Add your project-specific decisions here -->
| Topic | Decision |
|-------|----------|

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
