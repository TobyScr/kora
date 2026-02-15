"use client";

import { useState } from "react";
import { Modal, ModalHeader, ModalBody, ModalFooter } from "../Modal";
import type { ResearchQuestion } from "./types";

type EditQuestionModalProps = {
  isOpen: boolean;
  onClose: () => void;
  question: ResearchQuestion | null;
  onSave: (question: ResearchQuestion) => void;
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

function EditQuestionForm({
  question,
  onSave,
  onCancel,
}: {
  question: ResearchQuestion;
  onSave: (question: ResearchQuestion) => void;
  onCancel: () => void;
}) {
  const [text, setText] = useState(question.text);

  const handleTextChange = (value: string) => {
    if (value.length <= 200) {
      setText(value);
    }
  };

  const handleSave = () => {
    onSave({
      ...question,
      text: text.trim(),
    });
  };

  const isValid = text.trim().length > 0;

  return (
    <>
      <ModalHeader
        title="Edit Research Question"
        icon={<EditIcon />}
        onClose={onCancel}
      />
      <ModalBody className="max-h-[60vh]">
        <div className="flex flex-col gap-2">
          <label className="px-2 text-base font-medium text-text-secondary tracking-[0.15px] leading-[1.6]">
            Research Question
          </label>
          <div className="flex flex-col border border-background-brand rounded-[10px] overflow-hidden focus-within:ring-1 focus-within:ring-background-brand">
            <textarea
              value={text}
              onChange={(e) => handleTextChange(e.target.value)}
              placeholder="Enter your research question"
              rows={3}
              maxLength={200}
              className="w-full p-4 text-sm font-medium text-text-primary tracking-[0.15px] leading-[1.6] resize-none outline-none"
            />
            <div className="flex justify-end p-4 pt-0">
              <span
                className={`text-xs leading-[1.5] ${
                  text.length >= 200 ? "text-red-500" : "text-text-tertiary"
                }`}
              >
                {text.length} / 200
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

export function EditQuestionModal({
  isOpen,
  onClose,
  question,
  onSave,
}: EditQuestionModalProps) {
  const handleSave = (updatedQuestion: ResearchQuestion) => {
    onSave(updatedQuestion);
    onClose();
  };

  if (!question) return null;

  return (
    <Modal isOpen={isOpen} onClose={onClose}>
      <EditQuestionForm
        key={question.id}
        question={question}
        onSave={handleSave}
        onCancel={onClose}
      />
    </Modal>
  );
}
