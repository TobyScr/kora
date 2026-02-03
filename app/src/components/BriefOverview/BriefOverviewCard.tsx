"use client";

import { type ReactNode } from "react";

export type CardType =
  | "clientName"
  | "location"
  | "budget"
  | "timeline"
  | "deliverables"
  | "problemDefinition"
  | "initialObjective"
  | "taProfile"
  | "dos"
  | "donts";

export type CardState = "loading" | "empty" | "filled";

type BriefOverviewCardProps = {
  type: CardType;
  state: CardState;
  content?: ReactNode;
  className?: string;
  onEdit?: () => void;
};

const cardConfig: Record<
  CardType,
  { title: string; optional: boolean; icon: ReactNode }
> = {
  clientName: {
    title: "Client Name",
    optional: false,
    icon: (
      <svg width="16" height="16" viewBox="0 0 16 16" fill="none">
        <path
          d="M3 4h10M6 4V2M6 4v10M10 4v4"
          stroke="currentColor"
          strokeWidth="1.5"
          strokeLinecap="round"
          strokeLinejoin="round"
        />
      </svg>
    ),
  },
  location: {
    title: "Location",
    optional: false,
    icon: (
      <svg width="16" height="16" viewBox="0 0 16 16" fill="none">
        <path
          d="M8 8.5a2 2 0 100-4 2 2 0 000 4z"
          stroke="currentColor"
          strokeWidth="1.5"
        />
        <path
          d="M8 14s5-3.5 5-7.5a5 5 0 10-10 0C3 10.5 8 14 8 14z"
          stroke="currentColor"
          strokeWidth="1.5"
          strokeLinecap="round"
          strokeLinejoin="round"
        />
      </svg>
    ),
  },
  budget: {
    title: "Budget",
    optional: false,
    icon: (
      <svg width="16" height="16" viewBox="0 0 16 16" fill="none">
        <circle cx="8" cy="8" r="6" stroke="currentColor" strokeWidth="1.5" />
        <path
          d="M8 4.5v7M10 6.5c0-1.1-.9-2-2-2s-2 .9-2 2 .9 2 2 2 2 .9 2 2-.9 2-2 2-2-.9-2-2"
          stroke="currentColor"
          strokeWidth="1.5"
          strokeLinecap="round"
        />
      </svg>
    ),
  },
  timeline: {
    title: "Timeline",
    optional: true,
    icon: (
      <svg width="16" height="16" viewBox="0 0 16 16" fill="none">
        <rect
          x="2"
          y="3"
          width="12"
          height="11"
          rx="1.5"
          stroke="currentColor"
          strokeWidth="1.5"
        />
        <path
          d="M2 6.5h12M5 2v2M11 2v2"
          stroke="currentColor"
          strokeWidth="1.5"
          strokeLinecap="round"
        />
      </svg>
    ),
  },
  deliverables: {
    title: "Deliverables",
    optional: true,
    icon: (
      <svg width="16" height="16" viewBox="0 0 16 16" fill="none">
        <path
          d="M14 5v8.5a1.5 1.5 0 01-1.5 1.5h-9A1.5 1.5 0 012 13.5V5"
          stroke="currentColor"
          strokeWidth="1.5"
        />
        <path
          d="M1 3.5A1.5 1.5 0 012.5 2h11A1.5 1.5 0 0115 3.5V5H1V3.5z"
          stroke="currentColor"
          strokeWidth="1.5"
        />
      </svg>
    ),
  },
  problemDefinition: {
    title: "Problem Definition",
    optional: false,
    icon: (
      <svg width="16" height="16" viewBox="0 0 16 16" fill="none">
        <path
          d="M3 12l2-8h6l2 8H3z"
          stroke="currentColor"
          strokeWidth="1.5"
          strokeLinejoin="round"
        />
        <path d="M8 4V2" stroke="currentColor" strokeWidth="1.5" strokeLinecap="round" />
      </svg>
    ),
  },
  initialObjective: {
    title: "Initial Objective",
    optional: false,
    icon: (
      <svg width="16" height="16" viewBox="0 0 16 16" fill="none">
        <circle cx="8" cy="8" r="6" stroke="currentColor" strokeWidth="1.5" />
        <circle cx="8" cy="8" r="3" stroke="currentColor" strokeWidth="1.5" />
        <circle cx="8" cy="8" r="1" fill="currentColor" />
      </svg>
    ),
  },
  taProfile: {
    title: "TA Profile",
    optional: false,
    icon: (
      <svg width="16" height="16" viewBox="0 0 16 16" fill="none">
        <circle cx="8" cy="5" r="3" stroke="currentColor" strokeWidth="1.5" />
        <path
          d="M3 14c0-2.8 2.2-5 5-5s5 2.2 5 5"
          stroke="currentColor"
          strokeWidth="1.5"
          strokeLinecap="round"
        />
      </svg>
    ),
  },
  dos: {
    title: "Do's",
    optional: true,
    icon: (
      <svg width="16" height="16" viewBox="0 0 16 16" fill="none">
        <circle cx="8" cy="8" r="6" stroke="currentColor" strokeWidth="1.5" />
        <path
          d="M5.5 8l2 2 3-4"
          stroke="currentColor"
          strokeWidth="1.5"
          strokeLinecap="round"
          strokeLinejoin="round"
        />
      </svg>
    ),
  },
  donts: {
    title: "Don'ts",
    optional: true,
    icon: (
      <svg width="16" height="16" viewBox="0 0 16 16" fill="none">
        <circle cx="8" cy="8" r="6" stroke="currentColor" strokeWidth="1.5" />
        <path
          d="M5.5 5.5l5 5M10.5 5.5l-5 5"
          stroke="currentColor"
          strokeWidth="1.5"
          strokeLinecap="round"
        />
      </svg>
    ),
  },
};

const EditIcon = () => (
  <svg width="16" height="16" viewBox="0 0 16 16" fill="none" className="text-text-tertiary">
    <path
      d="M11.5 2.5l2 2-8 8H3.5v-2l8-8z"
      stroke="currentColor"
      strokeWidth="1.5"
      strokeLinejoin="round"
    />
    <path d="M9.5 4.5l2 2" stroke="currentColor" strokeWidth="1.5" />
  </svg>
);

export function BriefOverviewCard({
  type,
  state,
  content,
  className = "",
  onEdit,
}: BriefOverviewCardProps) {
  const config = cardConfig[type];

  return (
    <div
      className={`bg-background-surface border border-stroke-default rounded-[var(--radius-lg)] p-4 flex flex-col gap-3 ${className}`}
    >
      {/* Header */}
      <div className="flex items-center justify-between">
        <div className="flex items-center gap-2 text-text-secondary">
          {config.icon}
          <span className="text-sm font-medium text-text-primary">
            {config.title}
          </span>
          {config.optional && (
            <span className="text-xs text-text-tertiary">(Optional)</span>
          )}
        </div>
        {state !== "loading" && (
          <button
            onClick={onEdit}
            className="p-1 hover:bg-gray-100 rounded transition-colors cursor-pointer"
            aria-label={`Edit ${config.title}`}
          >
            <EditIcon />
          </button>
        )}
      </div>

      {/* Content */}
      <div className="min-h-[40px]">
        {state === "loading" && (
          <div className="h-10 bg-background-page rounded animate-pulse" />
        )}
        {state === "empty" && (
          <p className="text-sm text-text-tertiary">No information</p>
        )}
        {state === "filled" && (
          <div className="text-sm text-text-primary">{content}</div>
        )}
      </div>
    </div>
  );
}
