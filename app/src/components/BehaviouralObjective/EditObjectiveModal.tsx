"use client";

import { useState } from "react";
import { Modal, ModalHeader, ModalBody, ModalFooter } from "../Modal";
import type { Objective } from "./types";

type EditObjectiveModalProps = {
  isOpen: boolean;
  onClose: () => void;
  objective: Objective | null;
  onSave: (objective: Objective) => void;
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

function EditObjectiveForm({
  objective,
  onSave,
  onCancel,
}: {
  objective: Objective;
  onSave: (objective: Objective) => void;
  onCancel: () => void;
}) {
  const [title, setTitle] = useState(objective.title);

  const handleTitleChange = (value: string) => {
    if (value.length <= 100) {
      setTitle(value);
    }
  };

  const handleSave = () => {
    onSave({
      ...objective,
      title: title.trim(),
    });
  };

  const isValid = title.trim().length > 0 && title.trim().length <= 100;

  return (
    <>
      <ModalHeader
        title="Edit Behavioural Objective"
        icon={<EditIcon />}
        onClose={onCancel}
      />
      <ModalBody className="max-h-[60vh]">
        <div className="flex flex-col gap-2">
          <label className="px-2 text-base font-medium text-text-secondary tracking-[0.15px] leading-[1.6]">
            Objective
          </label>
          <div className="flex flex-col border border-background-brand rounded-[10px] overflow-hidden focus-within:ring-1 focus-within:ring-background-brand">
            <textarea
              value={title}
              onChange={(e) => handleTitleChange(e.target.value)}
              placeholder="Enter the objective text"
              rows={3}
              maxLength={100}
              className="w-full p-4 text-sm font-medium text-text-primary tracking-[0.15px] leading-[1.6] resize-none outline-none"
            />
            <div className="flex justify-end p-4 pt-0">
              <span
                className={`text-xs leading-[1.5] ${
                  title.length >= 100 ? "text-red-500" : "text-text-tertiary"
                }`}
              >
                {title.length} / 100
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

export function EditObjectiveModal({
  isOpen,
  onClose,
  objective,
  onSave,
}: EditObjectiveModalProps) {
  const handleSave = (updatedObjective: Objective) => {
    onSave(updatedObjective);
    onClose();
  };

  if (!objective) return null;

  return (
    <Modal isOpen={isOpen} onClose={onClose}>
      <EditObjectiveForm
        key={objective.id}
        objective={objective}
        onSave={handleSave}
        onCancel={onClose}
      />
    </Modal>
  );
}
