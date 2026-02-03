"use client";

import { useState } from "react";
import { Modal, ModalHeader, ModalBody, ModalFooter } from "../Modal";
import { Tabs, InputField } from "../FormField";

type TimelineData = {
  unit: string;
  from: string;
  to: string;
};

type EditTimelineModalProps = {
  isOpen: boolean;
  onClose: () => void;
  initialValue: TimelineData;
  onSave: (value: TimelineData) => void;
};

const unitOptions = [
  { value: "days", label: "Days" },
  { value: "weeks", label: "Weeks" },
  { value: "months", label: "Months" },
  { value: "years", label: "Years" },
];

export function EditTimelineModal({
  isOpen,
  onClose,
  initialValue,
  onSave,
}: EditTimelineModalProps) {
  const [value, setValue] = useState<TimelineData>(initialValue);

  const handleSave = () => {
    onSave(value);
    onClose();
  };

  const handleCancel = () => {
    setValue(initialValue);
    onClose();
  };

  const updateField = (field: keyof TimelineData, fieldValue: string) => {
    setValue((prev) => ({ ...prev, [field]: fieldValue }));
  };

  return (
    <Modal isOpen={isOpen} onClose={handleCancel}>
      <ModalHeader title="Edit timeline" onClose={handleCancel} />
      <ModalBody>
        <div className="flex flex-col gap-6">
          <Tabs
            label="Unit"
            value={value.unit}
            onChange={(v) => updateField("unit", v)}
            options={unitOptions}
          />
          <div className="flex gap-2">
            <InputField
              label="From"
              value={value.from}
              onChange={(v) => updateField("from", v)}
              type="text"
              clearable
              className="flex-1"
            />
            <InputField
              label="To"
              value={value.to}
              onChange={(v) => updateField("to", v)}
              type="text"
              className="flex-1"
            />
          </div>
        </div>
      </ModalBody>
      <ModalFooter onCancel={handleCancel} onSave={handleSave} />
    </Modal>
  );
}
