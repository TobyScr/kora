"use client";

import { useState, type ReactNode } from "react";

type AccordionSectionProps = {
  title: string;
  isComplete?: boolean;
  defaultExpanded?: boolean;
  onExportPdf?: () => void;
  children?: ReactNode;
  className?: string;
};

const ChevronDown = () => (
  <svg width="16" height="16" viewBox="0 0 16 16" fill="none">
    <path d="M4 6l4 4 4-4" stroke="currentColor" strokeWidth="1.5" strokeLinecap="round" strokeLinejoin="round" />
  </svg>
);

const ChevronRight = () => (
  <svg width="16" height="16" viewBox="0 0 16 16" fill="none">
    <path d="M6 4l4 4-4 4" stroke="currentColor" strokeWidth="1.5" strokeLinecap="round" strokeLinejoin="round" />
  </svg>
);

const CheckCircle = () => (
  <svg width="16" height="16" viewBox="0 0 16 16" fill="none">
    <circle cx="8" cy="8" r="7" fill="#22c55e" />
    <path d="M5 8l2 2 4-4" stroke="white" strokeWidth="1.5" strokeLinecap="round" strokeLinejoin="round" />
  </svg>
);

const ExportIcon = () => (
  <svg width="16" height="16" viewBox="0 0 16 16" fill="none">
    <path d="M4 12h8M8 3v6m0-6L5 6m3-3l3 3" stroke="currentColor" strokeWidth="1.5" strokeLinecap="round" strokeLinejoin="round" />
  </svg>
);

export function AccordionSection({
  title,
  isComplete = false,
  defaultExpanded = false,
  onExportPdf,
  children,
  className,
}: AccordionSectionProps) {
  const [isExpanded, setIsExpanded] = useState(defaultExpanded);

  return (
    <div className={`border border-stroke-default rounded-[var(--radius-lg)] bg-background-surface overflow-hidden ${className ?? ""}`}>
      <button
        onClick={() => setIsExpanded(!isExpanded)}
        className="flex items-center gap-3 w-full px-4 py-3 cursor-pointer hover:bg-stroke-soft/30 transition-colors"
      >
        <span className="text-text-secondary">
          {isExpanded ? <ChevronDown /> : <ChevronRight />}
        </span>
        <span className="flex-1 text-left font-medium text-sm text-text-primary leading-[1.6] tracking-[var(--letter-spacing-wide-s)]">
          {title}
        </span>
        {isComplete && <CheckCircle />}
        {onExportPdf && (
          <span
            onClick={(e) => {
              e.stopPropagation();
              onExportPdf();
            }}
            className="flex items-center gap-1 text-text-secondary text-xs cursor-pointer hover:text-text-primary"
          >
            <ExportIcon />
            Export PDF
          </span>
        )}
      </button>
      {isExpanded && children && (
        <div className="px-4 pb-4">{children}</div>
      )}
    </div>
  );
}
