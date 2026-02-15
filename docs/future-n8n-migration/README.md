# Future N8N Migration Plan

## Context

Kora currently uses N8N (hosted on Sliplane) for AI orchestration — receiving webhooks from the Next.js frontend, assembling context from Xano/Langfuse/Supabase, calling OpenAI, and streaming responses back. This works but has downsides:

- N8N config lives outside GitHub (not version controlled)
- Separate SaaS to host, monitor, and maintain
- Workflows must be activated individually for MCP access
- Sub-workflows referenced by ID (fragile, fails silently)
- Environment variables require Sliplane dashboard access
- Streaming to the frontend is hacky (NDJSON proxy)

The goal is to eventually move AI orchestration into our codebase so it's version controlled, deployable with the app, and more flexible.

---

## Recommended Replacement: Mastra AI

### What It Is

Mastra is a TypeScript framework (from the team behind Gatsby) built **on top of Vercel AI SDK**. It adds agents, workflows, memory, RAG, and observability tooling on top of the AI SDK's core LLM/streaming/tools layer.

This means picking Mastra doesn't exclude Vercel AI SDK — you get it underneath. If Mastra ever disappoints, you can drop down to the AI SDK layer without rewriting everything.

### Why Mastra Fits Kora

| Need | How Mastra Handles It |
|------|----------------------|
| Agentic workflows (multi-step reasoning) | First-class Agent primitive with tool calling and max steps |
| Meta-chat across all content | Agent with tools that fetch each section's data from Xano |
| Multi-model (OpenAI, Claude, etc.) | Model routing to 40+ providers with one string |
| User-switchable models | Dynamic model selection at runtime — read preference from Xano, pass to agent |
| Prompt management | Fetch from Xano PROMPT table (or keep Langfuse), pass at runtime |
| Streaming to React UI | Built on Vercel AI SDK — native React hooks (useChat, useCompletion) |
| Observability | Mastra Studio (local dev playground) + built-in tracing |
| Model fallbacks | Auto-switch to backup model if primary provider goes down |
| Memory | Short-term and long-term memory systems across threads and sessions |
| Lives in GitHub | Yes — TypeScript code in the repo |

### Architecture

```
app/src/
  lib/
    ai/
      providers.ts        # Model provider config (OpenAI, Anthropic, etc.)
      tools/
        brief.ts          # Tools for brief section
        research.ts       # Tools for research section
        systemMap.ts      # Tools for system map
        ...               # One file per section
      prompts.ts          # Fetch prompts from Xano PROMPT table
      agents/
        chatAgent.ts      # Brief collection chat agent
        generationAgent.ts # Content generation agent
        metaAgent.ts      # Future: meta-chat across all content
  app/api/
    interventions/[id]/
      chat/route.ts       # Calls Mastra chat agent (replaces N8N webhook)
      generate/route.ts   # Calls Mastra generation agent
```

Everything in the repo. Everything deployable with the Next.js app. No separate hosting.

---

## All Options Evaluated

### 1. Mastra AI (Recommended)

- **What:** TypeScript AI framework built on Vercel AI SDK. Agents, workflows, memory, RAG, observability.
- **Pros:** Purpose-built for agentic workflows, multi-model routing (40+ providers), Mastra Studio for visual debugging, built-in memory system, TypeScript-native, lives in repo, Claude Code can build it
- **Cons:** Newer framework with smaller community, another dependency to bet on (though backed by Gatsby team)
- **Migration effort:** Medium — define agents + tools + workflows in TypeScript, API routes call Mastra instead of N8N
- **Docs:** https://mastra.ai/docs
- **GitHub:** https://github.com/mastra-ai/mastra

### 2. Vercel AI SDK (Standalone)

- **What:** Core library for LLM calls, streaming, tool execution, model routing. What Mastra is built on top of.
- **Pros:** Tightest Next.js integration, 2.8M weekly downloads (massive ecosystem), battle-tested, v6 has agents (ToolLoopAgent) and durable workflows (DurableAgent), Claude Code knows it extremely well
- **Cons:** SDK not framework — you build orchestration structure yourself, no built-in memory system, no visual debugging tool
- **Migration effort:** Medium — similar to Mastra but more DIY for complex patterns
- **Docs:** https://ai-sdk.dev/docs/introduction
- **Blog:** https://vercel.com/blog/ai-sdk-6

