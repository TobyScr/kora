# Xano Authentication & Data Routing Patterns

**Analysis Date:** 2026-02-12
**Source:** Ronald-BM/cleaned-n8n repository

## Overview

The N8N → Xano integration uses a sophisticated routing system to manage development and production data separately while using the same codebase.

---

## Authentication

### Xano Credentials Configuration

**From:** `/credentials/credentials-decrypted.json`

```json
{
  "id": "1lOyZxQNUUqKGOTG",
  "name": "Xano account",
  "type": "xanoApi",
  "data": {
    "baseUrl": "https://xyot-fwcy-i2yo.e2.xano.io/",
    "accessToken": "[REDACTED]"
  }
}
```

### Authentication Method

- **Type:** Bearer Token Authentication
- **Token:** Stored in Xano credential
- **Header Format:**
  ```
  Authorization: Bearer {accessToken}
  ```

### N8N Integration

- N8N workflows use empty URL strings (`""`) in HTTP Request nodes
- The credential provides the base URL automatically
- This allows for centralized credential management

---

## Data Source Routing

### The X-Data-Source Header

**Purpose:** Routes API requests to either development or production database

**Header Name:** `X-Data-Source`

**Possible Values:**
- `dev` - Routes to development database
- `live` - Routes to production database

### How It Works

#### 1. Request Flow
```
Bubble.io UI → N8N Webhook → Xano API
                    ↓
            X-Data-Source header
                    ↓
        Dev DB ←→ Live DB
```

#### 2. Header Injection Pattern

In every N8N workflow:

```json
{
  "headerParameters": {
    "parameters": [
      {
        "name": "X-Data-Source",
        "value": "={{ $('Webhook').item.json.body.data_source }}"
      }
    ]
  }
}
```

**Key Points:**
- Value comes from webhook request body
- Field name: `data_source`
- Passed through from Bubble.io UI
- Dynamically set per request

#### 3. Static Dev Routing

Some workflows hardcode `dev`:

```json
{
  "headerParameters": {
    "parameters": [
      {
        "name": "X-Data-Source",
        "value": "dev"
      }
    ]
  }
}
```

**Examples:**
- Error logging workflows
- Document insights
- Research availability checks

---

## Request Body Structure

### Standard Webhook Request

Every N8N webhook receives:

```json
{
  "body": {
    "intervention_id": integer,
    "data_source": "dev" | "live",
    // ... additional entity-specific fields
  }
}
```

### Core Parameters

| Parameter | Type | Required | Purpose |
|-----------|------|----------|---------|
| `intervention_id` | integer | Yes | Primary entity identifier |
| `data_source` | string | Yes | Database routing (dev/live) |

### Entity-Specific Parameters

Examples from different workflows:

**Personas:**
```json
{
  "intervention_id": 123,
  "data_source": "dev"
}
```

**Single Entity Regeneration:**
```json
{
  "intervention_id": 123,
  "data_source": "dev",
  "entity_id": 456  // For regenerating specific item
}
```

**Assumptions (requires objective):**
```json
{
  "intervention_id": 123,
  "data_source": "dev",
  "objective_id": 789
}
```

---

## Xano Server-Side Routing

### Inferred Xano Configuration

Based on the X-Data-Source header pattern, Xano likely implements:

#### Option 1: Conditional Database Queries

```javascript
// Xano Function Stack (pseudocode)
if (request.headers['X-Data-Source'] === 'dev') {
  database = dev_database;
} else {
  database = live_database;
}

// Then query the appropriate database
return database.query('personas', {intervention_id});
```

#### Option 2: Separate API Endpoints

```
Dev:  https://xyot-fwcy-i2yo.e2.xano.io/dev/api/personas
Live: https://xyot-fwcy-i2yo.e2.xano.io/live/api/personas
```

Then Xano routes based on header to appropriate endpoint.

#### Option 3: Database Table Prefixes

```
dev_personas
dev_interventions
live_personas
live_interventions
```

Xano selects table based on X-Data-Source header.

### Most Likely: Option 1

The credential structure suggests a single base URL with conditional logic, making **Option 1** most probable.

---

## Intervention Context Pattern

### "Get Intervention Info" Operation

**Frequency:** Used in 37+ workflows

**Purpose:**
- Fetches core intervention data
- Provides context for AI generation
- Ensures proper scoping

**Typical Usage:**

```javascript
// N8N Workflow Steps:
1. Webhook receives request with intervention_id and data_source
2. GET Intervention Info using intervention_id
3. Pass intervention context to AI agent
4. AI generates content based on intervention context
5. POST generated content back to Xano
```

**Sample Response Structure:**
```json
{
  "intervention_id": 123,
  "client": "Example Org",
  "location": "Kenya",
  "core_challenge": "...",
  "high_level_objective": "...",
  "budget_min": 10000,
  "budget_max": 50000,
  // ... other intervention fields
}
```

---

## Selected Entity Pattern

### Get Selected [Entity] Operations

Some entities require fetching previously selected items:

**Examples:**
- `GetSelectedObjective` - For assumption generation
- `GetSelectedEntryPoint` - For behavioural objectives

**Purpose:**
- Ensures generated content is contextually relevant
- Maintains logical flow through the brief stages
- Prevents orphaned or disconnected data

**Pattern:**

