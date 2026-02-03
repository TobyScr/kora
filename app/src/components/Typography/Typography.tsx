import React from "react";

type TypographyVariant =
  | "h1"
  | "h2"
  | "h3"
  | "h4"
  | "subheading-lg"
  | "subheading-md"
  | "subheading-sm"
  | "label-lg"
  | "label-md"
  | "label-sm"
  | "body-lg"
  | "body-md"
  | "body-sm"
  | "body-xs";

type TypographyColor = "primary" | "secondary" | "tertiary" | "inverse";

type ElementType = "h1" | "h2" | "h3" | "h4" | "h5" | "h6" | "p" | "span" | "div";

interface TypographyProps {
  variant: TypographyVariant;
  color?: TypographyColor;
  children: React.ReactNode;
  className?: string;
  as?: ElementType;
}

const variantStyles: Record<TypographyVariant, string> = {
  h1: "text-[length:var(--heading-h1-size)] font-[number:var(--heading-h1-weight)] leading-[var(--heading-h1-lineheight)] tracking-[var(--heading-h1-letterspacing)]",
  h2: "text-[length:var(--heading-h2-size)] font-[number:var(--heading-h2-weight)] leading-[var(--heading-h2-lineheight)] tracking-[var(--heading-h2-letterspacing)]",
  h3: "text-[length:var(--heading-h3-size)] font-[number:var(--heading-h3-weight)] leading-[var(--heading-h3-lineheight)] tracking-[var(--heading-h3-letterspacing)]",
  h4: "text-[length:var(--heading-h4-size)] font-[number:var(--heading-h4-weight)] leading-[var(--heading-h4-lineheight)] tracking-[var(--heading-h4-letterspacing)]",
  "subheading-lg":
    "text-[length:var(--subheading-lg-size)] font-[number:var(--subheading-lg-weight)] leading-[var(--subheading-lg-lineheight)] tracking-[var(--subheading-lg-letterspacing)]",
  "subheading-md":
    "text-[length:var(--subheading-md-size)] font-[number:var(--subheading-md-weight)] leading-[var(--subheading-md-lineheight)] tracking-[var(--subheading-md-letterspacing)]",
  "subheading-sm":
    "text-[length:var(--subheading-sm-size)] font-[number:var(--subheading-sm-weight)] leading-[var(--subheading-sm-lineheight)] tracking-[var(--subheading-sm-letterspacing)]",
  "label-lg":
    "text-[length:var(--label-lg-size)] font-[number:var(--label-lg-weight)] leading-[var(--label-lg-lineheight)] tracking-[var(--label-lg-letterspacing)]",
  "label-md":
    "text-[length:var(--label-md-size)] font-[number:var(--label-md-weight)] leading-[var(--label-md-lineheight)] tracking-[var(--label-md-letterspacing)]",
  "label-sm":
    "text-[length:var(--label-sm-size)] font-[number:var(--label-sm-weight)] leading-[var(--label-sm-lineheight)] tracking-[var(--label-sm-letterspacing)]",
  "body-lg":
    "text-[length:var(--body-lg-size)] font-[number:var(--body-lg-weight)] leading-[var(--body-lg-lineheight)] tracking-[var(--body-lg-letterspacing)]",
  "body-md":
    "text-[length:var(--body-md-size)] font-[number:var(--body-md-weight)] leading-[var(--body-md-lineheight)] tracking-[var(--body-md-letterspacing)]",
  "body-sm":
    "text-[length:var(--body-sm-size)] font-[number:var(--body-sm-weight)] leading-[var(--body-sm-lineheight)] tracking-[var(--body-sm-letterspacing)]",
  "body-xs":
    "text-[length:var(--body-xs-size)] font-[number:var(--body-xs-weight)] leading-[var(--body-xs-lineheight)] tracking-[var(--body-xs-letterspacing)]",
};

const colorStyles: Record<TypographyColor, string> = {
  primary: "text-text-primary",
  secondary: "text-text-secondary",
  tertiary: "text-text-tertiary",
  inverse: "text-text-inverse",
};

const defaultElements: Record<TypographyVariant, ElementType> = {
  h1: "h1",
  h2: "h2",
  h3: "h3",
  h4: "h4",
  "subheading-lg": "h5",
  "subheading-md": "h6",
  "subheading-sm": "h6",
  "label-lg": "span",
  "label-md": "span",
  "label-sm": "span",
  "body-lg": "p",
  "body-md": "p",
  "body-sm": "p",
  "body-xs": "p",
};

export function Typography({
  variant,
  color = "primary",
  children,
  className = "",
  as,
}: TypographyProps) {
  const Tag = as || defaultElements[variant];

  return (
    <Tag
      className={`${variantStyles[variant]} ${colorStyles[color]} ${className}`}
    >
      {children}
    </Tag>
  );
}
