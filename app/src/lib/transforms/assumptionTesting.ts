import type { XanoAssumption, XanoResearchQuestion, XanoResearchFile } from "@/lib/types/assumptionTesting";
import type { Assumption, AssumptionColor, ResearchQuestion, UploadedFile } from "@/components/AssumptionTesting/types";

// Cycle through these colors for assumption cards
const ASSUMPTION_COLORS: AssumptionColor[] = [
  "teal", "cyan", "blue", "indigo", "violet", "amber", "rose", "emerald",
];

// --- Assumptions: Xano -> Front-end ---

export function xanoAssumptionToFrontend(
  xano: XanoAssumption,
  index: number
): Assumption {
  return {
    id: xano.id,
    number: index + 1,
    title: xano.assumption || "",
    color: ASSUMPTION_COLORS[index % ASSUMPTION_COLORS.length],
  };
}

// --- Assumptions: Front-end -> Xano (POST create) ---

export function frontendAssumptionToXanoCreate(
  title: string,
  interventionId: number
): Record<string, unknown> {
  return {
    intervention_id: interventionId,
    assumption: title,
  };
}

// --- Assumptions: Front-end -> Xano (PATCH update) ---

export function frontendAssumptionToXanoPatch(
  title: string
): Record<string, unknown> {
  return { assumption: title };
}

// --- Research Questions: Xano -> Front-end ---

export function xanoQuestionToFrontend(
  xano: XanoResearchQuestion,
  index: number
): ResearchQuestion {
  return {
    id: xano.id,
    number: index + 1,
    text: xano.question || "",
  };
}

// --- Research Questions: Front-end -> Xano (POST create) ---

export function frontendQuestionToXanoCreate(
  text: string,
  interventionId: number
): Record<string, unknown> {
  return {
    intervention_id: interventionId,
    question: text,
  };
}

// --- Research Questions: Front-end -> Xano (PATCH update) ---

export function frontendQuestionToXanoPatch(
  text: string
): Record<string, unknown> {
  return { question: text };
}

// --- Files: Xano -> Front-end ---

function formatFileSize(bytes: number): string {
  if (bytes < 1024) return bytes + " B";
  if (bytes < 1024 * 1024) return (bytes / 1024).toFixed(1) + " KB";
  return (bytes / (1024 * 1024)).toFixed(1) + " MB";
}

export function xanoFileToFrontend(
  xano: XanoResearchFile
): UploadedFile {
  return {
    id: xano.id,
    name: xano.name || "Unknown file",
    size: formatFileSize(xano.size || 0),
  };
}
