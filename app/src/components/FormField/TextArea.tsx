"use client";

import { useId, type ChangeEvent } from "react";

type TextAreaProps = {
  label: string;
  value: string;
  onChange: (value: string) => void;
  maxLength?: number;
  placeholder?: string;
  rows?: number;
  className?: string;
};

export function TextArea({
  label,
  value,
  onChange,
  maxLength,
  placeholder,
  rows = 4,
  className = "",
}: TextAreaProps) {
  const id = useId();

  const handleChange = (e: ChangeEvent<HTMLTextAreaElement>) => {
    const newValue = e.target.value;
    if (maxLength && newValue.length > maxLength) return;
    onChange(newValue);
  };

  return (
    <div className={`flex flex-col gap-2 ${className}`}>
      <label
        htmlFor={id}
        className="px-2 text-base font-medium text-text-secondary tracking-[0.15px] leading-[1.6]"
      >
        {label}
      </label>
      <div className="flex flex-col border border-background-brand rounded-[10px] overflow-hidden focus-within:ring-1 focus-within:ring-background-brand">
        <textarea
          id={id}
          value={value}
          onChange={handleChange}
          placeholder={placeholder}
          rows={rows}
          className="w-full p-4 text-sm font-medium text-text-primary tracking-[0.15px] leading-[1.6] resize-none outline-none"
        />
        {maxLength && (
          <div className="flex justify-end p-4 pt-0">
            <span className="text-xs text-text-tertiary leading-[1.5]">
              {value.length} / {maxLength}
            </span>
          </div>
        )}
      </div>
    </div>
  );
}
