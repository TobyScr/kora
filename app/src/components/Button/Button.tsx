import type { ButtonHTMLAttributes, ReactNode } from "react";

type ButtonVariant = "solid" | "outline";
type ButtonSize = "sm" | "md";

type ButtonProps = {
  variant?: ButtonVariant;
  size?: ButtonSize;
  icon?: ReactNode;
  iconPosition?: "left" | "right";
  children: ReactNode;
  className?: string;
} & Omit<ButtonHTMLAttributes<HTMLButtonElement>, "className">;

const variantClasses: Record<ButtonVariant, string> = {
  solid:
    "bg-button-solid text-text-inverse",
  outline:
    "bg-button-outline border border-stroke-default text-text-primary",
};

const sizeClasses: Record<ButtonSize, string> = {
  sm: "min-h-[32px] px-2 py-1 text-sm",
  md: "min-h-[40px] px-3 py-1 text-sm",
};

export function Button({
  variant = "solid",
  size = "md",
  icon,
  iconPosition = "right",
  children,
  className,
  ...rest
}: ButtonProps) {
  return (
    <button
      className={`inline-flex items-center justify-center gap-1 rounded-[var(--radius-lg)] font-medium leading-[1.6] tracking-[var(--letter-spacing-wide-s)] cursor-pointer ${variantClasses[variant]} ${sizeClasses[size]} ${className ?? ""}`}
      {...rest}
    >
      {icon && iconPosition === "left" && (
        <span className="flex items-center justify-center size-6">{icon}</span>
      )}
      <span className="px-1.5">{children}</span>
      {icon && iconPosition === "right" && (
        <span className="flex items-center justify-center size-6">{icon}</span>
      )}
    </button>
  );
}
