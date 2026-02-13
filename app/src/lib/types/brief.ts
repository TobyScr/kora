// Xano BRIEF_OUTPUT table shape (table 294)
export type XanoBriefOutput = {
  id: number;
  created_at: number;
  intervention_id: number;
  client: string;
  location: string;
  budget_currency: string;
  budget_min: number;
  budget_max: number;
  timeline_unit: string;
  timeline_min: number;
  timeline_max: number;
  problem_definition: string;
  high_level_objective: string;
  is_confirmed: boolean;
  expected_deliverables: string;
  ta_profile: string[];
  dos: string[];
  donts: string[];
};

// Front-end shape used by BriefOverviewSection
export type BriefData = {
  clientName: string;
  location: string;
  budget: { currency: string; minAmount: string; maxAmount: string };
  timeline: { unit: string; from: string; to: string };
  deliverables: string;
  problemDefinition: string;
  initialObjective: string;
  taProfile: string[];
  dos: string[];
  donts: string[];
};
