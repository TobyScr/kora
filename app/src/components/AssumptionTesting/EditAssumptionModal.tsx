"use client";

import { useState } from "react";
import { Modal, ModalHeader, ModalBody, ModalFooter } from "../Modal";
import type { Assumption } from "./types";

type EditAssumptionModalProps = {
  isOpen: boolean;
  onClose: () => void;
  assumption: Assumption | null;
  onSave: (assumption: Assumption) => void;
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

function EditAssumptionForm({
  assumption,
  onSave,
  onCancel,
}: {
  assumption: Assumption;
  onSave: (assumption: Assumption) => void;
  onCancel: () => void;
}) {
  const [title, setTitle] = useState(assumption.title);

  const handleTitleChange = (value: string) => {
    if (value.length <= 200) {
      setTitle(value);
    }
  };

  const handleSave = () => {
    onSave({
      ...assumption,
      title: title.trim(),
    });
  };

  const isValid = title.trim().length > 0;

  return (
    <>
      <ModalHeader
        title="Edit Assumption"
        icon={<EditIcon />}
        onClose={onCancel}
      />
      <ModalBody className="max-h-[60vh]">
        <div className="flex flex-col gap-2">
          <label className="px-2 text-base font-medium text-text-secondary tracking-[0.15px] leading-[1.6]">
            Assumption
          </label>
          <div className="flex flex-col border border-background-brand rounded-[10px] overflow-hidden focus-within:ring-1 focus-within:ring-background-brand">
            <textarea
              value={title}
              onChange={(e) => handleTitleChange(e.target.value)}
              placeholder="Enter the assumption text"
              rows={3}
              maxLength={200}
              className="w-full p-4 text-sm font-medium text-text-primary tracking-[0.15px] leading-[1.6] resize-none outline-none"
            />
            <div className="flex justify-end p-4 pt-0">
              <span
                className={`text-xs leading-[1.5] ${
                  title.length >= 200 ? "text-red-500" : "text-text-tertiary"
                }`}
              >
                {title.length} / 200
              </span>
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

export function EditAssumptionModal({
  isOpen,
  onClose,
  assumption,
  onSave,
}: EditAssumptionModalProps) {
  const handleSave = (updatedAssumption: Assumption) => {
    onSave(updatedAssumption);
    onClose();
  };

  if (!assumption) return null;

  return (
    <Modal isOpen={isOpen} onClose={onClose}>
      <EditAssumptionForm
        key={assumption.id}
        assumption={assumption}
        onSave={handleSave}
        onCancel={onClose}
      />
    </Modal>
  );
}
