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

export type InsightSource = "Existing Research" | "DeepResearch";

export type InsightColor = "teal" | "cyan" | "blue" | "indigo";

export type Insight = {
  id: string;
  number: number;
  text: string;
  description?: string;
  sources?: InsightSource[];
  color: InsightColor;
  isExpanded: boolean;
};

export type ResearchTab = "existing" | "deepresearch" | "insights";

export type InsightsState = "empty" | "ready" | "generating" | "generated";
