# Xano AI Agents — Reference Guide

> **Source:** [Xano AI Agents Documentation](https://xano-997cb9ee.mintlify.app/ai-tools/agents/)
> **Date researched:** 2026-02-12
> **Status:** Agent Builder is labeled **Beta** on all Xano plans

---

## What Are Xano Agents?

Xano AI Agents are autonomous, multi-step reasoning engines that live inside Xano's function stack system. Unlike simple LLM wrappers, agents can:

- Receive a prompt with dynamic data
- Reason about the task
- Autonomously decide which **tools** to call and in what order
- Iterate up to a configurable `max_steps` limit
- Return structured JSON output matching a defined schema

They handle **"fuzzy logic"** — workflows requiring intricate decision-making that can't be expressed as simple if/then rules.

**Distinction from Xano Chatbots:** Xano also has a simpler "Chatbots" feature for direct LLM conversations with history stored in DB tables. Agents are more powerful — they have autonomous tool-calling, multi-step reasoning, and structured output capabilities that chatbots lack.

---

## Agent Configuration

Agents are configured via the Xano UI (`AI > Agents > + Add Agent`) or via XanoScript.

### Settings

| Setting | Description |
|---|---|
| **Name** | Descriptive identifier (e.g., "Generate System Map Agent") |
| **Description** | Internal documentation of purpose |
| **Agent Settings** | Dynamic inputs using `{{ $args.propertyName }}` and `{{ $env.variableName }}` |
| **Max Steps** | Maximum tool-calling iterations before the agent stops (examples show 5–8) |
| **System Prompt** | Core instructions defining role, capabilities, and constraints |
| **Prompt Type** | `messages` (conversation history array) or `prompt` (single prompt) |
| **Prompt** | Per-request context, supports variable interpolation |
| **Structured Outputs** | Toggle to force JSON responses with a predefined schema |
| **Output Schema** | JSON keys the agent must return (e.g., `response_message`, `challenges`) |
| **Tags** | Organizational categories |
| **Request History** | Logging: "Inherit Settings", "Disabled", or "Enabled" |

### Supported LLM Providers

| Provider | Models (examples) | Special Features |
|---|---|---|
| **Anthropic (Claude)** | `claude-opus-4-1-20250805`, `claude-3-7-sonnet-latest` | Extended thinking with budget tokens, reasoning content blocks |
| **OpenAI** | `gpt-4.1-mini`, `gpt-5` | Reasoning effort (low/medium/high), org/project identifiers |
| **Google Gemini** | `gemini-2.5-pro`, `gemini-2.5-flash-lite` | Search grounding (real-time web), extended thinking |
| **Grok** | — | — |
| **Xano Test Model** | Free Gemini credits | No API key needed; credits don't reset |

All providers are BYOK (Bring Your Own Key) — you pay your LLM provider directly.

### XanoScript Example

```java
agent "Generate System Map" {
  canonical = "SYSTEM_MAP_AGENT"
  tags = ["stage-1", "system-map"]
  llm = {
    type          : "anthropic"
    system_prompt : "You are a behavioural science expert..."
    max_steps     : 5
    prompt        : "Generate a system map for: {{ $args.brief_context }}"
    api_key       : "{{ $env.ANTHROPIC_KEY }}"
    model         : "claude-3-7-sonnet-latest"
    temperature   : 0.3
    reasoning     : true
  }
  tools = [
    { name: "Get_Intervention" },
    { name: "Save_System_Map" },
    { name: "Get_Research_Insights" }
  ]
}
```

---

## Agent Tools

Tools are the core building blocks. **There are no pre-built tools** — you create every tool yourself. Each tool is a Xano function stack that the agent can invoke.

### Creating Tools

**Option A — Build from scratch:**
`AI > Tools > + Add Tool` → configure name, description, instructions → build function stack logic

**Option B — Convert existing endpoints:**
Click three-dot menu on any existing function stack → "Use As AI Tool" → assign to an agent. No code duplication.

### What Tools Can Do

Tools inherit the full power of Xano's function stack system:

| Capability | Function |
|---|---|
| **Database CRUD** | Get, Query, Add, Edit, Delete, Patch, Bulk ops, Transactions, Raw SQL |
| **External API calls** | REST requests to any third-party API |
| **Streaming API calls** | For LLM-style streaming responses |
| **JavaScript/TypeScript** | Lambda function execution |
| **File operations** | Store, retrieve, manage files |
| **Cloud services** | Algolia, AWS OpenSearch, S3, etc. |
| **Security** | Token generation, encryption, validation |
| **MCP interop** | Call tools on remote MCP servers via `MCP Call Tool` |
| **Realtime** | Initiate real-time channel events |
| **Template engine** | Twig-powered dynamic text/JSON/SQL generation |

### Tool XanoScript Example

```java
tool "Save_System_Map" {
  instructions = "Saves generated system map challenges to the database"
  input {
    integer intervention_id
    object challenges filters=trim
  }
  stack {
    db.addOrEdit system_map {
      where = { intervention_id: $input.intervention_id }
      set = { challenges: $input.challenges, updated_at: now() }
    } as $result
  }
  response = $result
  tags = ["stage-1"]
}
```

---

## How Agents Are Triggered

| Method | Description |
|---|---|
| **API Endpoint** | Place a "Call Agent" step in any API endpoint's function stack → agent is invokable via HTTP |
| **Within function stacks** | Any function stack can call an agent as a processing step |
| **Agent Triggers** | Pre-processing hooks that run every time an agent is called (for logging, dynamic tool updates) |
| **Scheduled Tasks** | Place agent call in a background task with a schedule |
| **MCP Servers** | Expose agents as MCP tools to external AI clients (Cursor, Claude Desktop) |

The most common pattern for Kora: **front-end calls a Xano API endpoint → endpoint function stack calls the agent → agent reasons, calls tools, returns structured JSON → endpoint returns response to front-end.**

---

## Multi-Step Workflows & Agent Chaining

- The `max_steps` parameter controls iteration depth (documented examples: 5–8 steps)
- **Agent-to-agent chaining** is supported via structured outputs — one agent's JSON output feeds into the next
- Multiple agents can be called sequentially in a single function stack
- Pre/post-processing logic can surround agent calls in the function stack

---

## OpenTelemetry Integration

Xano agents natively support OpenTelemetry, sending execution traces to your chosen observability platform.

### Supported Platforms

| Platform | Credentials Required |
|---|---|
| **Langfuse** | Secret key, public key, base URL |
| **LangChain** | API key |
| **Braintrust** | API key + project name |

### Setup

1. Navigate to agent's **Details** tab
2. Click **"Setup OpenTelemetry Integration"**
3. Enable the integration and enter credentials
4. All future agent executions automatically send traces

### What Gets Tracked

- Complete execution traces (every step, every tool call)
- Performance data and bottlenecks
- Failures and error details
- Run history for debugging and prompt iteration

### Additional Observability

Beyond OTel, Xano provides:

- **Request History** — per-endpoint logging with inputs, outputs, duration (24h retention for APIs, 7 days for tasks)
- **Agent History Template** — dedicated DB tables (`agent_runs`, `agent_steps`, `agent_tool_calls`) with a monitoring dashboard

---

## Database Integration

Agents access the database **through their tools**. Each tool's function stack can use:

| Function | Description |
|---|---|
| `db.get` | Retrieve single record by field lookup |
| `db.query` | Retrieve filtered/complete record sets |
| `db.add` | Insert new record |
| `db.edit` | Update existing record |
| `db.delete` | Remove a record |
| `db.patch` | Partial update |
| `db.addOrEdit` | Upsert — search and update, or create |
| `db.transaction` | Atomic multi-operation with rollback |
| `db.rawQuery` | Raw SQL execution |
| `db.externalQuery` | Connect to PostgreSQL, MS SQL, Oracle, MySQL |
| `db.bulk` | Mass add/edit operations |

Since tools run inside Xano, database access is **direct** — no HTTP round-trips to an external DB API.

---

## Pricing

| Plan | Monthly Cost | Agent Support |
|---|---|---|
| **Free** | $0 | Agent Builder (Beta), 10 req/20s rate limit |
| **Essential** | $85 | Agent Builder (Beta), dedicated infra, background tasks |
| **Pro** | $224 | Agent Builder (Beta), load balancer, HIPAA add-on available |
| **Custom** | Flexible | Direct LLM integration via microservices, sidecar Docker |

**Key points:**
- Agent Builder is available on **all plans**, including Free
- **No per-agent-call charge** from Xano
- LLM costs are external (you pay Anthropic/OpenAI/Google directly via your API key)
- Storage for agent history uses your plan's SSD allocation (1 GB free → 10 GB → 25 GB)

---

## Known Limitations

| Limitation | Detail |
|---|---|
| **Beta status** | Agent Builder is labeled Beta on all plans |
| **No pre-built tools** | Every tool must be manually created |
| **Max steps ceiling** | Agents stop after `max_steps` iterations; no documented upper bound |
| **Model feature gaps** | Not all models support structured outputs + tool calls + reasoning together |
| **Auth in tools** | When a tool uses "Run API Endpoint" internally, auth tokens are not checked |
| **MCP auth** | Authentication methods "are in flux and may change" |
| **Streaming** | Run & Debug mode doesn't display streaming responses |
| **Request history retention** | 24 hours for APIs, 7 days for tasks |
| **Single MCP trigger** | Only one trigger per MCP server |
| **Experimental APIs** | Metadata API and MCP Server are marked "experimental" |

### Not Documented

- Rate limits for agent invocations (beyond plan-level API limits)
- Token limits per agent call (beyond LLM provider limits)
- Maximum number of tools per agent
- Concurrency limits for parallel agent execution
- Whether agents can directly invoke other agents (vs. chaining through function stacks)

---

## Relevance to Kora Architecture

### How Xano Agents Could Replace N8N

| Current (N8N) | Xano Agents Equivalent |
|---|---|
| N8N webhook receives request | Xano API endpoint triggers agent |
| N8N calls OpenAI with Langfuse prompt | Agent uses system prompt + calls OpenAI directly |
| N8N stores result in Xano DB | Agent tool writes directly to Xano tables |
| N8N returns response to front-end | Agent structured output returns JSON |
| Langfuse SDK tracks prompts in N8N | OTel integration sends traces to Langfuse automatically |
| 72 separate N8N workflow JSON files | 72 agents configured in Xano |

### Architecture Comparison

```
CURRENT (4 systems):
Front-end → N8N webhook → OpenAI + Langfuse SDK
                        → Xano DB (store results)
                        → Supabase RAG

WITH XANO AGENTS (2 systems):
Front-end → Xano API endpoint → Xano Agent → OpenAI (BYOK)
                                            → Xano DB (direct)
                                            → Langfuse (via OTel)
                                            → Supabase RAG (via external API tool)
```

### Gains

1. **One platform** — DB, API, AI orchestration, observability all in Xano
2. **No N8N hosting** — eliminate sliplane.app dependency and maintenance
3. **Direct DB access** — agents read/write tables without HTTP round-trips
4. **Agent chaining** — structured outputs feed downstream agents
5. **MCP interop** — expose agents as tools to Cursor/Claude Desktop for development
6. **Langfuse stays** — connected via OTel, no SDK wiring needed

### Trade-offs

1. **Vendor lock-in** — entire backend depends on Xano
2. **Rebuild effort** — 72 N8N workflows must be recreated as agents + tools
3. **Less visual debugging** — N8N's node-based UI is more intuitive than function stacks
4. **Beta risk** — Agent Builder may change; production reliability unproven
5. **No pre-built tools** — every tool must be manually built

### Decision Framework

| Path | Stack | Best When |
|---|---|---|
| **A** | Front-end → N8N → Xano/OpenAI/Langfuse | You want to use what already exists immediately |
| **B** | Front-end → Next.js API routes → OpenAI + OTel | You want full control and long-term clean architecture |
| **C** | Hybrid: Xano CRUD + N8N for AI generation | You want incremental migration |
| **D** | Front-end → Xano Agents → OpenAI + OTel/Langfuse | You want one platform with native AI orchestration |

**Recommendation:** Discuss with Ronald before deciding. Path D is architecturally the cleanest if Xano Agents are production-ready, but the beta status and rebuild effort are real costs. Path A gets you live fastest.
