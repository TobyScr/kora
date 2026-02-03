"use client";

type TabOption = {
  value: string;
  label: string;
};

type TabsProps = {
  label?: string;
  value: string;
  onChange: (value: string) => void;
  options: TabOption[];
  className?: string;
};

export function Tabs({
  label,
  value,
  onChange,
  options,
  className = "",
}: TabsProps) {
  return (
    <div className={`flex flex-col gap-2 ${className}`}>
      {label && (
        <span className="px-2 text-base font-medium text-text-secondary tracking-[0.15px] leading-[1.6]">
          {label}
        </span>
      )}
      <div className="flex h-12 p-1 bg-primary-100 rounded-[12px]">
        {options.map((option) => {
          const isSelected = value === option.value;
          return (
            <button
              key={option.value}
              type="button"
              onClick={() => onChange(option.value)}
              className={`flex-1 flex items-center justify-center rounded-[10px] text-sm font-medium tracking-[0.15px] leading-[1.6] transition-colors ${
                isSelected
                  ? "bg-background-surface text-text-primary shadow-sm"
                  : "text-text-secondary hover:text-text-primary"
              }`}
            >
              {option.label}
            </button>
          );
        })}
      </div>
    </div>
  );
}
