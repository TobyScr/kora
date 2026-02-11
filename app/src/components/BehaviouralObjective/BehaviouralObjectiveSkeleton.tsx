"use client";

const SKELETON_COUNT = 3;

const skeletonBadgeColors = [
  "bg-[#0d9488]", // teal
  "bg-[#0891b2]", // cyan
  "bg-[#0284c7]", // blue
];

export function BehaviouralObjectiveSkeleton() {
  return (
    <div className="grid grid-cols-1 lg:grid-cols-2 gap-4">
      {Array.from({ length: SKELETON_COUNT }, (_, i) => (
        <div
          key={i}
          className="bg-background-surface border border-stroke-default rounded-[var(--radius-lg)] p-4 flex items-start gap-3"
        >
          <span
            className={`flex items-center justify-center w-6 h-6 rounded-md text-xs font-semibold text-white shrink-0 ${skeletonBadgeColors[i]}`}
          >
            {i + 1}
          </span>
          <div className="flex-1 space-y-2 pt-0.5">
            <div className="h-4 bg-stroke-soft rounded animate-pulse w-3/4" />
            <div className="h-3 bg-stroke-soft rounded animate-pulse w-1/2" />
          </div>
        </div>
      ))}
    </div>
  );
}
