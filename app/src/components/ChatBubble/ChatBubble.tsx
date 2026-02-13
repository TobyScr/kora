import type { ReactNode } from "react";
import { AiAvatar } from "../AiAvatar/AiAvatar";

type ChatBubbleProps = {
  variant: "ai" | "user";
  children: ReactNode;
  className?: string;
};

export function ChatBubble({ variant, children, className }: ChatBubbleProps) {
  if (variant === "user") {
    return (
      <div className={`flex items-start justify-end max-w-[700px] w-full ${className ?? ""}`}>
        <div className="bg-primary-100 border border-stroke-soft rounded-tl-[var(--radius-xl)] rounded-tr-[var(--radius-xl)] rounded-bl-[var(--radius-xl)] px-3 py-2 max-w-[650px]">
          <div className="text-text-primary text-sm leading-[1.5]">{children}</div>
        </div>
      </div>
    );
  }

  return (
    <div className={`flex gap-4 items-start max-w-[700px] w-full ${className ?? ""}`}>
      <AiAvatar size={24} />
      <div className="flex-1 max-w-[650px] rounded-tl-[var(--radius-xl)] rounded-tr-[var(--radius-xl)] rounded-br-[var(--radius-xl)]">
        <div className="text-text-primary text-sm leading-[1.5]">{children}</div>
      </div>
    </div>
  );
}
