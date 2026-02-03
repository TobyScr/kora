"use client";

type InsightsEmptyStateProps = {
  onAddResearch: () => void;
};

const BoxIllustration = () => (
  <svg width="80" height="80" viewBox="0 0 80 80" fill="none">
    <rect
      x="15"
      y="30"
      width="50"
      height="35"
      rx="3"
      stroke="#1e3a5f"
      strokeWidth="2"
    />
    <path
      d="M15 35l25-15 25 15"
      stroke="#1e3a5f"
      strokeWidth="2"
      strokeLinecap="round"
      strokeLinejoin="round"
    />
    <path
      d="M40 20v25"
      stroke="#1e3a5f"
      strokeWidth="2"
      strokeLinecap="round"
    />
    <circle cx="55" cy="25" r="8" stroke="#1e3a5f" strokeWidth="2" />
    <path
      d="M55 22v6M55 30v1"
      stroke="#1e3a5f"
      strokeWidth="2"
      strokeLinecap="round"
    />
  </svg>
);

export function InsightsEmptyState({ onAddResearch }: InsightsEmptyStateProps) {
  return (
    <div className="flex flex-col items-center justify-center py-16 px-4">
      <BoxIllustration />
      <h3 className="mt-6 text-lg font-semibold text-text-primary">
        Add some research first!
      </h3>
      <p className="mt-2 text-sm text-text-secondary text-center max-w-md">
        To uncover fresh insights, add your existing research or run a new
        ChatGPT DeepResearch using the Kora-generated prompt.
      </p>
      <button
        onClick={onAddResearch}
        className="mt-6 px-6 py-2.5 text-sm font-medium text-text-primary border border-stroke-default rounded-full hover:bg-stroke-soft/30 transition-colors"
      >
        Add research
      </button>
    </div>
  );
}
