"use client";

import { useState } from "react";
import { Modal, ModalHeader, ModalBody, ModalFooter } from "../Modal";
import { TextArea } from "../FormField";

type EditLocationModalProps = {
  isOpen: boolean;
  onClose: () => void;
  initialValue: string;
  onSave: (value: string) => void;
};

export function EditLocationModal({
  isOpen,
  onClose,
  initialValue,
  onSave,
}: EditLocationModalProps) {
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
      <ModalHeader title="Edit intervention location" onClose={handleCancel} />
      <ModalBody>
        <TextArea
          label="Location"
          value={value}
          onChange={setValue}
          maxLength={200}
          rows={3}
        />
      </ModalBody>
      <ModalFooter onCancel={handleCancel} onSave={handleSave} />
    </Modal>
  );
}
