"use client";

import { useId, type ReactNode } from "react";

type SelectOption = {
  value: string;
  label: string;
};

type SelectProps = {
  label: string;
  value: string;
  onChange: (value: string) => void;
  options: SelectOption[];
  icon?: ReactNode;
  placeholder?: string;
  className?: string;
};

const ChevronDownIcon = () => (
  <svg width="16" height="16" viewBox="0 0 16 16" fill="none">
    <path
      d="M4 6L8 10L12 6"
      stroke="currentColor"
      strokeWidth="1.5"
      strokeLinecap="round"
      strokeLinejoin="round"
    />
  </svg>
);

export function Select({
  label,
  value,
  onChange,
  options,
  icon,
  placeholder = "Select...",
  className = "",
}: SelectProps) {
  const id = useId();

  return (
    <div className={`flex flex-col gap-2 ${className}`}>
      <label
        htmlFor={id}
        className="px-2 text-base font-medium text-text-secondary tracking-[0.15px] leading-[1.6]"
      >
        {label}
      </label>
      <div className="relative">
        <div className="flex items-center gap-3 h-12 px-3 border border-stroke-default rounded-[12px] bg-button-outline">
          {icon && (
            <span className="flex items-center justify-center p-[6px] text-text-primary">
              {icon}
            </span>
          )}
          <select
            id={id}
            value={value}
            onChange={(e) => onChange(e.target.value)}
            className="flex-1 text-base font-medium text-text-primary tracking-[0.15px] leading-[1.6] outline-none bg-transparent appearance-none cursor-pointer"
          >
            {!value && (
              <option value="" disabled>
                {placeholder}
              </option>
            )}
            {options.map((option) => (
              <option key={option.value} value={option.value}>
                {option.label}
              </option>
            ))}
          </select>
          <span className="flex items-center justify-center w-7 h-7 text-text-primary pointer-events-none">
            <ChevronDownIcon />
          </span>
        </div>
      </div>
    </div>
  );
}
