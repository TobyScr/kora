"use client";

import { useState } from "react";
import { Modal, ModalHeader, ModalBody, ModalFooter } from "../Modal";

type AddObjectiveModalProps = {
  isOpen: boolean;
  onClose: () => void;
  onAdd: (title: string) => void;
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

function AddObjectiveForm({
  onAdd,
  onCancel,
}: {
  onAdd: (title: string) => void;
  onCancel: () => void;
}) {
  const [title, setTitle] = useState("");

  const handleAdd = () => {
    onAdd(title.trim());
  };

  const isValid = title.trim().length > 0;

  return (
    <>
      <ModalHeader
        title="+ Add Behavioural Objective"
        icon={<PlusIcon />}
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
              onChange={(e) => setTitle(e.target.value)}
              placeholder="Add your behavioural objective here. Make sure to include Verb, behaviour and audience"
              rows={3}
              className="w-full p-4 text-sm font-medium text-text-primary tracking-[0.15px] leading-[1.6] resize-none outline-none"
            />
          </div>
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

export function AddObjectiveModal({
  isOpen,
  onClose,
  onAdd,
}: AddObjectiveModalProps) {
  const handleAdd = (title: string) => {
    onAdd(title);
    onClose();
  };

  return (
    <Modal isOpen={isOpen} onClose={onClose}>
      {isOpen && (
        <AddObjectiveForm
          key={Date.now()}
          onAdd={handleAdd}
          onCancel={onClose}
        />
      )}
    </Modal>
  );
}
