"use client";

import { useState } from "react";
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

export function EditBulletPointsModal({
  isOpen,
  onClose,
  title,
  fieldLabel,
  initialValue,
  onSave,
  maxPoints = 5,
  maxLength = 150,
}: EditBulletPointsModalProps) {
  const [value, setValue] = useState<BulletPointsData>(initialValue);

  const handleSave = () => {
    // Filter out empty points before saving
    const filteredPoints = value.points.filter((p) => p.trim() !== "");
    onSave({ points: filteredPoints });
    onClose();
  };

  const handleCancel = () => {
    setValue(initialValue);
    onClose();
  };

  const updatePoint = (index: number, newValue: string) => {
    setValue((prev) => {
      const newPoints = [...prev.points];
      newPoints[index] = newValue;
      return { points: newPoints };
    });
  };

  // Ensure we have the right number of text areas
  const points = [...value.points];
  while (points.length < maxPoints) {
    points.push("");
  }

  return (
    <Modal isOpen={isOpen} onClose={handleCancel}>
      <ModalHeader title={title} onClose={handleCancel} />
      <ModalBody className="max-h-[60vh]">
        <div className="flex flex-col gap-4">
          {points.slice(0, maxPoints).map((point, index) => (
            <TextArea
              key={index}
              label={`${fieldLabel} ${index + 1}`}
              value={point}
              onChange={(v) => updatePoint(index, v)}
              maxLength={maxLength}
              rows={2}
            />
          ))}
        </div>
      </ModalBody>
      <ModalFooter onCancel={handleCancel} onSave={handleSave} />
    </Modal>
  );
}
