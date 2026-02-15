export type AssumptionColor =
  | "teal"
  | "cyan"
  | "blue"
  | "indigo"
  | "violet"
  | "amber"
  | "rose"
  | "emerald";

export type Assumption = {
  id: string;
  number: number;
  title: string;
  color: AssumptionColor;
};

export type ResearchQuestion = {
  id: string;
  number: number;
  text: string;
};

export type UploadedFile = {
  id: string;
  name: string;
  size: string;
};

export type AssumptionTestingState = "loading" | "loaded";
