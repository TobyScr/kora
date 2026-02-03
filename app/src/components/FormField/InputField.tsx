"use client";

import { useId, type ReactNode, type ChangeEvent } from "react";

type InputFieldProps = {
  label: string;
  value: string;
  onChange: (value: string) => void;
  placeholder?: string;
  icon?: ReactNode;
  type?: "text" | "number";
  className?: string;
  clearable?: boolean;
  onClear?: () => void;
};

const ClearIcon = () => (
  <svg width="16" height="16" viewBox="0 0 16 16" fill="none">
    <path
      d="M12 4L4 12M4 4L12 12"
      stroke="currentColor"
      strokeWidth="1.5"
      strokeLinecap="round"
      strokeLinejoin="round"
    />
  </svg>
);

export function InputField({
  label,
  value,
  onChange,
  placeholder,
  icon,
  type = "text",
  className = "",
  clearable = false,
  onClear,
}: InputFieldProps) {
  const id = useId();

  const handleChange = (e: ChangeEvent<HTMLInputElement>) => {
    onChange(e.target.value);
  };

  const handleClear = () => {
    onChange("");
    onClear?.();
  };

  return (
    <div className={`flex flex-col gap-2 ${className}`}>
      <label
        htmlFor={id}
        className="px-2 text-base font-medium text-text-secondary tracking-[0.15px] leading-[1.6]"
      >
        {label}
      </label>
      <div className="flex items-center gap-3 h-12 px-3 border border-stroke-default rounded-[10px] bg-button-outline focus-within:border-background-brand focus-within:ring-1 focus-within:ring-background-brand">
        {icon && (
          <span className="flex items-center justify-center text-text-primary">
            {icon}
          </span>
        )}
        <input
          id={id}
          type={type}
          value={value}
          onChange={handleChange}
          placeholder={placeholder}
          className="flex-1 text-sm font-medium text-text-primary tracking-[0.15px] leading-[1.6] outline-none bg-transparent placeholder:text-text-tertiary"
        />
        {clearable && value && (
          <button
            type="button"
            onClick={handleClear}
            className="flex items-center justify-center text-text-secondary hover:text-text-primary transition-colors"
            aria-label="Clear input"
          >
            <ClearIcon />
          </button>
        )}
      </div>
    </div>
  );
}
