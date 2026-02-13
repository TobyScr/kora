// Xano RESEARCH_INSIGHTS table shape (table 337)
export type XanoResearchInsight = {
  id: string; // UUID
  created_at: number;
  intervention_id: number;
  insight: string | null;
  description: string | null;
  source: string[] | null; // e.g. ["Existing research", "DeepResearch"]
};
