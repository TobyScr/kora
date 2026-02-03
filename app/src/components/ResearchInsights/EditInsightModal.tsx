"use client";

import { useState, useRef, useEffect } from "react";
import { Modal, ModalHeader, ModalBody, ModalFooter } from "../Modal";
import { TextArea } from "../FormField";
import type { Insight, InsightSource } from "./types";

type EditInsightModalProps = {
  isOpen: boolean;
  onClose: () => void;
  insight: Insight | null;
  onSave: (insight: Insight) => void;
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

const ChevronDownIcon = () => (
  <svg width="16" height="16" viewBox="0 0 16 16" fill="none">
    <path
      d="M4 6L8 10L12 6"
      stroke="currentColor"
      strokeWidth="1.5"
      strokeLinecap="round"
      strokeLinejoin="round"
    />
  </svg>
);

const CheckIcon = () => (
  <svg width="14" height="14" viewBox="0 0 14 14" fill="none">
    <path
      d="M11.5 4L5.5 10L2.5 7"
      stroke="currentColor"
      strokeWidth="1.5"
      strokeLinecap="round"
      strokeLinejoin="round"
    />
  </svg>
);

const SOURCE_OPTIONS: InsightSource[] = ["Existing Research", "DeepResearch"];

// Inner component that only renders when we have an insight
function EditInsightForm({
  insight,
  onSave,
  onCancel,
}: {
  insight: Insight;
  onSave: (insight: Insight) => void;
  onCancel: () => void;
}) {
  const [text, setText] = useState(insight.text);
  const [description, setDescription] = useState(insight.description || "");
  const [sources, setSources] = useState<InsightSource[]>(insight.sources || []);
  const [isDropdownOpen, setIsDropdownOpen] = useState(false);
  const dropdownRef = useRef<HTMLDivElement>(null);

  // Close dropdown when clicking outside
  useEffect(() => {
    const handleClickOutside = (event: MouseEvent) => {
      if (dropdownRef.current && !dropdownRef.current.contains(event.target as Node)) {
        setIsDropdownOpen(false);
      }
    };

    if (isDropdownOpen) {
      document.addEventListener("mousedown", handleClickOutside);
    }

    return () => {
      document.removeEventListener("mousedown", handleClickOutside);
    };
  }, [isDropdownOpen]);

  const handleSave = () => {
    onSave({
      ...insight,
      text: text.trim(),
      description: description.trim() || undefined,
      sources: sources.length > 0 ? sources : undefined,
    });
  };

  const toggleSource = (source: InsightSource) => {
    setSources((prev) =>
      prev.includes(source)
        ? prev.filter((s) => s !== source)
        : [...prev, source]
    );
  };

  const handleTextChange = (value: string) => {
    // Enforce max 100 characters
    if (value.length <= 100) {
      setText(value);
    }
  };

  const isValid = text.trim().length > 0 && text.trim().length <= 100;

  return (
    <>
      <ModalHeader
        title="Edit Insight"
        icon={<EditIcon />}
        onClose={onCancel}
      />
      <ModalBody className="max-h-[60vh]">
        <div className="flex flex-col gap-6">
          {/* Insight Text Field */}
          <div className="flex flex-col gap-2">
            <label className="px-2 text-base font-medium text-text-secondary tracking-[0.15px] leading-[1.6]">
              Insight
            </label>
            <div className="flex flex-col border border-background-brand rounded-[10px] overflow-hidden focus-within:ring-1 focus-within:ring-background-brand">
              <textarea
                value={text}
                onChange={(e) => handleTextChange(e.target.value)}
                placeholder="Enter the insight text"
                rows={2}
                maxLength={100}
                className="w-full p-4 text-sm font-medium text-text-primary tracking-[0.15px] leading-[1.6] resize-none outline-none"
              />
              <div className="flex justify-end p-4 pt-0">
                <span
                  className={`text-xs leading-[1.5] ${
                    text.length >= 100 ? "text-red-500" : "text-text-tertiary"
                  }`}
                >
                  {text.length} / 100
                </span>
              </div>
            </div>
          </div>

          {/* Description Field */}
          <TextArea
            label="Description"
            value={description}
            onChange={setDescription}
            placeholder="Add a description for this insight"
            rows={3}
          />

          {/* Source(s) Multi-select Dropdown */}
          <div className="flex flex-col gap-2">
            <label className="px-2 text-base font-medium text-text-secondary tracking-[0.15px] leading-[1.6]">
              Source(s)
            </label>
            <div className="relative" ref={dropdownRef}>
              <button
                type="button"
                onClick={() => setIsDropdownOpen(!isDropdownOpen)}
                className="flex items-center justify-between w-full h-12 px-4 border border-stroke-default rounded-[12px] bg-button-outline hover:bg-gray-50 transition-colors"
              >
                <span className="text-base font-medium text-text-primary tracking-[0.15px] leading-[1.6]">
                  {sources.length === 0
                    ? "Select source(s)"
                    : sources.join(", ")}
                </span>
                <span
                  className={`transition-transform ${
                    isDropdownOpen ? "rotate-180" : ""
                  }`}
                >
                  <ChevronDownIcon />
                </span>
              </button>

              {isDropdownOpen && (
                <div className="absolute top-full left-0 right-0 mt-1 bg-white border border-stroke-default rounded-lg shadow-lg z-10 overflow-hidden">
                  {SOURCE_OPTIONS.map((source) => {
                    const isSelected = sources.includes(source);
                    return (
                      <button
                        key={source}
                        type="button"
                        onClick={() => toggleSource(source)}
                        className="flex items-center justify-between w-full px-4 py-3 text-left text-sm font-medium text-text-primary hover:bg-stroke-soft/30 transition-colors"
                      >
                        <span>{source}</span>
                        {isSelected && (
                          <span className="text-button-solid">
                            <CheckIcon />
                          </span>
                        )}
                      </button>
                    );
                  })}
                </div>
              )}
            </div>
          </div>
        </div>
      </ModalBody>
      <ModalFooter
        onCancel={onCancel}
        onSave={handleSave}
        saveDisabled={!isValid}
      />
    </>
  );
}

export function EditInsightModal({
  isOpen,
  onClose,
  insight,
  onSave,
}: EditInsightModalProps) {
  const handleSave = (updatedInsight: Insight) => {
    onSave(updatedInsight);
    onClose();
  };

  // Don't render the modal if there's no insight
  if (!insight) return null;

  return (
    <Modal isOpen={isOpen} onClose={onClose}>
      {/* Key forces remount when insight changes, ensuring fresh state */}
      <EditInsightForm
        key={insight.id}
        insight={insight}
        onSave={handleSave}
        onCancel={onClose}
      />
    </Modal>
  );
}
