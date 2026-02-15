// Xano COM_B table shape (table 347)
export type XanoComBBarrier = {
  id: string; // UUID
  created_at: number;
  intervention_id: number;
  type: "capability" | "opportunity" | "motivation";
  barrier: string;
  description: string;
  selected: boolean;
};

// GET response returns barriers grouped by type
export type XanoComBGroupedResponse = {
  capability: XanoComBBarrier[];
  opportunity: XanoComBBarrier[];
  motivation: XanoComBBarrier[];
};
