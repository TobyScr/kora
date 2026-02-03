"use client";

type InsightsReadyStateProps = {
  onGenerateInsights: () => void;
};

const QuestionIllustration = () => (
  <svg width="80" height="80" viewBox="0 0 80 80" fill="none">
    <rect
      x="15"
      y="20"
      width="35"
      height="45"
      rx="2"
      stroke="#1e3a5f"
      strokeWidth="2"
    />
    <line
      x1="22"
      y1="30"
      x2="43"
      y2="30"
      stroke="#1e3a5f"
      strokeWidth="2"
      strokeLinecap="round"
    />
    <line
      x1="22"
      y1="38"
      x2="43"
      y2="38"
      stroke="#1e3a5f"
      strokeWidth="2"
      strokeLinecap="round"
    />
    <line
      x1="22"
      y1="46"
      x2="35"
      y2="46"
      stroke="#1e3a5f"
      strokeWidth="2"
      strokeLinecap="round"
    />
    <circle cx="55" cy="35" r="12" stroke="#1e3a5f" strokeWidth="2" />
    <text
      x="55"
      y="40"
      textAnchor="middle"
      fontSize="16"
      fontWeight="bold"
      fill="#1e3a5f"
    >
      ?
    </text>
  </svg>
);

export function InsightsReadyState({
  onGenerateInsights,
}: InsightsReadyStateProps) {
  return (
    <div className="flex flex-col items-center justify-center py-16 px-4">
      <QuestionIllustration />
      <h3 className="mt-6 text-lg font-semibold text-text-primary">
        Should I generate some insights?
      </h3>
      <p className="mt-2 text-sm text-text-secondary text-center max-w-md">
        I can see you uploaded some research, should I synthesize your findings
        into key insights?
      </p>
      <button
        onClick={onGenerateInsights}
        className="mt-6 px-6 py-2.5 text-sm font-medium text-text-inverse bg-button-solid rounded-full hover:opacity-90 transition-opacity"
      >
        Generate Insights
      </button>
    </div>
  );
}
