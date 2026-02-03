"use client";

import { type ReactNode } from "react";

type ModalBodyProps = {
  children: ReactNode;
  className?: string;
};

export function ModalBody({ children, className = "" }: ModalBodyProps) {
  return (
    <div className={`flex-1 overflow-y-auto p-6 ${className}`}>
      {children}
    </div>
  );
}
