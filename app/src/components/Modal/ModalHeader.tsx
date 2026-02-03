"use client";

import { type ReactNode } from "react";

type ModalHeaderProps = {
  title: string;
  icon?: ReactNode;
  onClose: () => void;
};

const EditIcon = () => (
  <svg width="16" height="16" viewBox="0 0 16 16" fill="none">
    <path
      d="M11.5 1.5L14.5 4.5M1 15L1.5 11.5L12 1L15 4L4.5 14.5L1 15Z"
      stroke="currentColor"
      strokeWidth="1.5"
      strokeLinecap="round"
      strokeLinejoin="round"
    />
  </svg>
);

const CloseIcon = () => (
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

export function ModalHeader({ title, icon, onClose }: ModalHeaderProps) {
  return (
    <div className="flex items-center justify-between px-4 py-6 h-[72px] border-b border-stroke-soft shrink-0">
      <div className="flex items-center gap-1">
        <div className="flex items-center justify-center w-8 h-8 text-text-primary">
          {icon || <EditIcon />}
        </div>
        <h2 className="text-base font-bold text-text-primary leading-[1.2]">
          {title}
        </h2>
      </div>
      <button
        onClick={onClose}
        className="flex items-center justify-center w-8 h-8 text-text-secondary hover:text-text-primary transition-colors rounded-lg"
        aria-label="Close modal"
      >
        <CloseIcon />
      </button>
    </div>
  );
}
