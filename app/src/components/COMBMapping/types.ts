export type Barrier = {
  id: string;
  name: string;
  description: string;
  isRecommended: boolean;
  isSelected: boolean;
};

export type COMBCategoryId = "capability" | "opportunity" | "motivation";

export type COMBCategory = {
  id: COMBCategoryId;
  label: string;
  badge: string;
  badgeColor: string;
  subtitle: string;
  barriers: Barrier[];
  isExpanded: boolean;
};

export type COMBState = "loading" | "filled";
