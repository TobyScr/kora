"use client";

import { useState } from "react";
import { Modal, ModalHeader, ModalBody, ModalFooter } from "../Modal";
import { RichTextArea } from "../FormField";

type EditInitialObjectiveModalProps = {
  isOpen: boolean;
  onClose: () => void;
  initialValue: string;
  onSave: (value: string) => void;
};

export function EditInitialObjectiveModal({
  isOpen,
  onClose,
  initialValue,
  onSave,
}: EditInitialObjectiveModalProps) {
  const [value, setValue] = useState(initialValue);

  const handleSave = () => {
    onSave(value);
    onClose();
  };

  const handleCancel = () => {
    setValue(initialValue);
    onClose();
  };

  return (
    <Modal isOpen={isOpen} onClose={handleCancel}>
      <ModalHeader title="Edit Initial Objective" onClose={handleCancel} />
      <ModalBody>
        <RichTextArea
          label="Initial objective"
          value={value}
          onChange={setValue}
          maxLength={600}
          rows={6}
        />
      </ModalBody>
      <ModalFooter onCancel={handleCancel} onSave={handleSave} />
    </Modal>
  );
}
