"use client";

import { useState, useRef, useEffect } from "react";
import type { Insight, InsightColor } from "./types";

type InsightItemProps = {
  insight: Insight;
  onToggleExpand?: (id: string) => void;
  onEdit?: (insight: Insight) => void;
  onDelete?: (id: string) => void;
  isConfirmed?: boolean;
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

const EditIcon = () => (
  <svg width="14" height="14" viewBox="0 0 14 14" fill="none">
    <path
      d="M10 1.5L12.5 4M1 13L1.5 10L10.5 1L13 3.5L4 12.5L1 13Z"
      stroke="currentColor"
      strokeWidth="1.2"
      strokeLinecap="round"
      strokeLinejoin="round"
    />
  </svg>
);

const TrashIcon = () => (
  <svg width="14" height="14" viewBox="0 0 14 14" fill="none">
    <path
      d="M2.5 3.5H11.5M5 3.5V2.5C5 2.10218 5.15804 1.72064 5.43934 1.43934C5.72064 1.15804 6.10218 1 6.5 1H7.5C7.89782 1 8.27936 1.15804 8.56066 1.43934C8.84196 1.72064 9 2.10218 9 2.5V3.5M10.5 3.5V12C10.5 12.3978 10.342 12.7794 10.0607 13.0607C9.77936 13.342 9.39782 13.5 9 13.5H5C4.60218 13.5 4.22064 13.342 3.93934 13.0607C3.65804 12.7794 3.5 12.3978 3.5 12V3.5H10.5Z"
      stroke="currentColor"
      strokeWidth="1.2"
      strokeLinecap="round"
      strokeLinejoin="round"
    />
  </svg>
);

// Color configurations for insight highlights
const colorConfig: Record<InsightColor, { bg: string; text: string }> = {
  teal: { bg: "bg-[#0d9488]", text: "text-white" },
  cyan: { bg: "bg-[#0891b2]", text: "text-white" },
  blue: { bg: "bg-[#0284c7]", text: "text-white" },
  indigo: { bg: "bg-[#4f46e5]", text: "text-white" },
};

export function InsightItem({
  insight,
  onToggleExpand,
  onEdit,
  onDelete,
  isConfirmed = false,
}: InsightItemProps) {
  const [showMenu, setShowMenu] = useState(false);
  const menuRef = useRef<HTMLDivElement>(null);
  const colors = colorConfig[insight.color];

  // Close menu when clicking outside
  useEffect(() => {
    const handleClickOutside = (event: MouseEvent) => {
      if (menuRef.current && !menuRef.current.contains(event.target as Node)) {
        setShowMenu(false);
      }
    };

    if (showMenu) {
      document.addEventListener("mousedown", handleClickOutside);
    }

    return () => {
      document.removeEventListener("mousedown", handleClickOutside);
    };
  }, [showMenu]);

  const handleEditClick = () => {
    setShowMenu(false);
    onEdit?.(insight);
  };

  const handleDeleteClick = () => {
    setShowMenu(false);
    onDelete?.(insight.id);
  };

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

        {/* Kebab menu - only shown when not confirmed */}
        {!isConfirmed && (
          <div className="relative shrink-0" ref={menuRef}>
            <button
              onClick={() => setShowMenu(!showMenu)}
              className="text-text-tertiary hover:text-text-secondary transition-colors p-1 cursor-pointer"
              aria-label="Insight actions"
            >
              <KebabIcon />
            </button>
            {showMenu && (
              <div className="absolute right-0 top-full mt-1 bg-white border border-stroke-default rounded-lg shadow-lg py-1 z-20 min-w-[160px]">
                <button
                  onClick={handleEditClick}
                  className="flex items-center gap-2 w-full text-left px-3 py-2 text-sm text-text-primary hover:bg-stroke-soft/30 cursor-pointer"
                >
                  <EditIcon />
                  Edit Insight
                </button>
                <button
                  onClick={handleDeleteClick}
                  className="flex items-center gap-2 w-full text-left px-3 py-2 text-sm text-red-600 hover:bg-red-50 cursor-pointer"
                >
                  <TrashIcon />
                  Delete Insight
                </button>
              </div>
            )}
          </div>
        )}
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
