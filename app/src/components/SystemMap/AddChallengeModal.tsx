"use client";

import { useState } from "react";
import { Modal, ModalHeader, ModalBody, ModalFooter } from "../Modal";
import { TextArea } from "../FormField";

type AddChallengeModalProps = {
  isOpen: boolean;
  onClose: () => void;
  onAdd: (title: string, description: string) => void;
};

const PlusIcon = () => (
  <svg width="16" height="16" viewBox="0 0 16 16" fill="none">
    <path
      d="M8 3v10M3 8h10"
      stroke="currentColor"
      strokeWidth="1.5"
      strokeLinecap="round"
    />
  </svg>
);

function AddChallengeForm({
  onAdd,
  onCancel,
}: {
  onAdd: (title: string, description: string) => void;
  onCancel: () => void;
}) {
  const [title, setTitle] = useState("");
  const [description, setDescription] = useState("");

  const handleTitleChange = (value: string) => {
    if (value.length <= 100) {
      setTitle(value);
    }
  };

  const handleAdd = () => {
    onAdd(title.trim(), description.trim());
  };

  const isValid = title.trim().length > 0;

  return (
    <>
      <ModalHeader
        title="+ Add Challenge"
        icon={<PlusIcon />}
        onClose={onCancel}
      />
      <ModalBody className="max-h-[60vh]">
        <div className="flex flex-col gap-6">
          {/* Challenge Title Field */}
          <div className="flex flex-col gap-2">
            <label className="px-2 text-base font-medium text-text-secondary tracking-[0.15px] leading-[1.6]">
              Challenge
            </label>
            <div className="flex flex-col border border-background-brand rounded-[10px] overflow-hidden focus-within:ring-1 focus-within:ring-background-brand">
              <textarea
                value={title}
                onChange={(e) => handleTitleChange(e.target.value)}
                placeholder="Add your Challenge here"
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
            placeholder="Describe your challenge"
            rows={3}
          />
        </div>
      </ModalBody>
      <ModalFooter
        onCancel={onCancel}
        onSave={handleAdd}
        saveLabel="Add"
        saveDisabled={!isValid}
      />
    </>
  );
}

export function AddChallengeModal({
  isOpen,
  onClose,
  onAdd,
}: AddChallengeModalProps) {
  const handleAdd = (title: string, description: string) => {
    onAdd(title, description);
    onClose();
  };

  return (
    <Modal isOpen={isOpen} onClose={onClose}>
      {isOpen && (
        <AddChallengeForm
          key={Date.now()}
          onAdd={handleAdd}
          onCancel={onClose}
        />
      )}
    </Modal>
  );
}
