"use client";

import { useState, useRef, useEffect, type FormEvent, type KeyboardEvent } from "react";

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
  const textareaRef = useRef<HTMLTextAreaElement>(null);

  useEffect(() => {
    if (textareaRef.current) {
      textareaRef.current.style.height = "32px";
      textareaRef.current.style.height = `${Math.min(textareaRef.current.scrollHeight, 200)}px`;
    }
  }, [value]);

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
      className={`flex items-end gap-3 bg-background-surface p-4 rounded-[var(--radius-xxl)] w-full max-w-[668px] ${className ?? ""}`}
    >
      <textarea
        ref={textareaRef}
        value={value}
        onChange={(e) => setValue(e.target.value)}
        onKeyDown={handleKeyDown}
        placeholder={placeholder}
        rows={1}
        className="flex-1 h-8 min-h-[32px] max-h-[200px] resize-none bg-transparent text-sm text-text-primary placeholder:text-text-tertiary font-medium leading-8 tracking-[var(--letter-spacing-wide-s)] outline-none"
        suppressHydrationWarning
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
