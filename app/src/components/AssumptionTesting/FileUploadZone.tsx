"use client";

import { useState, useRef } from "react";
import type { UploadedFile } from "./types";

type FileUploadZoneProps = {
  files: UploadedFile[];
  onFilesChange: (files: UploadedFile[]) => void;
  isConfirmed: boolean;
};

const UploadIcon = () => (
  <svg width="24" height="24" viewBox="0 0 24 24" fill="none">
    <path
      d="M12 16V4m0 0L8 8m4-4l4 4M4 18h16"
      stroke="currentColor"
      strokeWidth="1.5"
      strokeLinecap="round"
      strokeLinejoin="round"
    />
  </svg>
);

const GreenCheckIcon = () => (
  <svg width="14" height="14" viewBox="0 0 14 14" fill="none">
    <circle cx="7" cy="7" r="7" fill="#2b8652" />
    <path
      d="M4 7l2 2 4-4"
      stroke="white"
      strokeWidth="1.5"
      strokeLinecap="round"
      strokeLinejoin="round"
    />
  </svg>
);

const TrashIcon = () => (
  <svg width="14" height="14" viewBox="0 0 16 16" fill="none">
    <path
      d="M3 4H13M6 4V3C6 2.44772 6.44772 2 7 2H9C9.55228 2 10 2.44772 10 3V4M12 4V13C12 13.5523 11.5523 14 11 14H5C4.44772 14 4 13.5523 4 13V4H12Z"
      stroke="currentColor"
      strokeWidth="1.5"
      strokeLinecap="round"
      strokeLinejoin="round"
    />
    <path
      d="M6.66667 7V11M9.33333 7V11"
      stroke="currentColor"
      strokeWidth="1.5"
      strokeLinecap="round"
      strokeLinejoin="round"
    />
  </svg>
);

export function FileUploadZone({ files, onFilesChange, isConfirmed }: FileUploadZoneProps) {
  const [isDragging, setIsDragging] = useState(false);
  const fileInputRef = useRef<HTMLInputElement>(null);

  const handleDragOver = (e: React.DragEvent) => {
    e.preventDefault();
    if (!isConfirmed) setIsDragging(true);
  };

  const handleDragLeave = (e: React.DragEvent) => {
    e.preventDefault();
    setIsDragging(false);
  };

  const handleDrop = (e: React.DragEvent) => {
    e.preventDefault();
    setIsDragging(false);
    if (isConfirmed) return;

    const droppedFiles = Array.from(e.dataTransfer.files);
    addFiles(droppedFiles);
  };

  const handleFileSelect = (e: React.ChangeEvent<HTMLInputElement>) => {
    if (e.target.files) {
      const selected = Array.from(e.target.files);
      addFiles(selected);
    }
  };

  const addFiles = (newFiles: File[]) => {
    const validExtensions = [".pdf", ".doc", ".docx"];
    const maxSize = 100 * 1024 * 1024; // 100MB

    const validFiles = newFiles.filter((file) => {
      const ext = "." + file.name.split(".").pop()?.toLowerCase();
      return validExtensions.includes(ext) && file.size <= maxSize;
    });

    const uploadedFiles: UploadedFile[] = validFiles.map((file) => ({
      id: `file-${Date.now()}-${Math.random().toString(36).slice(2)}`,
      name: file.name,
      size: formatFileSize(file.size),
    }));

    onFilesChange([...files, ...uploadedFiles]);
  };

  const handleRemoveFile = (id: string) => {
    onFilesChange(files.filter((f) => f.id !== id));
  };

  const formatFileSize = (bytes: number): string => {
    if (bytes < 1024) return bytes + " B";
    if (bytes < 1024 * 1024) return (bytes / 1024).toFixed(1) + " KB";
    return (bytes / (1024 * 1024)).toFixed(1) + " MB";
  };

  return (
    <div>
      {/* Upload zone */}
      {!isConfirmed && (
        <div
          onDragOver={handleDragOver}
          onDragLeave={handleDragLeave}
          onDrop={handleDrop}
          className={`flex flex-col items-center justify-center py-8 border-2 border-dashed rounded-[var(--radius-lg)] transition-colors ${
            isDragging
              ? "border-button-solid bg-blue-50/50"
              : "border-stroke-default"
          }`}
        >
          <div className="text-text-tertiary mb-2">
            <UploadIcon />
          </div>
          <p className="text-sm text-text-secondary mb-1">
            Drag and drop files here, or{" "}
            <button
              onClick={() => fileInputRef.current?.click()}
              className="text-button-solid font-medium hover:underline cursor-pointer"
            >
              Browse Files
            </button>
          </p>
          <p className="text-xs text-text-tertiary">
            PDF, DOC, DOCX (max 100MB)
          </p>
          <input
            ref={fileInputRef}
            type="file"
            accept=".pdf,.doc,.docx"
            multiple
            onChange={handleFileSelect}
            className="hidden"
          />
        </div>
      )}

      {/* Uploaded files list */}
      {files.length > 0 && (
        <div className="mt-3 space-y-2">
          {files.map((file) => (
            <div
              key={file.id}
              className="flex items-center gap-3 py-2 px-3 bg-background-surface border border-stroke-default rounded-lg"
            >
              <div className="flex-1 min-w-0">
                <span className="text-sm font-medium text-text-primary truncate block">
                  {file.name}
                </span>
                <span className="text-xs text-text-tertiary">{file.size}</span>
              </div>
              <GreenCheckIcon />
              {!isConfirmed && (
                <button
                  onClick={() => handleRemoveFile(file.id)}
                  className="text-text-tertiary hover:text-red-600 transition-colors p-1 cursor-pointer"
                  aria-label={`Remove ${file.name}`}
                >
                  <TrashIcon />
                </button>
              )}
            </div>
          ))}
        </div>
      )}
    </div>
  );
}
