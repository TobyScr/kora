"use client";

import { useState, type ReactNode } from "react";

type ResearchAccordionProps = {
  icon: ReactNode;
  number?: number;
  title: string;
  description: string;
  badge?: string;
  defaultExpanded?: boolean;
  children: ReactNode;
};

const ChevronIcon = ({ isExpanded }: { isExpanded: boolean }) => (
  <svg
    width="16"
    height="16"
    viewBox="0 0 16 16"
    fill="none"
    className={`transition-transform ${isExpanded ? "" : "-rotate-90"}`}
  >
    <path
      d="M4 6l4 4 4-4"
      stroke="currentColor"
      strokeWidth="1.5"
      strokeLinecap="round"
      strokeLinejoin="round"
    />
  </svg>
);

export function ResearchAccordion({
  icon,
  number,
  title,
  description,
  badge,
  defaultExpanded = false,
  children,
}: ResearchAccordionProps) {
  const [isExpanded, setIsExpanded] = useState(defaultExpanded);

  return (
    <div className="border border-stroke-default rounded-xl bg-background-surface-0 overflow-hidden">
      <button
        onClick={() => setIsExpanded(!isExpanded)}
        className="flex items-center gap-3 w-full px-4 py-3 cursor-pointer hover:bg-stroke-soft/30 transition-colors"
      >
        {/* Icon with background */}
        <span className="flex items-center justify-center w-8 h-8 rounded-lg bg-[#f0f4f8] text-[#64748b] shrink-0">
          {number !== undefined ? (
            <span className="text-sm font-semibold text-[#1e3a5f]">{number}</span>
          ) : (
            icon
          )}
        </span>

        {/* Title and description */}
        <div className="flex-1 text-left">
          <span className="font-semibold text-sm text-text-primary">{title}</span>
          <span className="text-sm text-text-tertiary ml-2">{description}</span>
          {badge && (
            <span className="text-xs text-text-tertiary ml-1">({badge})</span>
          )}
        </div>

        {/* Chevron */}
        <span className="text-text-secondary">
          <ChevronIcon isExpanded={isExpanded} />
        </span>
      </button>

      {isExpanded && <div className="px-4 pb-4">{children}</div>}
    </div>
  );
}
