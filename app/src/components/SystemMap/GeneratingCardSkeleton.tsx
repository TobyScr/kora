"use client";

import type { ChallengeColor } from "./types";

type GeneratingCardSkeletonProps = {
  number: number;
  color: ChallengeColor;
};

const colorConfig: Record<ChallengeColor, string> = {
  teal: "bg-[#0d9488]",
  cyan: "bg-[#0891b2]",
  blue: "bg-[#0284c7]",
  indigo: "bg-[#4f46e5]",
  violet: "bg-[#7c3aed]",
  amber: "bg-[#d97706]",
  rose: "bg-[#e11d48]",
  emerald: "bg-[#059669]",
};

export function GeneratingCardSkeleton({ number, color }: GeneratingCardSkeletonProps) {
  return (
    <div className="bg-background-surface border border-stroke-default rounded-[var(--radius-lg)] p-4 flex items-start gap-3">
      {/* Number badge */}
      <span
        className={`flex items-center justify-center w-6 h-6 rounded-md text-xs font-semibold text-white shrink-0 ${colorConfig[color]}`}
      >
        {number}
      </span>

      {/* Animated placeholder lines */}
      <div className="flex-1 space-y-2 pt-0.5">
        <div className="h-4 bg-stroke-soft rounded animate-pulse w-3/4" />
        <div className="h-3 bg-stroke-soft rounded animate-pulse w-1/2" />
      </div>
    </div>
  );
}
