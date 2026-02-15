// Xano ASSUMPTION table shape (table 341)
export type XanoAssumption = {
  id: string; // UUID
  created_at: number;
  intervention_id: number;
  assumption: string;
};

// Xano RESEARCH_QUESTION table shape (table 342)
export type XanoResearchQuestion = {
  id: string; // UUID
  created_at: number;
  intervention_id: number;
  question: string;
};

// Xano findings response shape (from GET .../findings)
export type XanoFindingsResponse = {
  findings: XanoFinding[];
  file: XanoResearchFile[];
};

export type XanoFinding = {
  id: string;
  created_at: number;
  intervention_id: number;
  subsection: string;
  content: string;
};

export type XanoResearchFile = {
  id: string;
  created_at: number;
  intervention_id: number;
  subsection: string;
  name: string;
  url: string;
  size: number;
};