### 3. OpenAI Agents SDK (TypeScript)

- **What:** OpenAI's lightweight framework for multi-agent workflows. Provider-agnostic despite the name.
- **Pros:** First-class multi-agent "handoffs", built-in guardrails (safety checks), built-in tracing, lightweight
- **Cons:** Newest option (smallest community), historically OpenAI-centric, no workflow engine, less Next.js integration (no React hooks), Claude Code has less knowledge of it
- **Migration effort:** Medium-high — less streaming/UI integration, more manual wiring
- **Docs:** https://openai.github.io/openai-agents-js/
- **GitHub:** https://github.com/openai/openai-agents-js

### 4. LangChain.js / LangGraph

- **What:** Most comprehensive AI framework. Chains, agents, tools, RAG, vector stores.
- **Pros:** Most mature RAG implementation, largest ecosystem of integrations, well-documented
- **Cons:** Heavy (101KB gzipped, blocks edge runtime), Python-first (JS always catching up), over-abstracted, notorious breaking API changes, harder for Claude Code to work with
- **Migration effort:** High — steeper learning curve, more abstraction layers
- **Docs:** https://js.langchain.com/

### 5. Direct SDK (OpenAI/Anthropic Node libraries)

- **What:** No framework. Use `openai` and `@anthropic-ai/sdk` npm packages directly.
- **Pros:** Maximum simplicity, zero framework risk, full control
- **Cons:** Build everything yourself (streaming, tool loops, memory, retry logic), maintaining multiple provider integrations, doesn't scale to complex agentic needs
- **Migration effort:** Low initially, high as complexity grows

### Comparison Table

| | Mastra | Vercel AI SDK | OpenAI Agents | LangChain.js | Direct SDK |
|---|---|---|---|---|---|
| In GitHub | Yes | Yes | Yes | Yes | Yes |
| Multi-model | 40+ providers | 20+ providers | Provider-agnostic | Many integrations | Manual per provider |
| Streaming + React | Native (via AI SDK) | Native | Manual | Manual | Manual |
| Agent support | First-class | v6 ToolLoopAgent | First-class | LangGraph | DIY |
| Memory | Built-in | DIY | Basic | DIY | DIY |
| Workflows | Built-in engine | v6 DurableAgent | No | LangGraph | DIY |
| Observability | Mastra Studio + tracing | Basic | Built-in tracing | LangSmith | None |
| Bundle size | Light (wraps AI SDK) | Light | Light | Heavy (101KB) | Lightest |
| Community size | Growing | Massive (2.8M/wk) | Small | Large | N/A |
| Claude Code support | Good | Excellent | Limited | Moderate | Excellent |

---

## Role of Xano Agents

Xano has its own AI Agents feature — LLM-powered agents that run inside the Xano backend, right next to the database.

### What Xano Agents Do

- Run LLM calls (OpenAI, Claude) from within Xano
- Use "tools" which are Xano functions (query tables, create records, etc.)
- Can be triggered from API endpoints, functions, database triggers, or tasks
- Direct database access — no API round-trip to fetch context

### Where Xano Agents Fit

Xano Agents and Mastra are **not mutually exclusive**. They serve different purposes:

| Use Case | Best Handled By | Why |
|----------|----------------|-----|
| User-facing chat (streaming) | Mastra | Native streaming, React hooks, responsive UI |
| Content generation (user waiting) | Mastra | Streaming progress, model switching, flexible orchestration |
| Meta-chat across all sections | Mastra | Complex agent with many tools, needs streaming |
| Background data enrichment | Xano Agents | Right next to the data, no round-trip needed |
| Auto-classification on record save | Xano Agents | Triggered by database events, no UI involvement |
| Data validation / quality checks | Xano Agents | Backend concern, no user-facing component |

**Rule of thumb:** If the user is watching and waiting (needs streaming), use Mastra. If it's a background task close to the data, use Xano Agents.

- **Docs:** https://docs.xano.com/ai-tools/agents
- **Platform page:** https://www.xano.com/platform/ai-agents/

---

## Migration Strategy

### Approach: Gradual, One Workflow at a Time

