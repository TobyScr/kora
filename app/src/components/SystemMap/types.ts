export type ChallengeColor =
  | "teal"
  | "cyan"
  | "blue"
  | "indigo"
  | "violet"
  | "amber"
  | "rose"
  | "emerald";

export type Challenge = {
  id: string;
  number: number;
  title: string;
  description: string;
  color: ChallengeColor;
};

export type SystemMapState = "loading" | "loaded";
