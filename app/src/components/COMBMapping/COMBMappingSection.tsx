"use client";

import { useState } from "react";
import { CategoryAccordion } from "./CategoryAccordion";
import { Button } from "../Button/Button";
import type { COMBState, COMBCategory, COMBCategoryId } from "./types";

type COMBMappingSectionProps = {
  state: COMBState;
  onStateChange?: (state: COMBState) => void;
  categories: COMBCategory[];
  onToggleCategory?: (categoryId: COMBCategoryId) => void;
  showDevToggle?: boolean;
  isExpanded?: boolean;
  onToggleExpand?: () => void;
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

type COMBTab = "comb-mapping" | "personas";

export function COMBMappingSection({
  state,
  onStateChange,
  categories,
  onToggleCategory,
  showDevToggle = false,
  isExpanded: controlledExpanded,
  onToggleExpand,
}: COMBMappingSectionProps) {
  const [localExpanded, setLocalExpanded] = useState(true);
  const [activeTab, setActiveTab] = useState<COMBTab>("comb-mapping");

  const isExpanded = controlledExpanded ?? localExpanded;

  const handleToggle = () => {
    if (onToggleExpand) {
      onToggleExpand();
    } else {
      setLocalExpanded(!localExpanded);
    }
  };

  const isLoading = state === "loading";

  return (
    <div className="w-full max-w-[800px] mx-auto bg-background-surface-0 rounded-[var(--radius-xl)] p-6">
      {/* Header */}
      <div className="flex items-center justify-between mb-4">
        <button
          onClick={handleToggle}
          className="flex items-center gap-2 text-text-primary cursor-pointer"
        >
          <ChevronIcon isExpanded={isExpanded} />
          <span className="text-lg font-medium">COM-B &amp; Personas</span>
        </button>

        <div className="flex items-center gap-3">
          {/* Dev Toggle */}
          {showDevToggle && (
            <div className="flex items-center gap-1 bg-yellow-100 rounded-full px-2 py-1 text-xs">
              <span className="text-yellow-800 font-medium">State:</span>
              <select
                value={state}
                onChange={(e) =>
                  onStateChange?.(e.target.value as COMBState)
                }
                className="bg-transparent text-yellow-800 font-medium outline-none cursor-pointer"
              >
                <option value="loading">Loading</option>
                <option value="filled">Filled</option>
              </select>
            </div>
          )}
        </div>
      </div>

      {isExpanded && (
        <>
          {/* Tab bar + Confirm button row */}
          <div className="flex items-center justify-between mb-4">
            {/* Tabs */}
            <div className="flex items-center gap-0 border-b border-stroke-default">
              <button
                onClick={() => setActiveTab("comb-mapping")}
                className={`px-4 py-2 text-sm font-medium leading-[1.6] tracking-[var(--letter-spacing-wide-s)] cursor-pointer transition-colors border-b-2 ${
                  activeTab === "comb-mapping"
                    ? "text-text-primary border-button-solid"
                    : "text-text-tertiary border-transparent hover:text-text-secondary"
                }`}
              >
                COM-B Mapping
              </button>
              <button
                disabled
                className="px-4 py-2 text-sm font-medium leading-[1.6] tracking-[var(--letter-spacing-wide-s)] border-b-2 border-transparent text-text-tertiary opacity-50 cursor-not-allowed"
              >
                Personas
              </button>
            </div>

            {/* Confirm button */}
            <Button
              variant="solid"
              disabled
              className="opacity-50 cursor-not-allowed pointer-events-none"
            >
              Confirm COM-B Mapping
            </Button>
          </div>

          {/* Category Accordions */}
          <div className="space-y-3">
            {categories.map((category) => (
              <CategoryAccordion
                key={category.id}
                category={category}
                isLoading={isLoading}
                onToggle={() => onToggleCategory?.(category.id)}
              />
            ))}
          </div>
        </>
      )}
    </div>
  );
}
