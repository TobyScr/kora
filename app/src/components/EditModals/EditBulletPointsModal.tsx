"use client";

import { useState, useEffect } from "react";
import { Modal, ModalHeader, ModalBody, ModalFooter } from "../Modal";
import { TextArea } from "../FormField";

type BulletPointsData = {
  points: string[];
};

type EditBulletPointsModalProps = {
  isOpen: boolean;
  onClose: () => void;
  title: string;
  fieldLabel: string;
  initialValue: BulletPointsData;
  onSave: (value: BulletPointsData) => void;
  maxPoints?: number;
  maxLength?: number;
};

const PlusIcon = () => (
  <svg width="16" height="16" viewBox="0 0 16 16" fill="none">
    <path
      d="M8 3v10M3 8h10"
      stroke="currentColor"
      strokeWidth="1.5"
      strokeLinecap="round"
      strokeLinejoin="round"
    />
  </svg>
);

const TrashIcon = () => (
  <svg width="16" height="16" viewBox="0 0 16 16" fill="none">
    <path
      d="M2 4h12M5 4V3a1 1 0 011-1h4a1 1 0 011 1v1M6 7v5M10 7v5M4 4l1 9a1 1 0 001 1h4a1 1 0 001-1l1-9"
      stroke="currentColor"
      strokeWidth="1.5"
      strokeLinecap="round"
      strokeLinejoin="round"
    />
  </svg>
);

export function EditBulletPointsModal({
  isOpen,
  onClose,
  title,
  fieldLabel,
  initialValue,
  onSave,
  maxPoints = 6,
  maxLength = 150,
}: EditBulletPointsModalProps) {
  const [points, setPoints] = useState<string[]>(initialValue.points);

  // Reset state when modal opens
  useEffect(() => {
    if (isOpen) {
      // Start with at least one empty field if no points exist
      setPoints(initialValue.points.length > 0 ? initialValue.points : [""]);
    }
  }, [isOpen, initialValue]);

  const handleSave = () => {
    // Filter out empty points before saving
    const filteredPoints = points.filter((p) => p.trim() !== "");
    onSave({ points: filteredPoints });
    onClose();
  };

  const handleCancel = () => {
    setPoints(initialValue.points);
    onClose();
  };

  const updatePoint = (index: number, newValue: string) => {
    setPoints((prev) => {
      const newPoints = [...prev];
      newPoints[index] = newValue;
      return newPoints;
    });
  };

  const addPoint = () => {
    if (points.length < maxPoints) {
      setPoints((prev) => [...prev, ""]);
    }
  };

  const removePoint = (index: number) => {
    if (points.length > 1) {
      setPoints((prev) => prev.filter((_, i) => i !== index));
    }
  };

  const canAddMore = points.length < maxPoints;

  return (
    <Modal isOpen={isOpen} onClose={handleCancel}>
      <ModalHeader title={title} onClose={handleCancel} />
      <ModalBody className="max-h-[60vh]">
        <div className="flex flex-col gap-4">
          {points.map((point, index) => (
            <div key={index} className="relative">
              <TextArea
                label={`${fieldLabel} ${index + 1}`}
                value={point}
                onChange={(v) => updatePoint(index, v)}
                maxLength={maxLength}
                rows={2}
              />
              {points.length > 1 && (
                <button
                  type="button"
                  onClick={() => removePoint(index)}
                  className="absolute top-0 right-0 p-2 text-text-tertiary hover:text-red-500 transition-colors"
                  aria-label={`Remove ${fieldLabel} ${index + 1}`}
                >
                  <TrashIcon />
                </button>
              )}
            </div>
          ))}

          {canAddMore && (
            <button
              type="button"
              onClick={addPoint}
              className="flex items-center justify-center gap-2 py-3 px-4 border border-dashed border-stroke-default rounded-[10px] text-sm font-medium text-text-secondary hover:border-background-brand hover:text-text-primary transition-colors"
            >
              <PlusIcon />
              Add {fieldLabel.toLowerCase()}
            </button>
          )}

          <p className="text-xs text-text-tertiary">
            {points.length} / {maxPoints} {fieldLabel.toLowerCase()}s
          </p>
        </div>
      </ModalBody>
      <ModalFooter onCancel={handleCancel} onSave={handleSave} />
    </Modal>
  );
}
