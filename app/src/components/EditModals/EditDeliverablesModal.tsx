"use client";

import { useState } from "react";
import { Modal, ModalHeader, ModalBody, ModalFooter } from "../Modal";
import { RichTextArea } from "../FormField";

type EditDeliverablesModalProps = {
  isOpen: boolean;
  onClose: () => void;
  initialValue: string;
  onSave: (value: string) => void;
};

export function EditDeliverablesModal({
  isOpen,
  onClose,
  initialValue,
  onSave,
}: EditDeliverablesModalProps) {
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
      <ModalHeader title="Edit expected deliverables" onClose={handleCancel} />
      <ModalBody>
        <RichTextArea
          label="Deliverables"
          value={value}
          onChange={setValue}
          maxLength={500}
          rows={5}
        />
      </ModalBody>
      <ModalFooter onCancel={handleCancel} onSave={handleSave} />
    </Modal>
  );
}
