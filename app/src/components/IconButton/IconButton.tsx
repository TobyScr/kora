import type { ButtonHTMLAttributes, ReactNode } from "react";

type IconButtonProps = {
  icon: ReactNode;
  size?: "sm" | "md";
  label: string;
  className?: string;
} & Omit<ButtonHTMLAttributes<HTMLButtonElement>, "className" | "children">;

const sizeClasses = {
  sm: "size-8 min-w-8 min-h-8",
  md: "size-10 min-w-10 min-h-10",
};

export function IconButton({
  icon,
  size = "md",
  label,
  className,
  ...rest
}: IconButtonProps) {
  return (
    <button
      aria-label={label}
      className={`inline-flex items-center justify-center p-1 rounded-[var(--radius-lg)] cursor-pointer hover:bg-stroke-soft transition-colors ${sizeClasses[size]} ${className ?? ""}`}
      {...rest}
    >
      <span className="flex items-center justify-center size-6">
        {icon}
      </span>
    </button>
  );
}
