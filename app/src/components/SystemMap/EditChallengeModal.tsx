"use client";

import { useState } from "react";
import { Modal, ModalHeader, ModalBody, ModalFooter } from "../Modal";
import { TextArea } from "../FormField";
import type { Challenge } from "./types";

type EditChallengeModalProps = {
  isOpen: boolean;
  onClose: () => void;
  challenge: Challenge | null;
  onSave: (challenge: Challenge) => void;
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

// Inner component that only renders when we have a challenge
function EditChallengeForm({
  challenge,
  onSave,
  onCancel,
}: {
  challenge: Challenge;
  onSave: (challenge: Challenge) => void;
  onCancel: () => void;
}) {
  const [title, setTitle] = useState(challenge.title);
  const [description, setDescription] = useState(challenge.description || "");

  const handleSave = () => {
    onSave({
      ...challenge,
      title: title.trim(),
      description: description.trim(),
    });
  };

  const handleTitleChange = (value: string) => {
    // Enforce max 100 characters
    if (value.length <= 100) {
      setTitle(value);
    }
  };

  const isValid = title.trim().length > 0 && title.trim().length <= 100;

  return (
    <>
      <ModalHeader
        title="Edit Challenge"
        icon={<EditIcon />}
        onClose={onCancel}
      />
      <ModalBody className="max-h-[60vh]">
        <div className="flex flex-col gap-6">
          {/* Challenge Text Field */}
          <div className="flex flex-col gap-2">
            <label className="px-2 text-base font-medium text-text-secondary tracking-[0.15px] leading-[1.6]">
              Challenge
            </label>
            <div className="flex flex-col border border-background-brand rounded-[10px] overflow-hidden focus-within:ring-1 focus-within:ring-background-brand">
              <textarea
                value={title}
                onChange={(e) => handleTitleChange(e.target.value)}
                placeholder="Enter the challenge text"
                rows={2}
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

          {/* Description Field */}
          <TextArea
            label="Description"
            value={description}
            onChange={setDescription}
            placeholder="Add a description for this challenge"
            rows={3}
          />
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

export function EditChallengeModal({
  isOpen,
  onClose,
  challenge,
  onSave,
}: EditChallengeModalProps) {
  const handleSave = (updatedChallenge: Challenge) => {
    onSave(updatedChallenge);
    onClose();
  };

  // Don't render the modal if there's no challenge
  if (!challenge) return null;

  return (
    <Modal isOpen={isOpen} onClose={onClose}>
      {/* Key forces remount when challenge changes, ensuring fresh state */}
      <EditChallengeForm
        key={challenge.id}
        challenge={challenge}
        onSave={handleSave}
        onCancel={onClose}
      />
    </Modal>
  );
}
