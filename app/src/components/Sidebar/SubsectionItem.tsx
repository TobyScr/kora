type SubsectionItemProps = {
  label: string;
  isActive?: boolean;
  isLocked?: boolean;
  onClick?: () => void;
  className?: string;
};

const CircleIcon = () => (
  <svg width="16" height="16" viewBox="0 0 16 16" fill="none">
    <circle cx="8" cy="8" r="7" stroke="var(--background-brand)" strokeWidth="1.5" />
  </svg>
);

const LockIcon = () => (
  <svg width="16" height="16" viewBox="0 0 16 16" fill="none">
    <rect x="3" y="7" width="10" height="7" rx="1.5" stroke="currentColor" strokeWidth="1.5" />
    <path d="M5.5 7V5a2.5 2.5 0 015 0v2" stroke="currentColor" strokeWidth="1.5" strokeLinecap="round" />
  </svg>
);

export function SubsectionItem({
  label,
  isActive = false,
  isLocked = false,
  onClick,
  className,
}: SubsectionItemProps) {
  const bgColor = isActive ? "bg-background-page" : "";
  const textColor = isLocked ? "text-text-tertiary" : "text-text-primary";

  return (
    <button
      onClick={onClick}
      disabled={isLocked}
      className={`flex items-center gap-3 w-full px-2 py-1 cursor-pointer disabled:cursor-not-allowed hover:bg-stroke-soft/50 transition-colors ${bgColor} ${className ?? ""}`}
    >
      <span className="flex items-center justify-center size-9 shrink-0 text-text-tertiary">
        {isLocked ? <LockIcon /> : <CircleIcon />}
      </span>
      <span className={`flex-1 text-left font-medium text-sm leading-[1.6] tracking-[var(--letter-spacing-wide-s)] ${textColor}`}>
        {label}
      </span>
    </button>
  );
}