```javascript
// Workflow: Generate Assumptions
1. GET Intervention Info (context)
2. GET Selected Objective (prerequisite)
3. Generate assumptions based on objective
4. POST assumptions to Xano
```

---

## Error Handling & Logging

### Error Logging Workflow

**Workflow:** `Kora Generic Error Workflow`

**Triggers:** On any N8N workflow error

**Request Body:**
```json
{
  "workflow_name": string,
  "error_message": string,
  "execution_id": string,
  "data_source": "dev" | "live"
}
```

**Xano Operation:**
```
POST /error_log
```

**Purpose:**
- Centralized error tracking
- Debug assistance
- Monitor workflow health

---

## Migration to Supabase: Routing Strategy

### Option 1: Separate Databases

**Pros:**
- Clear separation
- Independent scaling
- True isolation

**Cons:**
- Double maintenance
- Migration complexity
- Higher costs

**Implementation:**
```javascript
// Next.js API route
const db = data_source === 'dev'
  ? supabase_dev_client
  : supabase_prod_client;

const { data } = await db
  .from('personas')
  .select('*')
  .eq('intervention_id', intervention_id);
```

### Option 2: Row-Level Security (Recommended)

**Pros:**
- Single database
- Simpler maintenance
- PostgreSQL native security

**Cons:**
- More complex policies
- Requires careful testing

**Implementation:**

```sql
-- Add data_source column to all tables
ALTER TABLE personas
ADD COLUMN data_source TEXT DEFAULT 'live';

CREATE INDEX idx_personas_data_source ON personas(data_source);

-- Create RLS policy
CREATE POLICY data_source_isolation ON personas
USING (
  data_source = current_setting('app.data_source')::TEXT
);

-- Set in API route
await supabase.rpc('set_config', {
  setting: 'app.data_source',
  value: data_source
});
```

### Option 3: Schema-Based Separation

**Pros:**
- Logical separation in one DB
- Clear namespace
- Easy backups per schema

**Implementation:**

```sql
CREATE SCHEMA dev;
CREATE SCHEMA live;

-- Tables exist in both schemas
CREATE TABLE dev.personas (...);
CREATE TABLE live.personas (...);
```

```javascript
// Next.js
const schema = data_source === 'dev' ? 'dev' : 'live';
const { data } = await supabase
  .from(`${schema}.personas`)
  .select('*');
```

### Recommendation: Option 2 (RLS)

**Rationale:**
- Single source of truth
- Native PostgreSQL security
- Easier migrations
- Lower complexity
- Better for Next.js integration

---

## Authentication Migration

### Current: Xano Bearer Token

```
Authorization: Bearer {xano_access_token}
```

### Future: Supabase Auth

#### Option 1: Service Role Key (Server-Side Only)

```javascript
// Next.js API Route
import { createClient } from '@supabase/supabase-js';

const supabase = createClient(
  process.env.NEXT_PUBLIC_SUPABASE_URL,
  process.env.SUPABASE_SERVICE_ROLE_KEY
);
```

**Pros:** Simple, no user auth needed
**Cons:** Only works server-side

#### Option 2: User-Based Auth (Recommended)

```javascript
// Client-side (Bubble.io replacement)
import { createClientComponentClient } from '@supabase/auth-helpers-nextjs';

const supabase = createClientComponentClient();

// Authenticated requests automatically include user context
const { data } = await supabase
  .from('personas')
  .select('*')
  .eq('intervention_id', id);
```

**Pros:**
- Proper user context
- RLS automatically enforced
- Audit trail

**Cons:**
- Requires auth flow

---

## Webhook Migration to Next.js API Routes

### Current: N8N Webhooks

```
POST https://n8n.example.com/webhook/generate_persona
```

### Future: Next.js API Routes

```
POST https://kora-app.vercel.app/api/generate/persona
```

### Implementation Pattern

```typescript
// app/api/generate/persona/route.ts
import { NextRequest, NextResponse } from 'next/server';
import { createRouteHandlerClient } from '@supabase/auth-helpers-nextjs';
import { cookies } from 'next/headers';

export async function POST(request: NextRequest) {
  const { intervention_id, data_source } = await request.json();

  // Create Supabase client with user context
  const supabase = createRouteHandlerClient({ cookies });

  // Set data source for RLS
  await supabase.rpc('set_data_source', { source: data_source });

  // Get intervention context
  const { data: intervention } = await supabase
    .from('interventions')
    .select('*')
    .eq('intervention_id', intervention_id)
    .single();

  // Generate personas using AI (OpenAI/Claude)
  const personas = await generatePersonasWithAI(intervention);

  // Save to Supabase
  const { data, error } = await supabase
    .from('personas')
    .insert(personas)
    .select();

  if (error) {
    return NextResponse.json({ error: error.message }, { status: 500 });
  }

  return NextResponse.json({ data });
}
```

---

## Summary: Key Patterns

1. **X-Data-Source header** controls dev/live routing
2. **intervention_id** is the primary relationship key
3. **Get Intervention Info** is nearly always the first operation
4. **Bearer token auth** is simple but should be replaced with Supabase Auth
5. **Empty URLs** in N8N rely on credential base URL
6. **Webhook → API Route** migration is straightforward
7. **RLS policies** are the best Supabase equivalent to X-Data-Source routing

---

*Generated from Ronald-BM/cleaned-n8n repository analysis (2026-02-12)*
