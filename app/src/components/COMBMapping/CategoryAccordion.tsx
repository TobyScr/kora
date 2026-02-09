import type { COMBCategory } from "./types";
import { BarrierTable } from "./BarrierTable";

type CategoryAccordionProps = {
  category: COMBCategory;
  isLoading?: boolean;
  onToggle?: () => void;
};

const ChevronDown = () => (
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

const ChevronRight = () => (
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

const badgeColorMap: Record<string, string> = {
  teal: "bg-[#0d4f4f] text-white",
  orange: "bg-[#e67e22] text-white",
  purple: "bg-[#7c3aed] text-white",
};

const SkeletonRow = () => (
  <div className="flex items-center gap-3 px-3 py-3 animate-pulse">
    <div className="w-[30px] shrink-0">
      <div className="h-4 w-4 bg-stroke-soft rounded" />
    </div>
    <div className="w-[200px] shrink-0">
      <div className="h-4 w-32 bg-stroke-soft rounded" />
    </div>
    <div className="flex-1">
      <div className="h-4 w-full bg-stroke-soft rounded" />
    </div>
    <div className="w-[60px] shrink-0 flex justify-center">
      <div className="h-5 w-10 bg-stroke-soft rounded-full" />
    </div>
    <div className="w-[60px] shrink-0 flex justify-center">
      <div className="h-4 w-4 bg-stroke-soft rounded" />
    </div>
  </div>
);

export function CategoryAccordion({
  category,
  isLoading = false,
  onToggle,
}: CategoryAccordionProps) {
  const colorClass = badgeColorMap[category.badgeColor] ?? "bg-gray-500 text-white";

  return (
    <div className="border border-stroke-default rounded-[var(--radius-lg)] bg-background-surface overflow-hidden">
      {/* Header */}
      <button
        onClick={onToggle}
        className="flex items-center gap-3 w-full px-4 py-3 cursor-pointer hover:bg-stroke-soft/30 transition-colors"
      >
        {/* Badge */}
        <span
          className={`flex items-center justify-center w-6 h-6 rounded-md text-xs font-bold ${colorClass}`}
        >
          {category.badge}
        </span>

        {/* Label and subtitle */}
        <span className="flex-1 text-left">
          <span className="font-medium text-sm text-text-primary">
            {category.label}
          </span>
          <span className="text-sm text-text-tertiary ml-1">
            ({category.subtitle})
          </span>
        </span>

        {/* Chevron */}
        <span className="text-text-secondary">
          {category.isExpanded ? <ChevronDown /> : <ChevronRight />}
        </span>
      </button>

      {/* Content */}
      {category.isExpanded && (
        <div className="border-t border-stroke-default">
          {isLoading ? (
            <div>
              <SkeletonRow />
              <SkeletonRow />
              <SkeletonRow />
            </div>
          ) : (
            <BarrierTable barriers={category.barriers} />
          )}
        </div>
      )}
    </div>
  );
}