1. **Get each N8N workflow working** with the new Next.js frontend (proven logic, known-good outputs)
2. **Replicate in Mastra** (same inputs, same outputs, TypeScript in the repo)
3. **Test side-by-side** — feature flag in the API route to pick N8N or Mastra
4. **Switch over** once the Mastra version matches
5. **Deactivate the N8N workflow**
6. Repeat for the next workflow

### Migration Order (Suggested)

| Order | Workflow | Complexity | Notes |
|-------|----------|------------|-------|
| 1 | Brief Chat | Medium | Only working N8N workflow today. Good first migration target. |
| 2 | Brief Generation | Medium | generateBriefOutput sub-workflow |
| 3 | Research Insights Generation | Medium | Similar pattern to brief generation |
| 4 | System Map Generation | Medium | Same pattern |
| 5 | Behavioural Objective Generation | Medium | Same pattern |
| 6 | Assumption Generation | Medium | Same pattern |
| 7 | COM-B / Persona Generation | Higher | May involve RAG (Supabase vector search) |

### What Stays in N8N (Temporarily)

During migration, N8N continues handling workflows that haven't been replicated yet. The Next.js API routes are the abstraction layer — the frontend never knows whether N8N or Mastra is behind them.

### When N8N Can Be Fully Decommissioned

Once all generation workflows are running in Mastra:
- Deactivate all N8N workflows
- Remove N8N MCP config from `.mcp.json`
- Cancel Sliplane hosting
- Remove `N8N_WEBHOOK_BASE` and `N8N_API_KEY` from `.env.local`

---

## Prompt Management (Future)

Currently using Langfuse (cloud.langfuse.com) for prompt storage. Options for the future:

### Option A: Keep Langfuse
- Mastra fetches prompts from Langfuse at runtime (same as N8N does now)
- Pros: Already set up, nice UI for editing prompts
- Cons: Another external SaaS dependency

### Option B: PROMPT Table in Xano
- Create a PROMPT table: `name`, `model`, `content`, `version`, `is_active`
- Mastra fetches prompts from Xano at runtime
- Build a simple admin UI in the Next.js app for editing
- Pros: Everything in one place, admin/client can edit without leaving Kora, model + prompt paired together
- Cons: Need to build the admin UI

### Option C: Prompts in Code
- Store prompts as template files in the repo
- Pros: Version controlled with git, easy to review changes
- Cons: Requires deploy to update a prompt, no UI for non-technical users

**Recommendation:** Option B (Xano table) — aligns with the goal of letting admins and eventually users control model + prompt combinations.

---

## Sources

- [Mastra AI Documentation](https://mastra.ai/docs)
- [Mastra + Vercel AI SDK Integration](https://mastra.ai/docs/frameworks/agentic-uis/ai-sdk)
- [Mastra GitHub Repository](https://github.com/mastra-ai/mastra)
- [Vercel AI SDK 6 Announcement](https://vercel.com/blog/ai-sdk-6)
- [Vercel AI SDK Documentation](https://ai-sdk.dev/docs/introduction)
- [Vercel AI SDK Agent Workflows](https://ai-sdk.dev/docs/agents/workflows)
- [OpenAI Agents SDK TypeScript](https://openai.github.io/openai-agents-js/)
- [OpenAI Agents SDK GitHub](https://github.com/openai/openai-agents-js)
- [LangChain vs Vercel AI SDK vs OpenAI SDK: 2026 Guide](https://strapi.io/blog/langchain-vs-vercel-ai-sdk-vs-openai-sdk-comparison-guide)
- [Top 5 TypeScript AI Agent Frameworks 2026](https://techwithibrahim.medium.com/top-5-typescript-ai-agent-frameworks-you-should-know-in-2026-5a2a0710f4a0)
- [Mastra vs LangGraph Comparison](https://www.vendortruth.org/article/report-mastra-vs-langgraph-for-ai-orchestration)
- [Xano AI Agents Documentation](https://docs.xano.com/ai-tools/agents)
- [Xano AI Agents Platform](https://www.xano.com/platform/ai-agents/)
- [Introducing Xano Agents](https://www.xano.com/blog/introducing-xano-agents/)
- [Xano Agent-Ready Backends with MCP](https://www.xano.com/blog/building-agent-ready-systems-with-xano/)
- [Mastra Agent System Review](https://justinrich.medium.com/mastra-agent-system-review-a-fresh-take-on-ai-development-04ca3e8e3a1b)
