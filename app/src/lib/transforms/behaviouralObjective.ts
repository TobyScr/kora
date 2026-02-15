import type { XanoBehaviouralObjective } from "@/lib/types/behaviouralObjective";
import type { Objective, ObjectiveColor } from "@/components/BehaviouralObjective/types";

// Cycle through these colors for objective cards
const OBJECTIVE_COLORS: ObjectiveColor[] = [
  "teal", "cyan", "blue", "indigo", "violet", "amber", "rose", "emerald",
];

// --- Transform: Xano -> Front-end ---

export function xanoObjectiveToFrontend(
  xano: XanoBehaviouralObjective,
  index: number
): Objective {
  return {
    id: xano.id,
    number: index + 1,
    title: xano.objective || "",
    color: OBJECTIVE_COLORS[index % OBJECTIVE_COLORS.length],
  };
}

// --- Transform: Front-end -> Xano (for POST create) ---

export function frontendObjectiveToXanoCreate(
  objective: Partial<Pick<Objective, "title">>,
  interventionId: number
): Record<string, unknown> {
  return {
    intervention_id: interventionId,
    objective: objective.title || "",
    is_selected: false,
  };
}

// --- Transform: Front-end -> Xano (for PATCH update, partial) ---

export function frontendObjectiveToXanoPatch(
  fields: Partial<Pick<Objective, "title">>
): Record<string, unknown> {
  const body: Record<string, unknown> = {};
  if (fields.title !== undefined) body.objective = fields.title;
  return body;
}
