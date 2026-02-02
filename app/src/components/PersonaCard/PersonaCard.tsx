"use client";

import { useState, type ReactNode } from "react";

type PersonaSection = {
  id: string;
  label: string;
  color: "red" | "orange" | "purple";
  content?: ReactNode;
};

type PersonaCardProps = {
  number: number;
  name: string;
  archetype: string;
  age?: number;
  gender?: string;
  status?: string;
  quote?: string;
  imageUrl?: string;
  sections?: PersonaSection[];
  onEdit?: () => void;
  className?: string;
};

const EditIcon = () => (
  <svg width="16" height="16" viewBox="0 0 16 16" fill="none">
    <path d="M11.5 2.5l2 2L5 13H3v-2l8.5-8.5z" stroke="currentColor" strokeWidth="1.2" strokeLinecap="round" strokeLinejoin="round" />
  </svg>
);

const ChevronDown = () => (
  <svg width="12" height="12" viewBox="0 0 16 16" fill="none">
    <path d="M4 6l4 4 4-4" stroke="currentColor" strokeWidth="1.5" strokeLinecap="round" strokeLinejoin="round" />
  </svg>
);

const ChevronRight = () => (
  <svg width="12" height="12" viewBox="0 0 16 16" fill="none">
    <path d="M6 4l4 4-4 4" stroke="currentColor" strokeWidth="1.5" strokeLinecap="round" strokeLinejoin="round" />
  </svg>
);

const sectionColors = {
  red: "bg-red-100 text-red-700",
  orange: "bg-orange-100 text-orange-700",
  purple: "bg-purple-100 text-purple-700",
};

export function PersonaCard({
  number,
  name,
  archetype,
  age,
  gender,
  status,
  quote,
  imageUrl,
  sections = [],
  onEdit,
  className,
}: PersonaCardProps) {
  const [expandedSections, setExpandedSections] = useState<Set<string>>(new Set());

  const toggleSection = (id: string) => {
    setExpandedSections((prev) => {
      const next = new Set(prev);
      if (next.has(id)) {
        next.delete(id);
      } else {
        next.add(id);
      }
      return next;
    });
  };

  const demographics = [age && `${age} years old`, gender, status].filter(Boolean).join(" • ");

  return (
    <div className={`border-t border-stroke-default pt-4 ${className ?? ""}`}>
      {/* Header */}
      <div className="flex items-start justify-between mb-2">
        <div className="flex items-center gap-2">
          <span className="text-lg font-medium text-text-primary">{number}</span>
          <h3 className="font-medium text-text-primary">
            {name} — {archetype}
          </h3>
        </div>
        {onEdit && (
          <button
            onClick={onEdit}
            className="flex items-center gap-1 text-text-secondary text-sm cursor-pointer hover:text-text-primary"
          >
            <EditIcon /> Edit
          </button>
        )}
      </div>

      {/* Demographics */}
      {demographics && (
        <p className="text-xs text-text-secondary mb-2">{demographics}</p>
      )}

      {/* Body: quote + image */}
      <div className="flex gap-4 mb-3">
        {quote && (
          <p className="flex-1 text-sm text-text-secondary italic leading-relaxed">
            &ldquo;{quote}&rdquo;
          </p>
        )}
        {imageUrl && (
          <div className="w-[100px] h-[100px] rounded-[var(--radius-md)] overflow-hidden shrink-0">
            <img src={imageUrl} alt={name} className="w-full h-full object-cover" />
          </div>
        )}
      </div>

      {/* Expandable sections */}
      {sections.map((section) => {
        const isOpen = expandedSections.has(section.id);
        return (
          <div key={section.id} className="mb-2">
            <button
              onClick={() => toggleSection(section.id)}
              className="flex items-center gap-2 py-1 cursor-pointer"
            >
              <span className="text-text-secondary">
                {isOpen ? <ChevronDown /> : <ChevronRight />}
              </span>
              <span className={`px-2 py-0.5 rounded-md text-xs font-medium ${sectionColors[section.color]}`}>
                {section.label}
              </span>
            </button>
            {isOpen && section.content && (
              <div className="pl-6 pt-1 text-sm text-text-secondary leading-relaxed">
                {section.content}
              </div>
            )}
          </div>
        );
      })}
    </div>
  );
}
