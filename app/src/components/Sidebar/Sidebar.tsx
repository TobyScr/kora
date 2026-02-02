"use client";

import type { ReactNode } from "react";
import { CircularProgress } from "../CircularProgress/CircularProgress";
import { IconButton } from "../IconButton/IconButton";

type SidebarSection = {
  id: string;
  label: string;
  icon: ReactNode;
  isLocked?: boolean;
  isExpanded?: boolean;
  subsections?: { id: string; label: string; isActive?: boolean; isLocked?: boolean }[];
};

type SidebarProps = {
  projectName: string;
  projectSubtitle?: string;
  progress: 0 | 25 | 50 | 75 | 100;
  sections: SidebarSection[];
  onBack?: () => void;
  onToggleSidebar?: () => void;
  children?: ReactNode;
  className?: string;
};

const ArrowLeftIcon = () => (
  <svg width="16" height="16" viewBox="0 0 16 16" fill="none">
    <path d="M13 8H3m0 0l4 4M3 8l4-4" stroke="currentColor" strokeWidth="1.5" strokeLinecap="round" strokeLinejoin="round" />
  </svg>
);

const SidebarIcon = () => (
  <svg width="16" height="16" viewBox="0 0 16 16" fill="none">
    <rect x="1.5" y="2" width="13" height="12" rx="2" stroke="currentColor" strokeWidth="1.5" />
    <line x1="6" y1="2" x2="6" y2="14" stroke="currentColor" strokeWidth="1.5" />
  </svg>
);

export function Sidebar({
  projectName,
  projectSubtitle,
  progress,
  sections,
  onBack,
  onToggleSidebar,
  children,
  className,
}: SidebarProps) {
  return (
    <aside
      className={`flex flex-col w-[240px] h-full bg-background-surface border-r border-stroke-default shrink-0 overflow-y-auto ${className ?? ""}`}
    >
      {/* Top bar */}
      <div className="flex items-center justify-between p-2 border-b border-stroke-soft">
        <IconButton icon={<ArrowLeftIcon />} label="Go back" onClick={onBack} />
        <IconButton icon={<SidebarIcon />} label="Toggle sidebar" onClick={onToggleSidebar} />
      </div>

      {/* Project info */}
      <div className="flex flex-col p-4 border-b border-stroke-soft">
        <div className="flex items-center gap-2">
          <span className="flex-1 font-medium text-sm text-text-primary leading-[1.6] tracking-[var(--letter-spacing-wide-s)]">
            {projectName}
          </span>
          <div className="flex items-center gap-0 border border-stroke-default rounded-[var(--radius-lg)] p-1">
            <span className="px-1.5 text-sm font-medium text-text-primary">{progress}%</span>
            <CircularProgress progress={progress} />
          </div>
        </div>
        {projectSubtitle && (
          <span className="text-sm text-text-tertiary font-medium leading-[1.6] tracking-[var(--letter-spacing-wide-s)]">
            {projectSubtitle}
          </span>
        )}
      </div>

      {/* Sections - rendered via children for flexibility */}
      <div className="flex-1 flex flex-col">
        {children}
      </div>
    </aside>
  );
}
