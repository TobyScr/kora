"use client";

import { useState, useEffect } from "react";
import { Modal, ModalHeader, ModalBody, ModalFooter } from "../Modal";
import { RichTextArea } from "../FormField";

type EditProblemDefinitionModalProps = {
  isOpen: boolean;
  onClose: () => void;
  initialValue: string;
  onSave: (value: string) => void;
};

export function EditProblemDefinitionModal({
  isOpen,
  onClose,
  initialValue,
  onSave,
}: EditProblemDefinitionModalProps) {
  const [value, setValue] = useState(initialValue);

  useEffect(() => {
    if (isOpen) setValue(initialValue);
  }, [isOpen, initialValue]);

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
      <ModalHeader title="Edit Problem Definition" onClose={handleCancel} />
      <ModalBody>
        <RichTextArea
          label="Description"
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
