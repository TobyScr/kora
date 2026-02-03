export type ResearchFile = {
  id: string;
  name: string;
  size: string;
  type: "pdf" | "doc" | "docx";
};

export type ResearchLink = {
  id: string;
  url: string;
};

export type Insight = {
  id: string;
  number: number;
  text: string;
  isExpanded: boolean;
};

export type ResearchTab = "existing" | "deepresearch" | "insights";

export type InsightsState = "empty" | "ready" | "generating" | "generated";
