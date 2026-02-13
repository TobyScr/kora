import type { XanoResearchInsight } from "@/lib/types/research";
import type { Insight, InsightSource, InsightColor } from "@/components/ResearchInsights/types";

// Cycle through these colors for insight cards
const INSIGHT_COLORS: InsightColor[] = ["teal", "cyan", "blue", "indigo"];

// --- Source casing normalization ---
// Xano stores "Existing research" (lowercase r), front-end expects "Existing Research" (uppercase R)

const XANO_TO_FRONTEND_SOURCE: Record<string, InsightSource> = {
  "Existing research": "Existing Research",
  "DeepResearch": "DeepResearch",
};

const FRONTEND_TO_XANO_SOURCE: Record<string, string> = {
  "Existing Research": "Existing research",
  "DeepResearch": "DeepResearch",
};

function normalizeSourceToFrontend(sources: string[] | null): InsightSource[] {
  if (!sources) return [];
  return sources
    .map((s) => XANO_TO_FRONTEND_SOURCE[s])
    .filter((s): s is InsightSource => s !== undefined);
}

function normalizeSourceToXano(sources: InsightSource[] | undefined): string[] {
  if (!sources) return [];
  return sources
    .map((s) => FRONTEND_TO_XANO_SOURCE[s])
    .filter((s): s is string => s !== undefined);
}

// --- Transform: Xano -> Front-end ---

export function xanoInsightToFrontend(
  xano: XanoResearchInsight,
  index: number
): Insight {
  return {
    id: xano.id,
    number: index + 1,
    text: xano.insight || "",
    description: xano.description || "",
    sources: normalizeSourceToFrontend(xano.source),
    color: INSIGHT_COLORS[index % INSIGHT_COLORS.length],
    isExpanded: false,
  };
}

// --- Transform: Front-end -> Xano (for POST create) ---

export function frontendInsightToXanoCreate(
  insight: Partial<Insight>,
  interventionId: number
): Record<string, unknown> {
  return {
    intervention_id: interventionId,
    insight: insight.text || "",
    description: insight.description || "",
    source: normalizeSourceToXano(insight.sources),
  };
}

// --- Transform: Front-end -> Xano (for PATCH update, partial) ---

export function frontendInsightToXanoPatch(
  fields: Partial<Pick<Insight, "text" | "description" | "sources">>
): Record<string, unknown> {
  const body: Record<string, unknown> = {};
  if (fields.text !== undefined) body.insight = fields.text;
  if (fields.description !== undefined) body.description = fields.description;
  if (fields.sources !== undefined) body.source = normalizeSourceToXano(fields.sources);
  return body;
}
