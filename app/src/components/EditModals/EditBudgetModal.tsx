"use client";

import { useState, useEffect } from "react";
import { Modal, ModalHeader, ModalBody, ModalFooter } from "../Modal";
import { Select, InputField } from "../FormField";

type BudgetData = {
  currency: string;
  minAmount: string;
  maxAmount: string;
};

type EditBudgetModalProps = {
  isOpen: boolean;
  onClose: () => void;
  initialValue: BudgetData;
  onSave: (value: BudgetData) => void;
};

const PoundIcon = () => (
  <svg width="16" height="16" viewBox="0 0 16 16" fill="none">
    <path
      d="M4 14H12M5 8H10M6 2C4.5 2 3.5 3 3.5 4.5C3.5 6 4.5 7 5.5 8C6.5 9 7 10 7 11C7 12.5 6 14 4 14"
      stroke="currentColor"
      strokeWidth="1.5"
      strokeLinecap="round"
      strokeLinejoin="round"
    />
  </svg>
);

const currencyOptions = [
  { value: "GBP", label: "Pound sterling" },
  { value: "USD", label: "US Dollar" },
  { value: "EUR", label: "Euro" },
  { value: "AUD", label: "Australian Dollar" },
];

// Format number with commas (e.g., 1000000 -> 1,000,000)
const formatNumberWithCommas = (value: string): string => {
  // Remove all non-digit characters
  const digits = value.replace(/\D/g, "");
  // Add commas
  return digits.replace(/\B(?=(\d{3})+(?!\d))/g, ",");
};

export function EditBudgetModal({
  isOpen,
  onClose,
  initialValue,
  onSave,
}: EditBudgetModalProps) {
  const [value, setValue] = useState<BudgetData>(initialValue);

  // Reset state when modal opens with new initial value
  useEffect(() => {
    if (isOpen) {
      setValue(initialValue);
    }
  }, [isOpen, initialValue]);

  const handleSave = () => {
    onSave(value);
    onClose();
  };

  const handleCancel = () => {
    setValue(initialValue);
    onClose();
  };

  const updateAmountField = (field: "minAmount" | "maxAmount", rawValue: string) => {
    const formatted = formatNumberWithCommas(rawValue);
    setValue((prev) => ({ ...prev, [field]: formatted }));
  };

  const updateField = (field: keyof BudgetData, fieldValue: string) => {
    setValue((prev) => ({ ...prev, [field]: fieldValue }));
  };

  return (
    <Modal isOpen={isOpen} onClose={handleCancel}>
      <ModalHeader title="Edit budget" onClose={handleCancel} />
      <ModalBody>
        <div className="flex flex-col gap-6">
          <Select
            label="Currency"
            value={value.currency}
            onChange={(v) => updateField("currency", v)}
            options={currencyOptions}
            icon={<PoundIcon />}
          />
          <div className="flex gap-2">
            <InputField
              label="Min. amount"
              value={value.minAmount}
              onChange={(v) => updateAmountField("minAmount", v)}
              type="text"
              icon={<PoundIcon />}
              clearable
              className="flex-1"
            />
            <InputField
              label="Max. amount"
              value={value.maxAmount}
              onChange={(v) => updateAmountField("maxAmount", v)}
              type="text"
              icon={<PoundIcon />}
              clearable
              className="flex-1"
            />
          </div>
        </div>
      </ModalBody>
      <ModalFooter onCancel={handleCancel} onSave={handleSave} />
    </Modal>
  );
}
