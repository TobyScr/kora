import type { XanoSystemMapChallenge } from "@/lib/types/systemMap";
import type { Challenge, ChallengeColor } from "@/components/SystemMap/types";

// Cycle through these colors for challenge cards
const CHALLENGE_COLORS: ChallengeColor[] = [
  "teal", "cyan", "blue", "indigo", "violet", "amber", "rose", "emerald",
];

// --- Transform: Xano -> Front-end ---

export function xanoChallengeToFrontend(
  xano: XanoSystemMapChallenge,
  index: number
): Challenge {
  return {
    id: xano.id,
    number: index + 1,
    title: xano.challenge || "",
    description: xano.description || "",
    color: CHALLENGE_COLORS[index % CHALLENGE_COLORS.length],
  };
}

// --- Transform: Front-end -> Xano (for POST create) ---

export function frontendChallengeToXanoCreate(
  challenge: Partial<Pick<Challenge, "title" | "description">>,
  interventionId: number
): Record<string, unknown> {
  return {
    intervention_id: interventionId,
    challenge: challenge.title || "",
    description: challenge.description || "",
    is_selected: false,
  };
}

// --- Transform: Front-end -> Xano (for PATCH update, partial) ---

export function frontendChallengeToXanoPatch(
  fields: Partial<Pick<Challenge, "title" | "description">>
): Record<string, unknown> {
  const body: Record<string, unknown> = {};
  if (fields.title !== undefined) body.challenge = fields.title;
  if (fields.description !== undefined) body.description = fields.description;
  return body;
}
