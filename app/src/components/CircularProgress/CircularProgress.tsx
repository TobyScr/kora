import type { SVGProps } from "react";

type CircularProgressProps = {
  progress: 0 | 25 | 50 | 75 | 100;
  size?: number;
  className?: string;
};

const STROKE_WIDTH = 2;

export function CircularProgress({
  progress,
  size = 16,
  className,
}: CircularProgressProps) {
  const radius = (size - STROKE_WIDTH) / 2;
  const circumference = 2 * Math.PI * radius;
  const offset = circumference - (progress / 100) * circumference;

  return (
    <svg
      width={size}
      height={size}
      viewBox={`0 0 ${size} ${size}`}
      className={className}
      aria-label={`${progress}% complete`}
      role="progressbar"
      aria-valuenow={progress}
      aria-valuemin={0}
      aria-valuemax={100}
    >
      {/* Background track */}
      <circle
        cx={size / 2}
        cy={size / 2}
        r={radius}
        fill="none"
        stroke="var(--stroke-default)"
        strokeWidth={STROKE_WIDTH}
      />
      {/* Progress arc */}
      {progress > 0 && (
        <circle
          cx={size / 2}
          cy={size / 2}
          r={radius}
          fill="none"
          stroke="var(--background-brand)"
          strokeWidth={STROKE_WIDTH}
          strokeLinecap="round"
          strokeDasharray={circumference}
          strokeDashoffset={offset}
          transform={`rotate(-90 ${size / 2} ${size / 2})`}
        />
      )}
    </svg>
  );
}
