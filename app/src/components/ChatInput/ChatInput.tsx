"use client";

import { useState, type FormEvent, type KeyboardEvent } from "react";

type ChatInputProps = {
  placeholder?: string;
  onSubmit?: (message: string) => void;
  className?: string;
};

const SendIcon = () => (
  <svg width="16" height="16" viewBox="0 0 16 16" fill="none">
    <path
      d="M8 3v10m0-10l4 4M8 3L4 7"
      stroke="currentColor"
      strokeWidth="1.5"
      strokeLinecap="round"
      strokeLinejoin="round"
    />
  </svg>
);

export function ChatInput({
  placeholder = "Type here",
  onSubmit,
  className,
}: ChatInputProps) {
  const [value, setValue] = useState("");

  const handleSubmit = (e: FormEvent) => {
    e.preventDefault();
    if (value.trim() && onSubmit) {
      onSubmit(value.trim());
      setValue("");
    }
  };

  const handleKeyDown = (e: KeyboardEvent<HTMLTextAreaElement>) => {
    if (e.key === "Enter" && !e.shiftKey) {
      e.preventDefault();
      handleSubmit(e);
    }
  };

  return (
    <form
      onSubmit={handleSubmit}
      className={`flex items-center gap-3 bg-background-surface p-4 rounded-[var(--radius-xxl)] w-full max-w-[668px] ${className ?? ""}`}
    >
      <textarea
        value={value}
        onChange={(e) => setValue(e.target.value)}
        onKeyDown={handleKeyDown}
        placeholder={placeholder}
        rows={1}
        className="flex-1 min-h-[32px] resize-none bg-transparent text-sm text-text-primary placeholder:text-text-tertiary font-medium leading-[32px] tracking-[var(--letter-spacing-wide-s)] outline-none"
      />
      <button
        type="submit"
        disabled={!value.trim()}
        className="flex items-center justify-center size-8 rounded-full bg-button-solid text-text-inverse cursor-pointer disabled:opacity-40 disabled:cursor-not-allowed shrink-0"
        aria-label="Send message"
      >
        <SendIcon />
      </button>
    </form>
  );
}
