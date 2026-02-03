"use client";

export type StatusType = "in-progress" | "complete";

type StatusPillProps = {
  status: StatusType;
};

const statusConfig = {
  "in-progress": {
    bg: "bg-[#f7fbfe]",
    border: "border-[#bfdbf4]",
    text: "text-[#60a6e3]",
    dot: "bg-[#60a6e3]",
    label: "In progress",
  },
  complete: {
    bg: "bg-[#f4f9f6]",
    border: "border-[#a0c9b1]",
    text: "text-[#2b8652]",
    dot: "bg-[#2b8652]",
    label: "Complete",
  },
};

export function StatusPill({ status }: StatusPillProps) {
  const config = statusConfig[status];

  return (
    <div
      className={`flex items-center gap-2 h-6 px-2 py-[3px] rounded-2xl border whitespace-nowrap ${config.bg} ${config.border}`}
    >
      <span className={`w-[6px] h-[6px] rounded-full ${config.dot}`} />
      <span className={`text-xs font-medium leading-[1.6] tracking-[0.15px] ${config.text}`}>
        {config.label}
      </span>
    </div>
  );
}
