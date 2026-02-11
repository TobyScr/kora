export type ObjectiveColor =
  | "teal"
  | "cyan"
  | "blue"
  | "indigo"
  | "violet"
  | "amber"
  | "rose"
  | "emerald";

export type Objective = {
  id: string;
  number: number;
  title: string;
  color: ObjectiveColor;
};

export type BehaviouralObjectiveState = "loading" | "loaded";
