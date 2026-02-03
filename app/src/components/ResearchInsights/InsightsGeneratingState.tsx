"use client";

const SpinnerIcon = () => (
  <svg
    width="24"
    height="24"
    viewBox="0 0 24 24"
    fill="none"
    className="animate-spin"
  >
    <circle
      cx="12"
      cy="12"
      r="10"
      stroke="#e2e8f0"
      strokeWidth="3"
    />
    <path
      d="M12 2a10 10 0 019.75 7.75"
      stroke="#1e3a5f"
      strokeWidth="3"
      strokeLinecap="round"
    />
  </svg>
);

export function InsightsGeneratingState() {
  return (
    <div className="flex flex-col items-center justify-center py-16 px-4">
      <SpinnerIcon />
      <h3 className="mt-6 text-lg font-semibold text-text-primary">
        Generating insights...
      </h3>
      <p className="mt-2 text-sm text-text-secondary text-center max-w-md">
        Analyzing your research to extract key insights.
      </p>
    </div>
  );
}
