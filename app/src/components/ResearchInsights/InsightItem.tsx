"use client";

import { useState } from "react";
import type { Insight, InsightColor } from "./types";

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

// Color configurations for insight highlights
const colorConfig: Record<InsightColor, { bg: string; text: string }> = {
  teal: { bg: "bg-[#0d9488]", text: "text-white" },
  cyan: { bg: "bg-[#0891b2]", text: "text-white" },
  blue: { bg: "bg-[#0284c7]", text: "text-white" },
  indigo: { bg: "bg-[#4f46e5]", text: "text-white" },
};

export function InsightItem({ insight, onToggleExpand }: InsightItemProps) {
  const [showMenu, setShowMenu] = useState(false);
  const colors = colorConfig[insight.color];

  return (
    <div className="py-3 border-b border-stroke-default last:border-b-0">
      {/* Main row */}
      <div className="flex items-center gap-3">
        {/* Expand/collapse button */}
        <button
          onClick={() => onToggleExpand?.(insight.id)}
          className="text-text-tertiary hover:text-text-secondary transition-colors cursor-pointer shrink-0"
        >
          <ChevronIcon isExpanded={insight.isExpanded} />
        </button>

        {/* Number and highlighted text */}
        <div className="flex items-center gap-2 flex-1 min-w-0">
          <span
            className={`inline-flex items-center gap-1.5 px-2 py-1 rounded text-sm font-medium ${colors.bg} ${colors.text}`}
          >
            <span>{insight.number}.</span>
            <span className="truncate">{insight.text}</span>
          </span>
        </div>

        {/* Kebab menu */}
        <div className="relative shrink-0">
          <button
            onClick={() => setShowMenu(!showMenu)}
            className="text-text-tertiary hover:text-text-secondary transition-colors p-1 cursor-pointer"
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
                <button className="w-full text-left px-3 py-2 text-sm text-text-primary hover:bg-stroke-soft/30 cursor-pointer">
                  Edit
                </button>
                <button className="w-full text-left px-3 py-2 text-sm text-red-600 hover:bg-stroke-soft/30 cursor-pointer">
                  Remove
                </button>
              </div>
            </>
          )}
        </div>
      </div>

      {/* Expanded content */}
      {insight.isExpanded && (
        <div className="mt-3 ml-9 space-y-3">
          {insight.description && (
            <p className="text-sm text-text-secondary leading-relaxed">
              {insight.description}
            </p>
          )}
          {insight.sources && insight.sources.length > 0 && (
            <div className="flex items-center gap-2">
              <span className="text-sm text-text-tertiary font-medium">
                Source(s):
              </span>
              <div className="flex gap-2">
                {insight.sources.map((source) => (
                  <span
                    key={source}
                    className="px-2 py-0.5 text-xs font-medium bg-[#f1f5f9] text-text-secondary rounded border border-stroke-default"
                  >
                    {source}
                  </span>
                ))}
              </div>
            </div>
          )}
        </div>
      )}
    </div>
  );
}
