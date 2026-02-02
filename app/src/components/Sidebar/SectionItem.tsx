import type { ReactNode } from "react";

type SectionItemProps = {
  icon: ReactNode;
  label: string;
  isExpanded?: boolean;
  isLocked?: boolean;
  onClick?: () => void;
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

export function SectionItem({
  icon,
  label,
  isExpanded = false,
  isLocked = false,
  onClick,
  className,
}: SectionItemProps) {
  const textColor = isLocked ? "text-text-secondary" : "text-text-primary";

  return (
    <button
      onClick={onClick}
      className={`flex items-center gap-3 w-full px-2 py-2 border-b border-stroke-default cursor-pointer hover:bg-stroke-soft/50 transition-colors ${className ?? ""}`}
    >
      <span className="flex items-center justify-center size-9 shrink-0 text-text-primary">
        {icon}
      </span>
      <span className={`flex-1 text-left font-medium text-sm leading-[1.6] tracking-[var(--letter-spacing-wide-s)] ${textColor}`}>
        {label}
      </span>
      <span className="flex items-center justify-center size-9 shrink-0 text-text-secondary">
        {isExpanded ? <ChevronDown /> : <ChevronRight />}
      </span>
    </button>
  );
}
