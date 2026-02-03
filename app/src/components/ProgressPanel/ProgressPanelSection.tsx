"use client";

import { type ReactNode } from "react";
import { StatusPill, type StatusType } from "./StatusPill";

type ProgressPanelSectionProps = {
  title: string;
  status: StatusType;
  isExpanded: boolean;
  content?: ReactNode;
  timestamp?: string;
  onToggle?: () => void;
};

const ChevronRightIcon = () => (
  <svg width="16" height="16" viewBox="0 0 16 16" fill="none">
    <path
      d="M6 4l4 4-4 4"
      stroke="currentColor"
      strokeWidth="1.5"
      strokeLinecap="round"
      strokeLinejoin="round"
    />
  </svg>
);

const ChevronDownIcon = () => (
  <svg width="16" height="16" viewBox="0 0 16 16" fill="none">
    <path
      d="M4 6l4 4 4-4"
      stroke="currentColor"
      strokeWidth="1.5"
      strokeLinecap="round"
      strokeLinejoin="round"
    />
  </svg>
);

export function ProgressPanelSection({
  title,
  status,
  isExpanded,
  content,
  timestamp = "14:47",
  onToggle,
}: ProgressPanelSectionProps) {
  return (
    <div className="border-t border-stroke-default">
      {/* Header - always visible, clickable to toggle */}
      <div className="flex items-center justify-between p-4 cursor-pointer" onClick={onToggle}>
        <div className="flex items-center gap-2">
          <span className="text-sm font-medium text-text-primary tracking-[0.15px]">
            {title}
          </span>
          <StatusPill status={status} />
        </div>
        <div
          className="flex items-center justify-center w-10 h-10 text-text-secondary"
          aria-label={isExpanded ? "Collapse section" : "Expand section"}
        >
          {isExpanded ? <ChevronDownIcon /> : <ChevronRightIcon />}
        </div>
      </div>

      {/* Content - only visible when expanded */}
      {isExpanded && content && (
        <div className="px-4 pb-4">
          <div className="text-sm text-text-primary leading-[1.5]">
            {content}
          </div>
          <p className="text-xs text-text-secondary mt-4">{timestamp}</p>
        </div>
      )}
    </div>
  );
}
