"use client";

import { useState } from "react";
import type { Insight } from "./types";

type InsightItemProps = {
  insight: Insight;
  onToggleExpand?: (id: string) => void;
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

const KebabIcon = () => (
  <svg width="16" height="16" viewBox="0 0 16 16" fill="none">
    <circle cx="8" cy="3" r="1.5" fill="currentColor" />
    <circle cx="8" cy="8" r="1.5" fill="currentColor" />
    <circle cx="8" cy="13" r="1.5" fill="currentColor" />
  </svg>
);

export function InsightItem({ insight, onToggleExpand }: InsightItemProps) {
  const [showMenu, setShowMenu] = useState(false);

  // Determine if text is long enough to truncate (e.g., > 60 chars)
  const isLongText = insight.text.length > 80;
  const displayText =
    !insight.isExpanded && isLongText
      ? insight.text.slice(0, 80) + "..."
      : insight.text;

  return (
    <div className="flex items-start gap-3 py-3 border-b border-stroke-default last:border-b-0">
      {/* Expand/collapse button (only if long text) */}
      <button
        onClick={() => onToggleExpand?.(insight.id)}
        className={`text-text-tertiary hover:text-text-secondary transition-colors ${
          isLongText ? "" : "invisible"
        }`}
      >
        <ChevronIcon isExpanded={insight.isExpanded} />
      </button>

      {/* Number */}
      <span className="text-sm font-medium text-[#0ea5e9] shrink-0">
        {insight.number}.
      </span>

      {/* Text */}
      <p className="flex-1 text-sm text-[#0ea5e9]">{displayText}</p>

      {/* Kebab menu */}
      <div className="relative">
        <button
          onClick={() => setShowMenu(!showMenu)}
          className="text-text-tertiary hover:text-text-secondary transition-colors p-1"
        >
          <KebabIcon />
        </button>
        {showMenu && (
          <>
            <div
              className="fixed inset-0 z-10"
              onClick={() => setShowMenu(false)}
            />
            <div className="absolute right-0 top-full mt-1 bg-white border border-stroke-default rounded-lg shadow-lg py-1 z-20 min-w-[120px]">
              <button className="w-full text-left px-3 py-2 text-sm text-text-primary hover:bg-stroke-soft/30">
                Edit
              </button>
              <button className="w-full text-left px-3 py-2 text-sm text-red-600 hover:bg-stroke-soft/30">
                Remove
              </button>
            </div>
          </>
        )}
      </div>
    </div>
  );
}
