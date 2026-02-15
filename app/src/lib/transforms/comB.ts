import type { XanoComBBarrier } from "@/lib/types/comB";

export type ComBBarrierFrontend = {
  id: string;
  type: "capability" | "opportunity" | "motivation";
  barrier: string;
  description: string;
  selected: boolean;
};

// --- Transform: Xano -> Front-end ---

export function xanoBarrierToFrontend(xano: XanoComBBarrier): ComBBarrierFrontend {
  return {
    id: xano.id,
    type: xano.type,
    barrier: xano.barrier || "",
    description: xano.description || "",
    selected: xano.selected || false,
  };
}

// --- Transform: Front-end -> Xano (for POST create) ---

export function frontendBarrierToXanoCreate(
  barrier: { type: string; barrier: string; description: string },
  interventionId: number
): Record<string, unknown> {
  return {
    intervention_id: interventionId,
    type: barrier.type,
    barrier: barrier.barrier,
    description: barrier.description,
    selected: false,
  };
}

// --- Transform: Front-end -> Xano (for PATCH update, partial) ---

export function frontendBarrierToXanoPatch(
  fields: Partial<Pick<ComBBarrierFrontend, "barrier" | "description">>
): Record<string, unknown> {
  const body: Record<string, unknown> = {};
  if (fields.barrier !== undefined) body.barrier = fields.barrier;
  if (fields.description !== undefined) body.description = fields.description;
  return body;
}
