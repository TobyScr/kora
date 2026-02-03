"use client";

import { useId, type ChangeEvent } from "react";

type RichTextAreaProps = {
  label: string;
  value: string;
  onChange: (value: string) => void;
  maxLength?: number;
  placeholder?: string;
  rows?: number;
  className?: string;
};

const BoldIcon = () => (
  <svg width="16" height="16" viewBox="0 0 16 16" fill="none">
    <path
      d="M4 2.5H9C10.6569 2.5 12 3.84315 12 5.5C12 7.15685 10.6569 8.5 9 8.5H4V2.5Z"
      stroke="currentColor"
      strokeWidth="1.5"
      strokeLinecap="round"
      strokeLinejoin="round"
    />
    <path
      d="M4 8.5H10C11.6569 8.5 13 9.84315 13 11.5C13 13.1569 11.6569 14.5 10 14.5H4V8.5Z"
      stroke="currentColor"
      strokeWidth="1.5"
      strokeLinecap="round"
      strokeLinejoin="round"
    />
  </svg>
);

const ItalicIcon = () => (
  <svg width="16" height="16" viewBox="0 0 16 16" fill="none">
    <path
      d="M6 14L10 2"
      stroke="currentColor"
      strokeWidth="1.5"
      strokeLinecap="round"
      strokeLinejoin="round"
    />
    <path
      d="M5 14H9"
      stroke="currentColor"
      strokeWidth="1.5"
      strokeLinecap="round"
      strokeLinejoin="round"
    />
    <path
      d="M7 2H11"
      stroke="currentColor"
      strokeWidth="1.5"
      strokeLinecap="round"
      strokeLinejoin="round"
    />
  </svg>
);

const UnderlineIcon = () => (
  <svg width="16" height="16" viewBox="0 0 16 16" fill="none">
    <path
      d="M4 2V8C4 10.2091 5.79086 12 8 12C10.2091 12 12 10.2091 12 8V2"
      stroke="currentColor"
      strokeWidth="1.5"
      strokeLinecap="round"
      strokeLinejoin="round"
    />
    <path
      d="M3 14H13"
      stroke="currentColor"
      strokeWidth="1.5"
      strokeLinecap="round"
      strokeLinejoin="round"
    />
  </svg>
);

const NumberListIcon = () => (
  <svg width="16" height="16" viewBox="0 0 16 16" fill="none">
    <path
      d="M6 3H14M6 8H14M6 13H14"
      stroke="currentColor"
      strokeWidth="1.5"
      strokeLinecap="round"
      strokeLinejoin="round"
    />
    <path
      d="M2.5 2V5M2.5 5H2M2.5 5H3"
      stroke="currentColor"
      strokeWidth="1.2"
      strokeLinecap="round"
      strokeLinejoin="round"
    />
    <path
      d="M2 8H3L2 10H3"
      stroke="currentColor"
      strokeWidth="1.2"
      strokeLinecap="round"
      strokeLinejoin="round"
    />
    <path
      d="M2 12H3L2.5 13L3 14H2"
      stroke="currentColor"
      strokeWidth="1.2"
      strokeLinecap="round"
      strokeLinejoin="round"
    />
  </svg>
);

const BulletListIcon = () => (
  <svg width="16" height="16" viewBox="0 0 16 16" fill="none">
    <path
      d="M6 3H14M6 8H14M6 13H14"
      stroke="currentColor"
      strokeWidth="1.5"
      strokeLinecap="round"
      strokeLinejoin="round"
    />
    <circle cx="2.5" cy="3" r="1" fill="currentColor" />
    <circle cx="2.5" cy="8" r="1" fill="currentColor" />
    <circle cx="2.5" cy="13" r="1" fill="currentColor" />
  </svg>
);

type ToolbarButtonProps = {
  icon: React.ReactNode;
  onClick?: () => void;
  isActive?: boolean;
  label: string;
};

function ToolbarButton({ icon, onClick, isActive, label }: ToolbarButtonProps) {
  return (
    <button
      type="button"
      onClick={onClick}
      aria-label={label}
      className={`flex items-center justify-center w-8 h-8 rounded-lg transition-colors ${
        isActive
          ? "bg-primary-100 text-text-primary"
          : "text-text-secondary hover:text-text-primary hover:bg-gray-100"
      }`}
    >
      {icon}
    </button>
  );
}

export function RichTextArea({
  label,
  value,
  onChange,
  maxLength,
  placeholder,
  rows = 4,
  className = "",
}: RichTextAreaProps) {
  const id = useId();

  const handleChange = (e: ChangeEvent<HTMLTextAreaElement>) => {
    const newValue = e.target.value;
    if (maxLength && newValue.length > maxLength) return;
    onChange(newValue);
  };

  // Note: For MVP, toolbar buttons are visual placeholders.
  // Full rich text editing would require a library like TipTap or Slate.
  const handleFormatting = (format: string) => {
    // Placeholder for future rich text implementation
    console.log(`Format: ${format}`);
  };

  return (
    <div className={`flex flex-col gap-2 ${className}`}>
      <label
        htmlFor={id}
        className="px-2 text-base font-medium text-text-secondary tracking-[0.15px] leading-[1.6]"
      >
        {label}
      </label>
      <div className="flex flex-col border border-background-brand rounded-[10px] overflow-hidden">
        {/* Toolbar */}
        <div className="flex items-center gap-2 px-2 py-2 bg-background-surface border-b border-stroke-soft">
          <div className="flex items-center gap-2">
            <ToolbarButton
              icon={<BoldIcon />}
              onClick={() => handleFormatting("bold")}
              label="Bold"
            />
            <ToolbarButton
              icon={<ItalicIcon />}
              onClick={() => handleFormatting("italic")}
              label="Italic"
            />
            <ToolbarButton
              icon={<UnderlineIcon />}
              onClick={() => handleFormatting("underline")}
              label="Underline"
            />
          </div>
          {/* Divider */}
          <div className="w-px h-8 bg-stroke-soft" />
          <div className="flex items-center gap-2">
            <ToolbarButton
              icon={<NumberListIcon />}
              onClick={() => handleFormatting("numbered-list")}
              label="Numbered list"
            />
            <ToolbarButton
              icon={<BulletListIcon />}
              onClick={() => handleFormatting("bullet-list")}
              label="Bullet list"
            />
          </div>
        </div>

        {/* Text area */}
        <textarea
          id={id}
          value={value}
          onChange={handleChange}
          placeholder={placeholder}
          rows={rows}
          className="w-full p-4 text-sm font-medium text-text-primary tracking-[0.15px] leading-[1.6] resize-none outline-none"
        />

        {/* Character count */}
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
