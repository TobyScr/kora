"use client";

import { Modal, ModalBody } from "../Modal";

type DeleteObjectiveModalProps = {
  isOpen: boolean;
  onClose: () => void;
  onDelete: () => void;
};

const TrashIcon = () => (
  <svg width="20" height="20" viewBox="0 0 20 20" fill="none">
    <path
      d="M3.75 5H16.25M7.5 5V3.75C7.5 3.05964 8.05964 2.5 8.75 2.5H11.25C11.9404 2.5 12.5 3.05964 12.5 3.75V5M15 5V16.25C15 16.9404 14.4404 17.5 13.75 17.5H6.25C5.55964 17.5 5 16.9404 5 16.25V5H15Z"
      stroke="currentColor"
      strokeWidth="1.5"
      strokeLinecap="round"
      strokeLinejoin="round"
    />
    <path
      d="M8.33337 8.75V13.75M11.6667 8.75V13.75"
      stroke="currentColor"
      strokeWidth="1.5"
      strokeLinecap="round"
      strokeLinejoin="round"
    />
  </svg>
);

const CloseIcon = () => (
  <svg width="16" height="16" viewBox="0 0 16 16" fill="none">
    <path
      d="M12 4L4 12M4 4L12 12"
      stroke="currentColor"
      strokeWidth="1.5"
      strokeLinecap="round"
      strokeLinejoin="round"
    />
  </svg>
);

export function DeleteObjectiveModal({
  isOpen,
  onClose,
  onDelete,
}: DeleteObjectiveModalProps) {
  const handleDelete = () => {
    onDelete();
    onClose();
  };

  return (
    <Modal isOpen={isOpen} onClose={onClose} width={400}>
      {/* Custom Header with Red/Danger styling */}
      <div className="flex items-center justify-between px-4 py-6 h-[72px] border-b border-stroke-soft shrink-0">
        <div className="flex items-center gap-1">
          <div className="flex items-center justify-center w-8 h-8 text-red-600">
            <TrashIcon />
          </div>
          <h2 className="text-base font-bold text-red-600 leading-[1.2]">
            Delete Objective
          </h2>
        </div>
        <button
          onClick={onClose}
          className="flex items-center justify-center w-8 h-8 text-text-secondary hover:text-text-primary transition-colors rounded-lg"
          aria-label="Close modal"
        >
          <CloseIcon />
        </button>
      </div>

      <ModalBody>
        <p className="text-sm text-text-secondary leading-relaxed">
          Are you sure you want to delete this Objective? This action cannot be
          undone.
        </p>
      </ModalBody>

      {/* Custom Footer with Cancel and Delete buttons */}
      <div className="flex items-center justify-end gap-[10px] px-4 py-4 h-[72px] border-t border-stroke-soft shrink-0">
        <button
          onClick={onClose}
          className="flex items-center justify-center h-10 px-[14px] bg-button-outline border border-stroke-default rounded-[12px] text-sm font-medium text-text-primary tracking-[0.15px] leading-[1.6] hover:bg-gray-50 transition-colors"
        >
          Cancel
        </button>
        <button
          onClick={handleDelete}
          className="flex items-center justify-center gap-2 h-10 px-4 bg-red-600 rounded-[12px] text-sm font-medium text-white tracking-[0.15px] leading-[1.6] hover:bg-red-700 transition-colors"
        >
          <TrashIcon />
          Delete Objective
        </button>
      </div>
    </Modal>
  );
}
