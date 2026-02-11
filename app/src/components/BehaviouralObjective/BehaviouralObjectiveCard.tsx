"use client";

import { useState, useRef, useEffect } from "react";
import type { Objective, ObjectiveColor } from "./types";

type BehaviouralObjectiveCardProps = {
  objective: Objective;
  isSelected: boolean;
  onSelect: (id: string) => void;
  isConfirmed?: boolean;
  onEdit: () => void;
  onDelete: () => void;
};

const KebabIcon = () => (
  <svg width="16" height="16" viewBox="0 0 16 16" fill="none">
    <circle cx="8" cy="3" r="1.5" fill="currentColor" />
    <circle cx="8" cy="8" r="1.5" fill="currentColor" />
    <circle cx="8" cy="13" r="1.5" fill="currentColor" />
  </svg>
);

const EditIcon = () => (
  <svg width="14" height="14" viewBox="0 0 16 16" fill="none">
    <path
      d="M11.5 1.5L14.5 4.5M1 15L1.5 11.5L12 1L15 4L4.5 14.5L1 15Z"
      stroke="currentColor"
      strokeWidth="1.5"
      strokeLinecap="round"
      strokeLinejoin="round"
    />
  </svg>
);

const TrashIcon = () => (
  <svg width="14" height="14" viewBox="0 0 16 16" fill="none">
    <path
      d="M3 4H13M6 4V3C6 2.44772 6.44772 2 7 2H9C9.55228 2 10 2.44772 10 3V4M12 4V13C12 13.5523 11.5523 14 11 14H5C4.44772 14 4 13.5523 4 13V4H12Z"
      stroke="currentColor"
      strokeWidth="1.5"
      strokeLinecap="round"
      strokeLinejoin="round"
    />
    <path
      d="M6.66667 7V11M9.33333 7V11"
      stroke="currentColor"
      strokeWidth="1.5"
      strokeLinecap="round"
      strokeLinejoin="round"
    />
  </svg>
);

const colorConfig: Record<ObjectiveColor, { bg: string }> = {
  teal: { bg: "bg-[#0d9488]" },
  cyan: { bg: "bg-[#0891b2]" },
  blue: { bg: "bg-[#0284c7]" },
  indigo: { bg: "bg-[#4f46e5]" },
  violet: { bg: "bg-[#7c3aed]" },
  amber: { bg: "bg-[#d97706]" },
  rose: { bg: "bg-[#e11d48]" },
  emerald: { bg: "bg-[#059669]" },
};

export function BehaviouralObjectiveCard({
  objective,
  isSelected,
  onSelect,
  isConfirmed = false,
  onEdit,
  onDelete,
}: BehaviouralObjectiveCardProps) {
  const badgeColor = colorConfig[objective.color];
  const [isMenuOpen, setIsMenuOpen] = useState(false);
  const menuRef = useRef<HTMLDivElement>(null);

  useEffect(() => {
    const handleClickOutside = (event: MouseEvent) => {
      if (menuRef.current && !menuRef.current.contains(event.target as Node)) {
        setIsMenuOpen(false);
      }
    };

    if (isMenuOpen) {
      document.addEventListener("mousedown", handleClickOutside);
    }

    return () => {
      document.removeEventListener("mousedown", handleClickOutside);
    };
  }, [isMenuOpen]);

  return (
    <div
      className={`bg-background-surface border rounded-[var(--radius-lg)] p-4 flex flex-col gap-3 transition-colors ${
        isSelected
          ? "border-button-solid ring-1 ring-button-solid/20"
          : "border-stroke-default"
      }`}
    >
      {/* Top row: badge + title + kebab */}
      <div className="flex items-start gap-3">
        {/* Number badge */}
        <span
          className={`flex items-center justify-center w-6 h-6 rounded-md text-xs font-semibold text-white shrink-0 ${badgeColor.bg}`}
        >
          {objective.number}
        </span>

        {/* Objective text */}
        <span className="flex-1 text-sm font-medium text-text-primary leading-snug pt-0.5">
          {objective.title}
        </span>

        {/* Kebab menu - hidden when confirmed */}
        {!isConfirmed && (
          <div className="relative" ref={menuRef}>
            <button
              className="text-text-tertiary hover:text-text-secondary transition-colors p-1 shrink-0 cursor-pointer"
              aria-label="Objective actions"
              onClick={() => setIsMenuOpen(!isMenuOpen)}
            >
              <KebabIcon />
            </button>

            {isMenuOpen && (
              <div className="absolute right-0 top-full mt-1 w-48 bg-white border border-stroke-default rounded-lg shadow-lg z-10 overflow-hidden">
                <button
                  onClick={() => {
                    onEdit();
                    setIsMenuOpen(false);
                  }}
                  className="flex items-center gap-2 w-full px-3 py-2.5 text-sm font-medium text-text-primary hover:bg-gray-50 transition-colors text-left"
                >
                  <EditIcon />
                  Edit Objective
                </button>
                <button
                  onClick={() => {
                    onDelete();
                    setIsMenuOpen(false);
                  }}
                  className="flex items-center gap-2 w-full px-3 py-2.5 text-sm font-medium text-red-600 hover:bg-gray-50 transition-colors text-left"
                >
                  <TrashIcon />
                  Delete Objective
                </button>
              </div>
            )}
          </div>
        )}
      </div>

      {/* Select radio */}
      {isConfirmed ? (
        isSelected ? (
          <div className="flex items-center gap-2 ml-9">
            <span className="flex items-center gap-2" aria-label="Selected objective">
              <span className="flex items-center justify-center w-4 h-4 rounded-full border-2 border-button-solid">
                <span className="w-2 h-2 rounded-full bg-button-solid" />
              </span>
              <span className="text-xs font-medium text-text-primary">
                Selected
              </span>
            </span>
          </div>
        ) : null
      ) : (
        <div className="flex items-center gap-2 ml-9">
          <button
            onClick={() => onSelect(objective.id)}
            className="flex items-center gap-2 cursor-pointer group"
            role="radio"
            aria-checked={isSelected}
            aria-label={`Select "${objective.title}"`}
          >
            <span
              className={`flex items-center justify-center w-4 h-4 rounded-full border-2 transition-colors ${
                isSelected
                  ? "border-button-solid"
                  : "border-text-tertiary group-hover:border-text-secondary"
              }`}
            >
              {isSelected && (
                <span className="w-2 h-2 rounded-full bg-button-solid" />
              )}
            </span>
            <span
              className={`text-xs font-medium ${
                isSelected ? "text-text-primary" : "text-text-secondary"
              }`}
            >
              Select
            </span>
          </button>
        </div>
      )}
    </div>
  );
}
