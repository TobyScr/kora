"use client";

type ModalFooterProps = {
  onCancel: () => void;
  onSave: () => void;
  saveLabel?: string;
  cancelLabel?: string;
  saveDisabled?: boolean;
};

const CheckIcon = () => (
  <svg width="16" height="16" viewBox="0 0 16 16" fill="none">
    <path
      d="M13.5 4.5L6 12L2.5 8.5"
      stroke="currentColor"
      strokeWidth="1.5"
      strokeLinecap="round"
      strokeLinejoin="round"
    />
  </svg>
);

export function ModalFooter({
  onCancel,
  onSave,
  saveLabel = "Save",
  cancelLabel = "Cancel",
  saveDisabled = false,
}: ModalFooterProps) {
  return (
    <div className="flex items-center justify-end gap-[10px] px-4 py-4 h-[72px] border-t border-stroke-soft shrink-0">
      <button
        onClick={onCancel}
        className="flex items-center justify-center h-10 px-[14px] bg-button-outline border border-stroke-default rounded-[12px] text-sm font-medium text-text-primary tracking-[0.15px] leading-[1.6] hover:bg-gray-50 transition-colors"
      >
        {cancelLabel}
      </button>
      <button
        onClick={onSave}
        disabled={saveDisabled}
        className="flex items-center justify-center gap-0 h-10 px-2 bg-button-solid rounded-[12px] text-sm font-medium text-text-inverse tracking-[0.15px] leading-[1.6] hover:opacity-90 transition-opacity disabled:opacity-50 disabled:cursor-not-allowed"
      >
        <span className="flex items-center justify-center w-6 h-6">
          <CheckIcon />
        </span>
        <span className="px-[6px]">{saveLabel}</span>
      </button>
    </div>
  );
}
